local u1 = {Tween = function(p1, p2, p3, p4, p5, p6)
		game:GetService("TweenService"):Create(p2, TweenInfo.new(p4, p5, p6, 0, false, 0), p3):Play();
	end}
u1.HapticService = game:GetService("HapticService")
u1.RunService = game:GetService("RunService")
u1.UserInputService = game:GetService("UserInputService")
u1.PlayerInfo = {
	DefaultFOV = 95, 
	DefaultSpeed = 12, 
	RunningFOV = 105, 
	RunningSpeed = 18, 
	CrouchingFOV = 85, 
	CrouchingSpeed = 8, 
	ZoomingFOV = 35, 
	fovEase = Enum.EasingStyle.Quint, 
	zoomEase = Enum.EasingStyle.Circular, 
	MaxPickupDistance = 12, 
	SnapToGridRange = 0.01, 
	MinScrollDistance = 2.5, 
	GridSize = 0.5, 
	HoldE_Time = 0.5, 
	MaxWaypoints = 4, 
	WaypointOnDeath = false, 
	RotationalInfo = {
		DefaultIncrement = 45, 
		CtrlIncrement = 15, 
		ShiftIncrement = 90, 
		X = 0, 
		Y = 0, 
		Z = 0, 
		ObjectCFrame = CFrame.Angles(0, 0, 0), 
		CurrentAxis = "Y"
	}, 
	EffectWobble = Vector3.new(0, 0, 0), 
	WalkXDamp = 9, 
	WalkYDamp = 13, 
	RotationDamp = 2, 
	RotationSpeed = 12, 
	XSpeed = 12, 
	YSpeed = 24, 
	StrafeDamp = 6
};
u1.Humanoid = game.Players.LocalPlayer.Character.Humanoid
u1.Camera = workspace.CurrentCamera
u1.RootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
local u2 = Instance.new("NumberValue");
local u3 = Vector3.new(0, 0, 0);
local u4 = 0;
local u5 = 0;
local u6 = Vector3.new(0, 0, 0);
local u7 = 0;
local u8 = Instance.new("NumberValue");
getgenv().onny = true
u1.RunService.RenderStepped:Connect(function(p1)
	if onny == true then
		local v1 = p1 * 60;
		local v2 = 0;
		local v3 = -u1.RootPart.CFrame:VectorToObjectSpace(u1.RootPart.Velocity).X / u1.PlayerInfo.StrafeDamp;
		if math.abs(v3) > 0.4 then
			v2 = v3;
		end;
		u1:Tween(u2, {
			Value = v2 + -u1.UserInputService:GetMouseDelta().X / 5
		}, 1.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out);
		if workspace:GetRealPhysicsFPS() > 67 then
			u1.LocalPlayer:Kick("High speed client detected.");
		end;
		if u1.Humanoid.RootPart then
			if u1.Humanoid.Health < 10 then
				u1.PlayerInfo.RotationSpeed = 4.5;
				u1.PlayerInfo.XSpeed = 4.5;
				u1.PlayerInfo.YSpeed = 9;
			elseif u1.Humanoid.HipHeight < -0.4 then
				u1.PlayerInfo.RotationSpeed = 6.428571428571429;
				u1.PlayerInfo.XSpeed = 6.428571428571429;
				u1.PlayerInfo.YSpeed = 12.857142857142858;
				u1.PlayerInfo.StrafeDamp = 2;
			else
				u1.PlayerInfo.RotationSpeed = 9;
				u1.PlayerInfo.XSpeed = 9;
				u1.PlayerInfo.YSpeed = 18;
				u1.PlayerInfo.StrafeDamp = 6;
			end;
			if u1.Humanoid.MoveDirection.Magnitude > 0 then
				u3 = u3 / 1.5;
				u4 = u4 + 0.015 * v1;
				u5 = 0;
				u6 = Vector3.new(math.cos(u4 * u1.PlayerInfo.XSpeed) / u1.PlayerInfo.WalkYDamp, math.sin(u4 * u1.PlayerInfo.YSpeed) / u1.PlayerInfo.WalkXDamp, 0) * math.min(1, u1.RootPart.Velocity.Magnitude / u1.Humanoid.WalkSpeed);
				u7 = math.rad(math.sin(u4 * u1.PlayerInfo.RotationSpeed)) / u1.PlayerInfo.RotationDamp;
			elseif not true then
				u5 = u5 + 0.015 * v1;
				u4 = 0;
				u3 = Vector3.new(0, math.cos(u5 * 3.5) / 60, 0);
				u6 = u6 / 1.05;
				u7 = u7 / 1.15;
			else
				u5 = u5 + 0.015 * v1;
				u4 = 0;
				u3 = u3 / 1.5;
				u6 = u6 / 1.05;
				u7 = u7 / 1.15;
			end;
			local l__PlayerInfo__4 = u1.PlayerInfo;
			l__PlayerInfo__4.EffectWobble = l__PlayerInfo__4.EffectWobble / 1.075;
			u1.Humanoid.CameraOffset = u1.Humanoid.CameraOffset:lerp(u3 + u6, 0.25);
			local l__Camera__5 = u1.Camera;
			l__Camera__5.CFrame = l__Camera__5.CFrame * (CFrame.Angles(0, 0, u8.Value + u7) * CFrame.Angles(u1.PlayerInfo.EffectWobble.X, u1.PlayerInfo.EffectWobble.Y, u1.PlayerInfo.EffectWobble.Z + math.rad(u2.Value)));
		end;
	end;
end);
