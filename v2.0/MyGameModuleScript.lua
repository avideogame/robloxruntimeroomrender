-- game.ServerScriptService.MyGameModuleScript

local aModule = {}

aModule.MyConfig = {}
-- Data Definition
aModule.MyConfig["MyLanguage"] = {
	MyType = {
		MyEnglish = {
			aKey = "aEnglish",
		},
		MyChinese = {
			aKey = "aChinese",
		},
	},
}
aModule.MyConfig["MyGame"] = {
	aScreenOrientation = Enum.ScreenOrientation.LandscapeSensor,
	aLanguageDefault = aModule.MyConfig.MyLanguage.MyType.MyEnglish.aKey,

	MyExperience = {
		aId = 1234567890,
	},
	MyPlace  = {	
		aId = 12345678901,
		MyLabel = {
			aEnglish = "Cube Room",
			aChinese = "立方房間",
		},
	},

	MyRoom = {
		MyBound = {
			aWidth = 100,
			aLength = 100,
			aHeight = 1,
		},
		MyRoomParent = {
			aName = "MyRoomParent",
		},
		MyRoomSensor = {
			aName = "MyRoomSensor",
			MyAttribute = {
				MyRoomId = {
					aName = "MyRoomId",
					aKey = "aRoomId",
				},
			},
		},
	},
	aSectionList = [=[
	{
		"MyEvenNumber":{
			"aKey":"MyEvenNumber",
			"MyLabel":{
				"aEnglish":"Even Number",
				"aChinese":"雙數"
			}
		},
		"MyOddNumber":{
			"aKey":"MyOddNumber",
			"MyLabel":{
				"aEnglish":"Odd Number",
				"aChinese":"單數"
			}
		}
	}
	]=],

	aLocationList = [=[
[
	{
		"aKey":"MyNumberZero",
		"MyLabel":{
			"aEnglish":"Number Zero",
			"aChinese":"數字零"
		},
		"aSectionKey":"MyEvenNumber",
		"MyCategoryList":[],
		"MyCubeMap":{
			"MyAssetList":{
				"b":"rbxassetid://26424652",
				"d":"rbxassetid://26424652",
				"f":"rbxassetid://147144198",
				"l":"rbxassetid://26424652",
				"r":"rbxassetid://147144198",
				"u":"rbxassetid://147144198"
			}
		},
		"aStatus":""
	},
	{
		"aKey":"MyNumberOne",
		"MyLabel":{
			"aEnglish":"Number One",
			"aChinese":"數字壹"
		},
		"aSectionKey":"MyOddNumber",
		"MyCategoryList":["oddnumber"],
		"MyCubeMap":{
			"MyAssetList":{
				"b":"rbxasset://textures/sky/sky512_bk.tex",
				"d":"rbxasset://textures/sky/sky512_dn.tex",
				"f":"rbxasset://textures/sky/sky512_ft.tex",
				"l":"rbxasset://textures/sky/sky512_lf.tex",
				"r":"rbxasset://textures/sky/sky512_rt.tex",
				"u":"rbxasset://textures/sky/sky512_up.tex"
			}
		},
		"aStatus":""
	}
]
	]=],
	aSectionKeyList = [=[
[
"MyEvenNumber","MyOddNumber"
]
	]=],
}

aModule.MyConfig["MyRemoteEvent"] = {
	MyClientServerTrigger = {
		MySetMenuMore = {
			aName = "MyRemoteEventClientServerSetMenuMore",
		},
		MySetMenuLocation = {
			aName = "MyRemoteEventClientServerSetMenuLocation",
		},
	},
}

aModule.MyConfig["MyPlayer"] = {
	MyAttribute = {
		MyLanguage = {
			aName = "MyLanguage",
			aKey = "aLanguage",
			MyValue = {
				aDefault = ""..aModule.MyConfig.MyGame.aLanguageDefault
			},
		},
		MySections = {
			aName = "MySections",
			aKey = "aSections",
		},
	},
	MyMenuMore = {
		aName = "MyMenuMore",
		aFrameSizeMax = 20,
		MyList = {
			aName = "MyMenuMoreList",
			aFrameSizeMax = 200,
			aButtonOffsetY = 50,
			MyOption = {
				MyCancel = {
					aName = "MyCancel",
					MyLabel = {
						MyEnglish = {
							aTitle = "Cancel",
						},
						MyChinese = {
							aTitle = "取消",
						},
					},
				},
				MyLanguageEnglish = {
					aKey = ""..aModule.MyConfig.MyLanguage.MyType.MyEnglish.aKey,
					aName = "MyLanguageEnglish",
					MyLabel = {
						MyEnglish = {
							aTitle = "Language:\nEnglish",
						},
						MyChinese = {
							aTitle = "Language:\nEnglish",
						},
					},
				},
				MyLanguageChinese = {
					aKey = ""..aModule.MyConfig.MyLanguage.MyType.MyChinese.aKey,
					aName = "MyLanguageChinese",
					MyLabel = {
						MyEnglish = {
							aTitle = "語言：\n中文",
						},
						MyChinese = {
							aTitle = "語言：\n中文",
						},
					},
				},
				MyAbout = {
					aName = "MyAbout",
					MyLabel = {
						MyEnglish = {
							aTitle = "About",
						},
						MyChinese = {
							aTitle = "關於",
						},
					},
					aPromptTimeout = 2.0,
				},
				MyRoomCurrent = {
					aName = "MyRoomCurrent",
					MyLabel = {
						MyEnglish = {
							aTitle = "Current Room",
						},
						MyChinese = {
							aTitle = "現時房間",
						},
					},
					aPromptTimeout = 2.0,
				},
			},
		},
	},

	MyMenuLocations = {
		aName = "MyMenuLocations",
		aFrameSizeMax = 20,
		MyList = {
			aName = "MyMenuLocationsList",
			aFrameSizeMax = 200,
			aButtonOffsetY = 50,
			MyOption = {
				MyCancel = {
					aName = "MyCancel",
					MyLabel = {
						MyEnglish = {
							aTitle = "Cancel",
						},
						MyChinese = {
							aTitle = "取消",
						},
					},
				},
			},
		},
	},
}
aModule.MyConfig["MyDataStore"] = {
	MyField = {
		MyPlayerLanguage = {
			aName = "MyPlayerLanguage",
		},
	},
}

