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
  //image_angle+=arcChange
  image_angle+=arcChange*gDeltaTime //60fps change: per 30fps tick
  //flyDir+=dirChange
  flyDir+=dirChange*gDeltaTime //60fps change: per 30fps tick
  x=oPlayer1.x+lengthdir_x(flyDist,flyDir)
  y=oPlayer1.y-26+lengthdir_y(flyDist,flyDir)
  //lifeTime+=1
  lifeTime+=gDeltaTime //60fps change: counts 30fps ticks
  //if lifeTime>=1 and lifeTime<=12
  if lifeTime>0 and lifeTime<=12 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    //flyDist-=2
    flyDist-=2*gDeltaTime //60fps change: per 30fps tick
  //else if lifeTime>=20
  else if lifeTime>19 //60fps change: see above
  {
    //flyDist+=spiralOutSpd
    flyDist+=spiralOutSpd*gDeltaTime //60fps change: per 30fps tick
    //spiralOutSpd+=0.1
    spiralOutSpd+=0.1*gDeltaTime //60fps change: per 30fps tick
    //if lifeTime>=60
    if lifeTime>59 //60fps change: see above
    {
      //image_alpha-=0.1
      image_alpha-=0.1*gDeltaTime //60fps change: per 30fps tick
      if image_alpha<=0
        instance_destroy()
    }
  }
}
