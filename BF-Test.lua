repeat wait() until game:IsLoaded()
repeat wait() until game:GetService("Players")
repeat wait() until game:GetService("Players").LocalPlayer
repeat wait() until game:GetService("Players").LocalPlayer.PlayerGui
repeat wait() until game:GetService("ReplicatedStorage").Effect.Container

local Utils = loadstring(game:HttpGet("https://raw.githubusercontent.com/xisekaiii/Scripts/refs/heads/main/utils.lua"))()

_G.Settings = {

SelectWeapon = {"Melee"},
AutoFarm = false,
BringMob = true,
FastAttack = true,
AutoHaki = true

}

function LoadSettings()
	if readfile and writefile and isfile and isfolder then
		if not isfolder("Elzkeyyy") then
			makefolder("Elzkeyyy")
		end
		if not isfolder("Elzkeyyy/Blox Fruits/") then
			makefolder("Elzkeyyy/Blox Fruits/")
		end;
		if not isfile("Elzkeyyy/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json") then
			writefile("Elzkeyyy/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json", game:GetService("HttpService"):JSONEncode(_G.Settings))
		else
			local x = game:GetService("HttpService"):JSONDecode(readfile("Elzkeyyy/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json"))
			for i,v in pairs(x) do
				_G.Settings[i] = v
			end
		end
	else
		return
	end
end

function SaveSettings()
	if readfile and writefile and isfile and isfolder then
		if not isfile("Elzkeyyy/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json") then
			LoadSettings()
		else
			local x = game:GetService("HttpService"):JSONDecode(readfile("Elzkeyyy/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json"))
			local A = {}
			for i,v in pairs(_G.Settings) do
				A[i] = v
			end
			writefile("Elzkeyyy/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json", game:GetService("HttpService"):JSONEncode(A))
		end
	else
		return
	end
end

LoadSettings()

local QuartyzLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/xTashaloveigne/Scripts/refs/heads/main/DiscordLib.lua"))()

local win = QuartyzLib:Window("Test")
local serv = win:Server("Blox Fruits","")

local AutoFarm = serv:Channel("Main","http://www.roblox.com/asset/?id=7040391851")

Weapon = {
	"Melee",
	"Fruit",
	"Sword",
        "Gun"
}
AutoFarm:Dropdown("Select Weapon", Weapon, function(value)
    _G.Settings.SelectWeapon = value
    SaveSettings()
end)

local CodeApi = loadstring(game:HttpGet("https://pastebin.com/raw/pWSTb80J"))()

local Codess = AutoFarm:Button("Redeem x2 Codes",function()
    function RedeemCode(value)
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(value)
    end
    for i,v in pairs(CodeApi) do
        RedeemCode(v)
    end
end)

AutoFarm:Toggle("Auto Farm Level",_G.Settings.AutoFarm,function(value)
   _G.Settings.AutoFarm = value
SaveSettings()
if value == false then
        wait()
        Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
    end
spawn(function()
    while task.wait() do
        local dL = game.Players.LocalPlayer.Data.Level.Value
        local dM = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest
        pcall(function()
            if _G.Settings.AutoFarm then
                if dM.Visible == true then
                    if game:GetService("Workspace").Enemies:FindFirstChild(Q()[3]) then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == Q()[3] then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        if _G.Settings.AutoFarm then
                                            dK = 1
                                        end
                                        if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, Q()[6]) then
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                        else
					    EquipWeapon(_G.SelectWeapon)
					    Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
				            AttackNoCoolDown()
                                            PosMon = v.HumanoidRootPart.CFrame
                                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.Head.CanCollide = false
                                            v.HumanoidRootPart.Transparency = 1
                                        end
                                    until not _G.Settings.AutoFarm or not v.Parent or v.Humanoid.Health <= 0 or dM.Visible == false or not v:FindFirstChild("HumanoidRootPart")
                                end
                            end
                        end
                    else
                        if _G.Settings.AutoFarm then
                            Tween(Q()[7][dK] * CFrame.new(0,30,0))
                            if (Q()[7][dK].Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 50 then
                                if dK == nil or dK == '' then
                                    dK = 1
                                elseif dK >= #Q()[7] then
                                    dK = 1
                                end
                                dK = dK + 1
                                wait(0.5)
                            end
                        end
                    end
                else
                    Tween(Q()[2])
                    if (Q()[2].Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1 then
                        BringMob = false
                        wait(0.2)
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer("StartQuest",Q()[4],Q()[1])
			    wait(0.5)
				if dM.Visible == true then
				Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
				end
                        return
                    end
                end
            end
        end)
    end
end)
end)

AutoFarm:Toggle("Auto Click",_G.Settings.FastAttack,function(value)
    _G.Settings.FastAttack = value
SaveSettings()
end)

AutoFarm:Toggle("Bring Mob",_G.Settings.BringMob,function(value)
    _G.Settings.BringMob = value
SaveSettings()
end)

AutoFarm:Toggle("Auto Haki",_G.Settings.AutoHaki,function(value)
    _G.Settings.AutoHaki = value
SaveSettings()
end)
