-- player_deck.lua
local M = {}

local state = {}

function M.add_card(v)
	table.insert(state, v)
end

function M.get_state()
	return state
end

return M
