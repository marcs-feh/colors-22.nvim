local M = {}

local apply = require 'nvim-theme.theme'.apply_theme

M.setup = function(opts)
	apply(opts)
end

return M
