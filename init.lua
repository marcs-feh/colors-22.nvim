local M = {}

local apply = require 'theme'.apply_theme

M.setup = function(opts)
	apply(opts)
end

return M
