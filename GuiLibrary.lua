local notifications = {}
local anim = {}

anim["update"] = function(Target, Time, ShowTime)
	game:GetService("TweenService"):Create(Target, TweenInfo.new(Time, Enum.EasingStyle.Exponential), {Position = UDim2.new(0.021, 0,0.467, 0)}):Play()
	wait(ShowTime)
	game:GetService("TweenService"):Create(Target, TweenInfo.new(Time, Enum.EasingStyle.Exponential), {Position = UDim2.new(-0.521, 0,0.467, 0)}):Play()
	wait(2)
	Target:Destroy()
end

notifications["render"] = function(Description, Duration)
	local Notification = Instance.new("ScreenGui")
	local NotificationRenderer = Instance.new("Frame")
	local Notification_2 = Instance.new("Frame")
	local NotificationTypeInfo = Instance.new("ImageLabel")
	local NTIAspect = Instance.new("UIAspectRatioConstraint")
	local NotificationCorner = Instance.new("UICorner")
	local NotificationDescription = Instance.new("TextLabel")
	local NotificationDescriptionPadding = Instance.new("UIPadding")
	local NotificationLayout = Instance.new("UIListLayout")
	local NotificationPadding = Instance.new("UIPadding")
	local duration = Duration or 3
	local showing = false
	local count = 0

	Notification.Name = "Notification"
	Notification.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	Notification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	NotificationRenderer.Name = "NotificationRenderer"
	NotificationRenderer.Parent = Notification
	NotificationRenderer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NotificationRenderer.BackgroundTransparency = 1.000
	NotificationRenderer.Position = UDim2.new(-0, 0, 0.923, 0)
	NotificationRenderer.Size = UDim2.new(0, 430, 0, 60)

	Notification_2.Name = "Notification"
	Notification_2.Parent = NotificationRenderer
	Notification_2.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
	Notification_2.BorderSizePixel = 0
	Notification_2.Position = UDim2.new(-0.521, 0,0.467, 0)
	Notification_2.Size = UDim2.new(0, 130, 0, 20)

	NotificationTypeInfo.Name = "NotificationTypeInfo"
	NotificationTypeInfo.Parent = Notification_2
	NotificationTypeInfo.AnchorPoint = Vector2.new(0.5, 0.5)
	NotificationTypeInfo.BackgroundTransparency = 1.000
	NotificationTypeInfo.BorderSizePixel = 0
	NotificationTypeInfo.Position = UDim2.new(0.920000017, 0, 0.5, 0)
	NotificationTypeInfo.Size = UDim2.new(0, 18, 0, 20)
	NotificationTypeInfo.Image = "http://www.roblox.com/asset/?id=6026568210"

	NTIAspect.Name = "NTIAspect"
	NTIAspect.Parent = NotificationTypeInfo

	NotificationCorner.CornerRadius = UDim.new(0, 6)
	NotificationCorner.Name = "NotificationCorner"
	NotificationCorner.Parent = Notification_2

	NotificationDescription.Name = "NotificationDescription"
	NotificationDescription.Parent = Notification_2
	NotificationDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NotificationDescription.BackgroundTransparency = 1.000
	NotificationDescription.Position = UDim2.new(0, 0, 0.0250000004, 0)
	NotificationDescription.Size = UDim2.new(0, 124, 0, 19)
	NotificationDescription.Font = Enum.Font.RobotoMono
	NotificationDescription.LineHeight = 1.120
	NotificationDescription.Text = Description
	NotificationDescription.TextColor3 = Color3.fromRGB(255, 255, 255)
	NotificationDescription.TextSize = 14.000
	NotificationDescription.TextXAlignment = Enum.TextXAlignment.Left

	NotificationDescriptionPadding.Name = "NotificationDescriptionPadding"
	NotificationDescriptionPadding.Parent = NotificationDescription
	NotificationDescriptionPadding.PaddingLeft = UDim.new(0, 5)

	NotificationLayout.Name = "NotificationLayout"
	NotificationLayout.Parent = Notification_2
	NotificationLayout.FillDirection = Enum.FillDirection.Horizontal
	NotificationLayout.VerticalAlignment = Enum.VerticalAlignment.Center

	NotificationPadding.Name = "NotificationPadding"
	NotificationPadding.Parent = Notification_2
	NotificationPadding.PaddingRight = UDim.new(0, 2)

	count = count + 1

	local function update()
		anim.update(Notification_2, 1, 2)
	end

	update()
