-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.

local Colyseus = require("colyseus.client")

local client

function init(self)
	msg.post(".", "acquire_input_focus")
	
	client = Colyseus("ws://localhost:2567")

	client:join_or_create("my_room")

	pprint(client)
end