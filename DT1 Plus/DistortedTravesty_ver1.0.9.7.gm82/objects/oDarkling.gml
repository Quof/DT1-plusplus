#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if random(10)>5
  sprite_index=sDarkling2
flySpeed=random_range(16,22)
image_speed=random_range(0.4,0.8)
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
    if dir=1
      image_xscale=-1
  if dir=0
    x+=flySpeed
  else if dir=1
    x-=flySpeed
  if point_distance(x,0,oPlayer1.x,0)>512
    instance_destroy()
}