end
local library = {
	["notification"] = notifications,
	["modules"] = {},
	["panels"] = {}
}
local mouse = {}
local value = {}
local roblox = {
	["thePlayer"] = game:GetService("Players").LocalPlayer
}
local utils = {
	["input"] = game:GetService("UserInputService"),
	["anim"] = game:GetService("TweenService"),
	["player"] = game:GetService("Players").LocalPlayer,
	["players"] = game:GetService("Players"),
	["runService"] = game:GetService("RunService")
}

utils["eventUpdate"] = function(Method)
	local meth = Method or function() end
	utils.runService.Heartbeat:Connect(function()
		task.wait(.5)
		pcall(meth)
	end)
end

mouse["mouseClicked"] = function(Target, Button, Method)
	local method = Method or function() end
	local entered = false
	Target.MouseEnter:Connect(function() entered = true end)
	Target.MouseLeave:Connect(function() entered = false end)
	utils.input.InputBegan:Connect(function(code)
		if Button == 0 then
			if code.UserInputType == Enum.UserInputType.MouseButton1 then
				if entered == true then
					pcall(method)
				end
			end
		end
	end)
	utils.input.InputBegan:Connect(function(code)
		if Button == 1 then
			if code.UserInputType == Enum.UserInputType.MouseButton2 then
				if entered == true then
					pcall(method)
				end
			end
		end
	end)
end

mouse["mouseEnter"] = function(Target, Method)
	local method = Method or function() end
	Target.MouseEnter:Connect(function() pcall(method) end)
end

mouse["mouseLeave"] = function(Target, Method)
	local method = Method or function() end
	Target.MouseLeave:Connect(function() pcall(method) end)
end

mouse["mouseDown"] = function(Target, Method)
	local method = Method or function() end
	local entered = false
	Target.MouseEnter:Connect(function() entered = true end)
	Target.MouseLeave:Connect(function() entered = false end)
	utils.input.InputBegan:Connect(function(code)
		if code.UserInputType == Enum.UserInputType.MouseButton1 then
			if entered == true and utils.input:IsKeyDown(code.KeyCode) then
				pcall(method)
			end
		end
	end)
end

