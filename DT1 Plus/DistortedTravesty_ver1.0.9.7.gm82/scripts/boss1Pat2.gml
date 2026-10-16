/***************************************************
***** Bullet Pattern - Large Spliting Arc
1 straight stream (large) with new bullets
***************************************************/
var dir;
dir=point_direction(x,y,oPlayerShip.x,oPlayerShip.y)
for(i=0;i<argument1;i+=1)
{
  newBullet=instance_create(x,y,oBoss1SmallBullet)
  newBullet.bulletSpeed=2.2
  newBullet.direction=dir
  if argument0=0
    newBullet.bulletArc=1.5
  else if argument0=1
    newBullet.bulletArc=-1.5
  dir+=360/argument1
}
