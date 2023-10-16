const std = @import("std");
const Chameleon = @import("../lib/chameleon/src/chameleon.zig").Chameleon;

pub const TypeIcons = struct {
    err: []const u8,
    fatal: []const u8,
    ready: []const u8,
    warn: []const u8,
    info: []const u8,
    success: []const u8,
    debug: []const u8,
    trace: []const u8,
    fail: []const u8,
    start: []const u8,
    log: []const u8,

    pub fn init(unicode_supported: bool, alloc: std.mem.Allocator) TypeIcons {
        _ = unicode_supported;
        _ = alloc;
        comptime var cham = Chameleon.init(.Auto);

        return TypeIcons{
            .err = cham.bgRed().fmt(" ERROR "),
            .fatal = cham.red().fmt("✖"),
            .ready = cham.green().fmt("✔"),
            .warn = cham.bgYellow().fmt(" WARN "),
            .info = cham.green().fmt("ℹ"),
            .success = cham.green().fmt("✔"),
            .debug = cham.green().fmt("⚙"),
            .trace = cham.green().fmt("→"),
            .fail = cham.red().fmt("✖"),
            .start = cham.magenta().fmt("◐"),
            .log = "",
        };

        // return TypeIcons{
        //     .err = s("✖", "×", unicode_supported),
        //     .fatal = s("✖", "×", unicode_supported),
        //     .ready = s("✔", "√", unicode_supported),
        //     .warn = s("⚠", "‼", unicode_supported),
        //     .info = s("ℹ", "i", unicode_supported),
        //     .success = s("✔", "√", unicode_supported),
        //     .debug = s("⚙", "D", unicode_supported),
        //     .trace = s("→", "→", unicode_supported),
        //     .fail = s("✖", "×", unicode_supported),
        //     .start = s("◐", "o", unicode_supported),
        //     .log = "",
        // };
    }
};

fn s(c: []const u8, fallback: []const u8, supported: bool) []const u8 {
    if (supported) {
        return c;
    }

    return fallback;
}
