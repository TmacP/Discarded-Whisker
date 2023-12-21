-- player.lua

local player = {}

function player.create()
	local newPlayer = {
		deck = {
			--{ name = "SeaHorse" },
			{ name = "DeerSmall" },
			{ name = "RedFoxSmall" }, 
			{ name = "ChestSmall" },
		},
		hand = {}
	}
	return newPlayer
end

function player.drawCard(player)
	math.randomseed(os.time()) -- set the seed to make non deterministic

	if #player.deck > 0 then
		local randomIndex = math.random(1, #player.deck)
		
		-- pop a few random off to keep it random
		math.random(1, #player.deck)
		math.random(1, #player.deck)
		math.random(1, #player.deck)
		math.random(1, #player.deck)
		math.random(1, #player.deck)
		-- continue
		
		local drawnCard = table.remove(player.deck, randomIndex)
		table.insert(player.hand, drawnCard)
		return drawnCard
	else
		return nil -- No cards left in the deck
	end
end

return player