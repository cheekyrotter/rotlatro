SMODS.Atlas {
	-- Key for code to find it with
	key = "rotlatro",
	-- The name of the file, for the code to pull the atlas from
	path = "rotlatro.png",
	-- Width of each sprite in 1x size
	px = 71,
	-- Height of each sprite in 1x size
	py = 95
}

SMODS.current_mod.optional_features = function()
    return {
    retrigger_joker = true,
    }
end

-- function Card:get_id()
--     local ret = Getid_old(self)
--     if ret == 12 and next(find_joker("j_rotlatro_equality")) then ret = 13 end
--     return ret
--   end


assert(SMODS.load_file("scripts/tests.lua"))()
assert(SMODS.load_file("scripts/jokers.lua"))()