-- Objects

aModule.MyGame = {}
-- Cache space
aModule.MyGame.MyState = {
	aTimestamp = nil,
	MySectionList = {},
	MyLocationList = {},
}
aModule.MyGame.SetInit = function(aParam)
	local aConfig = aModule.MyConfig

	aModule.MyGame.SetSettingsInit(aParam)
	aModule.MyGame.SetPlayersInit(aParam)

	return
end

aModule.MyGame.SetFrameUpdate = function(aParam)
	local aConfig = aModule.MyConfig
	local aService
	local aOffset
	local aInstance
	local aName
	local aPlayer

	if aModule.MyGame.MyState.aTimestamp == nil then
		aModule.MyGame.MyState.aTimestamp = os.time()
	end

	if aModule.MyGame.MyState.aTimestamp < os.time() then
		aModule.MyGame.MyState.aTimestamp = os.time()

		aService = game:GetService("Players")
		local playerList = aService:GetPlayers()
		for i = 1, #playerList  do
			local player = playerList[i]
			if player:GetAttribute("IsAlive") then
				local points = player.leaderstats.Points
				points.Value = points.Value + 1
			end
		end

	end

	return
end

aModule.MyGame.SetOnPlayerAdded = function(aPlayer)
	local aConfig = aModule.MyConfig

	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = aPlayer

	local points = Instance.new("IntValue")
	points.Name = "Points"
	points.Value = 0
	points.Parent = leaderstats

	aPlayer:SetAttribute("IsAlive", false)

	aPlayer.CharacterAdded:Connect(function(aCharacter)
		aModule.MyGame.SetOnCharacterAdded({character=aCharacter,player=aPlayer,})
	end)

	return
end

aModule.MyGame.SetOnCharacterAdded = function(aParam)
	local aConfig = aModule.MyConfig
	local aPlayer = aParam.player
	local aCharacter = aParam.character
	aPlayer:SetAttribute("IsAlive", true)
	local humanoid = aCharacter:WaitForChild("Humanoid")
	humanoid.Died:Connect(function()
		local points = aPlayer.leaderstats.Points
		points.Value = 0
		aPlayer:SetAttribute("IsAlive", false)
	end)

	return
end

aModule.MyGame.SetPlayersInit = function(aParam)
	local aService
	aService = game:GetService("Players")
	aService.PlayerAdded:Connect(aModule.MyGame.SetOnPlayerAdded)
	aService.PlayerAdded:Connect(aModule.MyGame.SetPlayerAddedInit)

end

aModule.MyGame.SetSettingsInit = function(aParam)
	local aConfig = aModule.MyConfig
	local aService
	local aScript
	local aInstance

	aService = game:GetService("StarterGui")
	aService.ScreenOrientation = aConfig.MyGame.aScreenOrientation

	-- Stage to script on ReplicatedStorage to share between player space and game space
	aScript = game:GetService("ServerScriptService"):WaitForChild("MyGameModuleScript"):Clone()
	aScript.Parent = game:GetService("ReplicatedStorage")

	aInstance = Instance.new("Model")
	aInstance.Name = ("%s"):format(""..aConfig.MyGame.MyRoom.MyRoomParent.aName)
	aInstance.Parent = game:GetService("Workspace")

	aModule.MyGame.SetRemoteEventInit(aParam)
	aModule.MyGame.SetRoomsInit(aParam)

	return
end

aModule.MyGame.SetPlayerAddedInit = function(aPlayer)
	local aService
	local aConfig = aModule.MyConfig
	aModule.MyGame.SetPlayerLanguageInit({["aPlayer"] = aPlayer,})

	aService = game:GetService("HttpService")
	aModule.MyGame.SetPlayerAttributes({
		["aPlayer"] = aPlayer,
		["aProperties"] = {
			[""..aConfig.MyPlayer.MyAttribute.MySections.aKey] = aConfig.MyGame.aSectionList,
		},
	})

	aModule.MyGame.SetRoomInit({["aPlayer"] = aPlayer, ["aLocationKey"] = "MyNumberZero",})
