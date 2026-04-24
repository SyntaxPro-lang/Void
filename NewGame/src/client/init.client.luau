local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VoidClient = require(ReplicatedStorage.Packages.Void.VoidClient)

VoidClient.AddControllers(ReplicatedStorage.Controllers)

VoidClient.GetController("TestController").Client:DoSomething()