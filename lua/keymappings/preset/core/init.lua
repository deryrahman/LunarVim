-- Contains core plugins specific keymappings
local compe = require "keymappings.preset.core.compe"
local telescope = require "keymappings.preset.core.telescope"

local keys = {}
keys.compe = compe
keys.telescope = telescope

return keys