end

aModule.MyGame.SetRemoteEventInit = function(aParam)
	local aConfig = aModule.MyConfig
	local aInstance

	aInstance = Instance.new("RemoteEvent")
	aInstance.Name = aConfig.MyRemoteEvent.MyClientServerTrigger.MySetMenuMore.aName
	aInstance.Parent = game:GetService("ReplicatedStorage")
	aInstance.OnServerEvent:Connect(function(aPlayer, aParam2)
		for aKey,aValue in pairs(aConfig.MyPlayer.MyMenuMore.MyList.MyOption) do
			if aKey ~= aParam2["aKey"] then
				continue
			end
			if aKey == "MyLanguageEnglish" then
				aModule.MyGame.SetPlayerLanguage({
					["aPlayer"] = aPlayer,
					["aKey"] = ""..aValue.aKey,
				})
			end
			if aKey == "MyLanguageChinese" then
				aModule.MyGame.SetPlayerLanguage({
					["aPlayer"] = aPlayer,
					["aKey"] = ""..aValue.aKey,
				})
			end
		end
	end)

	aInstance = Instance.new("RemoteEvent")
	aInstance.Name = aConfig.MyRemoteEvent.MyClientServerTrigger.MySetMenuLocation.aName
	aInstance.Parent = game:GetService("ReplicatedStorage")
	aInstance.OnServerEvent:Connect(function(aPlayer, aParam2)
		aModule.MyGame.SetRoomInit({["aPlayer"] = aPlayer, ["aLocationKey"] = aParam2["aKey"],})
	end)
end

aModule.MyGame.SetPlayerLanguage = function(aParam)
	local aConfig = aModule.MyConfig
	local aService
	local aInstance
	local aName
	local aPlayer
	local aKey

	aPlayer = aParam["aPlayer"]
	aKey = aParam["aKey"]

	aName = aModule.MyConfig.MyDataStore.MyField.MyPlayerLanguage.aName
	aService = game:GetService("DataStoreService")
	aInstance = aService:GetDataStore(""..aName)

	if aInstance:GetAsync(aPlayer.UserId) == nil then
		aInstance:SetAsync(aPlayer.UserId, ""..aModule.MyConfig.MyPlayer.MyAttribute.MyLanguage.MyValue.aDefault)
	end

	for k,v in pairs(aConfig.MyLanguage.MyType) do
		if aKey == nil then
			break
		end
		if v.aKey ~= aKey then
			continue
		end

		-- Set data store key

		local setSuccess, errorMessage = pcall(function()

			aInstance:SetAsync(aPlayer.UserId, ""..aKey)

		end)

		if not setSuccess then

			warn(errorMessage)

		end
		break
	end

	-- Read data store key

	local getSuccess, currentLanguage = pcall(function()

		return aInstance:GetAsync(aPlayer.UserId)

	end)

	if getSuccess then
		aName = aConfig.MyPlayer.MyAttribute.MyLanguage.aKey
		aPlayer:SetAttribute(""..aName, currentLanguage)
	end
end

aModule.MyGame.SetPlayerLanguageInit = function(aParam)
	local aConfig = aModule.MyConfig
	local aService
	local aList
	local aInstance
	local aName
	local aPlayer = aParam["aPlayer"]
	local aLanguage

	aService = game:GetService("Players")

	aList = aService:GetPlayers()
	for i = 1, #aList  do
		aInstance = aList[i]
		if aPlayer.UserId ~= aInstance.UserId then
			continue
		end

		aLanguage = ""..aConfig.MyPlayer.MyAttribute.MyLanguage.MyValue.aDefault 
		aService = game:GetService("DataStoreService")
		aName = aConfig.MyDataStore.MyField.MyPlayerLanguage.aName
		aInstance = aService:GetDataStore(""..aName)
		--		aInstance:RemoveAsync(aPlayer.UserId)
		local getSuccess, currentLanguage = pcall(function()
			return aInstance:GetAsync(aPlayer.UserId)
		end)

		if getSuccess then
			if  currentLanguage == nil then
			else
				aLanguage = ""..currentLanguage
			end
		else
		end

		aName = ""..aConfig.MyPlayer.MyAttribute.MyLanguage.aKey
		aPlayer:SetAttribute(""..aName, ""..aLanguage)
		aInstance:SetAsync(aPlayer.UserId, aPlayer:GetAttribute(""..aName))

		break
	end
end

