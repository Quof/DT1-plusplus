#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
makeActive()
setCollisionBounds(-7,-3,7,3)
yVel=-4
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  //yVel+=0.3
  yVel=scrGravAcc(yVel,0.3,1) //60fps change: gravity per 30fps tick, following the 30fps arc
  //moveTo(xVel,yVel)
  moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick

  if isCollisionSolid()
    y-=2
  if y>room_height+24
    instance_destroy()
}
#define Collision_oCharacter
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.recTotalInternetzEarned+=moneyType
oPlayer1.moneyTotal+=moneyType
playSound(global.snd_MoneyPickup,0,0.9)
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,moneyIcon,x,y)
