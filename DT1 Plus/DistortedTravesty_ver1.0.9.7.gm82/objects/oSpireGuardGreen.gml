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
        direction=180
      else
        direction=0
    }
    init=1
  }
  //********** Movement patterns **********
  if movePattern=0 or movePattern=1 //0: straight, 1: across room
    speed=moveSpeed
  //********** Fire shots **********
  shotTime+=1
  if shotTime>=shotDelay and shotTime mod shotAmt=0
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
  speed=0
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