aModule.MyGame.SetRoomsInit = function(aParam)
	local aConfig = aModule.MyConfig
	local aInstance

	local aLog = nil

	local aService
	local aLink
	local aLanguage
	local aPlayer
	local aLang
	local aFields
	local aData

	if "" == "1" then
		aLog = {}

		aService = game:GetService("HttpService")

		aFields = {}
		aFields.akey = ("%s"):format("avalue")
		aData = ""
		for k, v in pairs(aFields) do
			aData = aData .. ("&%s=%s"):format(aService:UrlEncode(k), aService:UrlEncode(v))
		end
		aData = aData:sub(2)

		aLink = ("https://raw.githubusercontent.com/<user>/<project>/main/mylocations.json?%s"):format(aData)

		local aSuccess, aResult, aResponse

		aSuccess, aResult = pcall(function()
			aResponse = aService:GetAsync(aLink)
			aData = aService:JSONDecode(aResponse)
			return aData
		end)

		if not aSuccess then
			warn(("Error: %s"):format(aResult))
		else
			aLog = aData
		end		
	end

	aLog = {}

	aService = game:GetService("HttpService")
	aModule.MyGame.MyState.MySectionList = aService:JSONDecode(aConfig.MyGame.aSectionList)
	aModule.MyGame.MyState.MyLocationList = aService:JSONDecode(aConfig.MyGame.aLocationList)

	game:GetService("Lighting").GlobalShadows = false
end

aModule.MyGame.SetRoomInit = function(aParam)
	local aConfig = aModule.MyConfig
	local aInstance
	local aMax
	local aService
	local aName
	local aParent
	local aProperty
	local aKey
	local aIndex
	local aReference
	local aPlayer
	local aPosition

	aPlayer = aParam["aPlayer"]
	if aPlayer.Character == nil then
		--		return
	end
	while not aPlayer:HasAppearanceLoaded() do
		task.wait()
	end

	aKey = aParam["aLocationKey"]
	aIndex = aModule.MyGame.GetTableIndexByKey({
		["aTopLevelMatch"]={
			["aKey"]="aKey",
			["aValue"]=""..aKey.."",
		},
		["aTable"]=aModule.MyGame.MyState.MyLocationList,
	})
	if aIndex < 0 then
		return
	end

	aService = game:GetService("Workspace")
	aInstance = aService:FindFirstChild("SpawnLocation")
	aReference = aInstance

	aService = game:GetService("Workspace")	
	aParent = aService:WaitForChild(aConfig.MyGame.MyRoom.MyRoomParent.aName)

	aName = aParam["aLocationKey"]
	aInstance = aParent:FindFirstChild(aName)
	if aInstance ~= nil then
		aProperty = aConfig.MyGame.MyRoom.MyBound
		aPosition = aReference.Position
		aPosition += (Vector3.yAxis * aProperty.aLength * 0.5)
		aPosition += (Vector3.zAxis * aProperty.aLength * (aIndex-1))
		aPlayer.Character:MoveTo(aPosition)
		return
	end

	aInstance = Instance.new("Model", aParent)
	aInstance.Name = aName
	aParent = aInstance
	
	aProperty = aConfig.MyGame.MyRoom.MyBound
	aInstance = Instance.new("Part")
	aInstance.Name = aConfig.MyGame.MyRoom.MyRoomSensor.aName
	aInstance.Shape = Enum.PartType.Block
	aInstance.Anchored = true
	aInstance.CanCollide = false
	aInstance.CanTouch = true
	aInstance.Transparency = 1.0
	aInstance.Size = Vector3.new(aProperty.aWidth,aProperty.aWidth,aProperty.aLength)
	aInstance.Position = aReference.Position
	aInstance.Position += Vector3.zAxis * aProperty.aLength * (aIndex-1) * 1
	aInstance.Position += Vector3.yAxis * aProperty.aWidth * 0.5
	aInstance:SetAttribute(""..aConfig.MyGame.MyRoom.MyRoomSensor.MyAttribute.MyRoomId.aKey,""..aIndex)
	aInstance.Parent = aParent
	
	aMax = 6
	for i=1,aMax,1 do
		aProperty = aConfig.MyGame.MyRoom.MyBound
		aInstance = Instance.new("Part")
		aInstance.Shape = Enum.PartType.Block
		aInstance.Anchored = true
		aInstance.Size = Vector3.new(aProperty.aWidth,aProperty.aHeight,aProperty.aLength)
		aInstance.Position = aReference.Position
		aInstance.Position += Vector3.zAxis * aProperty.aLength * (aIndex-1) * 1
		if i == 1 then
			aInstance.Name = "d"
			aInstance.Position += Vector3.zero
			aInstance.Rotation = Vector3.zero + (Vector3.yAxis * -90.0)
		end
		if i == 2 then
			aInstance.Name = "u"
			aInstance.Position += Vector3.yAxis * aProperty.aLength
			aInstance.Rotation = Vector3.zero + (Vector3.xAxis * 180.0) + (Vector3.yAxis * 90.0)
		end
		if i == 3 then
			aInstance.Name = "l"
			aInstance.Position += Vector3.xAxis * aProperty.aLength * 0.5
			aInstance.Position += Vector3.yAxis * aProperty.aLength * 0.5
			aInstance.Rotation = Vector3.zero + (Vector3.zAxis * 90.0) + (Vector3.xAxis * -90.0)
		end
		if i == 4 then
			aInstance.Name = "r"
			aInstance.Position += Vector3.xAxis * aProperty.aLength * -0.5
			aInstance.Position += Vector3.yAxis * aProperty.aLength * 0.5
			aInstance.Rotation = Vector3.zero + (Vector3.zAxis * -90.0) + (Vector3.xAxis * -90.0)
		end
		if i == 5 then
			aInstance.Name = "b"
			aInstance.Position += Vector3.zAxis * aProperty.aLength * 0.5
			aInstance.Position += Vector3.yAxis * aProperty.aLength * 0.5
			aInstance.Rotation = Vector3.zero + (Vector3.xAxis * -90.0)
		end
		if i == 6 then
			aInstance.Name = "f"
			aInstance.Position += Vector3.zAxis * aProperty.aLength * -0.5
			aInstance.Position += Vector3.yAxis * aProperty.aLength * 0.5
			aInstance.Rotation = Vector3.zero + (Vector3.xAxis * 90.0) + (Vector3.yAxis * 180.0)
		end		
		aInstance.Parent = aParent

		aProperty = aModule.MyGame.MyState.MyLocationList[aIndex].MyCubeMap.MyAssetList

		local aInstance2
		aInstance2 = Instance.new("Decal")
		aInstance2.Face = Enum.NormalId.Top
		if i == 1 then
			aInstance2.Texture = ""..aProperty.d
		end
		if i == 2 then
			aInstance2.Texture = ""..aProperty.u
		end
		if i == 3 then
			aInstance2.Texture = ""..aProperty.l
		end
		if i == 4 then
			aInstance2.Texture = ""..aProperty.r
		end
		if i == 5 then
			aInstance2.Texture = ""..aProperty.b
		end
		if i == 6 then
			aInstance2.Texture = ""..aProperty.f
		end
		aInstance2.Parent = aInstance


		aInstance2 = Instance.new("SurfaceLight")
		aInstance2.Face = Enum.NormalId.Top
		aInstance2.Parent = aInstance
	end

	aProperty = aConfig.MyGame.MyRoom.MyBound
	aPosition = aReference.Position
	aPosition += (Vector3.yAxis * aProperty.aLength * 0.5)
	aPosition += (Vector3.zAxis * aProperty.aLength * (aIndex-1))
	aPlayer.Character:MoveTo(aPosition)
