#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
tutX=16
tutY=56
tutAlpha=0
fadeSpeed=0.2
currentTut=""
sceneProgress=0
sceneDelay=0
otherTime=0
cyborgTextHax=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if global.gameProgress<4
    global.p1RaveEnergy=0
  if global.gameProgress=-9 //tutorial room
  {
    if sceneProgress=0
    {
      sceneDelay+=1
      if sceneDelay>=30
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
    else if sceneProgress=1
    {
      if otherTime=25
      {
        msgCreate("Geez, I was TRYING to read that location indicator.",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=120
        otherTime=200
      }
      else
        otherTime+=1
      if tutAlpha<1
        tutAlpha+=fadeSpeed
      if oPlayer1.x>=544
        sceneProgress+=1
      currentTut="<<Movement Info>>#[" +string(global.ctrlLeft) +string("] Move left    [") +string(global.ctrlRight) +string("] Move right    [") +string(global.ctrlDown) +string("] Crouch")
    }
    else if sceneProgress=2
    {
      if tutAlpha>0
        tutAlpha-=fadeSpeed
      else
      {
        otherTime=0
        sceneProgress+=1
      }
    }
    else if sceneProgress=3
    {
      if tutAlpha<1
        tutAlpha+=fadeSpeed
      if oPlayer1.x>=1216
        sceneProgress+=1
      currentTut="<<Movement Info>>#[" +string(global.ctrlJump) +string("] Jump#The longer jump is held down, the higher you will jump.")
    }
    else if sceneProgress=4
    {
      if tutAlpha>0
        tutAlpha-=fadeSpeed
      else
      {
        tutY=296
        otherTime=0
        sceneProgress+=1
      }
    }
    else if sceneProgress=5
    {
      if tutAlpha<1
        tutAlpha+=fadeSpeed
      if oPlayer1.x>=2208
        sceneProgress+=1
      currentTut="<<Movement Info>>#If [" +string(global.ctrlDown) +string("] is held before jumping, ") +string(global.mainCharacters[0]) +string(" will quickly dash back#If [") +string(global.ctrlUp) +string("] is held before jumping, ") +string(global.mainCharacters[0]) +string(" will quickly dash forward#Try it to get across this gap.")
    }
    else if sceneProgress=6
    {
      if tutAlpha>0
        tutAlpha-=fadeSpeed
      else
      {
        tutY=56
        sceneProgress+=1
      }
    }
    else if sceneProgress=7
    {
      if tutAlpha<1
        tutAlpha+=fadeSpeed
      if oPlayer1.x>=2672
        sceneProgress+=1
      currentTut="<<Scanning Info>>#You can use the mouse to left-click on hostile targets.#This will bring up some general statistics and info on the target.#Useful if you come across a tough opponent, just want some info, or are bored."
    }
    else if sceneProgress=8
    {
      if tutAlpha>0
        tutAlpha-=fadeSpeed
      else
        sceneProgress+=1
    }
    else if sceneProgress=9
    {
      if tutAlpha<1
        tutAlpha+=fadeSpeed
      if oPlayer1.x>=2960
        sceneProgress+=1
      currentTut="<<General Info>>#[" +string(global.ctrlUp) +string("] Interact with objects#The chest here can be opened by standing over it and pressing up.#The Binary Index contains information, you can decode it's contents#by pressing up near it.")
    }
    else if sceneProgress=10
    {
      if tutAlpha>0
        tutAlpha-=fadeSpeed
      else
      {
        tutY=296
        sceneProgress+=1
      }
    }
  }
  if global.gameProgress=-8 //combat tutorial
  {
    if oPlayer1.life<oPlayer1.maxLife
      oPlayer1.life+=7
    if tutAlpha<1
      tutAlpha+=fadeSpeed
    currentTut="<<Combat Info>>#[" +string(global.ctrlAttack) +string("] Use Physical Attacks#Holding different directions with the attack will make you perform different strikes.#[") +string(global.ctrlAttack) +string("] Full Swing     [") +string(global.ctrlUp) +string("]+[") +string(global.ctrlAttack) +string("] Upward Attack     [") +string(global.ctrlLeft) +string("]or[") +string(global.ctrlRight) +string("]+[") +string(global.ctrlAttack) +string("] Thrusting Attack#[") +string(global.ctrlDown) +string("]+[") +string(global.ctrlAttack) +string("] Downward Attack(On the ground)     [") +string(global.ctrlDown) +string("]+[") +string(global.ctrlAttack) +string("] Jump Attack(In mid-air)")
  }
  else if global.gameProgress=1 //first room
  {
    if sceneProgress=0
    {
      if oPlayer1.x>=160
      {
        tutY=56
        sceneProgress+=1
      }
    }
    if sceneProgress=1
    {
      if tutAlpha<1
        tutAlpha+=fadeSpeed
      if oPlayer1.x>=512
        sceneProgress+=1
      currentTut="<<General Info>>#The pillar will fully restore Health and Spirit Energy#if you interact with it using Up - [" +string(global.ctrlUp) +string("]")
    }
    else if sceneProgress=2
    {
      if tutAlpha>0
        tutAlpha-=fadeSpeed
      else
        sceneProgress+=1
    }
    else if sceneProgress=3
    {
      if oPlayer1.x>=960
        sceneProgress+=1
    }
    else if sceneProgress=4
    {
      if tutAlpha<1
        tutAlpha+=fadeSpeed
      otherTime+=1
      if otherTime=60
      {
        msgCreate("I kinda want to see the screen where that text box is.",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=120
      }
      else if otherTime=200
      {
        msgCreate("Don't you just love tutorial boxes that get in the way?",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=120
      }
      currentTut="<<Pause Menu Info>>#[P] Open/Close pause menu#[WASD] Move menu cursor     [J] Confirm menu selection     [U or I] Swap sub-menus#From the menu, you can use items, swap/view techniques,#learn skills, and set some options."
    }
  }
  else if global.gameProgress=2 //second room
  {
    if sceneProgress=0
    {
      if oPlayer1.x>=368
      {
        tutY=296
        sceneProgress+=1
      }
    }
    else if sceneProgress=1
    {
      if oPlayer1.spiritEnergy<oPlayer1.maxSpiritEnergy
        oPlayer1.spiritEnergy+=5
      if oPlayer1.fireEnergy<oPlayer1.maxFireEnergy
        oPlayer1.fireEnergy+=5
      if oPlayer1.waterEnergy<oPlayer1.maxWaterEnergy
        oPlayer1.waterEnergy+=5
      if oPlayer1.windEnergy<oPlayer1.maxWindEnergy
        oPlayer1.windEnergy+=5
      if oPlayer1.earthEnergy<oPlayer1.maxEarthEnergy
        oPlayer1.earthEnergy+=5
      draw_set_halign(fa_left)
      draw_set_font(fnt_showMessage)
      draw_set_color(make_color_rgb(248,248,216))
      draw_set_alpha(1)
      draw_text(view_xview[0]+452,view_yview[0]+68,"BOOSTED")
      if tutAlpha<1
        tutAlpha+=fadeSpeed
      if global.switchTrigger[1]=1
        sceneProgress+=1
      if otherTime=30
      {
        msgCreate("Great, it covers the entire bottom of the screen.",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=120
        otherTime=200
      }
      else
        otherTime+=1
      currentTut="<<Spirit Info>>#" +string(global.mainCharacters[0]) +string(" has the ability to cast spells from the four elements.#[") +string(global.ctrlSpell) +string("] Cast a spell from the current active element.#[") +string(global.ctrlCycleBack) +string(",") +string(global.ctrlCycleForward) +string("] Swap between the elements. Each spell uses a bit of Spirit Energy as well as energy#from the called element. Try using a fire spell to hit the switch on the top ledge.")
    }
    else if sceneProgress=2
    {
      if tutAlpha>0
        tutAlpha-=fadeSpeed
      else
      {
        tutY=64
        otherTime=0
        sceneProgress+=1
      }
    }
    else if sceneProgress=3
    {
      if tutAlpha<1
        tutAlpha+=fadeSpeed
      if oPlayer1.x>=1392
        sceneProgress+=1
      if otherTime=30
      {
        msgCreate("Look at that, new info on the screen.#That should be useful info.",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=120
        otherTime=200
      }
      else
        otherTime+=1
      currentTut="<<Combat Info>>#Additionally while an element is active it is also fused onto your weapon.#Attacks made with an element fused will have properties of that element.#Enemies are weak and resistant to different elements, take advantage#of these during combat. Try using the Earth element here."
    }
  }
  else if global.gameProgress=3 //third room
  {
    if sceneProgress=0
    {
      sceneDelay+=1
      if sceneDelay>=30
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
    else if sceneProgress=1
    {
      if oPlayer1.x>=432
        sceneProgress+=1
      if tutAlpha<1
        tutAlpha+=fadeSpeed
      currentTut="<<General Info>>#On the ledge above is a Skill Capsule. Each is worth 1 Skill Point.#In the Skill submenu, Skill Points can be used to boost various attributes.#Open the menu [P] and learn skills with the confirm key [J] in the skills menu."
    }
    else if sceneProgress=2
    {
      if tutAlpha>0
        tutAlpha-=fadeSpeed
      else
        sceneProgress+=1
    }
  }
  else if global.gameProgress=6 //fourth room
  {
    if sceneProgress=0
    {
      sceneDelay+=1
      if sceneDelay>=15
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
    else if sceneProgress=1
    {
      if oPlayer1.x>=480
        sceneProgress+=1
      if tutAlpha<1
        tutAlpha+=fadeSpeed
      currentTut=string("<<Saving Info>>#You can save by going into the doors marked SAVE.#Press Up [") +string(global.ctrlUp) +string("] to go into them.")
    }
    else if sceneProgress=2
    {
      if tutAlpha>0
        tutAlpha-=fadeSpeed
      else
        sceneProgress+=1
    }
    else if sceneProgress=3
    {
      if oPlayer1.x>=1024
        sceneProgress+=1
    }
    else if sceneProgress=4
    {
      if global.switchTrigger[2]=1
        sceneProgress+=1
      if tutAlpha<1
        tutAlpha+=fadeSpeed
      currentTut="<<General Info>>#The color of the crystal above the switch indicates which element is#needed to unlock it. Which element is green associated with?"
    }
    else if sceneProgress=5
    {
      if tutAlpha>0
        tutAlpha-=fadeSpeed
      else
        sceneProgress+=1
    }
  }
  else if global.gameProgress=7 //fifth room
  {
    if sceneProgress=0
    {
      sceneDelay+=1
      if sceneDelay>=30
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
    else if sceneProgress=1
    {
      if oPlayer1.x>=480
        sceneProgress+=1
      if tutAlpha<1
        tutAlpha+=fadeSpeed
      currentTut="<<Death Info>>#Bottomless pits are bottomless.#If you lose all your health, you will be brought to the Game Over screen.#You can choose to retry the current map, if you do, any money#obtained from enemies as well as Awesome Points will be lost.#Money from chests and Exp/Lv will be maintained."
    }
    else if sceneProgress=2
    {
      if tutAlpha>0
        tutAlpha-=fadeSpeed
      else
        sceneProgress+=1
    }
  }
  else if global.gameProgress=9 //room 6 - Displaced Cyborg Boss Fight
  {
    if sceneProgress=0
    {
      if oPlayer1.tookHitAmount>=5
      {
        tutX=176
        tutY=314
        if tutAlpha<1
          tutAlpha+=fadeSpeed
        else
          sceneProgress+=1
        currentTut="Help Info#" +string(global.mainCharacters[0]) +string(" can dash through the Cyborg's rock attack.#Try dashing just before they reach you.#Dash reminder: Hold up or down while pressing jump.")
      }
    }
    else if sceneProgress=1
    {
      sceneDelay+=1
      if sceneDelay>=210
      {
        if tutAlpha>0
          tutAlpha-=fadeSpeed
        else
          sceneProgress+=1
      }
    }
    if cyborgTextHax=0 and oDCyborg.specialRockAttack=4 and oDCyborg.currentAttack=2 and oDCyborg.attackDelay=oDCyborg.waitTime
    {
      stringToShow="Activating Rock Formation Type: 0041...#Deletion of Datatype Anomally Commencing...#Calculating Distance Formula to Maximize Threat Value..."
      messageWidth=string_width(stringToShow)
      newMessage=instance_create(256-(messageWidth/2),112,oMessagePerson)
      newMessage.message=stringToShow
      newMessage.talker="Displaced Cyborg"
      newMessage.fadingTime=120
      cyborgTextHax+=1
    }
    else if cyborgTextHax=1
    {
      otherTime+=1
      if otherTime>=90
        cyborgTextHax+=1
    }
    else if cyborgTextHax=2
    {
      stringToShow="That is so lame, it's covering it's attack with a text box."
      messageWidth=string_width(stringToShow)
      newMessage=instance_create(256-(messageWidth/2),56,oMessagePerson)
      newMessage.message=stringToShow
      newMessage.talker=global.mainCharacters[0]
      newMessage.fadingTime=120
      cyborgTextHax+=1
    }
  }
}

if currentTut!=""
  showMessage(view_xview[0]+tutX,view_yview[0]+tutY,currentTut,"",0,tutAlpha)
