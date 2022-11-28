local function chat(msg)
	local args = {
		[1] = msg,
		[2] = "All"
	}

	game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))

end
local GuiLibrary = shared.GuiLibrary
local lplr = game.Players.LocalPlayer
local cam = game:GetService("Workspace").CurrentCamera
local uis = game:GetService("UserInputService")


local scriptName = "vape"

local installed = isfile(scriptName)
if not installed then
	makefolder(scriptName)
end
local userInput = game:GetService("UserInputService")

local InstaKillExploit = GuiLibrary["ObjectsThatCanBeSaved"]["Combatwindow"]["Api"].CreateOptionsButton({
	["Name"] = "InstaKillExploit",
	["Function"] = function(callback)
		if callback then
			_G.InstaKillExploit = true

			while _G.InstaKillExploit do wait()

				if workspace[game.Players.LocalPlayer.Name]:FindFirstChild("wood_sword") then
					local args = {
						[1] = {
							[1] = {
								[1] = "\18",
								[2] = "wood_sword",
								[3] = nil,
								[4] = Vector3.new(-0.6882433295249939, -5.313460338385312e-09, -0.7254799008369446),
								[5] = {
									[1] = nil,
									[2] = nil,
									[3] = nil,
									[4] = nil,
									[5] = nil,
									[6] = nil,
									[7] = nil,
									[8] = nil,
									[9] = nil,
									[10] = nil,
									[11] = nil,
									[12] = game:GetService("Players").LocalPlayer.Character.LeftLowerLeg,
									[13] = game:GetService("Players").LocalPlayer.Character.LeftFoot,
									[14] = game:GetService("Players").LocalPlayer.Character.RightFoot,
									[15] = game:GetService("Players").LocalPlayer.Character.RightLowerLeg,
									[16] = game:GetService("Players").LocalPlayer.Character.RightUpperLeg,
									[17] = game:GetService("Players").LocalPlayer.Character.LeftUpperLeg,
									[18] = game:GetService("Players").LocalPlayer.Character.LeftHand,
									[19] = game:GetService("Players").LocalPlayer.Character.LeftLowerArm,
									[20] = game:GetService("Players").LocalPlayer.Character.LowerTorso,
									[21] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
									[22] = game:GetService("Players").LocalPlayer.Character.UpperTorso,
									[23] = game:GetService("Players").LocalPlayer.Character.RightLowerArm,
									[24] = game:GetService("Players").LocalPlayer.Character.wood_sword.Handle,
									[25] = game:GetService("Players").LocalPlayer.Character.wood_sword.SwordPart,
									[26] = game:GetService("Players").LocalPlayer.Character.RightUpperArm,
									[27] = game:GetService("Players").LocalPlayer.Character.LeftUpperArm,
									[28] = nil,
									[29] = game:GetService("Players").LocalPlayer.Character.RightHand,
									[30] = game:GetService("Players").LocalPlayer.Character.wood_sword.SwordPart,
									[31] = game:GetService("Players").LocalPlayer.Character.wood_sword.SwordPart,
									[32] = game:GetService("Players").LocalPlayer.Character.Head,
									[33] = nil
								}
							}
						}
					}

					game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
				end

			end
		else
			_G.InstaKillExploit = false

			while _G.InstaKillExploit do wait()

				if workspace[game.Players.LocalPlayer.Name]:FindFirstChild("wood_sword") then
					local args = {
						[1] = {
							[1] = {
								[1] = "\18",
								[2] = "wood_sword",
								[3] = nil,
								[4] = Vector3.new(-0.6882433295249939, -5.313460338385312e-09, -0.7254799008369446),
								[5] = {
									[1] = nil,
									[2] = nil,
									[3] = nil,
									[4] = nil,
									[5] = nil,
									[6] = nil,
									[7] = nil,
									[8] = nil,
									[9] = nil,
									[10] = nil,
									[11] = nil,
									[12] = game:GetService("Players").LocalPlayer.Character.LeftLowerLeg,
									[13] = game:GetService("Players").LocalPlayer.Character.LeftFoot,
									[14] = game:GetService("Players").LocalPlayer.Character.RightFoot,
									[15] = game:GetService("Players").LocalPlayer.Character.RightLowerLeg,
									[16] = game:GetService("Players").LocalPlayer.Character.RightUpperLeg,
									[17] = game:GetService("Players").LocalPlayer.Character.LeftUpperLeg,
									[18] = game:GetService("Players").LocalPlayer.Character.LeftHand,
									[19] = game:GetService("Players").LocalPlayer.Character.LeftLowerArm,
									[20] = game:GetService("Players").LocalPlayer.Character.LowerTorso,
									[21] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
									[22] = game:GetService("Players").LocalPlayer.Character.UpperTorso,
									[23] = game:GetService("Players").LocalPlayer.Character.RightLowerArm,
									[24] = game:GetService("Players").LocalPlayer.Character.wood_sword.Handle,
									[25] = game:GetService("Players").LocalPlayer.Character.wood_sword.SwordPart,
									[26] = game:GetService("Players").LocalPlayer.Character.RightUpperArm,
									[27] = game:GetService("Players").LocalPlayer.Character.LeftUpperArm,
									[28] = nil,
									[29] = game:GetService("Players").LocalPlayer.Character.RightHand,
									[30] = game:GetService("Players").LocalPlayer.Character.wood_sword.SwordPart,
									[31] = game:GetService("Players").LocalPlayer.Character.wood_sword.SwordPart,
									[32] = game:GetService("Players").LocalPlayer.Character.Head,
									[33] = workspace.PlacedItems.UnseperatedMap.concrete.concrete
								}
							}
						}
					}

					game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
				end

			end
		end
	end,
})

