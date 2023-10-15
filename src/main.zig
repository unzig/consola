const std = @import("std");
const consola = @import("consola.zig");
const utils = @import("utils.zig");

pub fn createConsola(alloc: std.mem.Allocator) consola.Consola {
    const unicode_supported = utils.isUnicodeSupported(alloc);
    const type_icons = utils.TypeIcons.init(unicode_supported, alloc);

    return consola.Consola{
        .allocator = alloc,
        .unicode_supported = unicode_supported,
        .type_icons = type_icons,
    };
}

test "basic" {
    const c = createConsola(std.testing.allocator);

    std.debug.print("\n", .{});
    std.debug.print("{any}\n", .{"ℹ"});

    c.info("hello world");
}
