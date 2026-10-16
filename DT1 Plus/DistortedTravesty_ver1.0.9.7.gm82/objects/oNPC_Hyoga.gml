#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
bLooksAtPlayer=true

if global.gameProgress<=85
  stringToShow=string(global.mainCharacters[5]) +string(" can be found in that large apartment#building to the east.")
else if global.gameProgress>=86 and global.gameProgress<=98
  stringToShow="I hope you can stop that Quick Time Machine."
else if global.gameProgress>=99 and global.gameProgress<=181
  stringToShow="Stopped it I see... I heard about " +string(global.mainCharacters[5]) +string(", that really sucks.#Kick their asses man.")
else if global.gameProgress>=182 and global.gameProgress<=241
  stringToShow="Whoa dude! You totally rocked their world!#I think we can win against The Darkness now.#You just infiltrated a place like THAT!"
else if global.gameProgress>=242
  stringToShow=string(global.mainCharacters[5]) +string(" has not come out of the building at all.#This is very unlike him. I wonder what he saw or what they did to him.#I've been very concerned, but he won't talk to anyone.")
talker="Hyoga"
bTalking=false
sceneProgress=0
bWaitForInput=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if bLooksAtPlayer=true
  {
    if x<=oPlayer1.x
      image_xscale=1
    else
      image_xscale=-1
  }
}

if bTalking=true
{
  if sceneProgress=0 and bWaitForInput=false
    msgCreate("Dude, what are you doing here?#You got sucked into that strange portal thing too?",1,oMessageCutscene,talker)
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("Yeah, it has sucked and kicked ass all at the same time!#As for what I'm doing here, I don't know.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Well we've had one heck of a time here trying to fend off these Darkness creatures.#They keep trying to get into the city.#Now I've seen some crazy things in my time, but these things... MAN!#So I saw you walk in, no way you can tell me that you were out there?!",1,oMessageCutscene,talker)
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("I was actually, I've had a few run-ins with these guys too.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("That's pretty sick man.#What brings you here then?",1,oMessageCutscene,talker)
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("I'm trying to find this Quick Time Machine.#If it's not stopped, the world will be plagued with Quick Time Events.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("If anyone knows where this thing is, it would be " +string(global.mainCharacters[5]) +string("."),1,oMessageCutscene,talker)
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Dude, he's here?!#Bad ass, we go way back, we used to play Super Ma...#Yeah, nevermind...",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8
  {
    bTalking=false
    global.gamePaused=false
    sceneProgress=10
  }

  keyWaitForInput()
}
#define Collision_oPlayer1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (keyboard_check_pressed(ord(global.ctrlUp))) or keyboard_check_pressed(vk_up) and global.gamePaused=false
{
  if x<=oPlayer1.x
    image_xscale=1
  else
    image_xscale=-1

  if global.gameProgress=83
  {
    if sceneProgress=0
    {
      stopPlayer()
      oPlayer1.sprite_index=sPlayerIdle
      oPlayer1.y=y
      bTalking=true
      global.gamePaused=true
    }
    else
      npcTextBox()
  }

  if global.gameProgress>=84
    npcTextBox()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale,0,image_blend,1)
