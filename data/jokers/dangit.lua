SMODS.Joker { 
    -- Scaling joker
    -- Increases when any luck based ability fails in that round

    -- Key
    key = 'dangit',

    -- Vars
    config = { extra = { xmult = 1, xmult_gain = 0.25 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_gain } }
    end,

    -- Atlas
    atlas = 'rotlatro',
    pos = { x = 3, y = 0 },
    
    -- Ingame config
    cost = 7,
    unlocked = true, 
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 3,

    calculate = function(self, card, context)

        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult,
            }
        end

        if context.probability_failed and not context.blueprint then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
            return {
                message = 'Upgraded!',
                colour = G.C.MULT,
                card = card
            }
        end

        
        if context.end_of_round and context.cardarea == G.jokers then
            card.ability.extra.xmult = 1
            return {
                message = localize('k_reset'),
                colour = G.C.RED
            }
        end
    end
    
}