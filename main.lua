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

to_big = to_big or function(x) return x end

-- function Card:get_id()
--     local ret = Getid_old(self)
--     if ret == 12 and next(find_joker("j_rotlatro_equality")) then ret = 13 end
--     return ret
--   end

local mod = SMODS.current_mod

local function batch_load(txt)
	-- Credit to GARBSHIT for this function, very helpful 
    local joker_files = NFS.getDirectoryItems(mod.path.."data/"..txt)
    sendInfoMessage(mod.path.."data/"..txt)
    local txt = txt..'/'
    for _, file in pairs(joker_files) do
        sendInfoMessage(file)
        if string.find(file, ".lua") then
          assert(SMODS.load_file("data/"..txt..file))()
        end
    end
    sendInfoMessage("FINISHED BATCH LOAD FOR "..txt)
    return true
end


batch_load("jokers")
batch_load("misc")