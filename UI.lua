local InputService = game:GetService('UserInputService');
local TextService = game:GetService('TextService');
local TweenService = game:GetService('TweenService');
local CoreGui = game:GetService('CoreGui');
local PlayerUI = game:GetService("Players").LocalPlayer.PlayerGui
local RenderStepped = game:GetService('RunService').RenderStepped;
local LocalPlayer = game:GetService('Players').LocalPlayer;
local Mouse = LocalPlayer:GetMouse();
local UIS = game:GetService("UserInputService")
local Blur =  game:GetService("Lighting"):FindFirstChild("Blur")
local UIToggle = false
local LoadingSucces = false	
if Blur then
	Blur:Destroy() 
end
if CoreGui:FindFirstChild("Script") then
	CoreGui:FindFirstChild("Script"):Destroy()
end

local ProtectGui = protectgui or (syn and syn.protect_gui) or (function() end);

local ScreenGui = Instance.new('ScreenGui');
ProtectGui(ScreenGui);

ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global;
ScreenGui.Parent = CoreGui;
ScreenGui.Name = "Script"

local Toggles = {};
local Options = {};

local Lib = {
	MapPlaceID = "";
}

function Lib:Create(Class, Properties)
	local _Instance = Class;

	if type(Class) == 'string' then
		_Instance = Instance.new(Class);
	end;

	for Property, Value in next, Properties do
		_Instance[Property] = Value;
	end;

	return _Instance;
end;

function Lib:CreateWindow(Prop, Title)

end

function Lib:StartUI()
	local Blur = Instance.new('BlurEffect')
	Blur.Name = "Blur"
	Blur.Parent = game.Lighting
	Blur.Size = 0

	UIToggle = true

	TweenService:Create(
		Blur,
		TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
		{Size = 30}
	):Play()
	UIS.InputBegan:Connect(function(Input)
		if Input.KeyCode == Enum.KeyCode.RightControl and UIToggle == true and LoadingSucces == true then
			UIToggle = false
			TweenService:Create(
				Blur,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
				{Size = 0}
			):Play()
		elseif Input.KeyCode == Enum.KeyCode.RightControl and UIToggle == false and LoadingSucces == true then
			UIToggle = true
			TweenService:Create(
				Blur,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
				{Size = 30}
			):Play()
		end
	end)

	--//Loading_Frame//--

	local Loading_Frame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Title = Instance.new("TextLabel")
	local UIGradient = Instance.new("UIGradient")
	local Loading_Bar = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local UIGradient_2 = Instance.new("UIGradient")
	local Bar = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")
	local UIGradient_3 = Instance.new("UIGradient")
	local UIGradient_4 = Instance.new("UIGradient")
	local Percent = Instance.new("TextLabel")
	local UIGradient_5 = Instance.new("UIGradient")

	Loading_Frame.Name = "Loading_Frame"
	Loading_Frame.Parent = CoreGui:FindFirstChild("Script")
	Loading_Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Loading_Frame.Position = UDim2.new({0.314, 0},{-0.182, 0})--0.339598984, 0, 0.391123444, 0
	Loading_Frame.Size = UDim2.new(0, 592, 0, 157)
	Loading_Frame.Visible = false

	UICorner.CornerRadius = UDim.new(0, 360)
	UICorner.Parent = Loading_Frame

	Title.Name = "Title"
	Title.Parent = Loading_Frame
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0.0861486495, 0, 0.0700636953, 0)
	Title.Size = UDim2.new(0, 480, 0, 48)
	Title.Font = Enum.Font.Gotham
	Title.Text = ""
	Title.TextColor3 = Color3.fromRGB(220, 220, 220)
	Title.TextSize = 25.000

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(226, 226, 226)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(226, 226, 226))}
	UIGradient.Parent = Title

	Loading_Bar.Name = "Loading_Bar"
	Loading_Bar.Parent = Loading_Frame
	Loading_Bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Loading_Bar.Position = UDim2.new(0.0945945978, 0, 0.458598733, 0)
	Loading_Bar.Size = UDim2.new(0, 480, 0, 19)

	UICorner_2.CornerRadius = UDim.new(0, 360)
	UICorner_2.Parent = Loading_Bar

	UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(173, 173, 173)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(173, 173, 173))}
	UIGradient_2.Parent = Loading_Bar

	Bar.Name = "Bar"
	Bar.Parent = Loading_Bar
	Bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Bar.BorderColor3 = Color3.fromRGB(255, 255, 255)
	Bar.Size = UDim2.new(0, 20, 0, 19)

	UICorner_3.CornerRadius = UDim.new(0, 360)
	UICorner_3.Parent = Bar

	UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(18, 225, 18)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(18, 225, 18))}
	UIGradient_3.Parent = Bar

	UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(24, 24, 24)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(24, 24, 24))}
	UIGradient_4.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.25), NumberSequenceKeypoint.new(1.00, 0.25)}
	UIGradient_4.Parent = Loading_Frame

	Percent.Name = "Percent"
	Percent.Parent = Loading_Frame
	Percent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Percent.BackgroundTransparency = 1.000
	Percent.Position = UDim2.new(0.096283786, 0, 0.662420392, 0)
	Percent.Size = UDim2.new(0, 478, 0, 38)
	Percent.Font = Enum.Font.Gotham
	Percent.Text = "0%"
	Percent.TextColor3 = Color3.fromRGB(220, 220, 220)
	Percent.TextSize = 25.000

	UIGradient_5.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(226, 226, 226)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(226, 226, 226))}
	UIGradient_5.Parent = Percent
	--//Loading_Frame//--
	
	Loading_Frame.Visible = true
	wait(0.1)
	Loading_Frame:TweenPosition(UDim2.new(0.339598984, 0, 0.391123444, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 2.5, true)
	
	wait(2.8)

	Title.Text = "Starting UI."
	wait(0.5)
	Title.Text = "Starting UI.."
	wait(0.5)
	Title.Text = "Starting UI..."
	wait(0.5)
	Title.Text = "Starting UI...."

	for i = 1, 100 do
		wait(0.1)
		Percent.Text = i.."%"

		local formula = i/100

		Bar:TweenSize(UDim2.new(formula, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
		if i == 25 then
			Title.Text = "Checking HWID...."
			wait(1.2)
			Title.Text = "Successfully Checking HWID!"
		end
		if i == 50 then
			Title.Text = "Checking Whitelist...."
			wait(1.2)
			Title.Text = "Successfully Checking Whitelist!"
		end
		if i == 75 then
			Title.Text = "Checking Configs...."
			wait(1.2)
			Title.Text = "Successfully Checking Configs!"
		end
		if i == 100 then
			Title.Text = "Succesfully Loaded!"
			LoadingSucces = true
			wait(1.2)
			Loading_Frame:Destroy()
		end
	end
end
