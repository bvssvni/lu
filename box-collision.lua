
function do_lines_intersect(x1, y1, x2, y2, x3, y3, x4, y4)
   d = (y4-y3)*(x2-x1)-(x4-x3)*(y2-y1)
   Ua_n = ((x4-x3)*(y1-y3)-(y4-y3)*(x1-x3))
   Ub_n = ((x2-x1)*(y1-y3)-(y2-y1)*(x1-x3))
   if d == 0 then
       --if Ua_n == 0 and Ua_n == Ub_n then
       -- return true
       --end
       return false
   end
   Ua = Ua_n / d
   Ub = Ub_n / d
   if Ua >= 0 and Ua <= 1 and Ub >= 0 and Ub <= 1 then
       return true
   end
   return false
end

--[[
Returns normal vector of collision between two bricks.
Creates a bigger rectangle from the two and then does path intersection test.
oax, oay is the old coordinates of the upper left corner of rectangle a.

Normal vectors are useful since they can give force feedback to the object
that collides. The contact force is simply proportional to the normal.
--]]
function collision_rectangle_normal(ball, brick, oax, oay)
    local aw2, ah2 = ball.w/2, ball.h/2
    local acx, acy = ball.x + aw2, ball.y + ah2
    local oacx, oacy = oax + aw2, oay + ah2
    local cx, cy = brick.x - aw2, brick.y - ah2
    local cw, ch = ball.w + brick.w, ball.h + brick.h
    
    if do_lines_intersect(acx, acy, oacx, oacy, cx, cy, cx+cw, cy) then
        return 0, -1
    end
    if do_lines_intersect(acx, acy, oacx, oacy, cx+cw, cy+ch, cx, cy+ch) then
        return 0, 1
    end
    if do_lines_intersect(acx, acy, oacx, oacy, cx+cw, cy, cx+cw, cy+ch) then
        return 1, 0
    end
    if do_lines_intersect(acx, acy, oacx, oacy, cx+cw, cy+ch, cx, cy+ch) then
        return 0, 1
    end
    if do_lines_intersect(acx, acy, oacx, oacy, cx, cy+ch, cx, cy) then
        return -1, 0
    end
    
    return 0, 0
end

