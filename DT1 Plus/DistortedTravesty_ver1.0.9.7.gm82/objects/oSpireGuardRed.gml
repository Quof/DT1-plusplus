#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
circleColor=c_red
if global.difficulty=1
{
  shotDelay=80
  shotAmt=6
}
else if global.difficulty=2
{
  shotDelay=75
  shotAmt=7
}
else if global.difficulty=3
{
  shotDelay=70
  shotAmt=8
}
else if global.difficulty=4
{
  shotDelay=65
  shotAmt=9
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
      direction=point_direction(x,y,oPlayer1.x,oPlayer1.y-26)
    init=1
  }
  //********** Movement patterns **********
  if movePattern=0 or movePattern=1 //0: straight, 1: to player
    speed=moveSpeed
  //********** Fire shots **********
  shotTime+=1
  if shotTime>=shotDelay
  {
    shotDir=point_direction(x,y,oPlayer1.x,oPlayer1.y-26)
    for(i=0;i<shotAmt;i+=1)
    {
      newBullet=instance_create(x,y,oMMeShot1)
      newBullet.x=x+lengthdir_x(8,shotDir)
      newBullet.y=y+lengthdir_y(8,shotDir)
      newBullet.sprite_index=sEbulletDiamond
      newBullet.damageType="SPIRIT"
      newBullet.elementType=1
      newBullet.spiritPower=oSpireGuardian.spiritPower
      newBullet.bulletSpeed=5
      newBullet.direction=shotDir
      newBullet.image_angle=shotDir
      shotDir+=360/shotAmt
    }
    shotTime=0
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