end

aModule.MyGame.GetTableIndexByKey = function(aParam)
	local aConfig = aModule.MyConfig
	local aProperty
	local aKey
	local aMatch
	local aTable
	local aIndex

	aMatch = aParam["aTopLevelMatch"]
	aTable = aParam["aTable"]

	aIndex = -1
	for i=1,table.maxn(aTable),1 do
		for k,v in pairs(aTable[i]) do
			if aMatch["aKey"] ~= k then
				continue
			end
			if aMatch["aValue"] ~= v then
				continue
			end
			aIndex = i
			break
		end
		if aIndex > 0 then
			break
		end
	end
	return aIndex
end

aModule.MyGame.SetPlayerAttributes = function(aParam)
	local aConfig = aModule.MyConfig
	local aService
	local aList
	local aInstance
	local aName
	local aPlayer = aParam["aPlayer"]
	local aLanguage
	local aProperties = aParam["aProperties"]

	aService = game:GetService("Players")

	aList = aService:GetPlayers()
	for i = 1, #aList  do
		aInstance = aList[i]
		if aPlayer.UserId ~= aInstance.UserId then
			continue
		end

		for k,v in pairs(aProperties) do
			aPlayer:SetAttribute(""..k, ""..v)
		end

		break
	end
end

-- Player space perspective
aModule.MyPlayer = {}

aModule.MyPlayer.SetLocalInit = function(aParam)
	aModule.MyPlayer.MyMenuMore.SetInit(aParam)
end

aModule.MyPlayer.SetLocalUpdate = function(aParam)
	local aConfig = aModule.MyConfig
	local aService
	local aLanguage
	local aPlayer
	local aInstance
	local aName
	local aList

	aService = game:GetService("Players")
	aPlayer = aService.LocalPlayer
	aLanguage = aModule.MyPlayer.MyLanguage.GetType({["aPlayer"]=aPlayer,})

	if aLanguage == nil then
		return
	end

end

aModule.MyPlayer.MyLanguage = {}
aModule.MyPlayer.MyLanguage.GetType = function(aParam)
	local aConfig = aModule.MyConfig
	local aPlayer = aParam["aPlayer"]
	local aService
	local aKey
	local aList
	local aType

	aService = game:GetService("Players")
	aKey = aConfig.MyPlayer.MyAttribute.MyLanguage.MyValue.aDefault
	aList = aService:GetPlayers()
	for i,aValue in ipairs(aList) do
		if aValue.UserId ~= aPlayer.UserId then
			continue
		end
		for k,v in pairs(aConfig.MyLanguage) do
			for aFieldKey, aFieldValue in pairs(v) do
				if aFieldValue.aKey == aValue:GetAttribute(aConfig.MyPlayer.MyAttribute.MyLanguage.aKey) then
					aKey = aFieldKey
					return aKey
				end
			end

		end
	end

	return aKey
