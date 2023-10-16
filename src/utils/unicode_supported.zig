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
