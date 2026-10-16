#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
//find the correct sprite for effect and collision
currentSpell="WILDFIRE"
damageType="SPIRIT"
spiritPower=oPlayer1.spiritPower
elementType=1
image_xscale=0.8
image_yscale=0.8

var angleCheck;
angleCheck=1
if oPlayer1.image_xscale=-1
  angleCheck=2

if angleCheck=1
{
  arcChange=-15
  dirChange=-5
}
else
{
  arcChange=15
  dirChange=5
}
skillPower=50
image_speed=0.33
lifeTime=0
flyDist=48
spiralOutSpd=4
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if global.gamePaused=false
{
  image_angle+=arcChange
  flyDir+=dirChange
  x=oPlayer1.x+lengthdir_x(flyDist,flyDir)
  y=oPlayer1.y-26+lengthdir_y(flyDist,flyDir)
  lifeTime+=1
  if lifeTime>=1 and lifeTime<=12
    flyDist-=2
  else if lifeTime>=20
  {
    flyDist+=spiralOutSpd
    spiralOutSpd+=0.1
    if lifeTime>=60
    {
      image_alpha-=0.1
      if image_alpha<=0
        instance_destroy()
    }
  }
}
