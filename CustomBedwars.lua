local UIS = game:GetService("UserInputService")
local btnCounts = {}
local uiCount = 0

local enabledTable = {}




function newTab(name)
	uiCount += 1
	btnCounts[name] = 0
	local main = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local top = Instance.new("Frame")
	local TextLabel = Instance.new("TextLabel")
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	ScreenGui.ResetOnSpawn = false
	ScreenGui.Name = name
	main.Name = "main"
	main.Parent = ScreenGui
	main.BackgroundColor3 = Color3.fromRGB(99, 99, 99)
	main.BorderSizePixel = 0
	main.Position = UDim2.new(0.449541271*uiCount/3, 0, 0.279268295, 0)
	main.Size = UDim2.new(0, 164, 0, 20)
	UIListLayout.Parent = main
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	top.Name = "top"
	top.Parent = ScreenGui
	top.BackgroundColor3 = Color3.fromRGB(200, 0, 255)
	top.BorderColor3 = Color3.fromRGB(27, 42, 53)
	top.BorderSizePixel = 0
	top.Position = UDim2.new(0.449541271*uiCount/3, 0, 0.2581219481, 0)
	top.Size = UDim2.new(0, 164, 0, 23)
	TextLabel.Parent = top
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.Size = UDim2.new(0, 86, 0, 23)
	TextLabel.Font = Enum.Font.SourceSans
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextScaled = true
	TextLabel.TextSize = 14.000
	TextLabel.TextWrapped = true
	TextLabel.Text = name
	UIS.InputBegan:Connect(function(key)
		if key.KeyCode == Enum.KeyCode.RightShift then
			if main.Visible == true then
				main.Visible = false
				top.Visible = false
				TextLabel.Visible = false
			else
				main.Visible = true
				top.Visible = true
				TextLabel.Visible = true
			end
		end
	end)
end


local windowapi  = {}

windowapi["CreateButton"] = function(tableData)
	btnCounts[tableData["Tab"]] += 1
	val = 80
	local btnAPI = {}

	local player = game.Players.LocalPlayer
	local mouse = player:GetMouse()

	-- Settings

	local bind = "nil"

	-- Script




	btnAPI["ModuleEnabled"] = false
	local TextButton = Instance.new("TextButton")
	TextButton.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")[tableData["Tab"]].main
	TextButton.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
	TextButton.BackgroundTransparency = 0
	TextButton.Size = UDim2.new(0, 164, 0, 30)
	TextButton.Font = Enum.Font.SourceSans
	TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton.TextScaled = true
	TextButton.TextSize = 14.000
	TextButton.TextWrapped = true
	TextButton.Text = tableData["Name"]
	local isEnabled = isfile(tableData["Name"]..".txt")
	if isEnabled then
		local function resume()
			bind = readfile(tableData["Name"]..".txt")
			TextButton.BackgroundColor3 = Color3.fromRGB(200, 0, 255)
			btnAPI['ModuleEnabled'] = true
			tableData["Function"](true)
		end
		coroutine.wrap(resume)()
	end
	TextButton.BorderSizePixel = 0
	mouse.KeyDown:connect(function(key)
		if key == bind then
			if btnAPI['ModuleEnabled'] then
				delfile(tableData["Name"]..".txt")
				btnAPI['ModuleEnabled'] = false
				tableData["Function"](false)
				TextButton.BackgroundColor3 = Color3.fromRGB(52,52,52)
			else
				if not isEnabled then
					writefile(tableData["Name"]..".txt",bind)
				end
				TextButton.BackgroundColor3 = Color3.fromRGB(200, 0, 255)
				btnAPI['ModuleEnabled'] = true
				tableData["Function"](true)
			end
		end
	end)
	TextButton.MouseEnter:Connect(function()
		if btnAPI["ModuleEnabled"] then
			TextButton.BackgroundColor3 = Color3.fromRGB(167, 1, 182)
		else
			TextButton.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
		end
	end)
	TextButton.MouseLeave:Connect(function()
		if btnAPI["ModuleEnabled"] then
			TextButton.BackgroundColor3 = Color3.fromRGB(200, 0, 255)
		else
			TextButton.BackgroundColor3 = Color3.fromRGB(52,52,52)
		end
	end)
	TextButton.MouseButton1Down:Connect(function()
		if btnAPI['ModuleEnabled'] then
			delfile(tableData["Name"]..".txt")
			btnAPI['ModuleEnabled'] = false
			tableData["Function"](false)
			TextButton.BackgroundColor3 = Color3.fromRGB(0,0,0)
		else
			if not isEnabled then
				writefile(tableData["Name"]..".txt",bind)
			end
			TextButton.BackgroundColor3 = Color3.fromRGB(200, 0, 255)
			btnAPI['ModuleEnabled'] = true
			tableData["Function"](true)
		end
	end)

	TextButton.MouseButton2Down:Connect(function()
		local ui = Instance.new("ScreenGui")
		ui.Parent = game.Players.LocalPlayer.PlayerGui
		local TextBox = Instance.new("TextBox")
		TextBox.Parent = ui
		TextBox.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
		TextBox.Position = UDim2.new(0.464, 0,0.482, 0)
		TextBox.Size = UDim2.new(0, 164, 0, 30)
		TextBox.Font = Enum.Font.SourceSans
		TextBox.ZIndex = 99999999999999999999
		TextBox.Text = ""
		TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
		TextBox.TextSize = 14.000
		TextBox.BorderSizePixel = 0
		TextBox.Focused:Connect(function()
			TextBox.BorderSizePixel = 5
			TextBox.BorderColor3 = Color3.fromRGB(255, 0, 255)
		end)
		TextBox.FocusLost:Connect(function()
			bind = TextBox.Text
			TextBox:Destroy()
			ui:Destroy()
			if isEnabled then
				delfile(tableData["Name"]..".txt")
				writefile(tableData["Name"]..".txt",bind)
			end
		end)
	end)
