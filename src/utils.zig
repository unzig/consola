const std = @import("std");

pub fn isUnicodeSupported(allocator: std.mem.Allocator) bool {
    const ci = std.process.getEnvVarOwned(allocator, "CI") catch "";
    const wt_session = std.process.getEnvVarOwned(allocator, "WT_SESSION") catch "";
    const terminus_sublime = std.process.getEnvVarOwned(allocator, "TERMINUS_SUBLIME") catch "";
    const cet = std.process.getEnvVarOwned(allocator, "ConEmuTask") catch "";
    const term_program = std.process.getEnvVarOwned(allocator, "TERM_PROGRAM") catch "";
    const term = std.process.getEnvVarOwned(allocator, "TERM") catch "";
    const terminal_emulator = std.process.getEnvVarOwned(allocator, "TERMINAL_EMULATOR") catch "";

    defer allocator.free(ci);
    defer allocator.free(wt_session);
    defer allocator.free(terminus_sublime);
    defer allocator.free(cet);
    defer allocator.free(term_program);
    defer allocator.free(term);
    defer allocator.free(terminal_emulator);

    if (!std.mem.eql(u8, ci, "")) {
        return true;
    }

    if (!std.mem.eql(u8, wt_session, "")) {
        return true;
    }

    if (!std.mem.eql(u8, terminus_sublime, "")) {
        return true;
    }

    if (!std.mem.eql(u8, cet, "{cmd::Cmder}")) {
        return true;
    }

    if (!std.mem.eql(u8, term_program, "Terminus-Sublime")) {
        return true;
    }

    if (!std.mem.eql(u8, term_program, "vscode")) {
        return true;
    }

    if (!std.mem.eql(u8, term, "xterm-256color")) {
        return true;
    }

    if (!std.mem.eql(u8, term, "alacritty")) {
        return true;
    }

    if (!std.mem.eql(u8, terminal_emulator, "JetBrains-JediTerm")) {
        return true;
    }

    return false;
}

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
        _ = alloc;
        _ = unicode_supported;
        return TypeIcons{
            .err = "✖",
            .fatal = "✖",
            .ready = "✔",
            .warn = "⚠",
            .info = "i",
            .success = "✔",
            .debug = "⚙",
            .trace = "→",
            .fail = "✖",
            .start = "◐",
            .log = "",
        };

        // return TypeIcons{
        //     .err = s("✖", "×", unicode_supported, alloc),
        //     .fatal = s("✖", "×", unicode_supported, alloc),
        //     .ready = s("✔", "√", unicode_supported, alloc),
        //     .warn = s("⚠", "‼", unicode_supported, alloc),
        //     .info = s("ℹ", "i", unicode_supported, alloc),
        //     .success = s("✔", "√", unicode_supported, alloc),
        //     .debug = s("⚙", "D", unicode_supported, alloc),
        //     .trace = s("→", "→", unicode_supported, alloc),
        //     .fail = s("✖", "×", unicode_supported, alloc),
        //     .start = s("◐", "o", unicode_supported, alloc),
        //     .log = "",
        // };
    }
};

fn s(c: []const u8, fallback: []const u8, supported: bool, alloc: std.mem.Allocator) []const u8 {
    _ = alloc;
    const unicode_str = std.unicode.utf8ToUtf16LeStringLiteral("ℹ");
    // var w = std.unicode.utf16leToUtf8Alloc(alloc, unicode_str) catch "ur mom";
    // defer alloc.free(w);

    std.debug.print("{any}", .{unicode_str});

    if (supported) {
        return c;
    }

    return fallback;
}
