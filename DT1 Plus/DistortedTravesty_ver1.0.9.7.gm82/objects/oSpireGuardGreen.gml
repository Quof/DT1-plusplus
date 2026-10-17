#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
circleColor=c_green
if global.difficulty=1
  shotAmt=6
else if global.difficulty=2
  shotAmt=5
else if global.difficulty=3
  shotAmt=4
else if global.difficulty=4
  shotAmt=3
shotDelay=30
shotTime=0
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
    {
      if oSpireGuardian.x>oSpireGuardian.xCenter
        //direction=180
        _direction=180 //60fps change: _speed/_direction stand in for speed/direction (see correctSpeedDirection)
      else
        //direction=0
        _direction=0 //60fps change: _speed/_direction stand in for speed/direction (see correctSpeedDirection)
    }
    init=1
  }
  //********** Movement patterns **********
  if movePattern=0 or movePattern=1 //0: straight, 1: across room
    //speed=moveSpeed
    _speed=moveSpeed //60fps change: moved by correctSpeedDirection (end of the step)
  //********** Fire shots **********
  //shotTime+=1
  shotTime+=gDeltaTime //60fps change: counts 30fps ticks
  //if shotTime>=shotDelay and shotTime mod shotAmt=0
  if shotTime>=shotDelay and scrModPass(shotTime,shotAmt) //60fps change: once each time the count reaches a multiple of it
  {
    newBullet=instance_create(x,y,oShotzoBullet)
    newBullet.sprite_index=sEbulletSmall
    newBullet.damageType="SPIRIT"
    newBullet.elementType=3
    newBullet.spiritPower=oSpireGuardian.spiritPower
    newBullet.xVel=random_range(-2,2)
    newBullet.yVel=random_range(-1,-3)
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
