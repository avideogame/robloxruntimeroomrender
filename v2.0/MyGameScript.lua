-- game.ServerScriptService.MyGameScript
local aGame = require(script.Parent.MyGameModuleScript)
aGame.MyGame.SetInit({})
coroutine.wrap(function()
	game:GetService("RunService").Heartbeat:Connect(function(aDeltaTime)
		aGame.MyGame.SetFrameUpdate({["deltaTime"]=aDeltaTime,})
	end)
end)()
