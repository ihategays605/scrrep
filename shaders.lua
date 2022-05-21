local t = Instance.new("DepthOfFieldEffect", game.Lighting)
t.Name = "dofe"
t.InFocusRadius = 30
local t2 = Instance.new("ColorCorrectionEffect", game.Lighting)
t2.Name = "cce"

t2.Brightness = -.1
t2.Contrast = .5
t2.TintColor = Color3.fromRGB(125,125,125)
