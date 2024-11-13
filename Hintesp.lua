local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera
local runService = game:GetService("RunService")

-- Function to create an ESP box around hint/advantage parts
local function createESP(part)
    -- Create a BillboardGui to display the hint
    local espGui = Instance.new("BillboardGui")
    espGui.Adornee = part
    espGui.Size = UDim2.new(0, 200, 0, 50)
    espGui.StudsOffset = Vector3.new(0, 5, 0)
    espGui.AlwaysOnTop = true
    espGui.Parent = part

    -- Create a TextLabel inside the BillboardGui to display "Hint/Advantage"
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = "Hint/Advantage"
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 14
    label.Parent = espGui
end

-- Function to check for "Hint/Advantage" objects and show them
local function detectHintsAndAdvantages()
    for _, object in pairs(workspace:GetDescendants()) do
        -- Check if the object is a hint or advantage (you can tag them by name or through a custom property)
        if object:IsA("Part") and (object.Name == "Hint" or object.Name == "Advantage") then
            -- Call the ESP function
            createESP(object)
        end
    end
end

-- Continuously check for hints/advantages
runService.Heartbeat:Connect(function()
    detectHintsAndAdvantages()
end)

