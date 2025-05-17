-- Save original pseudorandom function
local _pseudorandom = pseudorandom

-- Override pseudorandom
function pseudorandom(seed)
    local result = _pseudorandom(seed)

    local odds = nil
    local self_ref = nil

    -- Look through local variables of the original function
    for i = 1, 10 do
        local name, value = debug.getlocal(2, i)
        if name == "self" then
            self_ref = value
            break
        end
    end

    if self_ref and self_ref.ability and self_ref.ability.extra then
        odds = G.GAME.probabilities.normal / self_ref.ability.extra.odds
        if result >= odds then
            print("Ability failed for seed:", seed, "result:", result, "threshold:", odds)
            SMODS.calculate_context{probability_failed = true}
        end
    end

    return result
end