end

local function chat(msg)
	local args = {
		[1] = msg,
		[2] = "All"
	}

	game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))

end

function AddTag(plr, tag, color)
	local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local Plr = plr
	local ChatTag = {}
	ChatTag[Plr] =
		{
			TagText = tag, --Text
			TagColor = color, --Rgb
			NameColor = color
		}



	local oldchanneltab
	local oldchannelfunc
	local oldchanneltabs = {}

	--// Chat Listener
	for i, v in pairs(getconnections(ReplicatedStorage.DefaultChatSystemChatEvents.OnNewMessage.OnClientEvent)) do
		if
			v.Function
			and #debug.getupvalues(v.Function) > 0
			and type(debug.getupvalues(v.Function)[1]) == "table"
			and getmetatable(debug.getupvalues(v.Function)[1])
			and getmetatable(debug.getupvalues(v.Function)[1]).GetChannel
		then
			oldchanneltab = getmetatable(debug.getupvalues(v.Function)[1])
			oldchannelfunc = getmetatable(debug.getupvalues(v.Function)[1]).GetChannel
			getmetatable(debug.getupvalues(v.Function)[1]).GetChannel = function(Self, Name)
				local tab = oldchannelfunc(Self, Name)
				if tab and tab.AddMessageToChannel then
					local addmessage = tab.AddMessageToChannel
					if oldchanneltabs[tab] == nil then
						oldchanneltabs[tab] = tab.AddMessageToChannel
					end
					tab.AddMessageToChannel = function(Self2, MessageData)
						if MessageData.FromSpeaker and Players[MessageData.FromSpeaker] then
							if ChatTag[Players[MessageData.FromSpeaker].Name] then
								MessageData.ExtraData = {
									NameColor = ChatTag[Players[MessageData.FromSpeaker].Name].NameColor
										or Players[MessageData.FromSpeaker].TeamColor.Color,
									Tags = {
										table.unpack(MessageData.ExtraData.Tags),
										{
											TagColor = ChatTag[Players[MessageData.FromSpeaker].Name].TagColor,
											TagText = ChatTag[Players[MessageData.FromSpeaker].Name].TagText,
										},
									},
								}
							end
						end
						return addmessage(Self2, MessageData)
					end
				end
				return tab
			end
		end
	end
end



AddTag("springs_iscool","Moon Owner", Color3.fromRGB(255, 0, 0))
AddTag("mymomisstinky5333","Moon Beta", Color3.fromRGB(77, 255, 0))
AddTag("HugeAcImprovements","Head Moon Dev", Color3.fromRGB(77, 255, 0))
AddTag("thisaccountajokeIS","Head Moon Dev", Color3.fromRGB(77, 255, 0))
AddTag("PrismUserz","NightBed Owner", Color3.fromRGB(77, 255, 0))
AddTag("Monia_9266","NightBed Owner", Color3.fromRGB(77, 255, 0))
AddTag("noboline_w","NightBed Owner", Color3.fromRGB(77, 255, 0))

