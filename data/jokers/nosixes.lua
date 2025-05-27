SMODS.Joker { 
    -- Chance joker
    -- Halves all chances

    -- Key
    key = 'nosixes',

    -- Atlas
    atlas = 'rotlatro',
    pos = { x = 2, y = 0 },
    
    -- Ingame config
    cost = 4,
    unlocked = true, 
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,

    add_to_deck = function(self, card, from_debuff)
        for k, v in pairs(G.GAME.probabilities) do 
            G.GAME.probabilities[k] = v/2
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        for k, v in pairs(G.GAME.probabilities) do
            G.GAME.probabilities[k] = v*2
        end
    end
}