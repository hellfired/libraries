local library = {}

local Library = Instance.new("ScreenGui")

Library.Name = "Library"
Library.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Library.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

function library:CreateWindow(text)
	local BodyYSize = 0
	local Pos = 0.096

	local Top = Instance.new("Frame")
	local Container = Instance.new("Frame")
	local Title = Instance.new("TextLabel")

	local function Resize(value)
		BodyYSize = BodyYSize + value
		Container.Size = UDim2.new(0, 169, 0, BodyYSize)
	end

	local function Reposition(value)
		Pos = Pos + value
		Container.Position = UDim2.new(0.093, 0, Pos, 0)
	end


	Top.Name = "Top"
	Top.Parent = Library
	Top.AnchorPoint = Vector2.new(0.5, 0.5)
	Top.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Top.BorderSizePixel = 1
	Top.Position = UDim2.new(0.0927835107, 0, 0.0478087664, 0)
	Top.Size = UDim2.new(0, 169, 0, 27)

	Container.Name = "Container"
	Container.Parent = Library
	Container.AnchorPoint = Vector2.new(0.5, 0.5)
	Container.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Container.BorderSizePixel = 1
	Container.Position = UDim2.new(0.093, 0, 0.163, 0)
	Container.Size = UDim2.new(0, 169, 0, 0)
	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.Parent = Container
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	Title.Name = "Title"
	Title.Parent = Top
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderSizePixel = 0
	Title.Size = UDim2.new(0, 169, 0, 27)
	Title.Font = Enum.Font.Nunito
	Title.Text = text
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 18.000

	Container.Size = UDim2.new(0, 169, 0, BodyYSize)
	Container.Position = UDim2.new(0.093, 0, Pos, 0)

	local a = {}

	function a:CreateDropdown(text, list, callback)
		Resize(30)
		Reposition(0.033)

		local DropYSize = 0
		local IsDropped = true

		callback = callback or function()end
		list = list or {}
		text = text or "Dropdown"


		local Dropdown = Instance.new("Frame")
		local DropdownToggle = Instance.new("TextButton")
		local DropdownText = Instance.new("TextLabel")
		local DropdownContainer = Instance.new("Frame")

		Dropdown.Name = "Dropdown"
		Dropdown.Parent = Container
		Dropdown.Position = UDim2.new(0, 0, 0.03333333351, 0)
		Dropdown.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		Dropdown.BorderColor3 = Color3.fromRGB(30, 30, 30)
		Dropdown.BorderSizePixel = 1
		Dropdown.Size = UDim2.new(0, 169, 0, 30)

		DropdownContainer.Name = "DropdownContainer"
		DropdownContainer.Parent = Dropdown
		DropdownContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		DropdownContainer.BorderSizePixel = 0
		DropdownContainer.Position = UDim2.new(0, 0, 1.20000005, 0)
		DropdownContainer.Size = UDim2.new(0, 169, 0, DropYSize)
		DropdownContainer.ZIndex = 44
		DropdownContainer.ClipsDescendants = true
		local UIListLayout = Instance.new("UIListLayout")
		UIListLayout.Parent = DropdownContainer
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

		DropdownToggle.Name = "DropdownToggle"
		DropdownToggle.Parent = Dropdown
		DropdownToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		DropdownToggle.BackgroundTransparency = 1.000
		DropdownToggle.BorderSizePixel = 0
		DropdownToggle.Position = UDim2.new(0.810650885, 0, 0, 0)
		DropdownToggle.Size = UDim2.new(0, 31, 0, 30)
		DropdownToggle.Font = Enum.Font.Nunito
		DropdownToggle.Text = "+"
		DropdownToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
		DropdownToggle.TextSize = 20.000
		DropdownToggle.MouseButton1Click:Connect(function()
			if IsDropped then
				IsDropped = false
				DropdownContainer.Size = UDim2.new(0, 169, 0, DropYSize)
				DropdownToggle.Text = "-"
			else
				IsDropped = true
				DropdownContainer.Size = UDim2.new(0, 169, 0, 0)
				DropdownToggle.Text = "+"
			end
		end)

		DropdownText.Name = "DropdownText"
		DropdownText.Parent = Dropdown
		DropdownText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		DropdownText.BackgroundTransparency = 1.000
		DropdownText.BorderSizePixel = 0
		DropdownText.Size = UDim2.new(0, 137, 0, 30)
		DropdownText.Font = Enum.Font.Nunito
		DropdownText.Text = "  "..text
		DropdownText.TextColor3 = Color3.fromRGB(255, 255, 255)
		DropdownText.TextSize = 20.000
		DropdownText.TextXAlignment = Enum.TextXAlignment.Left

		for i,v in next, list do
			local Option = Instance.new("TextButton")

			Option.Name = "Option"
			Option.Parent = DropdownContainer
			Option.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			Option.BorderColor3 = Color3.fromRGB(30, 30, 30)
			Option.BorderSizePixel = 1
			Option.Size = UDim2.new(0, 169, 0, 30)
			Option.Font = Enum.Font.Nunito
			Option.Text = v
			Option.TextColor3 = Color3.fromRGB(255, 255, 255)
			Option.TextSize = 18.000
			DropYSize = DropYSize + 30

			Option.MouseButton1Click:Connect(function()
				DropdownText.Text = "  "..v
				callback(v)
			end)
		end
	end

	function a:CreateSlider(text, minValue, maxValue, callback)
		Resize(49)
		Reposition(0.033)

		text = text or "Slider"
		minValue = minValue or 0
		maxValue = maxValue or 100

		callback = callback or function()end

		local mouse = game.Players.LocalPlayer:GetMouse()
		local uis = game:GetService("UserInputService")
		local Value;

		local Slider = Instance.new("Frame")
		local SliderText = Instance.new("TextLabel")
		local SliderButton = Instance.new("TextButton")
		local Amount = Instance.new("Frame")
		local SliderAmount = Instance.new("TextLabel")

		Slider.Name = "Slider"
		Slider.Parent = Container
		Slider.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		Slider.BorderColor3 = Color3.fromRGB(30, 30, 30)
		Slider.BorderSizePixel = 1
		Slider.Position = UDim2.new(0, 0, 0.222222224, 0)
		Slider.Size = UDim2.new(0, 169, 0, 49)

		SliderText.Name = "SliderText"
		SliderText.Parent = Slider
		SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SliderText.BackgroundTransparency = 1.000
		SliderText.BorderSizePixel = 0
		SliderText.Size = UDim2.new(0, 137, 0, 30)
		SliderText.ZIndex = 2
		SliderText.Font = Enum.Font.Nunito
		SliderText.Text = "  "..text
		SliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
		SliderText.TextSize = 18.000
		SliderText.TextXAlignment = Enum.TextXAlignment.Left

		SliderButton.Name = "SliderButton"
		SliderButton.Parent = Slider
		SliderButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		SliderButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SliderButton.BorderSizePixel = 0
		SliderButton.Position = UDim2.new(0.0410000011, 0, 0.600000024, 0)
		SliderButton.Size = UDim2.new(0, 155, 0, 13)
		SliderButton.Font = Enum.Font.SourceSans
		SliderButton.Text = " "
		SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
		SliderButton.TextSize = 14.000
		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(0, 5)
		UICorner.Parent = SliderButton

		Amount.Name = "Amount"
		Amount.Parent = SliderButton
		Amount.BackgroundColor3 = Color3.fromRGB(255, 52, 55)
		Amount.BorderSizePixel = 0
		Amount.Size = UDim2.new(0, 0, 0, 13)
		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(0, 5)
		UICorner.Parent = Amount

		SliderAmount.Name = "SliderAmount"
		SliderAmount.Parent = Slider
		SliderAmount.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SliderAmount.BackgroundTransparency = 1.000
		SliderAmount.BorderSizePixel = 0
		SliderAmount.Position = UDim2.new(0.810650885, 0, 0, 0)
		SliderAmount.Size = UDim2.new(0, 31, 0, 30)
		SliderAmount.ZIndex = 2
		SliderAmount.Font = Enum.Font.Nunito
		SliderAmount.Text = minValue
		SliderAmount.TextColor3 = Color3.fromRGB(255, 255, 255)
		SliderAmount.TextSize = 18.000

		SliderButton.MouseButton1Down:Connect(function()
			Value = math.floor((((tonumber(maxValue) - tonumber(minValue)) / 155) * Amount.AbsoluteSize.X) + tonumber(minValue)) or 0
			pcall(function()
				callback(Value)
			end)
			Amount.Size = UDim2.new(0, math.clamp(mouse.X - Amount.AbsolutePosition.X, 0, 155), 0, 13)
			moveconnection = mouse.Move:Connect(function()
				SliderAmount.Text = Value
				Value = math.floor((((tonumber(maxValue) - tonumber(minValue)) / 155) * Amount.AbsoluteSize.X) + tonumber(minValue))
				pcall(function()
					callback(Value)
					SliderAmount.Text = Value
				end)
				Amount.Size = UDim2.new(0, math.clamp(mouse.X - Amount.AbsolutePosition.X, 0, 155), 0, 13)
			end)
			releaseconnection = uis.InputEnded:Connect(function(Mouse)
				if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
					Value = math.floor((((tonumber(maxValue) - tonumber(minValue)) / 318) * Amount.AbsoluteSize.X) + tonumber(minValue))
					pcall(function()
						callback(Value)
					end)
					Amount.Size = UDim2.new(0, math.clamp(mouse.X - Amount.AbsolutePosition.X, 0, 155), 0, 13)
					moveconnection:Disconnect()
					releaseconnection:Disconnect()
				end
			end)
		end)
	end

	function a:CreateButton(text, callback)
		Resize(30)
		Reposition(0.033)

		text = text or "Button"
		callback = callback or function()end

		local Button = Instance.new("TextButton")

		Button.Name = "Button"
		Button.Parent = Container
		Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		Button.BorderColor3 = Color3.fromRGB(30, 30, 30)
		Button.BorderSizePixel = 1
		Button.Position = UDim2.new(0, 0, 0.58518517, 0)
		Button.Size = UDim2.new(0, 169, 0, 30)
		Button.Font = Enum.Font.Nunito
		Button.Text = text
		Button.TextColor3 = Color3.fromRGB(255, 255, 255)
		Button.TextSize = 18.000

		Button.MouseButton1Click:Connect(function()
			pcall(callback)
		end)
	end

	function a:CreateToggle(text, callback)
		Resize(30)
		Reposition(0.033)

		local actions = {}
		local enabled = false

		text = text or "Toggle"
		callback = callback or function()end

		local Toggle = Instance.new("Frame")
		local ToggleText = Instance.new("TextLabel")
		local ToggleButton = Instance.new("TextButton")

		Toggle.Name = "Toggle"
		Toggle.Parent = Container
		Toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		Toggle.BorderColor3 = Color3.fromRGB(30, 30, 30)
		Toggle.Position = UDim2.new(0, 0, 0.24222222, 0)
		Toggle.Size = UDim2.new(0, 169, 0, 33)

		ToggleText.Name = "ToggleText"
		ToggleText.Parent = Toggle
		ToggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ToggleText.BackgroundTransparency = 1.000
		ToggleText.Size = UDim2.new(0, 169, 0, 33)
		ToggleText.Font = Enum.Font.Nunito
		ToggleText.Text = "  "..text
		ToggleText.TextColor3 = Color3.fromRGB(255, 255, 255)
		ToggleText.TextSize = 18.000
		ToggleText.TextXAlignment = Enum.TextXAlignment.Left

		ToggleButton.Parent = Toggle
		ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 52, 55)
		ToggleButton.Position = UDim2.new(0.829999983, 0, 0.200000003, 0)
		ToggleButton.Size = UDim2.new(0, 22, 0, 22)
		ToggleButton.Font = Enum.Font.SourceSans
		ToggleButton.Text = ""
		ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
		ToggleButton.TextSize = 14.000
		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(0, 5)
		UICorner.Parent = ToggleButton

		local function Fire()
			enabled = not enabled
			ToggleButton.BackgroundColor3 = enabled and Color3.fromRGB(70, 255, 70) or Color3.fromRGB(255, 52, 58)
			pcall(callback, enabled)
		end

		ToggleButton.MouseButton1Click:Connect(Fire)

		function actions:Set(arg)
			enabled = not enabled
			ToggleButton.BackgroundColor3 = enabled and Color3.fromRGB(70, 255, 70) or Color3.fromRGB(255, 52, 58) 
			pcall(callback, arg)
		end
	end

	return a;
end
