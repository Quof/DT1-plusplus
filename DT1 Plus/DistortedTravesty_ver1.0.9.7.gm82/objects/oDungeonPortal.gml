#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=0.8
image_speed=0.4
holdTime=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if point_distance(x,y,oPlayer1.x,oPlayer1.y-26)>48
  holdTime=0
#define Collision_oPlayer1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*
Dungeon Portal script.
This will move the player to the world map.
*/
if (keyboard_check(ord(global.ctrlUp)) or keyboard_check(vk_up)) and global.gamePaused=false
{
  if holdTime>=30
  {
    global.worldMapX=newMapX
    global.worldMapY=newMapY
    writeToPlayerGlobals()
    transition_kind=20
    transition_steps=30
    room_goto(toRoom)
  }
  else
    holdTime+=1
}
else
  holdTime=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=0.8
draw_sprite_ext(sprite_index,-1,x,y,1.2,1.2,0,c_white,0.2)
draw_sprite(sprite_index,-1,x,y)
draw_set_alpha(1)
if holdTime>0
{
  draw_set_color(c_black)
  draw_rectangle(x-15,y-48,x+17,y-42,false)
  draw_set_color(c_white)
  draw_rectangle(x-15,y-48,x+17,y-42,true)
  draw_set_color(c_red)
  draw_rectangle(x-14,y-47,x-13+holdTime,y-43,false)
}
