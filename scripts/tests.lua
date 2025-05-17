return {


SMODS.Joker {
    key = "test",
    config = {unlocked = true, discovered = true, extra = {mult = 10}},
    loc_txt = {
        name = 'Test',
        text = {'Test Joker'}
    },
    atlas = "rotlatro",
    pos = {x = 0, y = 0},
    cost = 4,
    
    calculate = function(self, card, context)

        if context.joker_main then
            return {
                mult_mod = card.ability.extra.mult,
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
            }
        end
    end
},

SMODS.Joker {
    key = "test2",
    config = {unlocked = true, discovered = true, extra = {mult = 0, mult_gain = 5}},
    loc_txt = {
        name = 'Test2',
        text = {
            "Gains {C:mult}+#2#{} Mult",
            "per hand",
            "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"}
    },
    atlas = "rotlatro",
    pos = {x = 1, y = 0},
    cost = 4,
    
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain } }
    end,

    calculate = function(self, card, context)

        if context.joker_main then
            return {
                card.ability.extra.mult == card.ability.extra.mult + card.ability.extra.mult_gain,
                mult_mod = card.ability.extra.mult,
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
            }
        end

        if context.before and not context.blueprint then
            -- Updated variable is equal to current variable, plus the amount of chips in chip gain.
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
            return {
                message = 'Upgraded!',
                colour = G.C.MULT,
                card = card
            }
        end
    end
},


SMODS.Joker {
    key = "test3",
    config = {unlocked = true, discovered = true, extra = {repetitions = 1}},
    loc_txt = {
        name = 'Test3',
        text = {
            "Retriggers all retriggering jokers {C:oraneg}+#1#{} times"
        }
    },
    atlas = "rotlatro",
    pos = {x = 2, y = 0},
    cost = 4,
    rarity = 3,
    
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.repetitions } }
    end,

    calculate = function(self, card, context)
        -- Checks that the current cardarea is G.play, or the cards that have been played, then checks to see if it's time to check for repetition.
        -- The "not context.repetition_only" is there to keep it separate from seals.
        if context.retrigger_joker_check and not context.retrigger_joker then
            -- context.other_card is something that's used when either context.individual or context.repetition is true
            -- It is each card 1 by 1, but in other cases, you'd need to iterate over the scoring hand to check which cards are there.
            return {
                message = 'Again!',
                repetitions = card.ability.extra.repetitions,
            }
        end
    end
},


SMODS.Keybind {
    key = 'test_give',
    key_pressed = '1',

    action = function(self)
        local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_rotlatro_dangit')
        card:add_to_deck()
        G.jokers:emplace(card)
    end
},

SMODS.Keybind {
    key = 'test_give2',
    key_pressed = '2',

    action = function(self)
        local card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_hanged_man')
        card:add_to_deck()
        G.consumeables:emplace(card)
    end
},

SMODS.Keybind {
    key = 'test_give3',
    key_pressed = '3',

    action = function(self)
        local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_bloodstone')
        card:add_to_deck()
        G.jokers:emplace(card)
    end
}

}