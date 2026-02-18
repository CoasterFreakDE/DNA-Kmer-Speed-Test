const std = @import("std");

fn convert(c: u8) u8 {
    return switch (c) {
        'A' => 'C',
        'C' => 'G',
        'G' => 'T',
        'T' => 'A',
        else => ' ',
    };
}

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    if (args.len < 2) {
        std.debug.print("Usage: zig_kmer <length>\n", .{});
        return;
    }

    const len = try std.fmt.parseInt(usize, args[1], 10);
    var s = try allocator.alloc(u8, len);
    defer allocator.free(s);
    const s_last = try allocator.alloc(u8, len);
    defer allocator.free(s_last);

    @memset(s, 'A');
    @memset(s_last, 'T');

    const start_ns = std.time.nanoTimestamp();
    var counter: u128 = 1;

    while (!std.mem.eql(u8, s, s_last)) {
        counter += 1;
        for (0..len) |i| {
            const old = s[i];
            s[i] = convert(old);
            if (old != 'T') break;
        }
    }

    const delta_ms = @as(f64, @floatFromInt(std.time.nanoTimestamp() - start_ns)) / 1_000_000.0;
    std.debug.print("Number of generated k-mers: {d} - took {d:.3}ms\n", .{ counter, delta_ms });
}
