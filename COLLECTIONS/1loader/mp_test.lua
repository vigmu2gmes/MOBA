-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.
local Colyseus = require "colyseus.client"

local client
local room

function init(self)
	msg.post(".", "acquire_input_focus")

	client = Colyseus("ws://localhost:2567")
	client.auth.token = "123"

	client:join_or_create("my_room", function(err, room)
		print("\n\nclient:join_or_create(), callback =>\n\n")
		if (err) then
			print("JOIN ERROR:")
			pprint(err)
			return
		end
		print("============================================")
		print("successfully joined '" .. room.name .. "'")
		print("============================================")

	end)
end
