local M = {}

local apply = require 'nvim-theme.theme'.apply_theme

M.setup = function(opts)
	apply(opts)
end

M. default_colors = require 'nvim-theme.colors'


return M
