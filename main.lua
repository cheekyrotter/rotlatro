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


mod = SMODS.current_mod

mod.optional_features = function()
    return {
        retrigger_joker = true,
    }
end

mod.arceus_config = {
	data_folder = "data/"
}

to_big = to_big or function(x) return x end

Arceus.auto_load()