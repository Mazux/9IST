-- Used to generate a forcefield around a player when the button is clicked. This requires the user interface to be present, but you can still check out how they reference eachother.

function onButtonClicked()
if not script.Parent.Parent.Parent.Parent.Character:findFirstChild("ForceField") == true then
A = Instance.new("ForceField")
A.Parent = script.Parent.Parent.Parent.Parent.Character
wait(30)
script.Parent.Parent.Parent.Character.ForceField:Remove()
game.Players.LocalPlayer.PlayerGui.ForceField:Destroy()
else
script.Parent.Parent.Parent.Parent.Character.ForceField:remove()
end
end

script.Parent.MouseButton1Click:connect(onButtonClicked)

-- Lachlan