-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.

local ColyseusSDK = require("colyseus.sdk")

local client
local room

function init(self)
	msg.post(".", "acquire_input_focus")
	
	client = ColyseusSDK.Client("ws://localhost:2567")
	
	client:join_or_create("match", function(err, _room)
		room = _room

		room:on_message("game_message", function(message)
			label.set_text("/loader#label1", message)
		end)
		
	end)
	
end