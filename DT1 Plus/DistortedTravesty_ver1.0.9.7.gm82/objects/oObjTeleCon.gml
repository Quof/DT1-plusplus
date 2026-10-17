#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
digit1=round(random(9))
digit2=round(random(9))
digit3=round(random(9))
changeTime=0
#define Collision_oCharacter
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//teleport object
if keyboard_check_pressed(ord(global.ctrlUp)) and global.gamePaused=false
{
  if variable_local_exists("objCache") {objID=GID(objCache)} //GM8.2 change (added): the room gives the object's old GM8.1 id (objCache); look it up (see GID)
  objID.x=teleX
  objID.y=teleY
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,-1,x,y)
draw_set_color(c_white)
draw_set_alpha(1)
draw_set_font(fnt_ScanData)
draw_set_halign(fa_left)
if changeTime>=9
{
  digit1=round(random(9))
  digit2=round(random(9))
  digit3=round(random(9))
  //changeTime=0
  changeTime=gDeltaTime-1 //60fps change: counts 30fps ticks; the frame that resets it counts as a whole tick, as at 30fps (it doesn't count up), so the count starts that far back (the same at 30fps)
}
else
  //changeTime+=1
  changeTime+=gDeltaTime //60fps change: counts 30fps ticks
draw_text(x+1,y,digit1)
draw_text(x+5,y,digit2)
draw_text(x+9,y,digit3)
