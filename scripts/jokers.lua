return {

SMODS.Joker { 
    -- Scaling joker
    -- Gains xmult when king of diamonds played

    -- Name/desc
    key = 'malech',
    loc_txt = {
        name = 'malech',
        text = {
        "This joker Gains {X:mult,C:white}X#2# {} Mult",
        "per {C:diamonds}Kings of Diamonds{} played",
        "{c:inactive}(Currently {X:mult,C:white} X#1# {c:inactive} Mult)",
        }
    },

    -- Vars
    config = { extra = { xmult = 1, xmult_gain = 0.2 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_gain } }
    end,

    -- Atlas
    atlas = 'rotlatro',
    pos = { x = 1, y = 0 },
    
    -- Ingame config
    cost = 7,
    unlocked = true, 
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 3,

    calculate = function(self, card, context)

        if context.joker_main then
            return {
                mult_mod = card.ability.extra.xmult,
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } }
            }
        end

        if context.individual and context.cardarea == G.play and not context.blueprint then
            
            -- Updated variable is equal to current variable, plus the amount of gain.
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
},


SMODS.Joker { 
    -- This is the first actual joker in the mod
    -- The code for this joker is from GARBSHIT, the inspiration behind this mod
    -- https://github.com/Gainumki/GARBSHIT/blob/main/scripts/jokers.lua
    -- Gives 2X per Heart King

    -- Name/desc
    key = 'gabril',
    loc_txt = {
        name = 'Gabril',
        text = {
        "All scored {C:hearts}Kings of Hearts{}",
        "give {X:mult,C:white} X#1# {} Mult",
        }
    },

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
    discovered = false,
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
},


SMODS.Joker { 
    -- Chance per card joker
    -- 1 in 2 chance for 3x mult with spade kings

    -- Name/desc
    key = 'ash',
    loc_txt = {
        name = 'Ash',
        text = {
        "{C:green}#1# in #2#{} chance for each",
        "{C:spades}Kings of Spades{} played",
        "to give {X:mult,C:white} X#3# {c:inactive} Mult when scored",
        }
    },

    -- Vars
    config = { extra = { odds = 1, xmult = 3 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds, card.ability.extra.xmult } }
    end,

    -- Atlas
    atlas = 'rotlatro',
    pos = { x = 3, y = 0 },
    
    -- Ingame config
    cost = 7,
    unlocked = true, 
    discovered = false,
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
},


SMODS.Joker { 
    -- Scaling joker
    -- Gains chips when club king played

    -- Name/desc
    key = 'estark',
    loc_txt = {
        name = 'Estark',
        text = {
        "This Joker gains {C:chips}#2#{} Chips",
        "per {C:clubs}Kings of Clubs{} played",
        "{c:inactive}(Currently {C:chips}#1#{c:inactive} Chips)",
        }
    },

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
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 3,

    calculate = function(self, card, context)

        if context.joker_main then
            return {
                chips_mod = card.ability.extra.chips,
                message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
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
},


}