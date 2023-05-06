-- game.StartPlayer.StarterPlayerScript.MyPlayerLocalScript
-- Enabled: true

local aScript
local aPlayer

aPlayer = game:GetService("Players").LocalPlayer

aScript = require(game:GetService("ReplicatedStorage"):WaitForChild("MyGameModuleScript"))
aScript.MyPlayer.SetLocalInit({["player"]=aPlayer,})

coroutine.wrap(function()
	game:GetService("RunService").Heartbeat:Connect(function(aDeltaTime)
		aScript.MyPlayer.SetLocalUpdate({["player"]=aPlayer,["deltaTime"]=aDeltaTime,})
	end)
end)()
