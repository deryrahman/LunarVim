-- Contains core plugins specific keymappings
local compe = require "keymappings.preset.plugin.compe"
local telescope = require "keymappings.preset.plugin.telescope"

local keys = {}
keys.compe = compe
keys.telescope = telescope

return keys
