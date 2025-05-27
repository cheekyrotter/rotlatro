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
                    card = other_card
                }
            end
        end
    end
    
}

SMODS.Joker { 
    -- Creation joker
    -- Creates a random legendary joker after a length of time

    -- Key
    key = 'spirit',

    -- Vars
    config = { extra = { max_rounds = 10, rounds = 0 }},

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.max_rounds, card.ability.extra.rounds } }
    end,

    -- Atlas
    atlas = 'rotlatro',
    pos = { x = 0, y = 0 },
    
    -- Ingame config
    cost = 10,
    unlocked = true, 
    discovered = true,
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
            SMODS.add_card({set = 'Joker', legendary = true})
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
}

SMODS.Joker { 
    -- Scaling joker
    -- Gains xmult when a Queen or 2 is destroyed
    -- Based on character of same name from Invincible (iykyk)

    -- Key
    key = 'plex',

    -- Vars
    config = { extra = { xmult = 1, xmult_gain = 0.5 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_gain } }
    end,

    -- Atlas
    atlas = 'rotlatro',
    pos = { x = 2, y = 0 },
    
    -- Ingame config
    cost = 4,
    unlocked = true, 
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,

    calculate = function(self, card, context)

        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end

        if context.remove_playing_cards and not context.blueprint then
            local destroyed = 0
            for k, v in ipairs(context.removed) do
                print(v:get_id())
                if v:get_id() == 12 or v:get_id() == 2 then
                    card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
                    destroyed = destroyed + 1
                end
            end
            if destroyed > 0 then
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
    -- Scaling joker
    -- Increases when any luck based ability fails

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

        -- if context.probability_failed and context.individual and not context.blueprint then
            
        --     return {
        --         message = 'FAILURE!',
        --         colour = G.C.RED,
        --         card = other_card
        --     }
        -- end
        
        if context.end_of_round and context.cardarea == G.jokers then
            card.ability.extra.xmult = 1
            return {
                message = localize('k_reset'),
                colour = G.C.RED
            }
        end
    end
    
}

SMODS.Joker { 
    -- Creation joker
    -- Creates 2 negative jokers after a boss

    -- Key
    key = 'nancy',

    -- Vars
    config = { extra = { creates = 2 }},

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.creates } }
    end,

    -- Atlas
    atlas = 'rotlatro',
    pos = { x = 0, y = 0 },
    
    -- Ingame config
    cost = 10,
    unlocked = true, 
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 3,

    calculate = function(self, card, context)

        if 
            context.end_of_round and
            context.cardarea == G.jokers and
            G.GAME.blind.boss == true
        then
            local jokers_to_create = card.ability.extra.creates
            print(jokers_to_create)
            G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
            G.E_MANAGER:add_event(Event({
                func = function()
                    for _ = 1, jokers_to_create do
                        SMODS.add_card {
                            set = 'Joker',
                            edition = 'e_negative'
                        }
                        G.GAME.joker_buffer = 0
                    end
                    return true
                end
            }))
            return {
                message = '+2 Jokers',
                colour = G.C.BLUE,
            }
        
        end
    end 
}

