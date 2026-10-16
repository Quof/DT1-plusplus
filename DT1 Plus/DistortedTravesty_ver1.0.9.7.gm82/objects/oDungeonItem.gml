#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.dungeonItems[dunNum,objectType]=1
  instance_destroy()
#define Collision_oPlayer1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*
Dungeon Item script.
objectNum relates to which global flag to write to.
0 = item has not been obtained.
1 = item has been obtained.
Each dungeon will use 3.

objectType relates to which object to give.
0=Map
1=Compass
2=Boss Key
*/
global.dungeonItems[dunNum,objectType]=1
playSound(global.snd_HeartPiece,0,1)
if objectType=0
  stringToShow="You found the Map!#You can now see where all the rooms are."
else if objectType=1
  stringToShow="You found the Compass!#You can now see where all the items are."
else if objectType=2
  stringToShow="You found the Boss Key!#You can now enter the room where the boss lies."
messageWidth=string_width(stringToShow)
newMessage=instance_create(256-(messageWidth/2),48,oMessageSign)
newMessage.message=stringToShow
newMessage.fadingTime=60
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sDungeonItems,objectType,x,y)
