-- Old Blox Fruits AutoFarm Don't Skid

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

local O = Instance.new("Folder", workspace)
O.Name = "EnemySpawns"
for y, z in pairs(workspace._WorldOrigin.EnemySpawns:GetChildren()) do
    if z:IsA("Part") then
        local P = z:Clone()
        local J = string.gsub(z.Name, "Lv. ", "")
        local K = string.gsub(J, "[%[%]]", "")
        local L = string.gsub(K, "%d+", "")
        local M = string.gsub(L, "%s+", "")
        P.Name = M
        P.Parent = workspace.EnemySpawns
        P.Anchored = true
    end
end
for y, z in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    if z:IsA("Model") and z:FindFirstChild("HumanoidRootPart") then
        local P = z.HumanoidRootPart:Clone()
        local J = string.gsub(z.Name, "Lv. ", "")
        local K = string.gsub(J, "[%[%]]", "")
        local L = string.gsub(K, "%d+", "")
        local M = string.gsub(L, "%s+", "")
        P.Name = M
        P.Parent = workspace.EnemySpawns
        P.Anchored = true
    end
end
for y, z in pairs(game.ReplicatedStorage:GetChildren()) do
    if z:IsA("Model") and z:FindFirstChild("HumanoidRootPart") then
        local P = z.HumanoidRootPart:Clone()
        local J = string.gsub(z.Name, "Lv. ", "")
        local K = string.gsub(J, "[%[%]]", "")
        local L = string.gsub(K, "%d+", "")
        local M = string.gsub(L, "%s+", "")
        P.Name = M
        P.Parent = workspace.EnemySpawns
        P.Anchored = true
    end
end
local function Q()
    local R = game:GetService("Players").LocalPlayer.Data.Level.Value
    if R >= 1 and R <= 9 then
        if tostring(game.Players.LocalPlayer.Team) == "Marines" then
            MobName = "Trainee"
            QuestName = "MarineQuest"
            QuestLevel = 1
            Mon = "Trainee"
            NPCPosition = CFrame.new(-2709.67944, 24.5206585, 2104.24585, -0.744724929, -3.97967455e-08, -0.667371571, 4.32403588e-08, 1, -1.07884304e-07, 0.667371571, -1.09201515e-07, -0.744724929)
        elseif tostring(game.Players.LocalPlayer.Team) == "Pirates" then
            MobName = "Bandit"
            Mon = "Bandit"
            QuestName = "BanditQuest1"
            QuestLevel = 1
            NPCPosition = CFrame.new(1059.99731, 16.9222069, 1549.28162, -0.95466274, 7.29721794e-09, 0.297689587, 1.05190106e-08, 1, 9.22064114e-09, -0.297689587, 1.19340022e-08, -0.95466274)
        end
        return {
            [1] = QuestLevel,
            [2] = NPCPosition,
            [3] = MobName,
            [4] = QuestName,
            [5] = LevelRequire,
            [6] = Mon,
            [7] = MobCFrame
        }
    end
    if R >= 210 and R <= 249 then
        MobName = "Dangerous Prisoner"
        QuestName = "PrisonerQuest"
        QuestLevel = 2
        Mon = "Dangerous Prisoner"
        NPCPosition = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
        local S = {}
        local J = string.gsub(MobName, "Lv. ", "")
        local K = string.gsub(J, "[%[%]]", "")
        local L = string.gsub(K, "%d+", "")
        local M = string.gsub(L, "%s+", "")
        for y, z in pairs(game.workspace.EnemySpawns:GetChildren()) do
            if z.Name == M then
                table.insert(S, z.CFrame)
            end
            MobCFrame = S
        end
        return {
            [1] = QuestLevel,
            [2] = NPCPosition,
            [3] = MobName,
            [4] = QuestName,
            [5] = LevelRequire,
            [6] = Mon,
            [7] = MobCFrame
        }
    end
    local T = require(game:GetService("ReplicatedStorage").GuideModule)
    local U = require(game:GetService("ReplicatedStorage").Quests)
    for y, z in pairs(T["Data"]["NPCList"]) do
        for V, W in pairs(z["Levels"]) do
            if R >= W then
                if not LevelRequire then
                    LevelRequire = 0
                end
                if W > LevelRequire then
                    NPCPosition = y["CFrame"]
                    QuestLevel = V
                    LevelRequire = W
                end
                if #z["Levels"] == 3 and QuestLevel == 3 then
                    NPCPosition = y["CFrame"]
                    QuestLevel = 2
                    LevelRequire = z["Levels"][2]
                end
            end
        end
    end
    if R >= 375 and R <= 399 then
        if _G.Settings.AutoFarm and (NPCPosition.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
        end
    end
    if R >= 400 and R <= 449 then
        if _G.Settings.AutoFarm and (NPCPosition.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
        end
    end
    for y, z in pairs(U) do
        for V, W in pairs(z) do
            if W["LevelReq"] == LevelRequire and y ~= "CitizenQuest" then
                QuestName = y
                for X, Y in pairs(W["Task"]) do
                    MobName = X
                    Mon = string.split(X, " [Lv. " .. W["LevelReq"] .. "]")[1]
                end
            end
        end
    end
    if QuestName == "MarineQuest2" then
        QuestName = "MarineQuest2"
        QuestLevel = 1
        MobName = "Chief Petty Officer"
        Mon = "Chief Petty Officer"
        LevelRequire = 120
    elseif QuestName == "ImpelQuest" then
        QuestName = "PrisonerQuest"
        QuestLevel = 2
        MobName = "Dangerous Prisoner"
        Mon = "Dangerous Prisoner"
        LevelRequire = 210
        NPCPosition = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, -0.999846935, 0, 0.0175017118)
    elseif QuestName == "SkyExp1Quest" then
        if QuestLevel == 1 then
            NPCPosition = CFrame.new(-4721.88867, 843.874695, -1949.96643, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859)
        elseif QuestLevel == 2 then
            NPCPosition = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
        end
    elseif QuestName == "Area2Quest" and QuestLevel == 2 then
        QuestName = "Area2Quest"
        QuestLevel = 1
        MobName = "Swan Pirate"
        Mon = "Swan Pirate"
        LevelRequire = 775
    end
    MobName = MobName:sub(1, #MobName)
    if not MobName:find("Lv") then
        for y, z in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            MonLV = string.match(z.Name, "%d+")
            if z.Name:find(MobName) and #z.Name > #MobName and tonumber(MonLV) <= R + 50 then
                MobName = z.Name
            end
        end
    end
    if not MobName:find("Lv") then
        for y, z in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
            MonLV = string.match(z.Name, "%d+")
            if z.Name:find(MobName) and #z.Name > #MobName and tonumber(MonLV) <= R + 50 then
                MobName = z.Name
                Mon = a
            end
        end
    end
    local S = {}
    local J = string.gsub(MobName, "Lv. ", "")
    local K = string.gsub(J, "[%[%]]", "")
    local L = string.gsub(K, "%d+", "")
    local M = string.gsub(L, "%s+", "")
    for y, z in pairs(game.workspace.EnemySpawns:GetChildren()) do
        if z.Name == M then
            table.insert(S, z.CFrame)
        else
            table.insert(S, nil)
        end
        MobCFrame = S
    end
    return {
        [1] = QuestLevel,
        [2] = NPCPosition,
        [3] = MobName,
        [4] = QuestName,
        [5] = LevelRequire,
        [6] = Mon,
        [7] = MobCFrame,
        [8] = MonQ,
        [9] = MobCFrameNuber
    }
end

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
