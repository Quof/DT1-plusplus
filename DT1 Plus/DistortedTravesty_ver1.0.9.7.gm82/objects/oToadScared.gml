#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
makeActive()
setCollisionBounds(-7,-26,7,-1)
runAcc=1
bWalking=false
walkingTime=round(random(120)+30)
if global.gameProgress<=32
  stringToShow="If you head east from here and continue down#the path, you'll come across a scary castle."
else if global.gameProgress>=33
  stringToShow="Did you know that when you have downward momentum#in the air when you connect an attack, you will hover in the air for a moment?#You can actually chain many of these together."
talker="Scared Toad"
bStandOnly=false
image_blend=c_ltgray
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  npcWalk()
}
#define Collision_oPlayer1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if (keyboard_check_pressed(ord(global.ctrlUp))) or keyboard_check_pressed(vk_up) and global.gamePaused=false
if (keyboard_check_pressed(ord(global.ctrlUp))) or (keyboard_check_pressed(vk_up) or scrPadPressed(3)) and global.gamePaused=false //gamepad change: and the gamepad's Up (scrGamepadInit)
{
  bWalking=false
  xVel=0
  image_speed=0
  image_index=0
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
