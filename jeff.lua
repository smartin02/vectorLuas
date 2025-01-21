Vector = {}
MetaVector = {}
MetaVector.__index = Vector

function Vector.new_rect(compX, compY)
  local instance = setmetatable({}, MetaVector)
  instance.X = compX
  instance.Y = compY
  instance.M = math.sqrt(math.pow(compX, 2) + math.pow(compY, 2))
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

rect1 = Vector.new_rect(0, 1)
rect2 = Vector.new_rect(1, 0)
rect3 = Vector.add(rect1, rect2)

rect1:display()
print('\n')
rect2:display()
print('\n')
rect3:display()