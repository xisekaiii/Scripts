function Tween(xx)
	if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health <= 0 or not game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") then 
        tween:Cancel() 
        repeat task.wait() until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") and game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 wait(7) return 
    end
	if (game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - xx.Position).Magnitude <= 150 then
		pcall(function()
			tween:Cancel()

			game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.CFrame = xx

			return
		end)
	end

	local tween_s = game:service("TweenService")
	local info = TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - xx.Position).Magnitude/300,Enum.EasingStyle.Linear)
	tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"],info,{CFrame = xx})
	tween:Play()

	local tweenfunc = {}

	function tweenfunc:Stop()
		tween:Cancel()
	end

	return tweenfunc
end

task.spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        pcall(function()
            if _G.Settings.AutoFarm then
                 if syn then
                    setfflag("HumanoidParallelRemoveNoPhysics","false")
                    setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2","false")
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                    if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                    end
                else
                    if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1") then
                            if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
                                game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                            end
                            local BodyVelocity = Instance.new("BodyVelocity")
                            BodyVelocity.Name = "BodyVelocity1"
                            BodyVelocity.Parent =  game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                            BodyVelocity.MaxForce = Vector3.new(10000,10000,10000)
                            BodyVelocity.Velocity = Vector3.new(0,0,0)
                        end
                    end
                    for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false
                        end
                    end
                end
            else
                if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1"):Destroy()
                end
            end
        end)
    end)
end)

local v21 = game.Players.LocalPlayer;
function FindEnemiesInRange(v223, v224)
    local v225 = (v21.Character or v21.CharacterAdded:Wait()):GetPivot().Position;
    local v226 = nil;
    for v471, v472 in ipairs(v224) do
        if (not v472:GetAttribute("IsBoat") and v472:FindFirstChildOfClass("Humanoid") and (v472.Humanoid.Health > 0)) then
            local v671 = v472:FindFirstChild("Head");
            if (v671 and ((v225 - v671.Position).Magnitude <= 60)) then
                if (v472 ~= v21.Character) then
                    table.insert(v223, {
                        v472,
                        v671
                    });
                    v226 = v671;
                end
            end
        end
    end
    for v473, v474 in ipairs(game.Players:GetPlayers()) do
        if (v474.Character and (v474 ~= v21)) then
            local v672 = v474.Character:FindFirstChild("Head");
            if (v672 and ((v225 - v672.Position).Magnitude <= 60)) then
                table.insert(v223, {
                    v474.Character,
                    v672
                });
                v226 = v672;
            end
        end
    end
    return v226;
end

function GetEquippedTool()
    local v227 = v21.Character;
    if not v227 then
        return nil;
    end
    for v475, v476 in ipairs(v227:GetChildren()) do
        if v476:IsA("Tool") then
            return v476;
        end
    end
    return nil;
end

function AttackNoCoolDown()
    local v228 = {};
    local v229 = game:GetService("Workspace").Enemies:GetChildren();
    local v230 = FindEnemiesInRange(v228, v229);
    if not v230 then
        return;
    end
    local v231 = GetEquippedTool();
    if not v231 then
        return;
    end
    pcall(function()
        local v477 = game:GetService("ReplicatedStorage");
        local v478 = v477:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack");
        local v479 = v477:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit");
        if (# v228 > 0) then
            v478:FireServer(1e-9);
            v479:FireServer(v230, v228);
        else
            task.wait(1e-9);
        end
    end);
end

spawn(function()
    while wait() do
        if _G.Settings.FastAttack then
            AttackNoCoolDown()
        end
    end
end)

if game.PlaceId == 2753915549 then
        Sea1 = true
    elseif game.PlaceId == 4442272183 then
        Sea2 = true
    elseif game.PlaceId == 7449423635 then
        Sea3 = true
end

local dK = 1

spawn(function()
	game:GetService("RunService").Heartbeat:Connect(function()
		pcall(function()
			if _G.Settings.BringMob then
				for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
					if _G.Settings.AutoFarm and v.Name == Mon and (v.HumanoidRootPart.Position - PosMon.Position).magnitude <= 200 then
						v.HumanoidRootPart.CFrame = PosMon
						v.HumanoidRootPart.CanCollide = false
						v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
						sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
					end
				end
			end
		end)
	end)
end)

task.spawn(function()
	while task.wait() do
		pcall(function()
			if _G.Settings.BringMob then
				for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
					if not string.find(v.Name, "Boss") and (v.HumanoidRootPart.Position - PosMon.Position).magnitude <= 300 then
						v.HumanoidRootPart.CFrame = PosMon
						v.Humanoid.JumpPower = 0
						v.Humanoid.WalkSpeed = 0
						v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
						v.HumanoidRootPart.Transparency = 1
						v.HumanoidRootPart.CanCollide = false
						v.Head.CanCollide = false
						v.Humanoid:ChangeState(11)
						v.Humanoid:ChangeState(14)
						sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
					end
				end
			end
		end)
	end
end)


game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

spawn(function()
    while task.wait() do
        for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"]:GetChildren()) do
            pcall(function()
                if v.Name == ("CurvedRing") or v.Name == ("SlashHit") or v.Name == ("SwordSlash") or v.Name == ("SlashTail") or v.Name == ("Sounds") then
                    v:Destroy()
                end
            end)
        end
    end
end)

function EquipWeapon(zz)
	pcall(function()
		if game.Players.LocalPlayer.Backpack:FindFirstChild(zz) then
			local vv = game.Players.LocalPlayer.Backpack:FindFirstChild(zz)
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(vv)
		end
	end)
end;

spawn(function()
    while task.wait() do
        pcall(function()
            for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                if v:IsA("Tool") then
                    if v.ToolTip == _G.Settings.SelectWeapon then
                        _G.SelectWeapon = v.Name
                    end
                end
            end
        end)
    end
end)

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

task.spawn(function()
	while task.wait() do
		pcall(function()
			if _G.Settings.AutoHaki then
				if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
				end
			end
		end)
	end
end)
