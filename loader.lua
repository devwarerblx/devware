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
