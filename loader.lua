--// Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

--// ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ScriptLoadingUI"
screenGui.Parent = PlayerGui
screenGui.IgnoreGuiInset = true

--// Frame (container)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 80)
frame.Position = UDim2.new(1, -320, 1, -100) -- bottom-right
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 0.1
frame.Parent = screenGui

--// Rounded corners
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = frame

--// Title Label
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0.7, 0)
label.BackgroundTransparency = 1
label.Text = "🔄 Script Loading..."
label.Font = Enum.Font.GothamBold
label.TextSize = 20
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.Parent = frame

--// Progress Bar Background
local progressBg = Instance.new("Frame")
progressBg.Size = UDim2.new(0.9, 0, 0.15, 0)
progressBg.Position = UDim2.new(0.05, 0, 0.75, 0)
progressBg.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
progressBg.BorderSizePixel = 0
progressBg.Parent = frame

local progressCorner = Instance.new("UICorner")
progressCorner.CornerRadius = UDim.new(0, 8)
progressCorner.Parent = progressBg

--// Progress Bar Fill
local progressFill = Instance.new("Frame")
progressFill.Size = UDim2.new(0, 0, 1, 0)
progressFill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
progressFill.BorderSizePixel = 0
progressFill.Parent = progressBg

local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(0, 8)
fillCorner.Parent = progressFill

--// Slide In Animation
frame.Position = UDim2.new(1, 20, 1, -100)
TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
	Position = UDim2.new(1, -320, 1, -100)
}):Play()

--// Progress Bar Fill Over 20 Seconds
TweenService:Create(progressFill, TweenInfo.new(20, Enum.EasingStyle.Linear), {
	Size = UDim2.new(1, 0, 1, 0)
}):Play()

--// Wait for 20 seconds
task.wait(45)

--// Fade Out and Slide Away
TweenService:Create(frame, TweenInfo.new(0.6), {
	BackgroundTransparency = 1,
	Position = UDim2.new(1, 20, 1, -100)
}):Play()
TweenService:Create(label, TweenInfo.new(0.6), {TextTransparency = 1}):Play()
TweenService:Create(progressFill, TweenInfo.new(0.6), {BackgroundTransparency = 1}):Play()
TweenService:Create(progressBg, TweenInfo.new(0.6), {BackgroundTransparency = 1}):Play()

task.wait(0.7)
screenGui:Destroy()


loadstring(game:HttpGet("https://api.junkie-development.de/api/v1/luascripts/public/3a75bd38ce65c7bb5558d979605a605d33c6ee3e11938d26b70ce98e474ff02b/download"))()
