-- player.lua

local player = {}

function player.create()
	local newPlayer = {
		deck = {
			--{ name = "SeaHorse" },
			{ name = "Deer" },
		--{ name = "RedFox" },
			{ name = "Chest" },
		},
		hand = {}
	}
	return newPlayer
end

function player.drawCard(player)
	if #player.deck > 0 then
		local randomIndex = math.random(1, #player.deck)
		local drawnCard = table.remove(player.deck, randomIndex)
		table.insert(player.hand, drawnCard)
		return drawnCard
	else
		return nil -- No cards left in the deck
	end
end

return player