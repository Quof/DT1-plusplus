#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sprite_index=sKirbyDoorway
findTargetX=0
findTargetY=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
findTargetX=point_distance(oCharacter.x,0,x,0)
findTargetY=point_distance(0,oCharacter.y,0,y)
#define Collision_oPlayer1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*
Save Door script.
This will move the player to the Data Center.
*/
if (keyboard_check_pressed(ord(global.ctrlUp)) or keyboard_check_pressed(vk_up)) and global.gamePaused=false
{
  if room!=rDataCenter
  {
    global.targetMapX=x+8
    global.targetMapY=y+33
    global.targetMap=room
  }
  else
  {
    global.newMapX=global.targetMapX
    global.newMapY=global.targetMapY
  }
  writeToPlayerGlobals()
  //transition_steps=30
  transition_steps=30/gDeltaTime //60fps change: transition_steps counts frames: the same time
  transition_kind=20
  if room!=rDataCenter
    room_goto(rDataCenter)
  else
  {
    global.resetNewMapXY=true
    room_goto(global.targetMap)
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if findTargetX<480 and findTargetY<352
{
  draw_sprite(sprite_index,-1,x,y)
  draw_set_alpha(1)
  draw_set_color(c_red)
  draw_set_halign(fa_center)
  draw_set_font(fnt_Exp)
  if room!=rDataCenter
    draw_text(x+8,y-12,"SAVE")
  else
    draw_text(x+8,y-12,"EXIT")
}
