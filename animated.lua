
--[[

Uses the game engine Löve https://love2d.org

This class has a method to updated the seconds of the members
with the change in time since last frame.

It makes it easy to deal with animated objects, it becomes
a matter of putting objects in the list and set 'running' to true.

Animated {}
    running (boolean)
    seconds (number)

--]]

Animated = {}
Animated.__index = Animated

function Animated:update()
	local delta = love.timer.getDelta()
	local len = #animated
	for i = 1, len do
		if self[i] and self[i].running then
			self[i].seconds = self[i].seconds + delta
		end
	end
end
