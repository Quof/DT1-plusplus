#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
circleColor=make_color_rgb(0,180,255)
if global.difficulty=1
{
  shotDelay=85
  shotAmt=4
}
else if global.difficulty=2
{
  shotDelay=80
  shotAmt=5
}
else if global.difficulty=3
{
  shotDelay=75
  shotAmt=6
}
else if global.difficulty=4
{
  shotDelay=70
  shotAmt=7
}
shotTime=shotDelay-30
init=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if init=0
  {
    if movePattern=1
      //direction=point_direction(x,y,oPlayer1.x,oPlayer1.y-26)
      _direction=point_direction(x,y,oPlayer1.x,oPlayer1.y-26) //60fps change: _speed/_direction stand in for speed/direction (see correctSpeedDirection)
    init=1
  }
  //********** Movement patterns **********
  if movePattern=0 or movePattern=1 //0: straight, 1: to player
    //speed=moveSpeed
    _speed=moveSpeed //60fps change: moved by correctSpeedDirection (end of the step)
  //********** Fire shots **********
  //shotTime+=1
  shotTime+=gDeltaTime //60fps change: counts 30fps ticks
  if shotTime>=shotDelay
  {
    shotDir=point_direction(x,y,oPlayer1.x,oPlayer1.y-26)
    for(i=0;i<shotAmt;i+=1)
    {
      newBullet=instance_create(x,y,oMMeShotArc)
      newBullet.x=x+lengthdir_x(8,shotDir)
      newBullet.y=y+lengthdir_y(8,shotDir)
      newBullet.sprite_index=sEbulletLong
      newBullet.damageType="SPIRIT"
      newBullet.elementType=2
      newBullet.spiritPower=oSpireGuardian.spiritPower
      newBullet.bDestroyOnOutside=1
      newBullet.bulletSpeed=5
      //newBullet.direction=shotDir
      newBullet._direction=shotDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      newBullet.arcTime=35
      newBullet.bulletArc=5
      shotDir+=360/shotAmt
    }
    shotTime=0
  }
}
else
  //speed=0
  _speed=0 //60fps change: see above
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction, this frame's share of a 30fps tick
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color(circleColor)
draw_set_alpha(0.3)
draw_circle(x,y,10,0)
draw_set_alpha(1)
draw_circle(x,y,10,1)
