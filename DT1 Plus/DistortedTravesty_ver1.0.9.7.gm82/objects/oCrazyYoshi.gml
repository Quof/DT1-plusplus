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
stringToShow="I'm not really angry at you, I'm just frustrated right now.#I need some time to think."
talker="Crazy Yoshi"
bStandOnly=false
bTalking=false
sceneProgress=0
bWaitForInput=false

if global.gameProgress>=242
{
  sceneProgress=10
  stringToShow="Knowing that I don't really exist is depressing.#But wait... if I'm able to feel depressed then... do I actually exist?#I'm aware that I'm in a depressed state, maybe that's all existance really is...#just awareness of one's self."
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
  npcYoshiWalk(sYoshiGreenStand,sYoshiGreenWalk,sYoshiGreenStomp)

if bTalking=true
{
  if sceneProgress=0 and bWaitForInput=false
    msgCreate("Why am I labeled as a Crazy Yoshi?#I'm not THAT crazy, AHHH!!",1,oMessageCutscene,talker)
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("Need help with anything?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("I'm fine, I'm just venting some frustration.",1,oMessageCutscene,talker)
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Oh... well then I'll be on my way, but before I do...",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("THE ANSWER IS NO!!",1,oMessageCutscene,talker)
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Whoa, I didn't realize you guys were that sensitive about it.#How did you know I was going to ask that?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("I'm a Yoshi, what do you think?",1,oMessageCutscene,talker)
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Oh right.",1,oMessageCutscene,global.mainCharacters[0])
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
//if (keyboard_check_pressed(ord(global.ctrlUp))) or keyboard_check_pressed(vk_up) and global.gamePaused=false
if (keyboard_check_pressed(ord(global.ctrlUp))) or (keyboard_check_pressed(vk_up) or scrPadPressed(3)) and global.gamePaused=false //gamepad change: and the gamepad's Up (scrGamepadInit)
{
  bWalking=false
  xVel=0
  sprite_index=sYoshiGreenStand
  walkingTime=150
  if x<=oPlayer1.x
    image_xscale=1
  else
    image_xscale=-1

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
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale,0,image_blend,1)
