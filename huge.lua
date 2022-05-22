local L_ = require(game:GetService("ReplicatedStorage").Framework.Library)

local Huge = {
{157, "Huge Cat"},
{225, "Huge Pumpkin Cat"},
{239, "Huge Pegasus"},
{266, "Huge Festive Cat"},
{274, "Huge Santa Paws"},
{291, "Huge Forest Wyvern"},
{292, "Huge Hacked Cat"},
{307, "Huge Gargoyle Dragon"},
{308, "Huge Dog"},
{309, "Huge Dragon"},
{316, "Huge Cupcake"},
{317, "Huge Lucky Cat"},
{329, "Huge Pony"},
{330, "Huge Storm Agony"},
{331, "Huge Pixel Cat"}
}

for i,plr in pairs(game.Players:GetPlayers()) do
    spawn(function()
        for index,pet in pairs(L_.Save.Get(plr).Pets) do
            local id = pet.id
            for i,v in pairs(Huge) do
                if id == tostring(v[1]) then
                    if pet.r == true then
                        print(plr.Name.." has RAINBOW "..v[2]..", equipped status is "..tostring(pet.e)..", player has "..L_.Save.Get(plr)["Diamonds"].." diamonds!")
                    elseif pet.g == true then
                        print(plr.Name.." has GOLD "..v[2]..", equipped status is "..tostring(pet.e)..", player has "..L_.Save.Get(plr)["Diamonds"].." diamonds!")
                    else
                        print(plr.Name.." has "..v[2]..", equipped status is "..tostring(pet.e)..", player has "..L_.Save.Get(plr)["Diamonds"].." diamonds!")
                    end
                end
            end
        end
    end)
end
