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