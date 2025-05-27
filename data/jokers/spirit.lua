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