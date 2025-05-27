SMODS.Joker { 
    -- Scaling joker
    -- Gains xmult when king of diamonds played

    -- Key
    key = 'malech',

    -- Vars
    config = { extra = { xmult = 1, xmult_gain = 0.1 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_gain } }
    end,

    -- Atlas
    atlas = 'rotlatro',
    pos = { x = 1, y = 0 },
    
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

        if context.individual and context.cardarea == G.play and not context.blueprint then
            
            if context.other_card:get_id() == 13 and context.other_card:is_suit("Diamonds") then
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
                return {
                    message = 'Upgraded!',
                    colour = G.C.MULT,
                    card = card
                }
            end
        end
    end
}


SMODS.Joker { 
    -- This is the first actual joker in the mod
    -- The code for this joker is from GARBSHIT, the inspiration behind this mod
    -- i fucking love garbshit
    -- https://github.com/Gainumki/GARBSHIT/blob/main/scripts/jokers.lua
    -- Gives 2X per Heart King

    -- Key
    key = 'gabril',

    -- Vars
    config = { extra = { xmult = 2 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,

    -- Atlas
    atlas = 'rotlatro',
    pos = { x = 2, y = 0 },
    
    -- Ingame config
    cost = 7,
    unlocked = true, 
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 3,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 13 and context.other_card:is_suit("Hearts") then -- Checks for king and hearts
                return {
                    xmult = card.ability.extra.xmult,
                }
            end
        end
    end
}


SMODS.Joker { 
    -- Chance per card joker
    -- 1 in 2 chance for 3x mult with spade kings

    -- Key
    key = 'ash',

    -- Vars
    config = { extra = { odds = 2, xmult = 3 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds, card.ability.extra.xmult } }
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

        if context.individual and context.cardarea == G.play then
            if pseudorandom('Ash') < G.GAME.probabilities.normal/card.ability.extra.odds then
                if context.other_card:get_id() == 13 and context.other_card:is_suit("Spades") then
                    return {
                        xmult = card.ability.extra.xmult,
                    }
                end
            end
        end
    end
}


SMODS.Joker { 
    -- Scaling joker
    -- Gains chips when club king played

    -- Key
    key = 'estark',

    -- Vars
    config = { extra = { chips = 0, chips_gain = 50 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chips_gain } }
    end,

    -- Atlas
    atlas = 'rotlatro',
    pos = { x = 4, y = 0 },
    
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
                chips = card.ability.extra.chips,
            }
        end

        if context.individual and context.cardarea == G.play and not context.blueprint then
            
            -- Updated variable is equal to current variable, plus the amount of gain.
            if context.other_card:get_id() == 13 and context.other_card:is_suit("Clubs") then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_gain
                return {
                    message = 'Upgraded!',
                    colour = G.C.CHIPS,
                    card = card
                }
            end
        end
    end
}
