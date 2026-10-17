#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
itemCheck=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.moneyChest[objectNum]=0 and itemCheck=0
{
  extraItemAlert()
  itemCheck=1
}
#define Collision_oPlayer1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*
Chest script.
objectNum relates to which global flag to write to.
0 = item has not been obtained.
1 = item has been obtained.

objectType relates to how much money to give.
*/
//if (keyboard_check_pressed(ord(global.ctrlUp)) or keyboard_check_pressed(vk_up)) and global.gamePaused=false
if (keyboard_check_pressed(ord(global.ctrlUp)) or (keyboard_check_pressed(vk_up) or scrPadPressed(3))) and global.gamePaused=false //gamepad change: and the gamepad's Up (scrGamepadInit)
{
  if global.moneyChest[objectNum]=0
  {
    with oMessageSign
      instance_destroy()
    global.moneyChest[objectNum]=1
    playSound(global.snd_ChestOpen,0,1)
    stringToShow="You found " +string(objectType) +string(" Internetz!")
    messageWidth=string_width(stringToShow)
    newMessage=instance_create(256-(messageWidth/2),48,oMessageSign)
    newMessage.message=stringToShow
    newMessage.fadingTime=60
    global.recTotalInternetzEarned+=objectType
    oPlayer1.moneyTotal+=objectType
    global.p1MoneyTotal+=objectType
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,global.moneyChest[objectNum],x,y)