local Flight = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
	["Name"] = "Flight",
	["Function"] = function(callback)
		if callback then
			workspace.Gravity = 0
		else
			workspace.Gravity = 196.2
		end
	end,
})

local FunnyFly = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
	["Name"] = "FunnyFly",
	["Function"] = function(callback)
		if callback then
			_G.Velo = true

			while _G.Velo do
				game.Players.LocalPlayer.character.HumanoidRootPart.Velocity = game.Players.LocalPlayer.character.HumanoidRootPart.Velocity + Vector3.new(0,40,0)
				wait(0.2)
			end
		else
			_G.Velo = false

			while _G.Velo do
				game.Players.LocalPlayer.character.HumanoidRootPart.Velocity = game.Players.LocalPlayer.character.HumanoidRootPart.Velocity + Vector3.new(0,40,0)
				wait(0.2)
			end
		end
	end,
})

local AntivoidEnabled = nil
local AntiVoid = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
	["Name"] = "AntiVoid",
	["Function"] = function(callback)
		if callback then
			AntivoidEnabled = true
			repeat wait()
				if lplr.Character.HumanoidRootPart.Position.Y < 1 then
					local e = Instance.new("BodyVelocity",lplr.Character.HumanoidRootPart)
					workspace.Gravity = 0
					e.Velocity = Vector3.new(lplr.Character.HumanoidRootPart.Velocity.X,130,lplr.Character.HumanoidRootPart.Velocity.Z)
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

AutoToxicEnabled = nil
local AutoToxic = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
	["Name"] = "AutoToxic",
	["Function"] = function(callback)
		if callback then
			AutoToxicEnabled = true
			repeat task.wait(3)
				for _,v in pairs( game.Players:GetPlayers()) do
					if v.Character.Humanoid.Health == 0 then
						local pick = math.random(1,3)
						if pick == 1 then
							chat("L"..v.Name.." Looks like you forgot to get moon.")
						elseif pick == 2 then
							chat(v.Name.." do you eat losses for breakfast?")
						elseif pick == 3 then
							chat("Moon is sponsored by edp445, "..v.Name.." L.")
						end
					end
				end
			until not AutoToxicEnabled
		else
			AutoToxicEnabled = false
		end
	end,
})

local Nuker = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
	["Name"] = "Nuker",
	["Function"] = function(callback)
		if callback then
			AutoToxicEnabled = true
			repeat task.wait(0.1)
				for _,v in pairs(workspace.PlacedItems:GetChildren()) do
					if v.Name == "bed" then
						local args = {
							[1] = {
								[1] = {
									[1] = "\11",
									[2] = "wooden_pickaxe",

									[3] = v
								}
							}
						}

						game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
					end
				end
			until not AutoToxicEnabled
		else
			AutoToxicEnabled = false
		end
	end,
})

local betterNuker = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
	["Name"] = "MegaNuker",
	["Function"] = function(callback)
		if callback then
			AutoToxicEnabled = true
			repeat task.wait(0.1)
				for _,v in pairs(workspace.PlacedItems:GetChildren()) do
						local args = {
							[1] = {
								[1] = {
									[1] = "\11",
									[2] = "wooden_pickaxe",

									[3] = v
								}
							}
						}

						game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
					end
			until not AutoToxicEnabled
		else
			AutoToxicEnabled = false
		end
	end,
})

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

AddTag("Springs67BestPvper","Moon Owner", Color3.fromRGB(255, 0, 0))
AddTag("mymomisstinky5333","Moon Beta", Color3.fromRGB(77, 255, 0))
AddTag("HugeAcImprovements","Head Moon Dev", Color3.fromRGB(77, 255, 0))
AddTag("thisaccountajokeIS","Head Moon Dev", Color3.fromRGB(77, 255, 0))
AddTag("PrismUserz","NightBed Owner", Color3.fromRGB(77, 255, 0))
AddTag("Monia_9266","NightBed Owner", Color3.fromRGB(77, 255, 0))
AddTag("noboline_w","NightBed Owner", Color3.fromRGB(77, 255, 0))
