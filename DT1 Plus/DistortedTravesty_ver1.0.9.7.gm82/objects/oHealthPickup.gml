#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//makeActive()
//setCollisionBounds(-5,-5,5,5)
//yVel=-4
image_speed=0.3
totalHeal=oPlayer1.maxLife*0.1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*if global.gamePaused=false
{
  yVel+=0.3
  //if isCollisionSolid()
  if isCollisionSolid() and gDeltaDoTicks //60fps change: once per 30fps tick (it ran every frame, so a unit stuck in a wall was pushed out 2x as fast at 60fps, 4x at 120fps)
    y-=2
  if y>room_height+24
    instance_destroy()
  moveTo(xVel,yVel)
}*/
#define Collision_oCharacter
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
oPlayer1.life+=totalHeal
playSound(global.snd_HealthPickup,0,1)
newDamage=instance_create(x,y-(sprite_height/2+(sprite_height/4)),oDamageNotice);
newDamage.damageValue=totalHeal
newDamage.damageColor=make_color_rgb(78,192,34)
effect=instance_create(oPlayer1.x,oPlayer1.y-(oPlayer1.sprite_height/2),oEffect)
effect.sprite_index=sHeal
instance_destroy()