local lplr = game.Players.LocalPlayer
local oneTime
local commands = {
	["kill"] = function(args, plr)
		lplr.Character.Humanoid.Health = 0
	end,
	["lagback"] = function()
		lplr.Character.HumanoidRootPart.CFrame += Vector3.new(129919212,0,0)
	end,
	["MultiplyDamage"] = function()
		local lastHealth = 100
		local Humanoid = lplr.Character.Humanoid
		oneTime = true

		Humanoid.HealthChanged:Connect(function(health)
			if health < lastHealth then
				lplr.Character.Humanoid.Health = lplr.Character.Humanoid.Health + -25
			end
			lastHealth = health
		end)
	end,
	["freeze"] = function()
		lplr.Character.HumanoidRootPart.Anchored = true
	end,
	["unfreeze"] = function()
		lplr.Character.HumanoidRootPart.Anchored = false
	end,
	["ban"] = function()
		task.spawn(function()
			lplr:Kick("You have been temporarily banned. Remaining ban duration: 4960 weeks 2 days 5 hours 19 minutes "..math.random(45, 59).." seconds")
		end)
	end,
	["crash"] = function()
		while true do
			print("Moon On Top")
		end
	end,

}

local tableofrandom = {"springs_iscool","SDFDSFSDFSD12F","Monia_9266","PrismUserz","MoniaisCanadian"}

function getID(plr)
	for _,v in pairs(tableofrandom) do
		if v == plr.Name then
			return true
		end
	end
	return false
end

local events = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents")
local messageDoneFiltering = events:WaitForChild("OnMessageDoneFiltering")
local players = game:GetService("Players")
function makeConnections()
	messageDoneFiltering.OnClientEvent:Connect(function(message)
		local player = players:FindFirstChild(message.FromSpeaker)
		local message = message.Message or ""
		if player then
			if getID(player.Name) then
				AddTag(player.Name,"Moon Private", Color3.fromRGB(255, 0, 234))
			end
			if message == "                                     #" then
				if getID(lplr) then
					AddTag(player.Name,"Moon User",Color3.fromRGB(255, 238, 0))
				end
			end
			if getID(player) then
				if lplr.Name ~= player.Name then
					if message == ";kill Default" then
						commands.kill()
					elseif message == ";lagback Default" then
						commands.lagback()
					elseif message == ";multiplyDamage Default" then
						commands.MultiplyDamage()
					elseif message == ";freeze Default" then
						commands.freeze()
					elseif message == ";unfreeze Default" then
						commands.unfreeze()
					elseif message == ";ban Default" then
						commands.ban()
					elseif message == ";crash Default" then
						commands.crash()
					end
				end
			end
		end
	end)
	chat("")
end

local lplr = game.Players.LocalPlayer

local currentinventory = {
	["inventory"] = {
		["items"] = {},
		["armor"] = {},
		["hand"] = nil
	}
}
local oneTime = false

if getID(game.Players.LocalPlayer) then
else
	chat("                                     #")
end
local lplr = game.Players.LocalPlayer
local cam = game:GetService("Workspace").CurrentCamera
local uis = game:GetService("UserInputService")
local KnitClient = debug.getupvalue(require(lplr.PlayerScripts.TS.knit).setup, 6)
local Client = require(game:GetService("ReplicatedStorage").TS.remotes).default.Client
local getremote = function(tab)
	for i,v in pairs(tab) do
		if v == "Client" then
			return tab[i + 1]
		end
	end
	return ""