end

aModule.MyPlayer.MyMenuMore = {}
aModule.MyPlayer.MyMenuMore.SetInit = function(aParam)
	local aConfig = aModule.MyConfig
	local aPlayer
	local aService
	local aInstance
	local aParent
	local aName
	local aOffset

	aService = game:GetService("Players")
	aPlayer = aService.LocalPlayer
	aPlayer = aService:GetPlayerByUserId(aPlayer.UserId)

	aParent = aPlayer:FindFirstChild("PlayerGui")
	aName = aConfig.MyPlayer.MyMenuMore.aName
	aInstance = aParent:FindFirstChild(""..aName)
	if aInstance ~= nil then
		aInstance:Destroy()
		aInstance = nil
		return
	end

	aInstance = Instance.new("ScreenGui")
	aInstance.Name = ""..aName
	aInstance.Parent = aParent
	aParent = aInstance

	aOffset = aConfig.MyPlayer.MyMenuMore.aFrameSizeMax

	aInstance = Instance.new("Frame")
	aInstance.Parent = aParent
	aInstance.Position = UDim2.new(0.25,0.25,0.25,0.25)
	aInstance.Size = UDim2.new(0,aOffset,0,(aOffset))
	aParent = aInstance

	aInstance = Instance.new("TextButton")
	aInstance.Parent = aParent
	aInstance.Text = "..."
	aInstance.Position = UDim2.new(0,0,0,0)
	aInstance.Size = UDim2.new(0,aOffset,0,aOffset)
	aInstance.MouseButton1Down:Connect(function()
		aModule.MyPlayer.MyMenuMore.SetListShow(aParam)
	end)

	return
end

aModule.MyPlayer.MyMenuMore.SetListShow = function(aParam)
	local aConfig = aModule.MyConfig
	local aPlayer
	local aService
	local aInstance
	local aParent
	local aName
	local aOffset

	local aKeys
	local aCount
	local aMax
	local aFrameSizeMax
	local aButtonOffsetY
	local aLanguage
	local aList

	aService = game:GetService("Players")
	aPlayer = aService.LocalPlayer

	aPlayer = aService:GetPlayerByUserId(aPlayer.UserId)

	aParent = aPlayer:FindFirstChild("PlayerGui")
	aName = aConfig.MyPlayer.MyMenuMore.MyList.aName
	aInstance = aParent:FindFirstChild(""..aName)
	if aInstance ~= nil then
		aInstance:Destroy()
		aInstance = nil
		return
	end

	aLanguage = aModule.MyPlayer.MyLanguage.GetType({["aPlayer"]=aPlayer,})

	aCount = 0
	aKeys = {}
	for aKey, aValue in pairs(aConfig.MyPlayer.MyMenuMore.MyList.MyOption) do
		if aKey == ""..aConfig.MyPlayer.MyMenuMore.MyList.MyOption.MyCancel.aName then
			continue
		end
		table.insert(aKeys,aKey)
		aCount += 1
	end
	aMax = aCount

	aInstance = Instance.new("ScreenGui")
	aInstance.Name = ""..aName
	aInstance.Parent = aParent
	aParent = aInstance

	aButtonOffsetY = aConfig.MyPlayer.MyMenuMore.MyList.aButtonOffsetY
	aFrameSizeMax = aConfig.MyPlayer.MyMenuMore.MyList.aFrameSizeMax

	aInstance = Instance.new("Frame")
	aInstance.Parent = aParent
	aInstance.Position = UDim2.new(0.25,0.25,0.25,0.25)
	aInstance.Size = UDim2.new(0,aFrameSizeMax,0,(aFrameSizeMax * aButtonOffsetY))
	aParent = aInstance

	aInstance = Instance.new("ScrollingFrame")
	aInstance.Parent = aParent
	aInstance.Size = UDim2.new(0,aFrameSizeMax,0,(aFrameSizeMax))
	aParent = aInstance

	aCount = 1
	aInstance = Instance.new("TextButton")
	aInstance.Parent = aParent
	aInstance.Text = ""..aConfig.MyPlayer.MyMenuMore.MyList.MyOption.MyCancel.MyLabel[""..aLanguage].aTitle
	aInstance.Position = UDim2.new(0,0,0,(aButtonOffsetY * aCount))
	aInstance.Size = UDim2.new(0,aFrameSizeMax,0,(aButtonOffsetY))
	aInstance.MouseButton1Down:Connect(function()
		local aElement = aPlayer:FindFirstChild("PlayerGui"):FindFirstChild(aName)
		if aElement ~= nil then
			aElement:Destroy()
			aElement = nil
		end
	end)
	aCount += 1

	aService = game:GetService("HttpService")
	aList = aService:JSONDecode(aPlayer:GetAttribute(aConfig.MyPlayer.MyAttribute.MySections.aKey))

	aKeys = {}
	for k,v in pairs(aList) do
		table.insert(aKeys,k)
	end
	table.sort(aKeys)
	aKeys = aService:JSONDecode(aConfig.MyGame.aSectionKeyList)

	for _, aKey in ipairs(aKeys) do
		local aValue = aList[""..aKey]
		local aText = ""..aValue.MyLabel[""..aConfig["MyLanguage"].MyType[""..aLanguage].aKey]

		aInstance = Instance.new("TextButton")
		aInstance.Parent = aParent
		aInstance.Text = ""..aText
		aInstance.Position = UDim2.new(0,0,0,(aButtonOffsetY * aCount))
		aInstance.Size = UDim2.new(0,aFrameSizeMax,0,(aButtonOffsetY))
		aInstance.MouseButton1Up:Connect(function()
			local aElement
			aModule.MyPlayer.MyMenuMore.SetListSelect({["aKey"]=""..aKey,})
			aElement = aPlayer:FindFirstChild("PlayerGui"):FindFirstChild(aName)
			if aElement ~= nil then
				aElement:Destroy()
				aElement = nil
			end
		end)
		aCount += 1

	end

	aKeys = {"MyRoomCurrent","MyLanguageEnglish","MyLanguageChinese","MyAbout",}
	for _, aKey in ipairs(aKeys) do
		local aValue = aConfig.MyPlayer.MyMenuMore.MyList.MyOption[""..aKey]
		local aText = ""..aValue.MyLabel[""..aLanguage].aTitle

		aInstance = Instance.new("TextButton")
		aInstance.Parent = aParent
		aInstance.Text = ""..aText
		aInstance.Position = UDim2.new(0,0,0,(aButtonOffsetY * aCount))
		aInstance.Size = UDim2.new(0,aFrameSizeMax,0,(aButtonOffsetY))
		aInstance.MouseButton1Up:Connect(function()
			local aElement
			aModule.MyPlayer.MyMenuMore.SetListSelect({["aKey"]=""..aKey,})
			aElement = aPlayer:FindFirstChild("PlayerGui"):FindFirstChild(aName)
			if aElement ~= nil then
				aElement:Destroy()
				aElement = nil
			end
		end)
		aCount += 1

	end

	return
