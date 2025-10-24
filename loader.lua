--// Services
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

--// Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LoadingNotification"
screenGui.Parent = PlayerGui

--// Create Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 80)
frame.Position = UDim2.new(0.5, -150, 0.85, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 0.2
frame.Parent = screenGui
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.ClipsDescendants = true
frame.Visible = true

--// Rounded corners
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = frame

--// Text Label
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "🔄 Script loading... please be patient."
textLabel.Font = Enum.Font.GothamBold
textLabel.TextSize = 18
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.Parent = frame

--// Tween fade in
local TweenService = game:GetService("TweenService")
TweenService:Create(frame, TweenInfo.new(0.5), {BackgroundTransparency = 0.2}):Play()

--// Wait 10 seconds
task.wait(10)

--// Tween fade out
TweenService:Create(frame, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
TweenService:Create(textLabel, TweenInfo.new(0.5), {TextTransparency = 1}):Play()

task.wait(0.6)
screenGui:Destroy()

loadstring(game:HttpGet("https://api.junkie-development.de/api/v1/luascripts/public/3a75bd38ce65c7bb5558d979605a605d33c6ee3e11938d26b70ce98e474ff02b/download"))()
