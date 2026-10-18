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
//if (keyboard_check(ord(global.ctrlUp)) or keyboard_check(vk_up)) and global.gamePaused=false
if (keyboard_check(ord(global.ctrlUp)) or (keyboard_check(vk_up) or scrPadHeld(3))) and global.gamePaused=false //gamepad change: and the gamepad's Up (scrGamepadInit)
{
  if holdTime>=30
  {
    global.worldMapX=newMapX
    global.worldMapY=newMapY
    writeToPlayerGlobals()
    transition_kind=20
    //transition_steps=30
    transition_steps=30 //60fps change: the original steps: GM plays a room transition at the new room's own speed (30; oGame sets room_speed only once the room runs), so steps/gDeltaTime made it 2x/4x as long at 60/120fps
    room_goto(toRoom)
  }
  else
    //holdTime+=1
    holdTime+=gDeltaTime //60fps change: counts 30fps ticks
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
