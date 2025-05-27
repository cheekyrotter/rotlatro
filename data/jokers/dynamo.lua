SMODS.Joker { 
    -- Creation joker
    -- Makes wild copy of last card in flush

    -- Key
    key = 'dynamo',

    -- Vars
    config = { extra = { } },

    loc_vars = function(self, info_queue, card)
        return { vars = { } }
    end,

    -- Atlas
    atlas = 'rotlatro',
    pos = { x = 1, y = 0 },
    
    -- Ingame config
    cost = 5,
    unlocked = true, 
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,

    calculate = function(self, card, context)

        if context.after and context.poker_hands['Flush'] then
            local hand_size = #context.scoring_hand
            local original = context.scoring_hand[hand_size]
            local copy_rank = original:get_id()
            local copy_suit = original.config.card.suit
            local copy = SMODS.create_card()
        end
    end
}