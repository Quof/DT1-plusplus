#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

//Enemy base statistics
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
if global.difficulty=1
{
  xLength=96
  yLength=42
}
else if global.difficulty=2
{
  xLength=128
  yLength=48
}
else if global.difficulty=3
{
  xLength=160
  yLength=56
}
else if global.difficulty=4
{
  xLength=192
  yLength=64
}
xLength+=irandom_range(8,16)
yLength+=irandom_range(2,4)
surfaceUsed=global.optGameDetail
if surfaceUsed=1
{
  messageCap=surface_create(xLength,yLength)
  surface_set_target(messageCap)
  screen_redraw()
  surface_reset_target()
}

size=2
sprite_index=sScaledCollision
destroyTime=360
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=xLength
image_yscale=yLength
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  speed=3
  destroyTime-=1
  if destroyTime<=0
  {
    if surfaceUsed=1
      surface_free(messageCap)
    instance_destroy()
  }
}
else
  speed=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if surfaceUsed=1
  draw_surface_general(messageCap,0,0,xLength,yLength,x,y,1,1,image_angle,c_white,c_white,c_white,c_white,image_alpha)
else
  draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
