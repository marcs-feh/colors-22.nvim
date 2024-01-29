local M = {}

local def_colors = require 'colors-22.colors'

local def_options = {
	transparent        = true,
	italic_comments    = false,
	bright_cursor_line = false,

	plugin_integrations = {
		telescope = true,
		mini_nvim = true,
		lazy = true,
	},

	colors = def_colors.colors,
	termcolors = def_colors.termcolors,
	overrides = {},
}

M.apply_theme = function(options)
	if not options then options = def_options end

	for k, _ in pairs(def_options) do
		if options[k] == nil then
			options[k] = def_options[k]
		end
	end

	local c = options.colors
	local tc = options.termcolors
	local cursor_bg = options.bright_cursor_line and c.bg_alt or nil
	local tr_bg     = nil
	if not options.transparent then
		tr_bg = c.bg
	end

	vim.cmd [[ colorscheme default ]]

	local hi = require 'colors-22.hi'.hi_set_pairs

	hi {
		-- Core highlight groups
		{'Normal', { bg = tr_bg, fg = c.fg, ctermfg = tc.fg }},
		{'Italic', { italic = true }},
		{'Bold', { bold = true }},
		{'Visual', { fg = c.fg_br, ctermfg = tc.fg_br, bg = c.bg_br, ctermbg = tc.str }},
		{'LineNr', { fg = c.bg_br, ctermfg = tc.bg_br }},
		{'SignColumn', { fg = c.fg_alt, ctermfg = tc.fg_alt }},
		{'IncSearch', { bg = c.literal, ctermbg = tc.literal, fg = c.bg_alt, ctermfg = tc.bg_alt }},
		{'Search', { bg = c.literal_alt, ctermbg = tc.literal_alt, fg = c.bg_alt, ctermfg = tc.bg_alt }},
		{'CursorLine', { bg = cursor_bg }},
		{'CursorLineNr', { bg = cursor_bg, fg = c.bg_br_alt, ctermfg = tc.func }},
		{'CursorLineSign', { bg = cursor_bg }},
		{'MatchParen', { bg = c.bg_alt, ctermbg = tc.bg_alt, fg = c.fg_br, ctermfg = tc.fg_br }},
		{'Directory', { fg = c.type, ctermfg = tc.type }},
		{'SpecialKey', { bg = c.bg_alt, ctermbg = tc.bg_alt, fg = c.type, ctermfg = tc.type }},
		{'EndOfBuffer', { fg = c.bg_br_alt, ctermfg = tc.bg_br_alt }},
		{'Pmenu', { bg = c.bg_alt, ctermbg = tc.bg_alt, fg = c.fg_alt, ctermfg = tc.fg_alt }},
		{'PmenuSel', { bg = c.fg_alt, ctermbg = tc.fg_alt, fg = c.bg_alt, ctermfg = tc.bg_alt, bold = true }},
		{'PmenuSBar', { bg = c.bg_br, ctermbg = tc.bg_br, fg = c.fg_br, ctermfg = tc.fg_br }},
		{'PmenuThumb', { bg = c.fg_br, ctermbg = tc.fg_br, fg = c.bg_br, ctermfg = tc.bg_br }},
		{'WildMenu', { bg = c.bg_alt, ctermbg = tc.bg_alt, fg = c.fg_alt, ctermfg = tc.fg_alt }},
		{'ColorColumn', { bg = c.bg_br, ctermbg = tc.bg_br }},
		{'Folded', { bg = tr_bg, fg = c.bg_br_alt, ctermfg = tc.bg_br_alt, italic = not options.italic_comments }},
		{'FoldColumn', { bg = c.tr_bg, ctermbg = tc.tr_bg, fg = c.bg_br_alt, ctermfg = tc.bg_br_alt }},
		{'Title', { fg = c.type, ctermfg = tc.type, bold = true }},
		{'Question', { fg = c.fg, ctermfg = tc.fg }},
		{'NonText', { fg = c.type, ctermfg = tc.type, bold = true }},
		{'MoreMsg', { fg = c.reserved_alt, ctermfg = tc.reserved_alt, bold = true }},
		{'ErrorMsg', { fg = c.error, ctermfg = tc.error }},
		{'Todo', { fg = c.func, ctermfg = tc.func, bold = true }},
		{'WarningMsg', { fg = c.warn, ctermfg = tc.warn }},
		{'Tabline', { bg = c.bg_alt, ctermbg = tc.bg_alt }},
		{'TablineSel', { bg = c.bg_br, ctermbg = tc.bg_br, bold = true }},
		{'TablineFill', { bg = c.tr_bg, ctermbg = tc.tr_bg }},
		{'WinBar', { bg = c.bg_alt, ctermbg = tc.bg_alt, fg = c.fg_alt, ctermfg = tc.fg_alt }},
		{'WinSeparator', { bg = c.bg, ctermbg = tc.bg, fg = c.bg, ctermfg = tc.bg }},
		{'StatusLine', { bg = c.bg_alt, ctermbg = tc.bg_alt, fg = c.fg_alt, ctermfg = tc.fg_alt }},
		{'StatusLineNC', { bg = c.bg, ctermbg = tc.bg, fg = c.bg_br_alt, ctermfg = tc.bg_br_alt }},
		{'DiffAdd', { fg = c.func, ctermfg = tc.func }},
		{'DiffText', { fg = c.reserved, ctermfg = tc.reserved }},
		{'DiffChange', { fg = c.reserved_alt, ctermfg = tc.reserved_alt }},
		{'DiffDelete', { fg = c.bg_alt, ctermfg = tc.bg_alt }},
		{'NormalFloat', { link = 'Pmenu' }},

		-- Syntax
		{'String', { fg = c.str, ctermfg = tc.str }},
		{'Delimiter', { fg = c.fg, ctermfg = tc.fg }},
		{'Comment', { fg = c.bg_br_alt, ctermfg = tc.bg_br_alt, italic = options.italic_comments }},
		{'Special', nil },
		{'Operator', nil },
		{'Identifier', { fg = c.id, ctermfg = tc.id }},
		{'Constant', { fg = c.id_alt, ctermfg = tc.id_alt }},
		{'Boolean', { fg = c.literal_alt, ctermfg = tc.literal_alt }},
		{'Number', { fg = c.literal, ctermfg = tc.literal }},
		{'Function', { fg = c.func, ctermfg = tc.func }},
		{'Type', { fg = c.type, ctermfg = tc.type }},
		{'Keyword', { fg = c.reserved, ctermfg = tc.reserved }},
		{'Repeat', { fg = c.reserved, ctermfg = tc.reserved }},
		{'Conditional', { fg = c.reserved, ctermfg = tc.reserved }},
		{'PreProc', { fg = c.reserved_alt, ctermfg = tc.reserved_alt }},
		{'Statement', { link = 'Keyword' }},
		{'Exception', { link = 'Keyword' }},
		{'SpellBad', { fg = c.hint, ctermfg = tc.hint, undercurl = true }},
		{'SpellCap', { fg = c.fg, ctermfg = tc.fg, undercurl = true }},
		{'SpellLocal', { fg = c.fg, ctermfg = tc.fg, italic = true, undercurl = true }},
		{'SpellRare', { fg = c.hint, ctermfg = tc.hint, undercurl = true }},
		{'Label', { fg = c.func_alt }},

		-- Diagnostic
		{'DiagnosticError', { fg = c.error, ctermfg = tc.error }},
		{'DiagnosticWarn', { fg = c.warn, ctermfg = tc.warn }},
		{'DiagnosticHint', { fg = c.hint, ctermfg = tc.hint }},
		{'DiagnosticInfo', { fg = c.info, ctermfg = tc.info }},
		{'DiagnosticUnderlineError', { fg = c.error, ctermfg = tc.error, underline = true }},
		{'DiagnosticUnderlineWarn', { fg = c.warn, ctermfg = tc.warn, underline = true }},
		{'DiagnosticUnderlineHint', { fg = c.hint, ctermfg = tc.hint, underline = true }},
		{'DiagnosticUnderlineInfo', { fg = c.info, ctermfg = tc.info, underline = true }},

		-- LSP
		{'QuickFixLine', { fg = c.type_alt, ctermfg = tc.type_alt }},

		-- Treesitter
		{'@constant.builtin', { fg = c.literal_alt, ctermfg = tc.literal_alt }},
		{'@namespace', { fg = c.type_alt, ctermfg = tc.type_alt }},
		{'@variable', { fg = c.id, ctermfg = tc.id }},
		{'@text.literal', { fg = c.fg, ctermfg = tc.fg }},
		{'@attribute', { link = 'Type' }},
		{'@module', { link = '@namespace' }},

		-- Language specific
		{'markdownCodeDelimiter', { link = 'Comment' }},
	}

	-- Telescope
	if options.plugin_integrations.telescope then
		hi {
			{'TelescopeNormal', { bg = c.bg, ctermbg = tc.bg }},
			{'TelescopePromptBorder', { fg = c.fg_alt, ctermfg = tc.fg_alt, bg = c.bg, ctermbg = tc.bg }},
			{'TelescopeResultsBorder', { fg = c.fg_alt, ctermfg = tc.fg_alt, bg = c.bg, ctermbg = tc.bg }},
			{'TelescopePreviewBorder', { fg = c.fg_alt, ctermfg = tc.fg_alt, bg = c.bg, ctermbg = tc.bg }},
			{'TelescopeSelection', { bg = c.bg_alt, ctermbg = tc.bg_alt }},
			{'TelescopeMultiSelection', { bg = c.bg_alt, ctermbg = tc.bg_alt, bold = true }},
			{'TelescopeMatching', { fg = c.literal_alt, ctermfg = tc.literal_alt, bold = true }},
			{'TelescopePromptPrefix', { fg = c.fg_alt, ctermfg = tc.fg_alt, bg = c.bg, ctermbg = tc.bg }},
		}
	end

	-- mini.nvim
	if options.plugin_integrations.mini_nvim then
		hi {
			{'MiniStatuslineFile', { bg = c.bg_br, ctermbg = tc.bg_br, fg = c.fg_alt, ctermfg = tc.fg_alt }},
			{'MiniStatuslineFileinfo', { bg = c.bg_br, ctermbg = tc.bg_br, fg = c.fg_alt, ctermfg = tc.fg_alt }},
			{'MiniStatuslineFilename', { bg = c.bg_alt, ctermbg = tc.bg_alt, fg = c.fg, ctermfg = tc.fg }},
			{'MiniStatuslineInactive', { bg = c.bg_alt, ctermbg = tc.bg_alt, fg = c.bg_br_alt, ctermfg = tc.bg_br_br_alt }},
			{'MiniStatuslineDevinfo', { bg = c.bg_br, ctermbg = tc.bg_br, fg = c.fg_br, ctermfg = tc.fg_br }},
			{'MiniStatuslineModeNormal', { bg = c.reserved, ctermbg = tc.reserved, fg = c.bg, ctermfg = tc.bg_br, bold = true }},
			{'MiniStatuslineModeInsert', { bg = c.type, ctermbg = tc.type, fg = c.bg, ctermfg = tc.bg_br, bold = true }},
			{'MiniStatuslineModeVisual', { bg = c.literal, ctermbg = tc.literal, fg = c.bg, ctermfg = tc.bg_br, bold = true }},
			{'MiniStatuslineModeCommand', { bg = c.reserved_alt, ctermbg = tc.reserved_alt, fg = c.bg, ctermfg = tc.bg_br, bold = true }},
			{'MiniStatuslineModeReplace', { bg = c.str_alt, ctermbg = tc.str_alt, fg = c.bg, ctermfg = tc.bg_br, bold = true }},
			{'MiniStatuslineModeOther', { bg = c.bg_br_alt, ctermbg = tc.bg_br_alt, fg = c.bg, ctermfg = tc.bg_br, bold = true }},

			{'MiniTablineHidden', { fg = c.fg_alt, ctermfg = tc.fg_alt, bg = c.bg, ctermbg = tc.bg }},
			{'MiniTablineModifiedHidden', { fg = c.fg_alt, ctermfg = tc.fg_alt, bg = c.bg, ctermbg = tc.bg, italic = true }},
			{'MiniTablineCurrent', { fg = c.fg_alt, ctermfg = tc.fg_alt, bg = c.bg_alt, ctermbg = tc.bg_alt, bold = true }},
			{'MiniTablineModifiedCurrent', { fg = c.fg_alt, ctermfg = tc.fg_alt, bg = c.bg_alt, ctermbg = tc.bg_alt, bold = true, italic = true }},
			{'MiniTablineVisible', { link = 'MiniTablineHidden' }},
			{'MiniTablineModifiedVisible', { link = 'MiniTablineModifiedHidden' }},
			{'MiniTablineTabpagesection', { bg = c.fg, ctermbg = tc.fg, fg = c.bg, ctermfg = tc.bg, bold = true}},
		}
	end

	if options.plugin_integrations.lazy then
		hi {
			{'LazyNormal', { link = 'Normal' } },
		}
	end

	-- Apply overrides
	hi(options.overrides)

	-- Set global with current options
	NvimThemeOptions = options
end

return M
