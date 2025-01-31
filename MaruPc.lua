local Globals_Environment = getgenv()
Globals_Environment["key"] = "WeAreRabbit";
Globals_Environment["id"] = "WeAreRabbit";

repeat task.wait() until game:IsLoaded();
repeat task.wait() until game.Players;
repeat task.wait() until game.Players.LocalPlayer;
repeat task.wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui");
repeat task.wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main");

-- Config : https://raw.githubusercontent.com/WeAreRabbit/Backups/main/MaruHub/configPC.lua

-- game:HttpGet Handler
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\87\101\65\114\101\82\97\98\98\105\116\47\66\97\99\107\117\112\115\47\109\97\105\110\47\77\97\114\117\72\117\98\47\72\116\116\112\72\97\110\100\108\101\114\46\108\117\97", true))();
-- Loader
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\87\101\65\114\101\82\97\98\98\105\116\47\66\97\99\107\117\112\115\47\109\97\105\110\47\77\97\114\117\72\117\98\47\69\120\116\101\110\116\105\111\110\115\46\108\117\97", true))();
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\87\101\65\114\101\82\97\98\98\105\116\47\66\97\99\107\117\112\115\47\109\97\105\110\47\77\97\114\117\72\117\98\47\76\111\97\100\101\114\46\108\117\97", true))();
