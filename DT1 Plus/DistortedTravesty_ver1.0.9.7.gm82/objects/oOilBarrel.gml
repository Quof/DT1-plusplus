#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-7,-15,7,-1)
image_speed=0.1

//Enemy base statistics
maxLife=1
life=maxLife
bShowHealthBar=false
bShowDamage=false
bCanDealDamage=false
hitSound=0
dieSound=0
weight=160
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if y<room_height
{
  fieldBlast=instance_create(x,y-(sprite_height/2),oFieldBlast)
  playSound(global.snd_CASdie,0,1)
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  makeEnemyActive()
  //yVel+=0.3
  yVel=scrGravAcc(yVel,0.3,1) //60fps change: gravity per 30fps tick, following the 30fps arc
  if isCollisionBottom(1)
  {
    if yVel>7
      instance_destroy()
    yVel=0
  }
  //if isCollisionSolid()
  if isCollisionSolid() and gDeltaDoTicks //60fps change: once per 30fps tick (it ran every frame, so a unit stuck in a wall was pushed out 2x as fast at 60fps, 4x at 120fps)
    y-=2
  if y>room_height+24
    instance_destroy()
  //moveTo(xVel,yVel)
  moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha(random(0.05)+0.3)
draw_set_blend_mode(bm_add)
draw_circle_color(x,y-24,16,make_color_rgb(240,193,64),c_black,false)
draw_set_blend_mode(bm_normal)
draw_set_alpha(1)
event_inherited()
