const std = @import("std");
const print = std.debug.print;
const Chameleon = @import("./lib/chameleon/src/chameleon.zig").Chameleon;
const utils = @import("utils.zig");

pub const Consola = struct {
    allocator: std.mem.Allocator,
    unicode_supported: bool,
    type_icons: utils.TypeIcons,

    pub fn info(self: *const Consola, message: []const u8) void {
        const writer = std.io.getStdOut().writer();
        nosuspend writer.print("{s} {s}\n", .{ self.type_icons.info, message }) catch return;
    }

    pub fn start(self: *const Consola, message: []const u8) void {
        const writer = std.io.getStdOut().writer();
        nosuspend writer.print("{s} {s}\n", .{ self.type_icons.start, message }) catch return;
    }

    pub fn warn(self: *const Consola, message: []const u8) void {
        const writer = std.io.getStdOut().writer();
        nosuspend writer.print("\n{s} {s}\n\n", .{ self.type_icons.warn, message }) catch return;
    }

    pub fn success(self: *const Consola, message: []const u8) void {
        const writer = std.io.getStdOut().writer();
        nosuspend writer.print("{s} {s}\n", .{ self.type_icons.success, message }) catch return;
    }

    pub fn err(self: *const Consola, message: []const u8) void {
        const writer = std.io.getStdOut().writer();
        nosuspend writer.print("\n{s} {s}\n\n", .{ self.type_icons.err, message }) catch return;
    }

    pub fn box(self: *const Consola, message: []const u8) void {
        const writer = std.io.getStdOut().writer();
        nosuspend writer.print("{s} {s}\n", .{ self.type_icons.start, message }) catch return;
    }
};