end

aModule.MyPlayer.MyMenuMore.SetListSelect = function(aParam)
	local aConfig = aModule.MyConfig
	local aName
	local aService
	local aLanguage
	local aPlayer
	local aList

	aPlayer = game:GetService("Players").LocalPlayer

	if aParam["aKey"] == aConfig.MyPlayer.MyMenuMore.MyList.MyOption.MyAbout.aName then
		local aMessage
		aLanguage = aModule.MyPlayer.MyLanguage.GetType({["aPlayer"]=aPlayer,})
		aMessage = Instance.new("Message")
		aMessage.Text = ("%s :\n\n%s"):format(
		aConfig.MyPlayer.MyMenuMore.MyList.MyOption.MyAbout.MyLabel[""..aLanguage].aTitle,
		aConfig.MyGame.MyPlace.MyLabel[""..aConfig.MyLanguage.MyType[""..aLanguage].aKey]
		)
		aMessage.Parent = aPlayer:WaitForChild("PlayerGui")
		task.wait(aConfig.MyPlayer.MyMenuMore.MyList.MyOption.MyAbout.aPromptTimeout)
		aMessage:Destroy()
		aMessage = nil
		return
	end
	
	if aParam["aKey"] == aConfig.MyPlayer.MyMenuMore.MyList.MyOption.MyRoomCurrent.aName then
		aService = game:GetService("Workspace")
		local aTouching = aService:GetPartsInPart(aPlayer.Character:FindFirstChild("HumanoidRootPart"))
		local aId = ""
		for i,v in ipairs(aTouching) do
			if v.Name ~= aConfig.MyGame.MyRoom.MyRoomSensor.aName then
				continue
			end
			aId = ""..v:GetAttribute(""..aConfig.MyGame.MyRoom.MyRoomSensor.MyAttribute.MyRoomId.aKey)
			break
		end
		local aMessage
		aLanguage = aModule.MyPlayer.MyLanguage.GetType({["aPlayer"]=aPlayer,})
		aMessage = Instance.new("Message")
		aMessage.Text = ("%s :\n\n%s"):format(
			aConfig.MyPlayer.MyMenuMore.MyList.MyOption.MyRoomCurrent.MyLabel[""..aLanguage].aTitle,
			aId
		)
		aMessage.Parent = aPlayer:WaitForChild("PlayerGui")
		task.wait(aConfig.MyPlayer.MyMenuMore.MyList.MyOption.MyRoomCurrent.aPromptTimeout)
		aMessage:Destroy()
		aMessage = nil
		return
	end
	
	aService = game:GetService("HttpService")
	for _,v in ipairs(aService:JSONDecode(aConfig.MyGame.aSectionKeyList)) do
		if aParam["aKey"] == v then
			aModule.MyPlayer.MyMenuLocations["SetListShow"]({["aKey"]=""..v,})
			return
		end
	end

	aService = game:GetService("ReplicatedStorage") 
	aName = aConfig.MyRemoteEvent.MyClientServerTrigger.MySetMenuMore.aName
	aService:WaitForChild(""..aName):FireServer({["aKey"]=""..aParam["aKey"],})
