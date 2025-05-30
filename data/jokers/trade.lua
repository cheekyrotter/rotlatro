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
    end
    
}