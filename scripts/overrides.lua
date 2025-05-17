-- Save original pseudorandom function
local _pseudorandom = pseudorandom

-- Override pseudorandom
function pseudorandom(seed)
    local result = _pseudorandom(seed)

    local odds = nil
    local extra_odds = nil
    local self_ref = nil

    -- Look through local variables of the original function
    for i = 1, 10 do
        local name, value = debug.getlocal(2, i)
        -- print(name, value)
        if name == "self" then
            self_ref = value
            break
        end
    end

    if self_ref and self_ref.ability and self_ref.ability.extra then
        local success = pcall(function()
            extra_odds = self_ref.ability.extra.odds
        end)
        if not success then
            local success = pcall(function ()
                extra_odds = self_ref.ability.extra.odds_1
            end)
        end
        if not success then
            local success = pcall(function ()
                extra_odds = self_ref.ability.extra
            end)
        end

        odds = G.GAME.probabilities.normal / extra_odds
        if result >= odds then
            print("Ability failed for seed:", seed, "result:", result, "threshold:", odds)
            SMODS.calculate_context{probability_failed = true}
        end
    end

    return result
end
