-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.

local ColyseusClient = require("colyseus.client")
local ColyseusSDK = require("colyseus.sdk")

local client
local room

function init(self)
	msg.post(".", "acquire_input_focus")
	
	client = ColyseusClient("ws://localhost:2567")

	client:join_or_create("my_room", function(err, _room)
		room = _room
		local callbacks = ColyseusSDK.callbacks(room)
	end)
end