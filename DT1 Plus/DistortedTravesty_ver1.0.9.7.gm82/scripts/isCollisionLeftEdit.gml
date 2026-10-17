/*
60fps change (added): from DT3 60FPS. isCollisionLeft, but only while moving left (xVel<0). For enemies that turn
around when they bump into a wall: above 30fps they move less per frame and can still be touching the wall on the
next frame, so the plain check turned them around again and again inside the wall.
An object can only use this script after calling "setCollisionBounds."
0: Number of pixels left of the collision rectangle to check for a collision
with a solid object.
*/
calculateCollisionBounds()
if xVel < 0.0 and collision_line(round(lb-argument0),round(tb),round(lb-argument0),round(bb-1),oSolid,1,1)>0
{
  return 1
}
return 0