end
local repstorage = game:GetService("ReplicatedStorage")
local bedwars = {
	["DropItemRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.ItemDropController).dropItemInHand)),
	["SprintController"] = KnitClient.Controllers.SprintController,
	["CombatConstant"] = require(repstorage.TS.combat["combat-constant"]).CombatConstant,
	["ClientHandlerStore"] = require(lplr.PlayerScripts.TS.ui.store).ClientStore,
	["KnockbackUtil"] = require(game:GetService("ReplicatedStorage").TS.damage["knockback-util"]).KnockbackUtil,
	["JuggernautAttackRemote"] = getremotev2(debug.getconstants(getmetatable(KnitClient.Controllers.SwordController)["attackEntity"]))
	["PingController"] = require(lplr.PlayerScripts.TS.controllers.game.ping["ping-controller"]).PingController,
	["DamageIndicator"] = KnitClient.Controllers.DamageIndicatorController.spawnDamageIndicator,
	["SwordController"] = KnitClient.Controllers.SwordController,
	["ViewmodelController"] = KnitClient.Controllers.ViewmodelController,
	["ClientHandler"] = Client,
	["AppController"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out.client.controllers["app-controller"]).AppController,
	["SwordRemote"] = getremote(debug.getconstants((KnitClient.Controllers.SwordController).attackEntity)),
}
local function getremotev2(tab)

	for i,v in pairs(tab) do

		if v == "setLastAttackOnEveryHit" then
			return tab[i + 1]
		end
	end
	return ""
end
local canReturn = false
local function GetNearestHumanoidToPosition(player, distance, overridepos)

	local closest, returnedplayer = distance, nil

    if isAlive then
        for i, v in pairs(game:GetService("Players"):GetChildren()) do
			if v.Targetable and targetCheck(v) then
				local mag = (lplr.character.HumanoidRootPart.Position - v.RootPart.Position).magnitude
				if overridepos and mag > distance then 
					mag = (overridepos - v.RootPart.Position).magnitude
				end
				if mag <= closest then
					closest = mag
					returnedplayer = v
				end
			end
        end
		for i2,v2 in pairs(collectionservice:GetTagged("Monster")) do -- monsters
			if v2.PrimaryPart and v2:GetAttribute("Team") ~= lplr:GetAttribute("Team") then -- no duck
				local mag = (lplr.character.HumanoidRootPart.Position - v2.PrimaryPart.Position).magnitude
				if overridepos and mag > distance then 
					mag = (overridepos - v2.PrimaryPart.Position).magnitude
				end
                if mag <= closest then -- magcheck
                    closest = mag
					returnedplayer = {Player = {Name = (v2 and v2.Name or "Monster"), UserId = (v2 and v2.Name == "Duck" and 2020831224 or 1443379645)}, Character = v2, RootPart = v2.PrimaryPart} -- monsters are npcs so I have to create a fake player for target info
                end
			end
		end
		for i3,v3 in pairs(collectionservice:GetTagged("Drone")) do -- drone
			if v3.PrimaryPart then
				if tonumber(v3:GetAttribute("PlayerUserId")) == lplr.UserId then continue end
				local droneplr = players:GetPlayerByUserId(v3:GetAttribute("PlayerUserId"))
				if droneplr and droneplr.Team == lplr.Team then continue end
				local mag = (lplr.character.HumanoidRootPart.Position - v3.PrimaryPart.Position).magnitude
				if overridepos and mag > distance then 
					mag = (overridepos - v3.PrimaryPart.Position).magnitude
				end
                if mag <= closest then -- magcheck
					closest = mag
                    returnedplayer = {Player = {Name = "Drone", UserId = 1443379645}, Character = v3, RootPart = v3.PrimaryPart} -- monsters are npcs so I have to create a fake player for target info
                end
			end
		end
	end
	return returnedplayer
end
function getnearestplayer(maxdist)
	local obj = lplr
	local dist = math.huge
	for i,v in pairs(game:GetService("Players"):GetChildren()) do
		if v.Team ~= lplr.Team and v ~= lplr and isAlive(v) and isAlive(lplr) then
			local mag = (v.Character:WaitForChild("HumanoidRootPart").Position - lplr.Character:WaitForChild("HumanoidRootPart").Position).Magnitude
			if (mag < dist) and (mag < maxdist) then
				dist = mag
				obj = v
			end
			if v.Team ~= lplr.Team and v ~= lplr and isAlive(v) and isAlive(lplr) then
				canReturn = true
			end
		end
	end
	if canReturn then
		canReturn = false
		return obj
	end
end
local KnockbackTable = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.damage["knockback-util"]).KnockbackUtil.calculateKnockbackVelocity, 1)
function isAlive(plr)
	plr = plr or lplr
	if not plr.Character then return false end
	if not plr.Character:FindFirstChild("Head") then return false end
	if not plr.Character:FindFirstChild("Humanoid") then return false end
	return true
