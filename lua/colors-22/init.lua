local M = {}

local apply = require 'colors-22.theme'.apply_theme

M.setup = function(opts)
	apply(opts)
end

M.default_colors = require 'colors-22.colors'


return M
