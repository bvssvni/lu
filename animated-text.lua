
--[[

Uses the game engine Löve https://love2d.org

This class displays an animated text on the screen.
The animation is showing letter by letter.
Color must be customized before the function call.

AnimatedText
    running (boolean)
    seconds (number)
    speed   (number)
    text    (string)
    font    (love.font.FontData)
    x       (number)
    y       (number)

--]]

AnimatedText = {}
AnimatedText.__index = AnimatedText

function AnimatedText:draw()
	local oldFont = love.graphics.getFont()
	local len = self.seconds * self.speed
	if len > string.len(self.text) then len = string.len(self.text) end
	local txt = string.sub(self.text, 1, len)
	if self.font then love.graphics.setFont(self.font) end
	love.graphics.print(txt, self.x, self.y)
	if oldFont then love.graphics.setFont(oldFont) end
end
