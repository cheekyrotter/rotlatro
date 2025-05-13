return {

SMODS.Joker { 
    -- Scaling joker
    -- Gains xmult when king of diamonds played

    -- Name/desc
    key = 'malech',
    loc_txt = {
        name = 'Malech',
        text = {
        "This joker Gains {X:mult,C:white}X#2# {} Mult when",
        "each {C:diamonds}Kings of Diamonds{} is scored",
        "{c:inactive}(Currently {X:mult,C:white} X#1# {c:inactive} Mult)",
        }
    },

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
        "Each scored {C:hearts}Kings of Hearts{}",
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
        "{C:spades}Kings of Spades{} scored",
        "to give {X:mult,C:white} X#3# {c:inactive} Mult when scored",
        }
    },

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
        "This Joker gains {C:chips}+#2#{} Chips when",
        "each {C:clubs}Kings of Clubs{} is scored",
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

SMODS.Joker { 
    -- Retrigger joker
    -- Retriggers lucky cards

    -- Name/desc
    key = 'viva',
    loc_txt = {
        name = 'Viva Las Jimbo',
        text = {
        "Retrigger all scored",
        "{C:attention}Lucky{} cards",
        }
    },

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
    discovered = false,
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
                    card = other_card
                }
            end
        end
    end
    
},

SMODS.Joker { 
    -- Creation joker
    -- Creates a random legendary joker after a length of time

    -- Name/desc
    key = 'spirit',
    loc_txt = {
        name = 'Spirit',
        text = {
        "After {C:attention}#1# rounds,",
        "sell this card to create a",
        "random {E:1,C:legendary}Legendary{} Joker",
        "{c:inactive}(Currently {C:attention}#2#{c:inactive}/#1#)"
        }
    },

    -- Vars
    config = { extra = { max_rounds = 1, rounds = 0 }},

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.max_rounds, card.ability.extra.rounds } }
    end,

    -- Atlas
    atlas = 'rotlatro',
    pos = { x = 0, y = 0 },
    
    -- Ingame config
    cost = 10,
    unlocked = true, 
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    rarity = 3,

    calculate = function(self, card, context)

        if 
            context.selling_self
            and (card.ability.extra.rounds == card.ability.extra.max_rounds)
            and not context.blueprint
        then
            play_sound('timpani')
            local card = create_card('Joker', G.jokers, true)
            card:add_to_deck()
            G.jokers:emplace(card)
			card:start_materialize()
        end

        if 
            context.end_of_round 
            and context.cardarea == G.jokers 
            and not context.blueprint
            and not context.individual
            and not context.repetition
            and not context.retrigger_joker 
        then
            if card.ability.extra.rounds < card.ability.extra.max_rounds then

                card.ability.extra.rounds = card.ability.extra.rounds + 1
                if card.ability.extra.rounds == card.ability.extra.max_rounds then
                    local eval = function(card) return not card.REMOVED end
                    juice_card_until(card, eval, true) 
                end
                return {
                    message = card.ability.extra.rounds .. '/' .. card.ability.extra.max_rounds,
                    color = G.C.FILTER,
                    card = card
                }
            end
        
        
    end
end 
},

}