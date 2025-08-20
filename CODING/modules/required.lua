-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.

-- Used for housing require files for game scripts.

--[[ Add player to match room, have player created in match room]]

local req = {}

req.CC = require("colyseus.sdk")

local client
local room 



return req