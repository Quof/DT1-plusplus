#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
chestFrame=0
bShowBeadIcon=false
bTutorial=true
tutorialProgress=0
tutorialDelay=0
itemCheck=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//Equip Tutorial
if tutorialProgress>0 and tutorialProgress<100
{
  if bTutorial=false //Normal Pause
  {
    if tutorialProgress=1 and bWaitForInput=false
      msgCreate("Press confirm to close.",1,oMessageCutscene,"")
    else if tutorialProgress=2
    {
      with oMessageSign
        instance_destroy()
      bShowBeadIcon=false
      tutorialProgress=1000
      global.gamePaused=false
    }
  }
  else bTutorial=true //Equip Tutorial
  {
    if tutorialProgress=1 and bWaitForInput=false
      msgCreate("Press confirm to close.",1,oMessageCutscene,"")
    else if tutorialProgress=2 and bWaitForInput=false
    {
      msgCreate("You just got your first Friendship Bead.#To equip it, open your menu and go to the Inventory submenu.#Scroll to your Friendship Bracelet#and press the confirm key.",1,oMessageCutscene,"")
      with oMessageSign
        instance_destroy()
      bShowBeadIcon=false
    }
    else if tutorialProgress=3 and bWaitForInput=false
      msgCreate("You can check/attach the beads to the bracelet from there.",1,oMessageCutscene,"")
    else if tutorialProgress=4
    {
      tutorialProgress=1000
      global.gamePaused=false
    }
  }

  //Wait for input
  //if keyboard_check_pressed(ord("J")) and bWaitForInput=true
  if (keyboard_check_pressed(ord("J")) or scrPadPressed(17)) and bWaitForInput=true //gamepad change: and the gamepad's Menu Confirm (scrGamepadInit)
  {
    io_clear()
    scrGamepadSync() //gamepad change (added): and the gamepad's presses (io_clear only clears the keyboard's, so a pad press it was meant to use up still counted for the rest of the frame: A that closed dialogue also jumped, Up at a door went through the door it arrived at and back)
    bWaitForInput=false
    with oMessageCutscene
      instance_destroy()
    tutorialProgress+=1
  }
}
if global.invBracelet[objectNum]=0 and itemCheck=0
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

objectType relates to which bead to show in the message
*/
//if (keyboard_check_pressed(ord(global.ctrlUp)) or keyboard_check_pressed(vk_up)) and global.gamePaused=false
if (keyboard_check_pressed(ord(global.ctrlUp)) or (keyboard_check_pressed(vk_up) or scrPadPressed(3))) and global.gamePaused=false //gamepad change: and the gamepad's Up (scrGamepadInit)
{
  if global.invBracelet[objectNum]=0
  {
    for(i=0;i<18;i+=1)
    {
      if global.invBracelet[i]>=1
      {
        bTutorial=false
        break;
      }
    }
    with oMessageSign
      instance_destroy()
    global.invBracelet[objectNum]=1
    playSound(global.snd_ChestOpen,0,1)

    stringToShow="You obtained the [" +string(objectType) +string("]!")
    messageWidth=string_width(stringToShow)
    newMessage=instance_create(256-(messageWidth/2),112,oMessageSign)
    newMessage.message=stringToShow
    newMessage.fadingTime=100000
    messageWidth=string_width(objectInfo)
    newMessage=instance_create(256-(messageWidth/2),152,oMessageSign)
    newMessage.message=objectInfo
    newMessage.fadingTime=100000

    bShowBeadIcon=true
    global.gamePaused=true
    bWaitForInput=false
    tutorialProgress=1
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
chestFrame=global.invBracelet[objectNum]
if chestFrame>1
  chestFrame=1
draw_sprite(sprite_index,chestFrame,x,y)
if bShowBeadIcon=true
{
  beadIconX=view_xview[0]+246
  beadIconY=view_yview[0]+132
  draw_set_alpha(1)
  draw_set_color(make_color_rgb(213,180,112))
  draw_rectangle(beadIconX,beadIconY,beadIconX+17,beadIconY+17,false)
  draw_set_color(make_color_rgb(184,104,8))
  draw_rectangle(beadIconX,beadIconY,beadIconX+17,beadIconY+17,true)
  draw_sprite(sFriendBeads,objectNum,beadIconX+1,beadIconY+1)
}
