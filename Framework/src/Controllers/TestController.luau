local TestService = {}
TestService.Server = {}
TestService.Client = {}

--\\
------------------------
-- SERVER
------------------------
--//
function TestService.Server.new()
    local self = setmetatable(TestService.Server, {})
    task.wait(1)
    self.Player = game.Players:GetChildren()[1] :: Player
    print(TestService.Server)
    return self
end

function TestService.Server:DoSomething()
    print(self.Player)
    print("Server do something")
    self.Player:Kick("Did something haha")
end
--\\
------------------------
-- CLIENT
------------------------
--//
function TestService.Client:DoSomething()
    print("Client do something")
end

return TestService