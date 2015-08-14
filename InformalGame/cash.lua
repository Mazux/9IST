-- Used to create a cash system on the leaderboard
function Entered(player)--creates a function when a player enters...
	wait()

	if player:findFirstChild("leaderstats") ~= nil then--if the leaderstats are there when the player enters, it removes it... if this~=nil then means if this is there then do this...
		player.leaderstats:remove()
	end

	stats = Instance.new("IntValue")--IntValue is for the grey spot where you see your name, and makes a leaderboard with the name: "leaderstats" if it's something else it won't do anything...
	stats.Parent = player--it puts it in the new player...
	stats.Name = "leaderstats"--names it leaderstats

	money = Instance.new("IntValue")--creates the leaderboard and names it Cash you can change it...
	money.Parent = stats
	money.Name = "Cash"
	money.Value = 100 --amount of cash they will start out with

end

game.Players.PlayerAdded:connect(Entered)
c = game.Players:GetChildren()
for i=1, #c do
	Entered(c[i])
end

-- Lachlan 


