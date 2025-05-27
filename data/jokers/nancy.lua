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