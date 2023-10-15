const std = @import("std");
const print = std.debug.print;
const chameleon = @import("./lib/chameleon/src/chameleon.zig");
const utils = @import("utils.zig");

pub const Consola = struct {
    allocator: std.mem.Allocator,
    unicode_supported: bool,
    type_icons: utils.TypeIcons,

    pub fn info(self: *const Consola, message: []const u8) void {
        print("{s} {s}\n", .{ self.type_icons.info, message });
    }
};
