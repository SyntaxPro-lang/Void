local VoidClient = {}
local controllers = {}

function VoidClient.GetController(serviceName: string | number?)
	for i, v in controllers do
		if v.Name == serviceName then
			local requiredModule = require(v)
			return requiredModule
		end
	end
	return nil
end

function VoidClient.AddControllers(parent)
	for _, v in parent:GetChildren() do
		if not v:IsA("ModuleScript") then
			continue
		end
		table.insert(controllers, v)
	end
end

return VoidClient