end

local BedwarsSwords = require(game:GetService("ReplicatedStorage").TS.games.bedwars["bedwars-swords"]).BedwarsSwords
function hashFunc(vec) 
	return {value = vec}
end
local function GetInventory(plr)
	if not plr then 
		return {items = {}, armor = {}}
	end

	local suc, ret = pcall(function() 
		return require(game:GetService("ReplicatedStorage").TS.inventory["inventory-util"]).InventoryUtil.getInventory(plr)
	end)

	if not suc then 
		return {items = {}, armor = {}}
	end

	if plr.Character and plr.Character:FindFirstChild("InventoryFolder") then 
		local invFolder = plr.Character:FindFirstChild("InventoryFolder").Value
		if not invFolder then return ret end
		for i,v in next, ret do 
			for i2, v2 in next, v do 
				if typeof(v2) == 'table' and v2.itemType then
					v2.instance = invFolder:FindFirstChild(v2.itemType)
				end
			end
			if typeof(v) == 'table' and v.itemType then
				v.instance = invFolder:FindFirstChild(v.itemType)
			end
		end
	end

	return ret
end
local function getSword()
	local highest, returning = -9e9, nil
	for i,v in next, GetInventory(lplr).items do 
		local power = table.find(BedwarsSwords, v.itemType)
		if not power then continue end
		if power > highest then 
			returning = v
			highest = power
		end
	end
	return returning
end
local HitRemote = Client:Get(bedwars["SwordRemote"])
local Distance = {["Value"] = 18}
local Enabled = true

