--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Networking = require(ReplicatedStorage.Packages.Networking)

local VoidServer = {}
local services = {} :: { ModuleScript }
local controllers = {} :: { ModuleScript }

function VoidServer.GetController(serviceName: string | number?)
	for i, v in controllers do
		if v.Name == serviceName then
			local requiredModule = require(v)

			for name, value in requiredModule do
				if typeof(value) == "function" and name ~= "new" then
					if table.find(value, requiredModule.Client) then
						continue
					end

					Networking.server:OnServerInvoke(name, function(player, ...)
						return value(player, ...)
					end, nil)
				end
			end
			for name, fn in requiredModule.Client do
				Networking.server:On(name, fn, true)
			end
			return requiredModule
		end
	end
	return nil
end

function VoidServer.AddControllers(parent: Instance)
	for _, v in parent:GetChildren() do
		if not v:IsA("ModuleScript") then
			continue
		end
		table.insert(controllers, v)
	end
end

return VoidServer
