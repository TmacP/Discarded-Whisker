-- player.lua

local player = {}

function player.create()
	local newPlayer = {
		deck = {
			{ name = "SeaHorse" },
			{ name = "Deer" },
			{ name = "RedFox" }, 
			{ name = "Chest" },
		},
		hand = {},
		discard = {}
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



function player.playCard(player, card)
	-- Find the index of the card in the hand
	local indexToRemove
	for i, c in ipairs(player.hand) do
		if c.name == card then
			indexToRemove = i
			break
		end
	end



	-- Remove the card from the hand and add it to the discard pile
	if indexToRemove then
		table.remove(player.hand, indexToRemove)
		table.insert(player.discard, {name = card})
	else
		print("Card not found in hand.")
	end
end


-- Fisher-Yates shuffle algorithm
local function shuffleDeck(deck)
	local n = #deck
	for i = n, 2, -1 do
		local j = math.random(i)
		deck[i], deck[j] = deck[j], deck[i]
	end
	print("shuffled deck")
end

function player.newDeck(player)
	-- Take all the cards out of the player.discard and add them to player.deck
	for _, card in ipairs(player.discard) do
		--print("card in discard: " .. card)
		table.insert(player.deck, card)
	end
	-- Clear the discard pile
	player.discard = {}
	-- Shuffle the deck
	shuffleDeck(player.deck)
	msg.post("/factory#card_factory", "new_deck")
	-- Return the updated player table
	return player -- not sure i need this
end

return player