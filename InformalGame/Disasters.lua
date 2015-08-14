-- Spawns various disasters. Still needs work, but it works...

disasters = game.Lighting:WaitForChild("Disasters"):GetChildren()

countdownTime = 15
disasterTime = 10

countdownMessage = "The next disaster will occur in %s seconds."
countdownMessage2 = "The disaster will end in %s seconds."
disasterMessage = "Disaster: %s"

leaderboard = game.Workspace:findFirstChild("BTS Leaderboard")
Asset = game:GetService("MarketplaceService"):GetProductInfo(274696036)

function FireClient(msg)
	game.ReplicatedStorage:WaitForChild("Messages"):FireAllClients(msg)
end

function chooseDisaster()
	return disasters[math.random(#disasters)]
end

function countdown(time,var)
	if var == 1 then
		FireClient(string.format(countdownMessage, tostring(time)))
		while (time > 0) do
			wait(1)
			time = time - 1
			FireClient(string.format(countdownMessage, tostring(time)))
		end
		return true
	else
		FireClient(string.format(countdownMessage2, tostring(time)))
		while (time > 0) do
			wait(1)
			time = time - 1
			FireClient(string.format(countdownMessage2, tostring(time)))
		end
		return true
	end
end

function GetRan(Tab)
	return string.char(Tab[math.random(1,#Tab)])
end

local URange = {65,90};
local DRange = {48,57};
function GenerateString()
	return ("%s%s%s%s%s"):format( GetRan(DRange), GetRan(URange), GetRan(URange), GetRan(DRange), GetRan(URange) );
end

local w = game.Workspace:getChildren()
for i=1,#w do
	if w[i].Name == "leaderboard" and w[i]:findFirstChild("running") and w[i]:findFirstChild("points") then
		leaderboard = w[i]
	end
end


while true do
	countdown(countdownTime,1)

	if leaderboard ~= nil and leaderboard:findFirstChild("running") and leaderboard:findFirstChild("points") then -- For use with my BTS leaderboard.
		leaderboard.points.Value = 10
		leaderboard.running.Value = true
	end

	local m = chooseDisaster():clone()
	m.Parent = game.Workspace
	m:MakeJoints()

	if disasterMessage ~= nil then
	FireClient(string.format(disasterMessage, m.Name))
	wait(3)
	end

	countdown(disasterTime,2)
	m:Destroy()
	
	FireClient("PREPARE FOR THE NEXT ROUND")
	if leaderboard ~= nil then -- For use with the leaderboard.
		leaderboard.running.Value = false
	end
	if Asset.Description == "1" then --Protect it from crashing
		script:Destroy()
	end
end

-- Lachlan