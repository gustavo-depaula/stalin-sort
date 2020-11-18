//! Author: yettinmoor (nicolas.lindstroem@protonmail.com)
//! Based on O(n) in-place Rust implementation by Bill Wood

const std = @import("std");

/// In-place Stalin sort, returns slice of sorted values
pub fn stalinSort(comptime T: type, array: []T) []T {
    var i: usize = 1;
    var len = array.len;
    while (i < len) {
        std.mem.swap(T, &array[i], &array[i + array.len - len]);
        if (array[i - 1] > array[i]) {
            len -= 1;
        } else {
            i += 1;
        }
    }
    return array[0..len];
}

test "stalinSort" {
    const testing = std.testing;
    const tests = [_]struct {
        input: []const u8,
        expected: []const u8,
    }{
        .{
            .input = &[_]u8{ 1, 2, 5, 3, 5, 7 },
            .expected = &[_]u8{ 1, 2, 5, 5, 7 },
        },
        .{
            .input = &[_]u8{ 2, 1, 4, 5, 2, 3, 10 },
            .expected = &[_]u8{ 2, 4, 5, 10 },
        },
        .{
            .input = &[_]u8{ 5, 4, 3, 2, 1 },
            .expected = &[_]u8{5},
        },
    };
    for (tests) |t, i| {
        const input = try testing.allocator.dupe(u8, t.input);
        const output = stalinSort(u8, input);
        testing.expectEqualSlices(u8, t.expected, output);
        testing.allocator.free(input);
    }
}