library["init"] = function()
	local InternalGui = Instance.new("ScreenGui")
	InternalGui.Name = "InternalGui"
	InternalGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	InternalGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	local gui = {}

	gui["drawPanel"] = function(Name)
		local Panel = Instance.new("Frame")
		local PanelTitle = Instance.new("TextLabel")
		local PanelTitlePadding = Instance.new("UIPadding")
		local PaneLayout = Instance.new("UIListLayout")
		local x = 180
		local offset = 0
		local open = true
		local dragging = false
		local height = 30
		
		Panel.Position = UDim2.new(0, 40, 0, 40)
		
		for index, item in next, library.panels do
			Panel.Position = UDim2.new(0, 40 + (x * index) + 5, 0, 40)
		end
		
		Panel.Name = Name.."Panel"
		Panel.Parent = InternalGui
		Panel.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
		Panel.BorderSizePixel = 0
		Panel.Size = UDim2.new(0, 180, 0, height)
		Panel.Active = true
		Panel.Draggable = true

		PanelTitle.Name = "PanelTitle"
		PanelTitle.Parent = Panel
		PanelTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		PanelTitle.BackgroundTransparency = 1.000
		PanelTitle.Size = UDim2.new(0, 171, 0, 30)
		PanelTitle.Font = Enum.Font.RobotoMono
		PanelTitle.Text = Name
		PanelTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
		PanelTitle.TextSize = 17.000
		PanelTitle.TextWrapped = true
		PanelTitle.TextXAlignment = Enum.TextXAlignment.Left

		PanelTitlePadding.Name = "PanelTitlePadding"
		PanelTitlePadding.Parent = PanelTitle
		PanelTitlePadding.PaddingLeft = UDim.new(0, 10)

		PaneLayout.Name = "PaneLayout"
		PaneLayout.Parent = Panel
		PaneLayout.SortOrder = Enum.SortOrder.LayoutOrder

		offset = offset + 1
		
		table.insert(library.panels, Name)

		local module = {}

		module["addModule"] = function(Name, onEnabled, onDisabled)
			local Module = Instance.new("Frame")
			local ModuleLabel = Instance.new("TextLabel")
			local ModuleLabelPadding = Instance.new("UIPadding")
			local ModuleLayout = Instance.new("UIListLayout")
			local offset = 25
			local enabled = false
			local open = false
			local module = {
				["Name"] = Name,
				["Enabled"] = enabled,
				["Settings"] = {

				}
			}

			Module.Name = "Module"
			Module.Parent = Panel
			Module.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
			Module.BorderSizePixel = 0
			Module.ClipsDescendants = true
			Module.Position = UDim2.new(0, 0, 0.138888896, 0)
			Module.Size = UDim2.new(0, 180, 0, offset)

			ModuleLabel.Name = "ModuleLabel"
			ModuleLabel.Parent = Module
			ModuleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ModuleLabel.BackgroundTransparency = 1.000
			ModuleLabel.Size = UDim2.new(0, 171, 0, 25)
			ModuleLabel.Font = Enum.Font.RobotoMono
			ModuleLabel.Text = Name
			ModuleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			ModuleLabel.TextSize = 15.000
			ModuleLabel.TextWrapped = true
			ModuleLabel.TextXAlignment = Enum.TextXAlignment.Left

			ModuleLabelPadding.Name = "ModuleLabelPadding"
			ModuleLabelPadding.Parent = ModuleLabel
			ModuleLabelPadding.PaddingLeft = UDim.new(0, 10)

			ModuleLayout.Name = "ModuleLayout"
			ModuleLayout.Parent = Module
			ModuleLayout.SortOrder = Enum.SortOrder.LayoutOrder

			mouse.mouseClicked(ModuleLabel, 1, function()
				open = not open

				if (open) then
					utils.anim:Create(Module, TweenInfo.new(.25, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 180, 0, offset)}):Play()
				else
					utils.anim:Create(Module, TweenInfo.new(.25, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 180, 0, 25)}):Play()
				end
			end)

			mouse.mouseClicked(ModuleLabel, 0, function()
				enabled = not enabled

				if (enabled) then
					pcall(onEnabled)
					library.notification.render("Enabled " .. Name, 1)
				else
					pcall(onDisabled)
					library.notification.render("Disabled " .. Name, 1)
				end
			end)

			local newHeight = 25

			height = height + newHeight

			table.insert(library.modules, module)

			local value = {}

			value["newBoolean"] = function(Name, State)
				local BooleanSetting = Instance.new("Frame")
				local BooleanSettingLayout = Instance.new("UIListLayout")
				local BooleanSettingPadding = Instance.new("UIPadding")
				local BooleanBox = Instance.new("Frame")
				local BooleanBoxAspect = Instance.new("UIAspectRatioConstraint")
				local BooleanLabel = Instance.new("TextLabel")
				local enabled = State or false
				local booleanSetting = {
					["Name"] = Name,
					["Enabled"] = enabled
				}

				BooleanSetting.Name = "BooleanSetting"
				BooleanSetting.Parent = Module
				BooleanSetting.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
				BooleanSetting.BorderSizePixel = 0
				BooleanSetting.Size = UDim2.new(0, 180, 0, 25)

				BooleanSettingLayout.Name = "BooleanSettingLayout"
				BooleanSettingLayout.Parent = BooleanSetting
				BooleanSettingLayout.FillDirection = Enum.FillDirection.Horizontal
				BooleanSettingLayout.SortOrder = Enum.SortOrder.LayoutOrder
				BooleanSettingLayout.VerticalAlignment = Enum.VerticalAlignment.Center
				BooleanSettingLayout.Padding = UDim.new(0, 7)

				BooleanSettingPadding.Name = "BooleanSettingPadding"
				BooleanSettingPadding.Parent = BooleanSetting
				BooleanSettingPadding.PaddingLeft = UDim.new(0, 10)

				BooleanBox.Name = "BooleanBox"
				BooleanBox.Parent = BooleanSetting
				BooleanBox.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
				BooleanBox.BorderSizePixel = 0
				BooleanBox.Size = UDim2.new(0, 15, 0, 25)

				BooleanBoxAspect.Name = "BooleanBoxAspect"
				BooleanBoxAspect.Parent = BooleanBox

				BooleanLabel.Name = "BooleanLabel"
				BooleanLabel.Parent = BooleanSetting
				BooleanLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				BooleanLabel.BackgroundTransparency = 1.000
				BooleanLabel.Position = UDim2.new(0.129411772, 0, 0.100000001, 0)
				BooleanLabel.Size = UDim2.new(0, 139, 0, 20)
				BooleanLabel.Font = Enum.Font.RobotoMono
				BooleanLabel.LineHeight = 1.120
				BooleanLabel.Text = Name
				BooleanLabel.TextColor3 = Color3.fromRGB(222, 222, 222)
				BooleanLabel.TextSize = 14.000
				BooleanLabel.TextWrapped = true
				BooleanLabel.TextXAlignment = Enum.TextXAlignment.Left

				if enabled then
					utils.anim:Create(BooleanBox, TweenInfo.new(.25, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 170, 255)}):Play()
				else
					utils.anim:Create(BooleanBox, TweenInfo.new(.25, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(47, 47, 47)}):Play()
				end

				mouse.mouseEnter(BooleanLabel, function()
					utils.anim:Create(BooleanLabel, TweenInfo.new(.25, Enum.EasingStyle.Exponential), {TextColor3 = Color3.fromRGB(85, 170, 255)}):Play()
				end)

				mouse.mouseLeave(BooleanLabel, function()
					utils.anim:Create(BooleanLabel, TweenInfo.new(.25, Enum.EasingStyle.Exponential), {TextColor3 = Color3.fromRGB(222, 222, 222)}):Play()
				end)

				mouse.mouseClicked(BooleanSetting, 0, function()
					enabled = not enabled
					if enabled then
						utils.anim:Create(BooleanBox, TweenInfo.new(.25, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 170, 255)}):Play()
					else
						utils.anim:Create(BooleanBox, TweenInfo.new(.25, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(47, 47, 47)}):Play()
					end
				end)

				offset = offset + 25

				table.insert(module.Settings, booleanSetting)

				local getters = {}

				getters["isEnabled"] = function ()
					return enabled
				end

				return getters
			end

			value["newMode"] = function(Name, Modes)
				local ModeSetting = Instance.new("Frame")
				local ModeLabel = Instance.new("TextLabel")
				local ModeSettingLayout = Instance.new("UIListLayout")
				local open = false
				local startSize = 25
				local size = 25
				local mode = Modes[0]
				local modeSetting = {
					["Name"] = Name,
					["Mode"] = mode,
					["Modes"] = Modes
				}

				ModeSetting.Name = "ModeSetting"
				ModeSetting.Parent = Module
				ModeSetting.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
				ModeSetting.BorderSizePixel = 0
				ModeSetting.Position = UDim2.new(0, 0, 0.310559005, 0)
				ModeSetting.Size = UDim2.new(0, 180, 0, size)
				ModeSetting.ClipsDescendants = true

				ModeLabel.Name = "ModeLabel"
				ModeLabel.Parent = ModeSetting
				ModeLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ModeLabel.BackgroundTransparency = 1.000
				ModeLabel.Size = UDim2.new(0, 180, 0, 25)
				ModeLabel.Font = Enum.Font.RobotoMono
				ModeLabel.LineHeight = 1.120
				ModeLabel.Text = "Mode"
				ModeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				ModeLabel.TextSize = 14.000

				ModeSettingLayout.Name = "ModeSettingLayout"
				ModeSettingLayout.Parent = ModeSetting
				ModeSettingLayout.SortOrder = Enum.SortOrder.LayoutOrder

				mouse.mouseClicked(ModeLabel, 0, function()
					open = not open
					if open then
						utils.anim:Create(ModeSetting, TweenInfo.new(.25), {Size = UDim2.new(0, 180, 0, size)}):Play()
						utils.anim:Create(Module, TweenInfo.new(.25), {Size = UDim2.new(0, 180, 0, offset + size - 25)}):Play()
					else
						utils.anim:Create(ModeSetting, TweenInfo.new(.25), {Size = UDim2.new(0, 180, 0, 25)}):Play()
						utils.anim:Create(Module, TweenInfo.new(.25), {Size = UDim2.new(0, 180, 0, offset)}):Play()	
					end
				end)

				for index, item in next, Modes do
					local Mode = Instance.new("TextLabel")
					Mode.Name = "Mode"
					Mode.Parent = ModeSetting
					Mode.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
					Mode.BackgroundTransparency = 0
					Mode.BorderSizePixel = 0
					Mode.Size = UDim2.new(0, 180, 0, 25)
					Mode.Font = Enum.Font.RobotoMono
					Mode.LineHeight = 1.120
					Mode.Text = item
					Mode.TextColor3 = Color3.fromRGB(222, 222, 222)
					Mode.TextSize = 14.000
					Mode.Active = true

					mouse.mouseClicked(Mode, 0, function()
						ModeLabel.Text = item
						mode = item
					end)

					mouse.mouseEnter(Mode, function()
						utils.anim:Create(Mode, TweenInfo.new(.25), {TextColor3 = Color3.fromRGB(85, 170, 255)}):Play()
					end)

					mouse.mouseLeave(Mode, function()
						utils.anim:Create(Mode, TweenInfo.new(.25), {TextColor3 = Color3.fromRGB(222, 222, 222)}):Play()
					end)

					size = size + 25
				end

				offset = offset + startSize

				table.insert(module.Settings, modeSetting)

				local getters = {}

				getters["getMode"] = function()
					return mode
				end

				return getters
			end
			return value
		end
		return module
	end
	return gui
end

return library
