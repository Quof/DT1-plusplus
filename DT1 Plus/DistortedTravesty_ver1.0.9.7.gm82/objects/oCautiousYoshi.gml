#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0.26
makeActive()
setCollisionBounds(-7,-28,7,-1)
runAcc=1
bWalking=false
walkingTime=round(random(120)+30)
stringToShow="I advise you to stock up on as many items as#you can before going in there."
talker="Cautious Yoshi"
bStandOnly=false
bWaitForInput=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
  npcYoshiWalk(sYoshiRedStand,sYoshiRedWalk,sYoshiRedStomp)
#define Collision_oPlayer1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (keyboard_check_pressed(ord(global.ctrlUp))) or keyboard_check_pressed(vk_up) and global.gamePaused=false
{
  bWalking=false
  xVel=0
  sprite_index=sYoshiRedStand
  walkingTime=150
  if x<=oPlayer1.x
    image_xscale=1
  else
    image_xscale=-1

  npcTextBox()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale,0,image_blend,1)
