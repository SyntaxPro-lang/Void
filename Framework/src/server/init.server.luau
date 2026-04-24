local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VoidServer = require(ReplicatedStorage.Packages.Void.VoidServer)
VoidServer.AddControllers(ReplicatedStorage.Controllers)

local TestObject = VoidServer.GetController("TestController").Server.new()
task.wait(0.5)
TestObject:DoSomething()