SMODS.Joker { 
    -- Xmult joker
    -- Gives x1.5, -$1, cost increases with more triggers

    -- this genuinely might be the worst thing ive ever created
    -- update: i
    -- update 2: okay so i am beginning to hate this thing with a burning passion, i have sunk so much time into this for one fucking stupid joker 
    -- i want it to die and burn in hell for all eternity for the impact it has had on my mental health
    -- not even my ex girlfriend could give me this much trauma

    -- Thank you Aurelius7309, John S Mods himself
    -- Explained this to me in detail, incredibly nice and helpful of him
    -- Also thank you to nh6574 for giving the nested extra tables suggestion
    -- While I did not use this solution ultimately, they were very helpful regardless

    -- Key
    key = 'trade',

    -- Vars
    config = { extra = { xmult = 1.5, cost = 1, triggers = 0, reset_triggers = 5} },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.cost, card.ability.extra.triggers, card.ability.extra.reset_triggers, card.ability.extra.reset_triggers - card.ability.extra.triggers } }
    end,

    -- Atlas
    atlas = 'rotlatro',
    pos = { x = 3, y = 0 },
    
    -- Ingame config
    cost = 6,
    unlocked = true, 
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 3,

    calculate = function(self, card, context)

        if context.final_scoring_step then

            local current_mult = mult
            local current_money = G.GAME.dollars
            local current_cost = card.ability.extra.cost
            local current_triggers = card.ability.extra.triggers

            repeat
                if to_big(current_money) - to_big(current_cost) >= to_big(G.GAME.bankrupt_at) then

                    current_mult = current_mult * card.ability.extra.xmult
                    current_money = current_money - current_cost
                    current_triggers = current_triggers + 1

                    if current_triggers == card.ability.extra.reset_triggers then
                        current_triggers = 0
                        current_cost = current_cost + 1
                        SMODS.calculate_effect({message = "Price Increase!"}, card)
                    end

                    SMODS.calculate_effect({
                        xmult = card.ability.extra.xmult,
                        dollars = -current_cost
                    }, card)

                else
                    break
                end
            until((current_mult * hand_chips) >= G.GAME.blind.chips)
            card.ability.extra.triggers = current_triggers
            card.ability.extra.cost = current_cost


        end
        -- SMODS.calculate_effect({message = "idk"}, card)

        -- if context.final_scoring_step then
        --     local triggers = 0
        --     local money = to_big(G.GAME.dollars)

        --     local relative_triggers = card.ability.extra.triggers
        --     local relative_cost = card.ability.extra.dollars

        --     if money - relative_cost >= to_big(G.GAME.bankrupt_at) then
        --         repeat
        --             relative_triggers = relative_triggers + 1
        --             if relative_triggers == card.ability.extra.reset_triggers then
        --                 relative_triggers = 0
        --                 relative_cost = relative_cost + 1
        --             end
        --             if money - relative_cost >= to_big(G.GAME.bankrupt_at) then
        --                 -- 
        --                 triggers = triggers + 1
        --                 money = money - relative_cost
                        
        --             else
        --                 break
        --             end
        --         until((hand_chips * mult * (card.ability.extra.xmult ^ triggers)) >= G.GAME.blind.chips)

        --         local return_table = {
        --             xmult = card.ability.extra.xmult,
        --             dollars = -card.ability.extra.dollars,
                    
        --         }

        --         local reset_table = {
        --             message = "Higher Prices!",
        --             func = function()
        --                 card.ability.extra.dollars = card.ability.extra.dollars + 1
        --             end
        --         }
                
        --         

        --         local head = return_table
        --         local copy = SMODS.shallow_copy(return_table)
                

        --         for i = 1, triggers - 1 do
        --             card.ability.extra.triggers = card.ability.extra.triggers + 1
        --             if card.ability.extra.triggers == card.ability.extra.reset_triggers then
        --                 card.ability.extra.triggers = 0
        --                 return_table.extra = SMODS.shallow_copy(reset_table)
        --                 return_table = return_table.extra
        --                 copy.dollars = copy.dollars - 1
        --             end
        --             return_table.extra = SMODS.shallow_copy(copy)
        --             return_table = return_table.extra
        --         end

        --         return_table.func = function()
        --                 G.E_MANAGER:add_event(Event({
        --                     func = function()
        --                         G.GAME.dollar_buffer = 0
        --                         return true
        --                     end
        --             }))
        --         end

        --         G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) - (triggers * card.ability.extra.dollars)

        --         return head
        --     end
        -- end
    end
    
}

SMODS.Joker { 
    -- Mult joker
    -- Sets mult to 12

    -- Key
    key = 'safety',

    -- Vars
    config = { extra = { mult = 12 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,

    -- Atlas
    atlas = 'rotlatro',
    pos = { x = 2, y = 0 },
    
    -- Ingame config
    cost = 4,
    unlocked = true, 
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 1,

    calculate = function(self, card, context)
        if context.joker_main then
            local subtract = mult - card.ability.extra.mult
            return {
                mult_mod = -subtract,
                message = card.ability.extra.mult.."!",
                colour = G.C.MULT
            }
        end
    end
}

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
    end,
}

SMODS.Joker { 
    -- Copying joker
    -- Copies joker to left for fixed uses/rounds
    -- Thanks Vanilla Remade people
    -- https://github.com/nh6574/VanillaRemade/blob/main/src/jokers.lua

    -- Key
    key = 'rice',

    -- Atlas
    atlas = 'rotlatro',
    pos = { x = 2, y = 0 },
    
    -- Ingame config
    cost = 8,
    unlocked = true, 
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,

    -- Vars
    config = { extra = { uses = 12 } },

    loc_vars = function(self, info_queue, card)
        local main_end = nil
        if G.jokers and G.jokers.cards then
            local other_joker
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i - 1] end
            end
            local compatible = other_joker and other_joker ~= card and other_joker.config.center.blueprint_compat
            main_end = (card.area and card.area == G.jokers) and {
                {
                    n = G.UIT.C,
                    config = { align = "bm", minh = 0.4 },
                    nodes = {
                        {
                            n = G.UIT.C,
                            config = { ref_table = card, align = "m", colour = compatible and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8), r = 0.05, padding = 0.06 },
                            nodes = {
                                { n = G.UIT.T, config = { text = ' ' .. localize('k_' .. (compatible and 'compatible' or 'incompatible')) .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 } },
                            }
                        }
                    }
                }
            } or nil
        end
        return { main_end = main_end, vars = {card.ability.extra.uses} }
    end,

    calculate = function(self, card, context)

        local other_joker = nil
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i - 1] end
        end
        local blueprint = SMODS.blueprint_effect(card, other_joker, context)
        if blueprint then
            card.ability.extra.uses = card.ability.extra.uses - 1
            
            blueprint.extra = {
                func = function ()
                    SMODS.calculate_effect({
                        message = "Chomp!"},
                        card
                )
            end
                -- message = "Chomp!",
                -- card = blueprint.copier
            }
        end
        return(blueprint)
    end
}

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