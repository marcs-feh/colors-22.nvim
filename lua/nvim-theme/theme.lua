local M = {}

local hi = require 'nvim-theme.hi'.hi_set_pairs

local def_colors = require 'nvim-theme.colors'

local def_options = {
	transparent        = true,
	italic_comments    = false,
	bright_cursor_line = false,

	plugin_integrations = {
		telescope = true,
		mini_nvim = true,
	},

	colors = def_colors,
}

M.apply_theme = function(options)
	if not options then options = def_options end

	for k, _ in pairs(def_options) do
		if options[k] == nil then
			options[k] = def_options[k]
		end
	end

	local c = options.colors
	local cursor_bg = options.bright_cursor_line and c.bg_alt or nil
	local tr_bg     = nil
	if not options.transparent then
		tr_bg = c.bg
	end

	vim.cmd [[ colorscheme default ]]

	-- Neovim
	hi {
		-- Core highlight groups
		{'Normal', { bg = tr_bg, fg = c.fg }},
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
		{'Folded', { bg = tr_bg, fg = c.bg_br_alt, italic = not options.italic_comments }},
		{'FoldColumn', { bg = c.tr_bg, fg = c.bg_br_alt }},
		{'Title', { fg = c.type, bold = true }},
		{'Question', { fg = c.fg }},
		{'NonText', { fg = c.type, bold = true }},
		{'Tabline', { bg = c.bg_alt }},
		{'TablineSel', { bg = c.bg_br, bold = true }},
		{'TablineFill', { bg = c.tr_bg }},
		{'WinBar', { bg = c.bg_alt, fg = c.fg_alt }},
		{'WinSeparator', { bg = c.bg, fg = c.bg }},
		{'StatusLine', { bg = c.bg_alt, fg = c.fg_alt }},
		{'StatusLineNC', { bg = c.bg, fg = c.bg_br_alt }},
		{'DiffAdd', { fg = c.func }},
		{'DiffText', { fg = c.reserved }},
		{'DiffChange', { fg = c.reserved_alt }},
		{'DiffDelete', { fg = c.bg_alt }},

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
		{'SpellBad', { fg = c.hint, undercurl = true }},
		{'SpellCap', { fg = c.fg, undercurl = true }},
		{'SpellLocal', { fg = c.fg, italic = true, undercurl = true }},
		{'SpellRare', { fg = c.hint, undercurl = true }},

		-- Diagnostic
		{'DiagnosticError', { fg = c.error }},
		{'DiagnosticWarn', { fg = c.warn }},
		{'DiagnosticHint', { fg = c.hint }},
		{'DiagnosticInfo', { fg = c.info }},
		{'DiagnosticUnderlineError', { fg = c.error, underline = true }},
		{'DiagnosticUnderlineWarn', { fg = c.warn, underline = true }},
		{'DiagnosticUnderlineHint', { fg = c.hint, underline = true }},
		{'DiagnosticUnderlineInfo', { fg = c.info, underline = true }},

		-- Treesitter
		{'@constant.builtin', { fg = c.literal_alt }},
		{'@namespace', { fg = c.type_alt }},
	}

	-- Telescope
	if options.plugin_integrations.telescope then
		hi {
			{'TelescopeNormal', { bg = c.bg }},
			{'TelescopePromptBorder', { fg = c.fg_alt, bg = c.bg }},
			{'TelescopeResultsBorder', { fg = c.fg_alt, bg = c.bg }},
			{'TelescopePreviewBorder', { fg = c.fg_alt, bg = c.bg }},
			{'TelescopeSelection', { bg = c.bg_alt }},
			{'TelescopeMultiSelection', { bg = c.bg_alt, bold = true }},
			{'TelescopeMatching', { fg = c.literal_alt, bold = true }},
			{'TelescopePromptPrefix', { fg = c.fg_alt, bg = c.bg }},
		}
	end

	-- mini.nvim
	if options.plugin_integrations.mini_nvim then
		hi {
			{'MiniStatuslineFile', { bg = c.bg_br, fg = c.fg_alt }},
			{'MiniStatuslineFileinfo', { bg = c.bg_br, fg = c.fg_alt }},
			{'MiniStatuslineFilename', { bg = c.bg_alt, fg = c.fg }},
			{'MiniStatuslineInactive', { bg = c.bg_alt, fg = c.bg_br_alt }},
			{'MiniStatuslineDevinfo', { bg = c.bg_br, fg = c.fg_br }},
			{'MiniStatuslineModeNormal', { bg = c.reserved, fg = c.bg, bold = true }},
			{'MiniStatuslineModeInsert', { bg = c.type, fg = c.bg, bold = true }},
			{'MiniStatuslineModeVisual', { bg = c.literal, fg = c.bg, bold = true }},
			{'MiniStatuslineModeCommand', { bg = c.reserved_alt, fg = c.bg, bold = true }},
			{'MiniStatuslineModeReplace', { bg = c.str_alt, fg = c.bg, bold = true }},
			{'MiniStatuslineModeOther', { bg = c.bg_br_alt, fg = c.bg, bold = true }},

			{'MiniTablineHidden', { fg = c.fg_alt, bg = c.bg }},
			{'MiniTablineModifiedHidden', { fg = c.fg_alt, bg = c.bg, italic = true }},
			{'MiniTablineCurrent', { fg = c.fg_alt, bg = c.bg_alt, bold = true }},
			{'MiniTablineModifiedCurrent', { fg = c.fg_alt, bg = c.bg_alt, bold = true, italic = true }},
			{'MiniTablineVisible', { link = 'MiniTablineHidden' }},
			{'MiniTablineModifiedVisible', { link = 'MiniTablineModifiedHidden' }},
			{'MiniTablineTabpagesection', { bg = c.fg, fg = c.bg, bold = true}},
		}
	end
end

return M
