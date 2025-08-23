-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.

-- Used for housing require files for game scripts.

--[[ Add player to match room, have player created in match room]]

local req = {}

local room

req.CC = require("colyseus.sdk")
req.client = req.CC.Client("ws://localhost:2567")
req.num = 0

function req.create_room()
	req.client:join_or_create("my_room", function(err, _room)
		room = _room
		local callbacks = req.CC.callbacks(room)

		callbacks:on_add("players", function (player, sessionId) 
			req.num = req.num + 1
			print(req.num)
			factory.create("/characters#characters", vmath.vector3(player.x, player.y, 0))
		end)
	end)
end

return req