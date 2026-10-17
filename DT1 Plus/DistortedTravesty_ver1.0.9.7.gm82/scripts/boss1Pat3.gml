/***************************************************
***** Bullet Pattern - Dual Circle
1 straight stream (normal)
1 arcing stream (diamond)
***************************************************/
var dir;
dir=point_direction(x,y,oPlayerShip.x,oPlayerShip.y)
for(i=0;i<argument1;i+=1)
{
  newBullet=instance_create(x,y,oEnemyShipBulletNormal)
  newBullet.bDestroyIfOffScreen=true
  newBullet.bulletSpeed=1
  //newBullet.direction=dir
  newBullet._direction=dir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
  newBullet=instance_create(x,y,oEnemyShipBulletDiamond)
  newBullet.bDestroyIfOffScreen=true
  newBullet.bulletSpeed=2
  //newBullet.direction=dir+5
  newBullet._direction=dir+5 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
  if argument0=0
    newBullet.bulletArc=0.25
  else if argument0=1
    newBullet.bulletArc=-0.25
  dir+=360/argument1
}
