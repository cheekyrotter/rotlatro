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