local hi = require 'hi'.hi_set_pairs
package.loaded['colors'] = nil -- DEBUG ONLY
local c  = require 'colors'

local options = {
	transparent = true,
	italic_comments = false,
	bright_cursor_line = false,
}

local cursor_bg = options.bright_cursor_line and c.bg_alt or nil

if options.transparent then
	c.bg = nil
end

hi {
	-- Core highlight groups
	{'Normal', { bg = c.bg, fg = c.fg }},
	{'Italic', { italic = true }},
	{'Bold', { bold = true }},
	{'Visual', { fg = c.fg_br, bg = c.bg_br }},
	{'LineNr', { fg = c.bg_br }},
	{'SignColumn', { fg = c.fg_alt }},
	{'IncSearch', { bg = c.literal, fg = c.bg_alt }},
	{'Search', { bg = c.literal_alt, fg = c.bg_alt }},
	{'CursorLine', { bg = cursor_bg }},
	{'CursorLineNr', { bg = cursor_bg, fg = c.bg_br_alt }},
	{'CursorLineSign', { bg = cursor_bg }},
	{'MatchParen', { bg = c.bg_alt, fg = c.fg_br }},
	{'Directory', { fg = c.type }},
	{'SpecialKey', { bg = c.bg_alt, fg = c.type }},
	{'EndOfBuffer', { fg = c.bg_br_alt }},
	{'Pmenu', { bg = c.bg_alt, fg = c.fg_alt }},
	{'PmenuSel', { bg = c.fg_alt, fg = c.bg_alt, bold = true }},
	{'PmenuSBar', { bg = c.bg_br, fg = c.fg_br }},
	{'PmenuThumb', { bg = c.fg_br, fg = c.bg_br }},
	{'ColorColumn', { bg = c.bg_br }},
	{'Folded', { bg = c.bg, fg = c.bg_br_alt, italic = not options.italic_comments }},
	{'FoldedColumn', { bg = c.bg_br, fg = c.bg_br_alt, italic = not options.italic_comments }},
	{'Title', { fg = c.type, bold = true }},
	{'Tabline', { bg = c.bg_alt }},
	{'TablineSel', { bg = c.bg_br, bold = true }},
	{'TablineFill', { bg = c.bg }},

	-- Syntax
	{'String', { fg = c.str }},
	{'Comment', { fg = c.bg_br_alt, italic = options.italic_comments }},
	{'Special', nil },
	{'Operator', nil },
	{'Identifier', { fg = c.id }},
	{'Constant', { fg = c.id_alt }},
	{'Boolean', { fg = c.literal_alt }},
	{'Number', { fg = c.literal }},
	{'Function', { fg = c.func }},
	{'Type', { fg = c.type }},
	{'Keyword', { fg = c.reserved }},
	{'Repeat', { fg = c.reserved }},
	{'Conditional', { fg = c.reserved }},
	{'PreProc', { fg = c.reserved_alt }},
	{'Statement', { fg = c.fg_alt, bold = true }},

	-- Diagnostic
	{'DiagnosticError', { fg = c.error }},
	{'DiagnosticWarn', { fg = c.warn }},
	{'DiagnosticHint', { fg = c.hint }},
	{'DiagnosticInfo', { fg = c.fg_alt }},
	{'DiagnosticUnderlineError', { fg = c.error, underline = true }},
	{'DiagnosticUnderlineWarn', { fg = c.warn, underline = true }},
	{'DiagnosticUnderlineHint', { fg = c.hint, underline = true }},
	{'DiagnosticUnderlineInfo', { fg = c.fg_alt, underline = true }},


	-- Treesitter
	{'@constant.builtin', { fg = c.literal_alt }},
	{'@namespace', { fg = c.type_alt }},
}

