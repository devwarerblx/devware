--// Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

--// ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LoadingNotification"
screenGui.Parent = PlayerGui
screenGui.IgnoreGuiInset = true

--// Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 80)
frame.Position = UDim2.new(1, -320, 1, -100) -- bottom right
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 0.2
frame.AnchorPoint = Vector2.new(0, 0)
frame.Parent = screenGui

--// Rounded corners
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = frame

--// Label
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 1, 0)
label.BackgroundTransparency = 1
label.Text = "Script loading... please be patient."
label.Font = Enum.Font.GothamBold
label.TextSize = 18
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.Parent = frame

--// Slide in from off-screen
frame.Position = UDim2.new(1, 20, 1, -100)
TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
	Position = UDim2.new(1, -320, 1, -100)
}):Play()

--// Stay visible for 10 seconds
task.wait(25)

--// Fade and slide out
TweenService:Create(frame, TweenInfo.new(0.5), {
	BackgroundTransparency = 1,
	Position = UDim2.new(1, 20, 1, -100)
}):Play()
TweenService:Create(label, TweenInfo.new(0.5), {TextTransparency = 1}):Play()

task.wait(0.6)
screenGui:Destroy()


loadstring(game:HttpGet("https://api.junkie-development.de/api/v1/luascripts/public/3a75bd38ce65c7bb5558d979605a605d33c6ee3e11938d26b70ce98e474ff02b/download"))()
