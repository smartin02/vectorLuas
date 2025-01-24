require "math"
Vector = {}
MetaVector = {}
MetaVector.__index = Vector

function Vector.new_rect(compX, compY)
  local instance = setmetatable({}, MetaVector)
  instance.X = compX
  instance.Y = compY
  instance.M = math.sqrt(compX^2 + compY^2)
  instance.A = math.atan(compY / compX)
  return instance
end
function Vector.new_pol(mag, angle)
  local instance = setmetatable({}, MetaVector)
  instance.X = mag * math.cos(angle)
  instance.Y = mag * math.sin(angle)
  instance.M = mag
  instance.A = angle
  return instance
end
function Vector:display()
  print("X-component:", self.X)
  print("Y-component:", self.Y)
  print("Magnitude:", self.M)
  print("Angle:", self.A)
end
function Vector.add(v1, v2)
  local rx = v1.X + v2.X
  local ry = v1.Y + v2.Y 
  return Vector.new_rect(rx, ry)
end
function Vector.sub(v1, v2)
  local rx = v1.X - v2.X
  local ry = v1.Y - v2.Y
  return Vector.new_rect(rx, ry)
end
function Vector.mul(v1, v2)
  local rm = v1.M * v2.M 
  local ra = v1.A + v2.A 
  return Vector.new_pol(rm, ra)
end
function Vector.div(v1, v2)
  local rm = v1.M / v2.M 
  local ra = v1.A - v2.A 
  return Vector.new_pol(rm, ra) 
end
function Vector.rec(v1)
  local rm = 1 / v1.M
  local ra = -1 * v1.A
  return Vector.new_pol(rm, ra)
end
function Vector.par(i1, i2)
  local r1 = Vector.mul(i1, i2)
  local r2 = Vector.add(i1, i2)

  return Vector.div(r1, r2)
end
function Vector.v_div(v1, i1, i2)
  -- the first argument given is the component that the voltage and current will be found
  -- all other arguments are expected to be in parallel 
  local r1 = Vector.add(i1, i2)
  Vector.div(i1, r1)
end

rect1 = Vector.new_rect(1, 0)
rect2 = Vector.new_rect(1, 0)
rect3 = Vector.par(rect1, rect2)

rect3:display()
