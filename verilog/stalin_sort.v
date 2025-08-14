// Stalin Sort
// Verilog-2001, synthesizable
module stalin_sort #(
    // number of input elements
    parameter integer N = 16,
    // bit width per element
    parameter integer WIDTH = 8,
    // initial value of 'bigger' (assumes unsigned)
    parameter integer INIT_BIGGER = 0
)(
    input  wire                   clk,
    input  wire                   rst_n,
    // 1-cycle pulse to start
    input  wire                   start,
    // concatenated input: element 0 at LSB side
    input  wire [N*WIDTH-1:0]     data_in,
    // concatenated output: densely packed at 0..out_len-1
    output reg  [N*WIDTH-1:0]     data_out,
    // number of kept elements
    output reg  [CLOG2(N+1)-1:0]  out_len,
    // result valid when 1
    output reg                    done
);

    // clog2 implementation
    function integer CLOG2;
        input integer value;
        integer v, i;
        begin
            v = value - 1;
            for (i = 0; v > 0; i = i + 1) v = v >> 1;
            CLOG2 = i;
        end
    endfunction

    // internal registers
    reg [WIDTH-1:0] bigger;
    // input scan index
    reg [CLOG2(N+1)-1:0] i_idx;
    // output write index
    reg [CLOG2(N+1)-1:0] o_idx;

    // FSM states
    localparam S_IDLE = 2'd0,
               S_RUN  = 2'd1,
               S_DONE = 2'd2;
    reg [1:0] state;

    // helper: read i-th element from data_in
    wire [WIDTH-1:0] cur = data_in[i_idx*WIDTH +: WIDTH];

    // keep data_out in a register and overwrite only the kept elements
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state   <= S_IDLE;
            i_idx   <= {CLOG2(N+1){1'b0}};
            o_idx   <= {CLOG2(N+1){1'b0}};
            bigger  <= {WIDTH{1'b0}};
            out_len <= {CLOG2(N+1){1'b0}};
            data_out<= {N*WIDTH{1'b0}};
            done    <= 1'b0;
        end else begin
            case (state)
                S_IDLE: begin
                    done    <= 1'b0;
                    if (start) begin
                        // initialize
                        i_idx   <= 0;
                        o_idx   <= 0;
                        bigger  <= INIT_BIGGER[WIDTH-1:0];
                        out_len <= 0;
                        data_out<= {N*WIDTH{1'b0}};
                        state   <= S_RUN;
                    end
                end

                S_RUN: begin
                    // process one element per cycle while i_idx < N
                    if (i_idx < N) begin
                        if (cur >= bigger) begin
                            // keep -> write to output (packed)
                            data_out[o_idx*WIDTH +: WIDTH] <= cur;
                            o_idx   <= o_idx + 1'b1;
                            out_len <= o_idx + 1'b1;
                            bigger  <= cur;
                        end
                        i_idx <= i_idx + 1'b1;
                    end else begin
                        state <= S_DONE;
                    end
                end

                S_DONE: begin
                    done <= 1'b1;
                    // restart on start
                    if (start) begin
                        i_idx    <= 0;
                        o_idx    <= 0;
                        bigger   <= INIT_BIGGER[WIDTH-1:0];
                        out_len  <= 0;
                        data_out <= {N*WIDTH{1'b0}};
                        done     <= 1'b0;
                        state    <= S_RUN;
                    end
                end

                default: state <= S_IDLE;
            endcase
        end
    end
endmodule
