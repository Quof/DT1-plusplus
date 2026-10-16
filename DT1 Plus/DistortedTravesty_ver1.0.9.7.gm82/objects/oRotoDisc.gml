#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
init=0
sX=x
sY=y
if image_blend=c_black
  midBlend=c_black
else
  midBlend=c_gray

//Enemy base statistics
physicalPower=600
bCanTakeDamage=false
bShowHealthBar=false
difficultyAdjustments(global.difficulty)
if global.location!="Distortion WTF 1" and global.location!="Distortion WTF 2"
  sprite_index=sColorRotoDisc
if global.location="Primary Memory"
  physicalPower+=150
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if init=0
{
  if global.difficulty=1
    swingSpeed*=0.9
  else if global.difficulty=3
    swingSpeed*=1.1
  else if global.difficulty=4
    swingSpeed*=1.25
  init=1
}
if global.gamePaused=false
{
  makeEnemyActive()
  dir+=swingSpeed
  x=sX+lengthdir_x(spinDist,dir)
  y=sY+lengthdir_y(spinDist,dir)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color(c_black)
draw_set_alpha(0.2)
draw_line(x,y,sX,sY)
draw_sprite_ext(sRotoDisc,-1,sX,sY,1,1,0,midBlend,0.8)
draw_sprite_ext(sprite_index,-1,x,y,1,1,0,image_blend,1)