end

aModule.MyPlayer.MyMenuLocations = {}
aModule.MyPlayer.MyMenuLocations.SetListShow = function(aParam)
	local aConfig = aModule.MyConfig
	local aPlayer
	local aService
	local aInstance
	local aParent
	local aName
	local aOffset

	local aKeys
	local aCount
	local aMax
	local aFrameSizeMax
	local aButtonOffsetY
	local aLanguage
	local aList

	aService = game:GetService("Players")
	aPlayer = aService.LocalPlayer

	aPlayer = aService:GetPlayerByUserId(aPlayer.UserId)

	aParent = aPlayer:FindFirstChild("PlayerGui")
	aName = aConfig.MyPlayer.MyMenuLocations.MyList.aName
	aInstance = aParent:FindFirstChild(""..aName)
	if aInstance ~= nil then
		aInstance:Destroy()
		aInstance = nil
		return
	end

	aLanguage = aModule.MyPlayer.MyLanguage.GetType({["aPlayer"]=aPlayer,})

	aCount = 0
	aKeys = {}
	for aKey, aValue in pairs(aConfig.MyPlayer.MyMenuLocations.MyList.MyOption) do
		if aKey == ""..aConfig.MyPlayer.MyMenuLocations.MyList.MyOption.MyCancel.aName then
			continue
		end
		table.insert(aKeys,aKey)
		aCount += 1
	end
	aMax = aCount

	aInstance = Instance.new("ScreenGui")
	aInstance.Name = ""..aName
	aInstance.Parent = aParent
	aParent = aInstance

	aButtonOffsetY = aConfig.MyPlayer.MyMenuLocations.MyList.aButtonOffsetY
	aFrameSizeMax = aConfig.MyPlayer.MyMenuLocations.MyList.aFrameSizeMax

	aInstance = Instance.new("Frame")
	aInstance.Parent = aParent
	aInstance.Position = UDim2.new(0.25,0.25,0.25,0.25)
	aInstance.Size = UDim2.new(0,aFrameSizeMax,0,(aFrameSizeMax * aButtonOffsetY))
	aParent = aInstance

	aInstance = Instance.new("ScrollingFrame")
	aInstance.Parent = aParent
	aInstance.Size = UDim2.new(0,aFrameSizeMax,0,(aFrameSizeMax))
	aParent = aInstance

	aCount = 1
	aInstance = Instance.new("TextButton")
	aInstance.Parent = aParent
	aInstance.Text = ""..aConfig.MyPlayer.MyMenuLocations.MyList.MyOption.MyCancel.MyLabel[""..aLanguage].aTitle
	aInstance.Position = UDim2.new(0,0,0,(aButtonOffsetY * aCount))
	aInstance.Size = UDim2.new(0,aFrameSizeMax,0,(aButtonOffsetY))
	aInstance.MouseButton1Down:Connect(function()
		local aElement = aPlayer:FindFirstChild("PlayerGui"):FindFirstChild(aName)
		if aElement ~= nil then
			aElement:Destroy()
			aElement = nil
		end
	end)
	aCount += 1

	aService = game:GetService("HttpService")
	aList = aService:JSONDecode(aConfig.MyGame.aLocationList)

	for _, v in ipairs(aList) do
		local aKey = v["aKey"]
		local aText = ""..v.MyLabel[""..aConfig["MyLanguage"].MyType[""..aLanguage].aKey]

		if v.aStatus ~= "" then
			continue
		end
		if v.aSectionKey ~= aParam["aKey"] then
			continue
		end

		aInstance = Instance.new("TextButton")
		aInstance.Parent = aParent
		aInstance.Text = ""..aText
		aInstance.Position = UDim2.new(0,0,0,(aButtonOffsetY * aCount))
		aInstance.Size = UDim2.new(0,aFrameSizeMax,0,(aButtonOffsetY))
		aInstance.MouseButton1Up:Connect(function()
			local aElement
			aModule.MyPlayer.MyMenuLocations.SetListSelect({["aKey"]=""..aKey,})
			aElement = aPlayer:FindFirstChild("PlayerGui"):FindFirstChild(aName)
			if aElement ~= nil then
				aElement:Destroy()
				aElement = nil
			end
		end)
		aCount += 1

	end

	return
end

aModule.MyPlayer.MyMenuLocations.SetListSelect = function(aParam)
	local aConfig = aModule.MyConfig
	local aName
	local aService
	local aLanguage
	local aPlayer
	local aList

	aPlayer = game:GetService("Players").LocalPlayer

	if aParam["aKey"] == aConfig.MyPlayer.MyMenuLocations.MyList.MyOption.MyCancel.aName then
		return
	end

	aService = game:GetService("ReplicatedStorage") 
	aName = aConfig.MyRemoteEvent.MyClientServerTrigger.MySetMenuLocation.aName
	aService:WaitForChild(""..aName):FireServer({["aKey"]=""..aParam["aKey"],})
end

return aModule
