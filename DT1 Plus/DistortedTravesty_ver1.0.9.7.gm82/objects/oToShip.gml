#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
arrowX=x+8
arrowY=y-24
pointTime=0
arrowColor=0
bShowArrow=true
init=0
#define Collision_oPlayer1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*
To ship script.
This will move the player to the ship room.
*/
if (keyboard_check_pressed(ord(global.ctrlUp)) or keyboard_check_pressed(vk_up)) and global.gamePaused=false
{
  global.recUsedAreaExit+=1
  global.newMapX=0
  global.newMapY=0
  writeToPlayerGlobals()
  transition_steps=30
  transition_kind=20
  room_goto(rShipInterface)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bShowArrow=true
{
  pointTime+=1
  if pointTime=20
    arrowY+=1
  else if pointTime=40
  {
    arrowY-=1
    pointTime=0
  }
  draw_sprite(sExitArrow,arrowColor,arrowX,arrowY)
}