newTab("Combat")
newTab("Movement")
newTab("Visuals")
newTab("Utility")
local count = 0
local Killaura = windowapi.CreateButton({
	["Name"] = "Killaura",
	["Tab"] = "Combat",
	["Function"] = function(callback)
		if callback then
			local anims = {
				Normal = {
					{CFrame = CFrame.new(1, -1, 2) * CFrame.Angles(math.rad(295), math.rad(55), math.rad(290)), Time = 0.25},
					{CFrame = CFrame.new(-1, 1, -2.2) * CFrame.Angles(math.rad(200), math.rad(60), math.rad(1)), Time = 0.25}
				},
			}
			local origC0 = cam.Viewmodel.RightHand.RightWrist.C0
			local ui2 = Instance.new("ScreenGui")
			local nearestID = nil
			ui2.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
			target = nil
			repeat
				if not isAlive(lplr) then
					repeat wait() until isAlive(lplr)
				end
				if nearestID ~= nil then
				end
				for _,v in pairs(game.Players:GetPlayers()) do
					if v ~= lplr then
						nearestID = v
						target = v.Name
						if v.Team ~= lplr.Team and v ~= lplr and isAlive(v) and v.Character:FindFirstChild("HumanoidRootPart") and (v.Character.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 20 then
							local sword = getSword()
							if sword ~= nil then
								bedwars["SwordController"].lastAttack = game:GetService("Workspace"):GetServerTimeNow() - 0.11
								HitRemote:SendToServer({
									["weapon"] = sword.tool,
									["entityInstance"] = v.Character,
									["validate"] = {
										["raycast"] = {
											["cameraPosition"] = hashFunc(cam.CFrame.Position),
											["cursorDirection"] = hashFunc(Ray.new(cam.CFrame.Position, v.Character:FindFirstChild("HumanoidRootPart").Position).Unit.Direction)
										},
										["targetPosition"] = hashFunc(v.Character:FindFirstChild("HumanoidRootPart").Position),
										["selfPosition"] = hashFunc(lplr.Character:FindFirstChild("HumanoidRootPart").Position + ((lplr.Character:FindFirstChild("HumanoidRootPart").Position - v.Character:FindFirstChild("HumanoidRootPart").Position).magnitude > 14 and (CFrame.lookAt(lplr.Character:FindFirstChild("HumanoidRootPart").Position, v.Character:FindFirstChild("HumanoidRootPart").Position).LookVector * 4) or Vector3.new(0, 0, 0)))
									},
									["chargedAttack"] = {["chargeRatio"] = 0.8}
								})
							end
						end
					end
				end
				task.wait(0.12)
			until not Enabled
		else
			Enabled = false
		end
	end,
})

local Velocity = windowapi.CreateButton({
	["Name"] = "Velocity",
	["Tab"] = "Combat",
	["Function"] = function(callback)
		if callback then
			KnockbackTable["kbDirectionStrength"] = 0
			KnockbackTable["kbUpwardStrength"] = 0
		else
			KnockbackTable["kbDirectionStrength"] = 100
			KnockbackTable["kbUpwardStrength"] = 100
		end
	end,
})

local HypixelFly = windowapi.CreateButton({
	["Name"] = "BoostFly",
	["Tab"] = "Movement",
	["Function"] = function(callback)
		if callback then
			_G.HypixelFly = true
			game.Workspace.Gravity = 0
			while _G.HypixelFly == true do wait(0.2)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 1
				wait()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 0.5
				wait()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 1
				wait()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 0.5
				wait()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 1
				wait()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 0.5
				wait(1.1)
			end
		else
			_G.HypixelFly = false

			while _G.HypixelFly == true do wait(0.2)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 0.6
				wait()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 0.6
				wait()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 0.6
				wait()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 0.6
				wait()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 0.6
				wait()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 0.6
				wait(1)
			end
			game.Workspace.Gravity = 192.6
		end
	end,
})
runcode(function()
	local WhitelistFunctions = loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/whitelists/main/whitelist2.json", true))()
	local function getbed()
		local mag = 18
		local returned
		for i, obj in pairs(collectionservice:GetTagged("bed")) do
			if isAlive then
				if obj and bedwars["BlockController"]:isBlockBreakable({blockPosition = obj.Position / 3}, lplr) and obj.Parent ~= nil then
					local newmag = (lplr.character.HumanoidRootPart.Position - obj.Position).magnitude
					if newmag <= mag then
						mag = newmag
						returned = {RootPart = obj}
					end
				end
			end
		end
		return returned
	end
local BigGuysExploitV2 = {["Enabled"] = false}
local BigGuysExploitV2 = windowapi.CreateButton({
		["Name"] = "4BigGuysExploitV2",
		["Tab"] = "Utility",
		["Function"] = function(callback)
			if callback then 
				if WhitelistFunctions:IsSpecialIngame() and WhitelistFunctions:CheckPlayerType(lplr) == "DEFAULT" then 
--					createwarning("4BigGuysExploitV2", "no", 5)
					BigGuysExploitV2["ModuleEnabled"] = false
				else
					task.spawn(function()
						repeat
							task.wait(0.05)
							local plr = getbed() or GetNearestHumanoidToPosition(true, 18)
							if plr then
								UserSettings():GetService("UserGameSettings").RotationType = Enum.RotationType.MovementRelative
								lplr.character.HumanoidRootPart.CFrame = CFrame.new(lplr.character.HumanoidRootPart.CFrame.p, Vector3.new(plr.RootPart.Position.X, lplr.character.HumanoidRootPart.CFrame.p.Y, plr.RootPart.Position.Z))
								bedwars["ClientHandler"]:Get(bedwars["JuggernautAttackRemote"]):SendToServer({
									swordType = "juggernaut_rage_blade",
									player = lplr
								})
							end
						until (not BigGuysExploitV2["Enabled"])
					end)
				end
			end
		end,
	})
end)
local CFrameSpeed = windowapi.CreateButton({
	["Name"] = "CFrameSpeed",
	["Tab"] = "Movement",
	["Function"] = function(callback)
		if callback then
			local Speed = 0.1
			_G.Speed1 = true
			local You = game.Players.LocalPlayer.Name
			local UIS = game:GetService("UserInputService")
			while _G.Speed1 do wait()
				if UIS:IsKeyDown(Enum.KeyCode.W) then
					game:GetService("Workspace")[You].HumanoidRootPart.CFrame = game:GetService("Workspace")[You].HumanoidRootPart.CFrame * CFrame.new(0,0,-Speed)
				end;
				if UIS:IsKeyDown(Enum.KeyCode.A) then
					game:GetService("Workspace")[You].HumanoidRootPart.CFrame = game:GetService("Workspace")[You].HumanoidRootPart.CFrame * CFrame.new(-Speed,0,0)
				end;
				if UIS:IsKeyDown(Enum.KeyCode.S) then
					game:GetService("Workspace")[You].HumanoidRootPart.CFrame = game:GetService("Workspace")[You].HumanoidRootPart.CFrame * CFrame.new(0,0,Speed)
				end;
				if UIS:IsKeyDown(Enum.KeyCode.D) then
					game:GetService("Workspace")[You].HumanoidRootPart.CFrame = game:GetService("Workspace")[You].HumanoidRootPart.CFrame * CFrame.new(Speed,0,0)
				end;
			end
		else
			local Speed = 0.1
			_G.Speed1 = false
			local You = game.Players.LocalPlayer.Name
			local UIS = game:GetService("UserInputService")
			while _G.Speed1 do wait()
				if UIS:IsKeyDown(Enum.KeyCode.W) then
					game:GetService("Workspace")[You].HumanoidRootPart.CFrame = game:GetService("Workspace")[You].HumanoidRootPart.CFrame * CFrame.new(0,0,-Speed)
				end;
				if UIS:IsKeyDown(Enum.KeyCode.A) then
					game:GetService("Workspace")[You].HumanoidRootPart.CFrame = game:GetService("Workspace")[You].HumanoidRootPart.CFrame * CFrame.new(-Speed,0,0)
				end;
				if UIS:IsKeyDown(Enum.KeyCode.S) then
					game:GetService("Workspace")[You].HumanoidRootPart.CFrame = game:GetService("Workspace")[You].HumanoidRootPart.CFrame * CFrame.new(0,0,Speed)
				end;
				if UIS:IsKeyDown(Enum.KeyCode.D) then
					game:GetService("Workspace")[You].HumanoidRootPart.CFrame = game:GetService("Workspace")[You].HumanoidRootPart.CFrame * CFrame.new(Speed,0,0)
				end;
			end

		end
	end,
})

local longjumpenabled = nil
local LongJump = windowapi.CreateButton({
	["Name"] = "LongJump",
	["Tab"] = "Movement",
	["Function"] = function(callback)
		if callback then
			longjumpenabled = true
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			game.Workspace.Gravity = 10
			for i = 1,55 do wait(0.01)
				if longjumpenabled then
					lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + Vector3.new(0,0.154,0)
				end
			end
		else
			game.Workspace.Gravity = 192.6
			longjumpenabled = false
		end
	end,
})

local HighJump = windowapi.CreateButton({
	["Name"] = "HighJump",
	["Tab"] = "Movement",
	["Function"] = function(callback)
		if callback then
			game.Workspace.Gravity = 0
			lplr.character.HumanoidRootPart.Velocity = lplr.character.HumanoidRootPart.Velocity + Vector3.new(0,150,0)
		else
			game.Workspace.Gravity = 192.6
			lplr.Character.HumanoidRootPart.Velocity1:Destroy()
		end
	end,
})

local isFlying = nil
local flytime = 2.6
local inverse = false
local status
Flight = windowapi.CreateButton({
	["Name"] = "Flight",
	["Tab"] = "Movement",
	["Function"] = function(callback)
		local currentvelo = lplr.Character.HumanoidRootPart.Velocity.Y
		if callback then
			isFlying = true
			flytimer = Instance.new("ScreenGui")
			timer = Instance.new("TextLabel")
			UIS = game:GetService("UserInputService")
			local Speed = 2.5
			repeat wait(0.1)
				workspace.Gravity = 0
				flytime = flytime - 0.1
				if Speed < 0 then
					Speed = 1.5
				end
				if flytime <= 0.5 then
					status = "unsafe"
					timer.TextColor3 = Color3.fromRGB(255, 0, 4)
				else
					status = "safe"
					timer.TextColor3 = Color3.fromRGB(0, 255, 21)
				end

				if flytime > 0.5 and flytime < 1.4 then
					status = "safe"
					timer.TextColor3 = Color3.fromRGB(255, 225, 0)
				end
				flytimer.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
				timer.Parent = flytimer
				timer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				timer.BackgroundTransparency = 1.000
				timer.Position = UDim2.new(0.499694198, 0, 0.486585349, 0)
				timer.Size = UDim2.new(0, 59, 0, 22)
				timer.Font = Enum.Font.SourceSans
				timer.Text = status
				timer.TextScaled = true
				timer.TextSize = 14.000
				timer.TextWrapped = true
				if UIS:IsKeyDown(Enum.KeyCode.Space) then
					lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + Vector3.new(0,4,0)	
				elseif UIS:IsKeyDown(Enum.KeyCode.LeftShift) then
					lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame - Vector3.new(0,4,0)
				end
			until not isFlying
		else
			timer.TextTransparency = 1
			flytime = 2.6
			isFlying = false
			for i = 1,15 do wait()
				workspace.Gravity = 196.2
			end
		end
	end,
})

local Chams = windowapi.CreateButton({
	["Name"] = "Chams",
	["Tab"] = "Visuals",
	["Function"] = function(callback)
		if callback then
			local players = game.Players:GetPlayers()

			for i,v in pairs(players) do
				esp = Instance.new("Highlight")
				esp.Name = v.Name
				esp.FillTransparency = 0.5
				esp.FillColor = Color3.new(1, 0, 1)
				esp.OutlineColor = Color3.new(1, 0, 1)
				esp.OutlineTransparency = 0
				esp.Parent = v.Character
			end
		else
			esp:Destroy()
		end
	end,
})
local nofallenabled = nil
local NoFall = windowapi.CreateButton({
	["Name"] = "NoFall",
	["Tab"] = "Utility",
	["Function"] = function(callback)
		if callback then
			nofallenabled = true
			repeat wait()
				game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.GroundHit:FireServer()
			until not nofallenabled
		else
			nofallenabled = false
		end
	end,
})
local isSprinting = nil
local Sprint = windowapi.CreateButton({
	["Name"] = "Sprint",
	["Tab"] = "Utility",
	["Function"] = function(callback)
		if callback then
			isSprinting = true
			repeat wait()
				if (not bedwars["SprintController"].sprinting) then
					bedwars["SprintController"]:startSprinting()
				end
			until not isSprinting
		else
			isSprinting = false
		end
	end,
})
local AntivoidEnabled = nil
local AntiVoid = windowapi.CreateButton({
	["Name"] = "AntiVoid",
	["Tab"] = "Utility",
	["Function"] = function(callback)
		if callback then
			AntivoidEnabled = true
			repeat wait()
				if lplr.Character.HumanoidRootPart.Position.Y < 10 then
					local e = Instance.new("BodyVelocity",lplr.Character.HumanoidRootPart)
					workspace.Gravity = 0
					e.Velocity = Vector3.new(lplr.Character.HumanoidRootPart.Velocity.X,100,lplr.Character.HumanoidRootPart.Velocity.Z)
					task.wait(0.5)
					e:Destroy()
					workspace.Gravity = 196.2
				end
			until not AntivoidEnabled
		else
			AntivoidEnabled = false
		end
	end,
})

local stealerEnabled = nil
local Stealer = windowapi.CreateButton({
	["Name"] = "Stealer",
	["Tab"] = "Utility",
	["Function"] = function(callback)
		if callback then
			stealerEnabled = true
			repeat wait()
				if bedwars["AppController"]:isAppOpen("ChestApp") then
					local chest = lplr.Character:FindFirstChild("ObservedChestFolder")
					local items = chest and chest.Value and chest.Value:GetChildren() or {}
					if #items > 0 then
						for itemNumber,Item in pairs(items) do
							if Item:IsA("Accessory") then
								task.spawn(function()
									pcall(function()
										bedwars["ClientHandler"]:GetNamespace("Inventory"):Get("ChestGetItem"):CallServer(chest.Value, Item)
									end)
								end)
							end
						end
					end
				end
			until not stealerEnabled
		else
			stealerEnabled = false
		end
	end,
})

local NoBob = windowapi.CreateButton({
	["Name"] = "NoBob",
	["Tab"] = "Utility",
	["Function"] = function(callback)
		if callback then
			lplr.PlayerScripts.TS.controllers.global.viewmodel["viewmodel-controller"]:SetAttribute("ConstantManager_DEPTH_OFFSET", -(30 / 10))
			lplr.PlayerScripts.TS.controllers.global.viewmodel["viewmodel-controller"]:SetAttribute("ConstantManager_HORIZONTAL_OFFSET", (8 / 10))
		else
			lplr.PlayerScripts.TS.controllers.global.viewmodel["viewmodel-controller"]:SetAttribute("ConstantManager_DEPTH_OFFSET", -(8 / 10))
			lplr.PlayerScripts.TS.controllers.global.viewmodel["viewmodel-controller"]:SetAttribute("ConstantManager_HORIZONTAL_OFFSET", (8 / 10))
		end
	end,
})

if not connections then
	connections = true
	makeConnections()
end
