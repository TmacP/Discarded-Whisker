-- card_data.lua

local card_data = {}

local card_health = {
	{ name = "SeaHorse", hp = 3},
	{ name = "Deer", hp = 3},
	{ name = "Chest", hp = 3},
	{ name = "RedFox", hp = 3}
	-- Add more card data as needed
}

function card_data.get_health(name)
	for _, card in ipairs(card_health) do
		if card.name == name then
			return card.hp
		end
	end
	return nil  -- Return nil if the card name is not found
end

return card_data
