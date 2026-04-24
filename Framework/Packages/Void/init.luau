local RunService = game:GetService("RunService")

local client = nil
local server = nil

if RunService:IsServer() then
    server = require(script.VoidServer)
else
    client = require(script.VoidClient)
end

return {
    server = server,
    client = client
}