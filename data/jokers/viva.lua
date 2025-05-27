SMODS.Joker { 
    -- Retrigger joker
    -- Retriggers lucky cards

    -- Key
    key = 'viva',

    -- Vars
    config = { extra = { retriggers = 1 }},

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.retriggers } }
    end,

    -- Atlas
    atlas = 'rotlatro',
    pos = { x = 5, y = 0 },
    
    -- Ingame config
    cost = 5,
    unlocked = true, 
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,

    calculate = function(self, card, context)

        if context.repetition and context.cardarea == G.play then
            if context.other_card.config.center.key == "m_lucky" then
                return {
                    message = localize("k_again_ex"),
                    repetitions = card.ability.extra.retriggers,
                    card = context.other_card
                }
            end
        end
    end
    
}