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
if global.itemChest[objectNum]=0 and itemCheck=0
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

objectType relates to which object to give.
100 set are consumables
200 set are weapon gems
300 set are armor
400 set are accessories
*/
//if (keyboard_check_pressed(ord(global.ctrlUp)) or keyboard_check_pressed(vk_up)) and global.gamePaused=false
if (keyboard_check_pressed(ord(global.ctrlUp)) or (keyboard_check_pressed(vk_up) or scrPadPressed(3))) and global.gamePaused=false //gamepad change: and the gamepad's Up (scrGamepadInit)
{
  var messageFadeTime;
  messageFadeTime=60
  if global.itemChest[objectNum]=0
  {
    with oMessageSign
      instance_destroy()
    global.itemChest[objectNum]=1
    playSound(global.snd_ChestOpen,0,1)
    if objectType=101
    {
      if oPlayer1.conSkittles<9
      {
        stringToShow="You found a bag of [Skittles]! Yay!"
        oPlayer1.conSkittles+=1
        global.p1Skittles+=1
      }
      else
      {
        stringToShow="You cannot hold anymore Skittles.#So you were awarded 64 Internetz instead."
        global.recTotalInternetzEarned+=64
        oPlayer1.moneyTotal+=64
        global.p1MoneyTotal+=64
      }
    }
    else if objectType=102
    {
      if oPlayer1.conSmoothie<3
      {
        stringToShow="You found a [Turbo Smoothie]!#TURBO SMOOTH!!"
        oPlayer1.conSmoothie+=1
        global.p1Smoothie+=1
      }
      else
      {
        stringToShow="You cannot hold anymore Turbo Smoothies.#So you were awarded 320 Internetz instead."
        global.recTotalInternetzEarned+=320
        oPlayer1.moneyTotal+=320
        global.p1MoneyTotal+=320
      }
    }
    else if objectType=103
    {
      if oPlayer1.conStarburst<5
      {
        stringToShow="You found some [Starbursts]! Bad ass!"
        oPlayer1.conStarburst+=1
        global.p1Starburst+=1
      }
      else
      {
        stringToShow="You cannot hold anymore Starbursts.#So you were awarded 128 Internetz instead."
        global.recTotalInternetzEarned+=128
        oPlayer1.moneyTotal+=128
        global.p1MoneyTotal+=128
      }
    }
    else if objectType=104
    {
      if oPlayer1.conGummyBears<7
      {
        stringToShow="You found an entire bag of Haribo [Gummy Bears]! Sweet!"
        oPlayer1.conGummyBears+=1
        global.p1GummyBears+=1
      }
      else
      {
        stringToShow="You cannot hold anymore Gummy Bears.#So you were awarded 104 Internetz instead."
        global.recTotalInternetzEarned+=104
        oPlayer1.moneyTotal+=104
        global.p1MoneyTotal+=104
      }
    }
    else if objectType=201
    {
      stringToShow="You found the [Item Finder]!#When you enter a new map, you will hear a sound alerting you#if there is an extra item in that room.#This can be turned off from the options menu."
      global.hasItemFinder=2
      messageFadeTime=300
    }
    else if objectType=301
    {
      stringToShow="You found a [Weapon Gem]."
      global.p1WeaponGem=global.invWeaponGems[1]
    }
    messageWidth=string_width(stringToShow)
    newMessage=instance_create(256-(messageWidth/2),48,oMessageSign)
    newMessage.message=stringToShow
    newMessage.fadingTime=messageFadeTime
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,global.itemChest[objectNum],x,y)
