`timescale 1ns/1ps

module tb_stalin_sort;
    localparam integer N     = 6;
    localparam integer WIDTH = 8;

    reg                      clk;
    reg                      rst_n;
    reg                      start;
    reg  [N*WIDTH-1:0]       data_in;
    wire [N*WIDTH-1:0]       data_out;
    wire [$clog2(N+1)-1:0]   out_len;
    wire                     done;

    stalin_sort #(
        .N(N),
        .WIDTH(WIDTH),
        .INIT_BIGGER(0)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .start(start),
        .data_in(data_in),
        .data_out(data_out),
        .out_len(out_len),
        .done(done)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    function [WIDTH-1:0] get_elem;
        input [N*WIDTH-1:0] vec;
        input integer idx;
        begin
            get_elem = vec[idx*WIDTH +: WIDTH];
        end
    endfunction

    function [N*WIDTH-1:0] pack6;
        input [WIDTH-1:0] a0,a1,a2,a3,a4,a5;
        begin
            pack6 = {a5,a4,a3,a2,a1,a0};
        end
    endfunction

    task check_result;
        input integer exp_len;
        input [N*WIDTH-1:0] exp_vec;
        integer k;
        reg [WIDTH-1:0] got, exp;
        begin
            if (out_len !== exp_len) begin
                $display("[ERROR] out_len mismatch: got=%0d exp=%0d", out_len, exp_len);
                $fatal;
            end
            for (k = 0; k < exp_len; k = k + 1) begin
                got = get_elem(data_out, k);
                exp = get_elem(exp_vec, k);
                if (got !== exp) begin
                    $display("[ERROR] data_out[%0d] mismatch: got=%0d exp=%0d", k, got, exp);
                    $fatal;
                end
            end
            $display("[OK] result matched. len=%0d", exp_len);
        end
    endtask

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_stalin_sort);

        rst_n   = 0;
        start   = 0;
        data_in = 0;

        repeat (3) @(posedge clk);
        rst_n = 1;
        @(posedge clk);

        // ---- Test 1 ----
        // Input: [3,1,2,2,5,4]
        data_in = pack6(8'd3, 8'd1, 8'd2, 8'd2, 8'd5, 8'd4);
        start = 1; @(posedge clk); start = 0;
        wait (done == 1);
        // Expect: [3,5,*,*,*,*]
        check_result(2, pack6(8'd3, 8'd5, 8'd0, 8'd0, 8'd0, 8'd0));

        // ---- Test 2 ----
        // Input: [1,2,3,4,5,6]
        @(posedge clk);
        data_in = pack6(8'd1,8'd2,8'd3,8'd4,8'd5,8'd6);
        start = 1; @(posedge clk); start = 0;
        wait (done == 1);
        // Expect: [1,2,3,4,5,6]
        check_result(6, pack6(8'd1,8'd2,8'd3,8'd4,8'd5,8'd6));

        // ---- Test 3 ----
        // Input: [9,8,7,6,5,4]
        @(posedge clk);
        data_in = pack6(8'd9,8'd8,8'd7,8'd6,8'd5,8'd4);
        start = 1; @(posedge clk); start = 0;
        wait (done == 1);
        // Expect: [9,*,*,*,*,*]
        check_result(1, pack6(8'd9,8'd0,8'd0,8'd0,8'd0,8'd0));

        $display("All tests passed.");
        $finish;
    end

endmodule
