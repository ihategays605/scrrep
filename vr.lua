local plr = game.Players.LocalPlayer
local uis = game:GetService("UserInputService")
local rs = game:GetService("RunService")
local cam = workspace.CurrentCamera
cam.CameraType = Enum.CameraType.Scriptable
cam.CFrame = plr.Character.Head.CFrame

rs.RenderStepped:Connect(function(step)
    uis.MouseBehavior = Enum.MouseBehavior.LockCenter
    local delta = uis:GetMouseDelta()
    local x = delta.X
    local y = delta.Y
    local addRotation = CFrame.Angles(math.rad(-y),math.rad(-x),math.rad(0))
    
    local headCf = plr.Character.Head.CFrame
    local headCFPosOnly = CFrame.new(headCf.Position)
    local currentCamRotationOnly = cam.CFrame-cam.CFrame.Position
    cam.CFrame = headCFPosOnly*currentCamRotationOnly*addRotation
end)
