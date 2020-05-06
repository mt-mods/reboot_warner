-- Simple reboot warning mod

local ie = minetest.request_insecure_environment()

local timer = 0
local warning_file = minetest.get_worldpath().."/reboot_warning"

minetest.register_globalstep(function(dtime)
	if timer > 600 then -- 600 tenths = 1 minute
		timer = 0
		local f = io.open(warning_file, "r")
		if f then
			io.close(f)
			ie.os.remove(warning_file)
			for _, player in ipairs(minetest.get_connected_players()) do
				local playername = player:get_player_name()
				if playername then
					notice.send(playername,
						"*** IMPORTANT NOTICE: | The server will be | rebooting for its nightly | backup in a few minutes!")
					minetest.log("Issued reboot warning to "..playername)
				end
			end
		end
	end
	timer = timer + 1
end)
