#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//Integrated Visualization System (IVS)
musicCheck=false //check music on load
menuOpen=false //if the pause menu is open
image_speed=0.1 //cursor image speed
lineEffectMax=0
lineEffect=0
currentMenu=1 //menu section
subCursorPos=1 //cursor position in sub menu
menuMax=0 //max entries in menu selection
cursorPosX=1
cursorPosY=1
menuCursorX=266
menuCursorY=203
cursorIncX=36 //cursor x movement increment
cursorIncY=24 //cursor y movement increment
identCursorX=0
identCursorY=0
bChangedMenu=false //whether menu was changed
itemName="" //item name
itemInfo="" //item info message
itemCapacityType="" //item capacity type
itemCapacity=0 //item capacity
hitComboAlpha=0 //combo counter alpha
hitComboFadeTime=0 //combo fade/reset time
killChainAlpha=0 //kill chain alpha
killChainFadeTime=0 //kill chain fade/reset time
killChainText=0
redRingAlpha=0.7
redRingAlphaDrop=true
//dash point colors==========
dpBorder=make_color_rgb(64,33,15)
dpOff=make_color_rgb(114,49,21)
dpOn=make_color_rgb(247,190,74)
//life bar drop==========
oldTrack=0
newTrack=0
dropAngle=0
dropAlpha=1
dropAlphaTime=0
yDrop=0
yDropSpeed=0
bShowLifeDrop=false //show life bar drop when hit

background_index[7]=backStatic
background_alpha[7]=0.07
background_foreground[7]=true
background_hspeed[7]=31
background_vspeed[7]=21
//input commands==========
curUp=ord("W")
curDown=ord("S")
curLeft=ord("A")
curRight=ord("D")
curMenuShiftBack=ord("U")
curMenuShiftForward=ord("I")
curConfirm=ord("J")
curCancel=ord("K")
curChange=ord("L")
curTeleport=ord("M")
curInfo=vk_f1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//--------------------------------
//---------- PAUSE MENU ----------
//--------------------------------
if global.gamePaused=true and menuOpen=true
{
  //cursor movement------------------------------------------------------------
  if currentMenu=2 //Inventory----------
  {
    if keyboard_check_pressed(curUp) or keyboard_check_pressed(vk_up)
    {
      playSound(global.snd_MenuCursor,0,1)
      if cursorPosY=1
      {
        cursorPosY=menuMax
        menuCursorY+=cursorIncY*(menuMax-1)
      }
      else
      {
        cursorPosY-=1
        menuCursorY-=cursorIncY
      }
    }
    if keyboard_check_pressed(curDown) or keyboard_check_pressed(vk_down)
    {
      playSound(global.snd_MenuCursor,0,1)
      if cursorPosY=menuMax
      {
        cursorPosY=1
        menuCursorY-=cursorIncY*(menuMax-1)
      }
      else
      {
        cursorPosY+=1
        menuCursorY+=cursorIncY
      }
    }
    if keyboard_check_pressed(curConfirm)
    {
      if global.location!="Spire of Forgotten Souls"
      {
        if cursorPosY=1
        {
          if oPlayer1.conSkittles>0
          {
            if global.currentBoss=""
            {
              if oPlayer1.life=oPlayer1.maxLife
              {
                playSound(global.snd_MenuCancel,0,1)
                with oMessageMenuPopup
                  instance_destroy()
                stringToShow="Your life is already full."
                messageWidth=string_width(stringToShow)
                newMessage=instance_create(floor(256-(messageWidth/2)),192,oMessageMenuPopup)
                newMessage.message=stringToShow
                newMessage.fadingTime=40
              }
              else
              {
                playSound(global.snd_HealingPlant,0,1)
                global.recItemsUsed+=1
                oPlayer1.conSkittles-=1
                healValue=round(oPlayer1.maxLife*0.3)
                oPlayer1.life+=healValue
              }
            }
            else
            {
              playSound(global.snd_MenuCancel,0,1)
              with oMessageMenuPopup
                instance_destroy()
              stringToShow="You cannot use items during a boss fight."
              messageWidth=string_width(stringToShow)
              newMessage=instance_create(floor(256-(messageWidth/2)),192,oMessageMenuPopup)
              newMessage.message=stringToShow
              newMessage.fadingTime=40
            }
          }
          else
            playSound(global.snd_MenuCancel,0,1)
        }
        else if cursorPosY=2
        {
          if oPlayer1.conSmoothie>0
          {
            if global.currentBoss=""
            {
              if oPlayer1.life=oPlayer1.maxLife
              {
                playSound(global.snd_MenuCancel,0,1)
                with oMessageMenuPopup
                  instance_destroy()
                stringToShow="Your life is already full."
                messageWidth=string_width(stringToShow)
                newMessage=instance_create(floor(256-(messageWidth/2)),192,oMessageMenuPopup)
                newMessage.message=stringToShow
                newMessage.fadingTime=40
              }
              else
              {
                playSound(global.snd_HealingPlant,0,1)
                global.recItemsUsed+=1
                oPlayer1.conSmoothie-=1
                oPlayer1.life=oPlayer1.maxLife
              }
            }
            else
            {
              playSound(global.snd_MenuCancel,0,1)
              with oMessageMenuPopup
                instance_destroy()
              stringToShow="You cannot use items during a boss fight."
              messageWidth=string_width(stringToShow)
              newMessage=instance_create(floor(256-(messageWidth/2)),192,oMessageMenuPopup)
              newMessage.message=stringToShow
              newMessage.fadingTime=40
            }
          }
          else
            playSound(global.snd_MenuCancel,0,1)
        }
        else if cursorPosY=3
        {
          if oPlayer1.conStarburst>0
          {
            if global.currentBoss=""
            {
              playSound(global.snd_HealingPlant,0,1)
              global.recItemsUsed+=1
              oPlayer1.conStarburst-=1
              oPlayer1.spiritEnergy=oPlayer1.maxSpiritEnergy
              oPlayer1.fireEnergy=oPlayer1.maxFireEnergy
              oPlayer1.waterEnergy=oPlayer1.maxWaterEnergy
              oPlayer1.windEnergy=oPlayer1.maxWindEnergy
              oPlayer1.earthEnergy=oPlayer1.maxEarthEnergy
            }
            else
            {
              playSound(global.snd_MenuCancel,0,1)
              with oMessageMenuPopup
                instance_destroy()
              stringToShow="You cannot use items during a boss fight."
              messageWidth=string_width(stringToShow)
              newMessage=instance_create(floor(256-(messageWidth/2)),192,oMessageMenuPopup)
              newMessage.message=stringToShow
              newMessage.fadingTime=40
            }
          }
          else
            playSound(global.snd_MenuCancel,0,1)
        }
        else if cursorPosY=4
        {
          if oPlayer1.conGummyBears>0
          {
            if global.currentBoss=""
            {

              if global.gameProgress>=183 and global.gameProgress<=323
              {
                playSound(global.snd_HealingPlant,0,1)
                global.recItemsUsed+=1
                global.shroudThreat=0
                global.p1GummyBears-=1
                oPlayer1.conGummyBears-=1
              }
              else
              {
                playSound(global.snd_MenuCancel,0,1)
                with oMessageMenuPopup
                  instance_destroy()
                stringToShow="No need to use this right now."
                messageWidth=string_width(stringToShow)
                newMessage=instance_create(floor(256-(messageWidth/2)),192,oMessageMenuPopup)
                newMessage.message=stringToShow
                newMessage.fadingTime=40
              }
            }
            else
            {
              playSound(global.snd_MenuCancel,0,1)
              with oMessageMenuPopup
                instance_destroy()
              stringToShow="You cannot use items during a boss fight."
              messageWidth=string_width(stringToShow)
              newMessage=instance_create(floor(256-(messageWidth/2)),192,oMessageMenuPopup)
              newMessage.message=stringToShow
              newMessage.fadingTime=40
            }
          }
          else
            playSound(global.snd_MenuCancel,0,1)
        }
      }
      else
      {
        with oMessageMenuPopup
          instance_destroy()
        stringToShow="You cannot use items here."
        messageWidth=string_width(stringToShow)
        newMessage=instance_create(floor(256-(messageWidth/2)),192,oMessageMenuPopup)
        newMessage.message=stringToShow
        newMessage.fadingTime=40
      }
      if cursorPosY=8 //bead menu
      {
        playSound(global.snd_MenuConfirm,0,1)
        subCursorPos=1
        cursorPosX=1
        cursorPosY=1
        subMenuBeadX=menuMainX+42
        subMenuBeadY=menuMainY+12
        beadCursorPosX=subMenuBeadX+6
        beadCursorPosY=subMenuBeadY+16
        currentMenu=100
      }
    }
  }
  else if currentMenu=3 //Techniques----------
  {
    if keyboard_check_pressed(curUp) or keyboard_check_pressed(vk_up)
    {
      playSound(global.snd_MenuCursor,0,1)
      if cursorPosY=1
      {
        cursorPosY=menuMax
        menuCursorY+=cursorIncY*(menuMax-1)
      }
      else
      {
        cursorPosY-=1
        menuCursorY-=cursorIncY
      }
    }
    if keyboard_check_pressed(curDown) or keyboard_check_pressed(vk_down)
    {
      playSound(global.snd_MenuCursor,0,1)
      if cursorPosY=menuMax
      {
        cursorPosY=1
        menuCursorY-=cursorIncY*(menuMax-1)
      }
      else
      {
        cursorPosY+=1
        menuCursorY+=cursorIncY
      }
    }
    if keyboard_check_pressed(curLeft) or keyboard_check_pressed(vk_left)
    {
      playSound(global.snd_MenuCursor,0,1)
      if subCursorPos=1
        subCursorPos=5
      else
        subCursorPos-=1
      cursorPosY=1
      menuCursorY=menuMainY+28
    }
    if keyboard_check_pressed(curRight) or keyboard_check_pressed(vk_right)
    {
      playSound(global.snd_MenuCursor,0,1)
      if subCursorPos=5
        subCursorPos=1
      else
        subCursorPos+=1
      cursorPosY=1
      menuCursorY=menuMainY+28
    }
    if keyboard_check_pressed(curConfirm)
    {
      if oPlayer1.attackState!=oPlayer1.ACT_CASTING
      {
        if subCursorPos=1 //PHYSICAL
        {
          prevTech=global.p1TechniqueEquip
          if cursorPosY=1 and global.techLv>=1
            global.p1TechniqueEquip="MENTAL INSURRECTION"
          else if cursorPosY=2 and global.techLv>=2
            global.p1TechniqueEquip="WAVE OF AWESOME"
          else if cursorPosY=3 and global.techLv>=3
            global.p1TechniqueEquip="KUDEKU"
          else if cursorPosY=4 and global.techLv>=4
            global.p1TechniqueEquip="GRAND SLAM"
          /*
          else if cursorPosY=5 and global.techLv>=5
            global.p1TechniqueEquip="CONJURE"*/

          if global.p1TechniqueEquip!=prevTech
            playSound(global.snd_MenuConfirm,0,1)
          else
            playSound(global.snd_MenuCancel,0,1)
        }
        else if subCursorPos=2 //FIRE
        {
          prevSpell=global.p1FireEquip
          if cursorPosY=1
            global.p1FireEquip="FIREBALL"
          else if cursorPosY=2 and global.fireLv>=2
            global.p1FireEquip="FLAME PILLAR"
          else if cursorPosY=3 and global.fireLv>=3
            global.p1FireEquip="BLAST OFF"
          else if cursorPosY=4 and global.fireLv>=4
            global.p1FireEquip="INFERNO"
          else if cursorPosY=5 and global.fireLv>=5
            global.p1FireEquip="WILDFIRE"

          if global.p1FireEquip!=prevSpell
          {
            playSound(global.snd_MenuConfirm,0,1)
            if global.p1CurrentElement=1
              global.p1SpellEquip=global.p1FireEquip
          }
          else
            playSound(global.snd_MenuCancel,0,1)
        }
        else if subCursorPos=3 //WATER
        {
          prevSpell=global.p1WaterEquip
          if cursorPosY=1
            global.p1WaterEquip="WATER BLAST"
          else if cursorPosY=2 and global.waterLv>=2
            global.p1WaterEquip="WATER BARRIER"
          else if cursorPosY=3 and global.waterLv>=3
            global.p1WaterEquip="FLOOD"
          else if cursorPosY=4 and global.waterLv>=4
            global.p1WaterEquip="SOOTHING SPRING"
          else if cursorPosY=5 and global.waterLv>=5
            global.p1WaterEquip="PIERCING STREAM"

          if global.p1WaterEquip!=prevSpell
          {
            playSound(global.snd_MenuConfirm,0,1)
            if global.p1CurrentElement=2
              global.p1SpellEquip=global.p1WaterEquip
          }
          else
            playSound(global.snd_MenuCancel,0,1)
        }
        else if subCursorPos=4 //WIND
        {
          prevSpell=global.p1WindEquip
          if cursorPosY=1
            global.p1WindEquip="WIND BURST"
          else if cursorPosY=2 and global.windLv>=2
            global.p1WindEquip="ZEPHYR"
          else if cursorPosY=3 and global.windLv>=3
            global.p1WindEquip="CYCLONE"
          else if cursorPosY=4 and global.windLv>=4
            global.p1WindEquip="BLAST SHIELD"
          else if cursorPosY=5 and global.windLv>=5
            global.p1WindEquip="HURRICANE"

          if global.p1WindEquip!=prevSpell
          {
            playSound(global.snd_MenuConfirm,0,1)
            if global.p1CurrentElement=3
              global.p1SpellEquip=global.p1WindEquip
          }
          else
            playSound(global.snd_MenuCancel,0,1)
        }
        else if subCursorPos=5 //EARTH
        {
          prevSpell=global.p1EarthEquip
          if cursorPosY=1
            global.p1EarthEquip="ROCK SMASH"
          else if cursorPosY=2
            global.p1EarthEquip="NATURE'S GIFT"
          else if cursorPosY=3 and global.earthLv>=2
            global.p1EarthEquip="EARTH SHIFT"
          else if cursorPosY=4 and global.earthLv>=3
            global.p1EarthEquip="RUPTURE"
          else if cursorPosY=5 and global.earthLv>=4
            global.p1EarthEquip="ROCK DRILL"

          if global.p1EarthEquip!=prevSpell
          {
            playSound(global.snd_MenuConfirm,0,1)
            if global.p1CurrentElement=4
              global.p1SpellEquip=global.p1EarthEquip
          }
          else
            playSound(global.snd_MenuCancel,0,1)
        }
      }
      else
      {
        with oMessageMenuPopup
          instance_destroy()
        stringToShow="You cannot swap spells while casting."
        messageWidth=string_width(stringToShow)
        newMessage=instance_create(floor(256-(messageWidth/2)),192,oMessageMenuPopup)
        newMessage.message=stringToShow
        newMessage.fadingTime=40
      }
    }
  }
  else if currentMenu=4 //Skills----------
  {
    if keyboard_check_pressed(curUp) or keyboard_check_pressed(vk_up)
    {
      playSound(global.snd_MenuCursor,0,1)
      if cursorPosX=0
      {
        if subCursorPos=1
        {
          subCursorPos=3
          menuCursorY=menuMainY+103
        }
        else
        {
          subCursorPos-=1
          menuCursorY-=27
        }
      }
      else
      {
        if cursorPosY=1
        {
          cursorPosY=menuMax
          menuCursorY+=cursorIncY*(menuMax-1)
        }
        else
        {
          cursorPosY-=1
          menuCursorY-=cursorIncY
        }
      }
    }
    if keyboard_check_pressed(curDown) or keyboard_check_pressed(vk_down)
    {
      playSound(global.snd_MenuCursor,0,1)
      if cursorPosX=0
      {
        if subCursorPos=3
        {
          subCursorPos=1
          menuCursorY=menuMainY+49
        }
        else
        {
          subCursorPos+=1
          menuCursorY+=27
        }
      }
      else
      {
        if cursorPosY=menuMax
        {
          cursorPosY=1
          menuCursorY-=cursorIncY*(menuMax-1)
        }
        else
        {
          cursorPosY+=1
          menuCursorY+=cursorIncY
        }
      }
    }
    if keyboard_check_pressed(curLeft) or keyboard_check_pressed(vk_left)
    {
      playSound(global.snd_MenuCursor,0,1)
      if cursorPosX<=1
      {
        cursorPosX=0
        menuCursorX=menuMainX+19
        if subCursorPos=1
          menuCursorY=menuMainY+49
        else if subCursorPos=2
          menuCursorY=menuMainY+76
        else if subCursorPos=3
          menuCursorY=menuMainY+103
      }
      else
      {
        cursorPosX-=1
        menuCursorX-=cursorIncX
      }
    }
    if keyboard_check_pressed(curRight) or keyboard_check_pressed(vk_right)
    {
      playSound(global.snd_MenuCursor,0,1)
      if cursorPosX=0
      {
        cursorPosX=1
        menuCursorX=menuMainX+81
        if subCursorPos=2
        {
          cursorPosY=2
          menuCursorY=menuMainY+58
        }
        else
        {
          cursorPosY=1
          menuCursorY=menuMainY+45
        }
      }
      else
      {
        if cursorPosX=13
        {
          cursorPosX=1
          menuCursorX-=cursorIncX*12
        }
        else
        {
          cursorPosX+=1
          menuCursorX+=cursorIncX
        }
      }
    }
    if keyboard_check_pressed(curConfirm)
    {
      tempSPcount=global.p1SkillPoints
      if subCursorPos=1 //Weapon
      {
        if cursorPosY=1
        {
          if cursorPosX=1 and global.p1SkillPoints>=itemCapacity and global.SkSharpen=0
          {
            global.SkSharpen+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=2 and global.p1SkillPoints>=itemCapacity and global.SkSharpen=1
          {
            global.SkSharpen+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=4 and global.p1SkillPoints>=itemCapacity and global.SkSmash=0 and global.SkSharpen=2
          {
            global.SkSmash+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=6 and global.p1SkillPoints>=itemCapacity and global.SkDashPower=0 and global.SkSmash=1
          {
            global.SkDashPower+=1
            global.p1SkillPoints-=itemCapacity
          }
        }
        else if cursorPosY=2
        {
          if cursorPosX=1 and global.p1SkillPoints>=itemCapacity and global.SkComboMaster=0
          {
            global.SkComboMaster+=1
            oPlayer1.nextAttackTime=15
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=3 and global.p1SkillPoints>=itemCapacity and global.SkExpertise=0 and global.SkComboMaster=1
          {
            global.SkExpertise+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=6 and global.p1SkillPoints>=itemCapacity and global.SkSharpen=2 and global.SkSmash=1
          {
            global.SkSharpen+=1
            global.p1SkillPoints-=itemCapacity
          }
        }
        else if cursorPosY=3
        {
          if cursorPosX=4 and global.p1SkillPoints>=itemCapacity and global.SkExpertise=1 and global.SkStrategist=0
          {
            global.SkStrategist+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=5 and global.p1SkillPoints>=itemCapacity and global.SkStrategist=1
          {
            global.SkStrategist+=1
            global.p1SkillPoints-=itemCapacity
          }
        }
        else if cursorPosY=4
        {
          if cursorPosX=1 and global.p1SkillPoints>=itemCapacity and global.SkFireAffinity=0
          {
            global.SkFireAffinity+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=2 and global.p1SkillPoints>=itemCapacity and global.SkFireAffinity=1
          {
            global.SkFireAffinity+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=3 and global.p1SkillPoints>=itemCapacity and global.SkFireAffinity=2
          {
            global.SkFireAffinity+=1
            global.p1SkillPoints-=itemCapacity
          }
        }
        else if cursorPosY=5
        {
          if cursorPosX=1 and global.p1SkillPoints>=itemCapacity and global.SkWaterAffinity=0
          {
            global.SkWaterAffinity+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=2 and global.p1SkillPoints>=itemCapacity and global.SkWaterAffinity=1
          {
            global.SkWaterAffinity+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=3 and global.p1SkillPoints>=itemCapacity and global.SkWaterAffinity=2
          {
            global.SkWaterAffinity+=1
            global.p1SkillPoints-=itemCapacity
          }
        }
        else if cursorPosY=6
        {
          if cursorPosX=1 and global.p1SkillPoints>=itemCapacity and global.SkWindAffinity=0
          {
            global.SkWindAffinity+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=2 and global.p1SkillPoints>=itemCapacity and global.SkWindAffinity=1
          {
            global.SkWindAffinity+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=3 and global.p1SkillPoints>=itemCapacity and global.SkWindAffinity=2
          {
            global.SkWindAffinity+=1
            global.p1SkillPoints-=itemCapacity
          }
        }
        else if cursorPosY=7
        {
          if cursorPosX=1 and global.p1SkillPoints>=itemCapacity and global.SkEarthAffinity=0
          {
            global.SkEarthAffinity+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=2 and global.p1SkillPoints>=itemCapacity and global.SkEarthAffinity=1
          {
            global.SkEarthAffinity+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=3 and global.p1SkillPoints>=itemCapacity and global.SkEarthAffinity=2
          {
            global.SkEarthAffinity+=1
            global.p1SkillPoints-=itemCapacity
          }
        }
      }
      else if subCursorPos=2 //Player
      {
        if cursorPosY=1
        {
          if cursorPosX=3 and global.p1SkillPoints>=itemCapacity and global.SkIronBody>=2 and global.SkAgility=0
          {
            global.SkAgility+=1
            oPlayer1.dashRecovery=30
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=7 and global.p1SkillPoints>=itemCapacity and global.SkFireResist=0
          {
            global.SkFireResist+=1
            global.p1FIREresist+=5
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=8 and global.p1SkillPoints>=itemCapacity and global.SkFireResist=1
          {
            global.SkFireResist+=1
            global.p1FIREresist+=5
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=9 and global.p1SkillPoints>=itemCapacity and global.SkFireResist=2
          {
            global.SkFireResist+=1
            global.p1FIREresist+=5
            global.p1SkillPoints-=itemCapacity
          }
        }
        else if cursorPosY=2
        {
          if cursorPosX=1 and global.p1SkillPoints>=itemCapacity and global.SkIronBody=0
          {
            global.SkIronBody+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=2 and global.p1SkillPoints>=itemCapacity and global.SkIronBody=1
          {
            global.SkIronBody+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=3 and global.p1SkillPoints>=itemCapacity and global.SkSwiftFoot=0
          {
            if global.SkIronBody=2 or global.SkFreeSpirit=2
            {
              global.SkSwiftFoot+=1
              oPlayer1.dashInvulnerability=9
              global.p1SkillPoints-=itemCapacity
            }
          }
          else if cursorPosX=4 and global.p1SkillPoints>=itemCapacity and global.SkSwiftFoot=1 and global.SkQuickRecovery=0
          {
            global.SkQuickRecovery+=1
            oPlayer1.recoverTime=24
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=7 and global.p1SkillPoints>=itemCapacity and global.SkWaterResist=0
          {
            global.SkWaterResist+=1
            global.p1WATERresist+=5
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=8 and global.p1SkillPoints>=itemCapacity and global.SkWaterResist=1
          {
            global.SkWaterResist+=1
            global.p1WATERresist+=5
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=9 and global.p1SkillPoints>=itemCapacity and global.SkWaterResist=2
          {
            global.SkWaterResist+=1
            global.p1WATERresist+=5
            global.p1SkillPoints-=itemCapacity
          }
        }
        else if cursorPosY=3
        {
          if cursorPosX=1 and global.p1SkillPoints>=itemCapacity and global.SkFreeSpirit=0
          {
            global.SkFreeSpirit+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=2 and global.p1SkillPoints>=itemCapacity and global.SkFreeSpirit=1
          {
            global.SkFreeSpirit+=1
            global.p1SkillPoints-=itemCapacity
          }

          else if cursorPosX=4 and global.p1SkillPoints>=itemCapacity and global.SkSwiftFoot=1 and global.SkIronBody=2 and global.SkFreeSpirit=2
          {
            global.SkIronBody+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=5 and global.p1SkillPoints>=itemCapacity and global.SkIronBody=3 and global.SkFreeSpirit=2
          {
            global.SkFreeSpirit+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=7 and global.p1SkillPoints>=itemCapacity and global.SkWindResist=0
          {
            global.SkWindResist+=1
            global.p1WINDresist+=5
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=8 and global.p1SkillPoints>=itemCapacity and global.SkWindResist=1
          {
            global.SkWindResist+=1
            global.p1WINDresist+=5
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=9 and global.p1SkillPoints>=itemCapacity and global.SkWindResist=2
          {
            global.SkWindResist+=1
            global.p1WINDresist+=5
            global.p1SkillPoints-=itemCapacity
          }
        }
        else if cursorPosY=4
        {
          if cursorPosX=7 and global.p1SkillPoints>=itemCapacity and global.SkEarthResist=0
          {
            global.SkEarthResist+=1
            global.p1EARTHresist+=5
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=8 and global.p1SkillPoints>=itemCapacity and global.SkEarthResist=1
          {
            global.SkEarthResist+=1
            global.p1EARTHresist+=5
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=9 and global.p1SkillPoints>=itemCapacity and global.SkEarthResist=2
          {
            global.SkEarthResist+=1
            global.p1EARTHresist+=5
            global.p1SkillPoints-=itemCapacity
          }
        }
        else if cursorPosY=5
        {
          if cursorPosX=4 and global.p1SkillPoints>=itemCapacity and global.SkPrecision>=1 and global.SkPerfection=0
          {
            global.SkPerfection+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=5 and global.p1SkillPoints>=itemCapacity and global.SkPerfection=1
          {
            global.SkPerfection+=1
            global.p1SkillPoints-=itemCapacity
          }
        }
        else if cursorPosY=6
        {
          if cursorPosX=1 and global.p1SkillPoints>=itemCapacity and global.SkPrecision=0
          {
            global.SkPrecision+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=2 and global.p1SkillPoints>=itemCapacity and global.SkPrecision=1
          {
            global.SkPrecision+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=5 and global.p1SkillPoints>=itemCapacity and global.SkSpiritMaster=0
          {
            if global.SkPerfection=2 or global.SkVirtue=2
            {
              global.SkSpiritMaster+=1
              global.p1SkillPoints-=itemCapacity
            }
          }
          else if cursorPosX=6 and global.p1SkillPoints>=itemCapacity and global.SkSpiritMaster=1
          {
            global.SkSpiritMaster+=1
            global.p1SkillPoints-=itemCapacity
          }
        }
        else if cursorPosY=7
        {
          if cursorPosX=4 and global.p1SkillPoints>=itemCapacity and global.SkPrecision>=1 and global.SkVirtue=0
          {
            global.SkVirtue+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=5 and global.p1SkillPoints>=itemCapacity and global.SkVirtue=1
          {
            global.SkVirtue+=1
            global.p1SkillPoints-=itemCapacity
          }
        }
      }
      else if subCursorPos=3 //Spirit
      {
        if cursorPosY=1
        {
          if cursorPosX=1 and global.p1SkillPoints>=itemCapacity and global.SkFireMastery=0
          {
            global.SkFireMastery+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=2 and global.p1SkillPoints>=itemCapacity and global.SkFireMastery=1
          {
            global.SkFireMastery+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=4 and global.p1SkillPoints>=itemCapacity and global.SkFireCraft=0
          {
            global.SkFireCraft+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=5 and global.p1SkillPoints>=itemCapacity and global.SkFireCraft=1
          {
            global.SkFireCraft+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=7 and global.p1SkillPoints>=itemCapacity and global.SkFireCraft=2 and global.SkProtection=0
          {
            global.SkProtection+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=8 and global.p1SkillPoints>=itemCapacity and global.SkProtection=1
          {
            global.SkProtection+=1
            global.p1SkillPoints-=itemCapacity
          }
        }
        else if cursorPosY=3
        {
          if cursorPosX=1 and global.p1SkillPoints>=itemCapacity and global.SkWaterMastery=0
          {
            global.SkWaterMastery+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=2 and global.p1SkillPoints>=itemCapacity and global.SkWaterMastery=1
          {
            global.SkWaterMastery+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=4 and global.p1SkillPoints>=itemCapacity and global.SkWaterCraft=0
          {
            global.SkWaterCraft+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=5 and global.p1SkillPoints>=itemCapacity and global.SkWaterCraft=1
          {
            global.SkWaterCraft+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=7 and global.p1SkillPoints>=itemCapacity and global.SkElementalMaster=0 and global.SkWaterCraft=2
          {
            global.SkElementalMaster+=1
            global.p1SkillPoints-=itemCapacity
          }
        }
        else if cursorPosY=5
        {
          if cursorPosX=1 and global.p1SkillPoints>=itemCapacity and global.SkWindMastery=0
          {
            global.SkWindMastery+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=2 and global.p1SkillPoints>=itemCapacity and global.SkWindMastery=1
          {
            global.SkWindMastery+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=4 and global.p1SkillPoints>=itemCapacity and global.SkWindCraft=0
          {
            global.SkWindCraft+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=5 and global.p1SkillPoints>=itemCapacity and global.SkWindCraft=1
          {
            global.SkWindCraft+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=7 and global.p1SkillPoints>=itemCapacity and global.SkGoodFortune=0 and global.SkWindCraft=2
          {
            global.SkGoodFortune+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=8 and global.p1SkillPoints>=itemCapacity and global.SkGoodFortune=1
          {
            global.SkGoodFortune+=1
            global.p1SkillPoints-=itemCapacity
          }
        }
        else if cursorPosY=6
        {
          if cursorPosX=8 and global.p1SkillPoints>=itemCapacity and global.SkStatistician=0 and global.SkGoodFortune>=1
          {
            global.SkStatistician+=1
            global.p1SkillPoints-=itemCapacity
          }
          if cursorPosX=9 and global.p1SkillPoints>=itemCapacity and global.SkStatistician=1
          {
            global.SkStatistician+=1
            global.p1SkillPoints-=itemCapacity
          }
        }
        else if cursorPosY=7
        {
          if cursorPosX=1 and global.p1SkillPoints>=itemCapacity and global.SkEarthMastery=0
          {
            global.SkEarthMastery+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=2 and global.p1SkillPoints>=itemCapacity and global.SkEarthMastery=1
          {
            global.SkEarthMastery+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=4 and global.p1SkillPoints>=itemCapacity and global.SkEarthCraft=0
          {
            global.SkEarthCraft+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=5 and global.p1SkillPoints>=itemCapacity and global.SkEarthCraft=1
          {
            global.SkEarthCraft+=1
            global.p1SkillPoints-=itemCapacity
          }
          else if cursorPosX=7 and global.p1SkillPoints>=itemCapacity and global.SkFaith=0 and global.SkEarthCraft=2
          {
            global.SkFaith+=1
            global.p1SkillPoints-=itemCapacity
          }
        }
      }

      if global.p1SkillPoints!=tempSPcount //got skill
        playSound(global.snd_MenuConfirm,0,1)
      else //not enough SP
        playSound(global.snd_MenuCancel,0,1)
    }
  }
  else if currentMenu=5 //Options----------
  {
    if keyboard_check_pressed(curUp) or keyboard_check_pressed(vk_up)
    {
      playSound(global.snd_MenuCursor,0,1)
      if cursorPosY=1
      {
        cursorPosY=menuMax
        menuCursorY+=cursorIncY*(menuMax-1)
      }
      else
      {
        cursorPosY-=1
        menuCursorY-=cursorIncY
      }
    }
    if keyboard_check_pressed(curDown) or keyboard_check_pressed(vk_down)
    {
      playSound(global.snd_MenuCursor,0,1)
      if cursorPosY=menuMax
      {
        cursorPosY=1
        menuCursorY-=cursorIncY*(menuMax-1)
      }
      else
      {
        cursorPosY+=1
        menuCursorY+=cursorIncY
      }
    }
    if keyboard_check(curLeft)=true
    {
      if subCursorPos=1
      {
        if cursorPosY=6
        {
          if global.optMusic>0
          {
            global.optMusic-=1
            var tempMplay;
            tempMplay=findMusic()
            SS_SetSoundVol(tempMplay,global.optMusic*100)
            if global.optMusic=0
              stopAllMusic()
          }
          playSound(global.snd_MenuCursor,0,1)
        }
        else if cursorPosY=7
        {
          if global.optSound>0
            global.optSound-=1
          playSound(global.snd_MenuCursor,0,1)
        }
        else if cursorPosY=8
        {
          if global.optIdentifier>0
            global.optIdentifier-=1
        }
      }
    }
    if keyboard_check(curRight)=true
    {
      if subCursorPos=1
      {
        if cursorPosY=6
        {
          if global.optMusic<100
          {
            var prevVol,tempMplay;
            prevVol=global.optMusic
            tempMplay=findMusic()
            global.optMusic+=1
            if prevVol=0
              playMusic(tempMplay,0)
            SS_SetSoundVol(tempMplay,global.optMusic*100)
          }
          playSound(global.snd_MenuCursor,0,1)
        }
        else if cursorPosY=7
        {
          if global.optSound<100
            global.optSound+=1
          playSound(global.snd_MenuCursor,0,1)
        }
        else if cursorPosY=8
        {
          if global.optIdentifier<100
            global.optIdentifier+=1
        }
      }
    }
    if keyboard_check_pressed(curConfirm)
    {
      if subCursorPos=1
      {
        if cursorPosY=1
        {
          if global.optLowHealthWarn=false
            global.optLowHealthWarn=true
          else
            global.optLowHealthWarn=false
        }
        else if cursorPosY=2
        {
          if global.optShowExpEarned=false
            global.optShowExpEarned=true
          else
            global.optShowExpEarned=false
        }
        else if cursorPosY=3
        {
          if global.optShowDamage=false
            global.optShowDamage=true
          else
            global.optShowDamage=false
        }
        else if cursorPosY=4
        {
          if global.optEnemyStatus=false
            global.optEnemyStatus=true
          else
            global.optEnemyStatus=false
        }
        else if cursorPosY=5
        {
          if global.optKeepMenuPosition=false
            global.optKeepMenuPosition=true
          else
            global.optKeepMenuPosition=false
        }
        else if cursorPosY=6
        {
          if global.optMusic=0
          {
            global.optMusic=100
            var tempMplay;
            tempMplay=findMusic()
            playMusic(tempMplay,0)
          }
          else
          {
            global.optMusic=0
            stopAllMusic()
          }
        }
        else if cursorPosY=7
        {
          if global.optSound=0
            global.optSound=100
          else
            global.optSound=0
        }
        else if cursorPosY=8
        {
          if global.optIdentifier=0
            global.optIdentifier=100
          else
            global.optIdentifier=0
        }
        else if cursorPosY=9
        {
          if global.optShowGlow=false
            global.optShowGlow=true
          else
            global.optShowGlow=false
        }
        else if cursorPosY=10
        {
          if global.hasItemFinder=1
            global.hasItemFinder=2
          else
            global.hasItemFinder=1
        }
      }
      else if subCursorPos=2
      {
        if cursorPosY=1
        {
          if global.optKillChainScreen=false
            global.optKillChainScreen=true
          else
            global.optKillChainScreen=false
        }
        else if cursorPosY=2
        {
          if global.optKillChainSound=false
            global.optKillChainSound=true
          else
            global.optKillChainSound=false
        }
        else if cursorPosY=3
        {
          if global.optKillingSpreeScreen=false
            global.optKillingSpreeScreen=true
          else
            global.optKillingSpreeScreen=false
        }
        else if cursorPosY=4
        {
          if global.optKillingSpreeSound=false
            global.optKillingSpreeSound=true
          else
            global.optKillingSpreeSound=false
        }
        else if cursorPosY=5
        {
          if global.optCombo=false
            global.optCombo=true
          else
            global.optCombo=false
        }
        else if cursorPosY=6
        {
          if global.optShowAwesome=false
            global.optShowAwesome=true
          else
            global.optShowAwesome=false
        }
        else if cursorPosY=7
        {
          if global.optEnemyHP=false
            global.optEnemyHP=true
          else
            global.optEnemyHP=false
        }
        else if cursorPosY=8
        {
          global.gamePriority+=1
          if global.gamePriority=3
            global.gamePriority=0
          set_program_priority(global.gamePriority)
        }
        else if cursorPosY=9
        {
          if global.optGameDetail=0
            global.optGameDetail=1
          else
            global.optGameDetail=0
        }
      }
      else if subCursorPos=3
      {
        if cursorPosY=1
        {
          if global.optDPadDash=false
            global.optDPadDash=true
          else
            global.optDPadDash=false
        }
        else if cursorPosY=2
        {
          if global.optRightIsForward=false
            global.optRightIsForward=true
          else
            global.optRightIsForward=false
        }
        else if cursorPosY=3
        {
          if global.optShowHUD=false
            global.optShowHUD=true
          else
            global.optShowHUD=false
        }
        else if cursorPosY=4
        {
          if global.optDashWarn=false
            global.optDashWarn=true
          else
            global.optDashWarn=false
        }
      }
      playSound(global.snd_MenuConfirm,0,1)
    }
    if keyboard_check_pressed(curChange)
    {
      playSound(global.snd_MenuCursor,0,1)
      bChangedMenu=true
      subCursorPos+=1
      if subCursorPos>3 {subCursorPos=1}
    }
  }
  else if currentMenu=7 //Records----------
  {
    if keyboard_check_pressed(curLeft) or keyboard_check_pressed(vk_left)
    {
      playSound(global.snd_MenuCursor,0,1)
      if subCursorPos=1
        subCursorPos=5
      else
        subCursorPos-=1
    }
    if keyboard_check_pressed(curRight) or keyboard_check_pressed(vk_right)
    {
      playSound(global.snd_MenuCursor,0,1)
      if subCursorPos=5
        subCursorPos=1
      else
        subCursorPos+=1
    }
  }
  else if currentMenu=8 //Controls----------
    menuControlConfig()
  else if currentMenu=9 //System----------
  {
    if keyboard_check_pressed(curUp) or keyboard_check_pressed(vk_up)
    {
      playSound(global.snd_MenuCursor,0,1)
      if cursorPosY=1
      {
        cursorPosY=menuMax
        menuCursorY+=cursorIncY*(menuMax-1)
      }
      else
      {
        cursorPosY-=1
        menuCursorY-=cursorIncY
      }
    }
    if keyboard_check_pressed(curDown) or keyboard_check_pressed(vk_down)
    {
      playSound(global.snd_MenuCursor,0,1)
      if cursorPosY=menuMax
      {
        cursorPosY=1
        menuCursorY-=cursorIncY*(menuMax-1)
      }
      else
      {
        cursorPosY+=1
        menuCursorY+=cursorIncY
      }
    }

    if keyboard_check_pressed(curConfirm)
    {
      if cursorPosY=1 //Force Game Over
      {
        global.quickGameOver=1
        oPlayer1.life-=oPlayer1.maxLife
        menuOpen=false
        exit;
      }
      else if cursorPosY=2 //Return to title screen
      {
        stopLoopingSounds()
        stopAllMusic()
        playSound(global.snd_MenuCancel,0,1)
        room_goto(rIntro)
      }
    }
  }
  else if currentMenu>=100 //Bead Equip----------
    menuBeadEquip(1)
  //swap menus------------------------------------------------------------
  if currentMenu<10
  {
    if keyboard_check_pressed(curMenuShiftForward)
    {
      playSound(global.snd_MenuShift,0,1)
      subCursorPos=1
      if currentMenu=9
        currentMenu=1
      else
        currentMenu+=1
      bChangedMenu=true
    }
    if keyboard_check_pressed(curMenuShiftBack)
    {
      playSound(global.snd_MenuShift,0,1)
      subCursorPos=1
      if currentMenu=1
        currentMenu=9
      else
        currentMenu-=1
      bChangedMenu=true
    }
    //menu swap toggle
    if keyboard_check_pressed(ord("1"))
    {
      playSound(global.snd_MenuShift,0,1)
      subCursorPos=1
      currentMenu=1
      bChangedMenu=true
    }
    else if keyboard_check_pressed(ord("2"))
    {
      playSound(global.snd_MenuShift,0,1)
      subCursorPos=1
      currentMenu=2
      bChangedMenu=true
    }
    else if keyboard_check_pressed(ord("3"))
    {
      playSound(global.snd_MenuShift,0,1)
      subCursorPos=1
      currentMenu=3
      bChangedMenu=true
    }
    else if keyboard_check_pressed(ord("4"))
    {
      playSound(global.snd_MenuShift,0,1)
      subCursorPos=1
      currentMenu=4
      bChangedMenu=true
    }
    else if keyboard_check_pressed(ord("5"))
    {
      playSound(global.snd_MenuShift,0,1)
      subCursorPos=1
      currentMenu=5
      bChangedMenu=true
    }
    else if keyboard_check_pressed(ord("6"))
    {
      playSound(global.snd_MenuShift,0,1)
      subCursorPos=1
      currentMenu=6
      bChangedMenu=true
    }
    else if keyboard_check_pressed(ord("7"))
    {
      playSound(global.snd_MenuShift,0,1)
      subCursorPos=1
      currentMenu=7
      bChangedMenu=true
    }
    else if keyboard_check_pressed(ord("8"))
    {
      playSound(global.snd_MenuShift,0,1)
      subCursorPos=1
      currentMenu=8
      bChangedMenu=true
    }
    else if keyboard_check_pressed(ord("9"))
    {
      playSound(global.snd_MenuShift,0,1)
      subCursorPos=1
      currentMenu=9
      bChangedMenu=true
    }
  }

  if bChangedMenu=true
  {
    if currentMenu=2 //Equipment
    {
      cursorPosY=1
      cursorIncX=28
      cursorIncY=12
      menuMax=8
      menuCursorX=menuMainX+18
      menuCursorY=menuMainY+28
    }
    else if currentMenu=3 //Techniques
    {
      cursorPosY=1
      menuMax=7
      menuCursorX=menuMainX+18
      menuCursorY=menuMainY+28
      cursorIncY=12
    }
    else if currentMenu=4 //Skills
    {
      cursorPosX=1
      cursorPosY=1
      menuMax=7
      menuCursorX=menuMainX+81
      menuCursorY=menuMainY+45
      cursorIncX=13
      cursorIncY=13
    }
    else if currentMenu=5 //Options
    {
      cursorPosY=1
      menuCursorX=menuMainX+18
      menuCursorY=menuMainY+28
      identCursorX=menuMainX+78
      identCursorY=menuMainY+104
      cursorIncY=12
      if subCursorPos=1
      {
        if global.hasItemFinder>=1
          menuMax=10
        else
          menuMax=9
      }
      else if subCursorPos=2
        menuMax=9
      else
        menuMax=4
    }
    else if currentMenu=8 //Controls
    {
      cursorPosY=1
      if subCursorPos=1
        menuMax=9
      else
        menuMax=8
      menuCursorX=menuMainX+18
      menuCursorY=menuMainY+42
      cursorIncY=12
    }
    else if currentMenu=9 //System
    {
      cursorPosY=1
      menuMax=2
      menuCursorX=menuMainX+18
      menuCursorY=menuMainY+28
      cursorIncY=12
    }
    bChangedMenu=false
  }
  //game info------------------------------------------------------------
  if keyboard_check_pressed(curInfo)
    show_info()
  //teleport-------------------------------------------------------------
  if keyboard_check_pressed(curTeleport) and global.gameProgress>=86
  {
    if global.teleportEnabled=0 and global.currentBoss=""
    {
      if global.shroudThreat<60
      {
        playSound(global.snd_MenuConfirm,0,1)
        var escapeLevel;
        escapeLevel=show_question("Do you want to teleport to the World Map?")
        if escapeLevel=true
        {
          global.gamePaused=false
          global.newMapX=0
          global.newMapY=0
          global.worldMapX=-1000
          global.worldMapY=-1000
          writeToPlayerGlobals()
          transition_kind=20
          transition_steps=30
          room_goto(rWorldMap)
        }
      }
      else
      {
        playSound(global.snd_MenuCancel,0,1)
        with oMessageMenuPopup
          instance_destroy()
        stringToShow="You cannot teleport when at a Warn Level of High or above.#Reason: The Shrouds are blocking this ability."
        messageWidth=string_width(stringToShow)
        newMessage=instance_create(floor(256-(messageWidth/2)),192,oMessageMenuPopup)
        newMessage.message=stringToShow
        newMessage.fadingTime=80
      }
    }
    else
    {
      playSound(global.snd_MenuCancel,0,1)
      with oMessageMenuPopup
        instance_destroy()
      stringToShow="You cannot teleport at this time."
      messageWidth=string_width(stringToShow)
      newMessage=instance_create(floor(256-(messageWidth/2)),192,oMessageMenuPopup)
      newMessage.message=stringToShow
      newMessage.fadingTime=40
    }
  }
}
else if global.gamePaused=false
{
  if oPlayer1.hitCombo>0 //hit combo fade
  {
    hitComboFadeTime-=1
    if hitComboFadeTime<=25
      hitComboAlpha-=0.04
    if hitComboFadeTime<=0
    {
      if oPlayer1.hitCombo>=4
      {
        var awesomeAward;
        awesomeAward=round((oPlayer1.hitCombo+exp(1.15))*(1+oPlayer1.lifePercent))
        awesomeA=instance_create(0,0,oAwesomeAward)
        awesomeA.awesomeValue=awesomeAward
      }
      oPlayer1.hitCombo=0
    }
  }
  if oPlayer1.killChain>0 //kill chain fade
  {
    killChainFadeTime-=1
    if killChainFadeTime<=25
      killChainAlpha-=0.04
    if killChainFadeTime<=0
      oPlayer1.killChain=0
  }
  if musicCheck=true //reload functions for music
  {
    var tempMplay;
    tempMplay=findMusic()
    playMusic(tempMplay,0)
    musicCheck=false
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=global.showHUD
arg1=true
arg2=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=STUFF
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=true and menuOpen=true
{
  backColor=make_color_rgb(184,104,8)
  draw_set_color(backColor)
  draw_set_alpha(0.9)
  draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false)
}

if global.optShowHUD=1
{
  //low health warn --------------------------------------------------
  if oPlayer1.lifePercent<=oPlayer1.lowHealthThreshold and global.optLowHealthWarn=true and global.gamePaused=false
  {
    lowHealthX=view_xview[0]
    lowHealthY=view_yview[0]
    draw_sprite_ext(sLowHealth,-1,lowHealthX+view_wview[0]+1,lowHealthY-1,2,2,0,c_white,redRingAlpha) //TR
    draw_sprite_ext(sLowHealth,-1,lowHealthX-1,lowHealthY-1,2,2,90,c_white,redRingAlpha) //TL
    draw_sprite_ext(sLowHealth,-1,lowHealthX-1,lowHealthY+view_hview[0]+1,2,2,180,c_white,redRingAlpha) //BL
    draw_sprite_ext(sLowHealth,-1,lowHealthX+view_wview[0]+1,lowHealthY+view_hview[0]+1,2,2,270,c_white,redRingAlpha) //BR
    background_visible[7]=true
  }
  else
  {
    if !instance_exists(oGameOver)
      background_visible[7]=false
  }
  //health track --------------------------------------------------
  healthDisplayX=view_xview[0]+4
  healthDisplayY=view_yview[0]+4
  draw_sprite(sHealthBar,-1,healthDisplayX,healthDisplayY)
  if oPlayer1.lifePercent<=oPlayer1.lowHealthThreshold
  {
    global.soundAmplify=0.8
    if redRingAlphaDrop=true
    {
      if redRingAlpha>=0.3
        redRingAlpha-=0.01
      else
        redRingAlphaDrop=false
    }
    else
    {
      if redRingAlpha<=0.7
        redRingAlpha+=0.01
      else
        redRingAlphaDrop=true
    }
    draw_sprite_ext(sRedRing,-1,healthDisplayX+3,healthDisplayY+3,1,1,0,c_white,redRingAlpha)
    barColor=2
  }
  else if oPlayer1.lifePercent>=1
  {
    global.soundAmplify=1
    barColor=0
  }
  else
  {
    global.soundAmplify=1
    barColor=1
  }

  healthTrack=oPlayer1.lifePercent*100
  draw_sprite_ext(sHealthTrack,barColor,healthDisplayX+27,healthDisplayY+10,healthTrack,1,0,c_white,1)
  //health notches --------------------------------------------------
  draw_set_color(c_black)
  draw_set_alpha(0.25)
  lineXpos=healthDisplayX+27
  for (i=0;i<6;i+=1)
  {
    draw_line(lineXpos,healthDisplayY+10,lineXpos,healthDisplayY+16)
    if i=0
      lineXpos+=19
    else
      lineXpos+=20
  }
  if bShowLifeDrop=true //show life meter drop --------------------------------------------------
  {
    dropBarColor=c_red
    if dropAlphaTime>=0
    {
      dropAlphaTime-=1
      if dropAlphaTime<=10
        dropAlpha-=0.1
      yDropSpeed+=0.25
      yDrop+=yDropSpeed
      dropAngle+=0.5
    }
    else
      bShowLifeDrop=false
    newTrack=oldTrack-healthTrack
    draw_sprite_ext(sHealthTrack,-1,healthDisplayX+27+healthTrack,healthDisplayY+10+yDrop,newTrack,1,dropAngle,dropBarColor,dropAlpha)
  }

  //dash icon
  if oPlayer1.canAirDash=1
    draw_sprite(sDashIcon,0,healthDisplayX+114,healthDisplayY+21)

  //exp meter --------------------------------------------------
  draw_set_alpha(1)
  draw_set_font(fnt_HUD_Exp)
  draw_set_halign(fa_center)
  expColor=make_color_rgb(248,192,72)
  draw_set_color(expColor)
  draw_text(healthDisplayX+31,healthDisplayY+21,oPlayer1.level)
  if oPlayer1.level<64
  {
    expTrack=(oPlayer1.expCurrent/oPlayer1.expNext)*70
    draw_sprite_ext(sSpiritTrack,-1,healthDisplayX+39,healthDisplayY+20,expTrack,1,0,c_white,1)
  }

  //status effects --------------------------------------------------
  draw_set_color(c_black)
  if oPlayer1.blastOffRecoveryTime>0 //Blast Off
  {
    draw_sprite(sStatusEffect,0,healthDisplayX+140,healthDisplayY+5)
    draw_text(healthDisplayX+148,healthDisplayY+5,round(oPlayer1.blastOffRecoveryTime/30))
  }
  if oPlayer1.statusPoison>0 //Poison
  {
    draw_sprite(sStatusEffect,1,healthDisplayX+158,healthDisplayY+5)
    draw_text(healthDisplayX+166,healthDisplayY+5,round(oPlayer1.statusPoison/30))
  }
  if oPlayer1.statusSpiritDrain>0 //Spirit Drain
  {
    draw_sprite(sStatusEffect,2,healthDisplayX+176,healthDisplayY+5)
    draw_text(healthDisplayX+184,healthDisplayY+5,round(oPlayer1.statusSpiritDrain/30))
  }
  if oPlayer1.statusSkillLock>0 //Skill Lock
  {
    draw_sprite(sStatusEffect,3,healthDisplayX+194,healthDisplayY+5)
    draw_text(healthDisplayX+202,healthDisplayY+5,round(oPlayer1.statusSkillLock/30))
  }

  //element meter --------------------------------------------------
  elementDisplayX=view_xview[0]+445
  elementDisplayY=view_yview[0]+4
  backBarColor=make_color_rgb(109,77,87)
  draw_set_color(backBarColor)
  draw_rectangle(elementDisplayX+15,elementDisplayY+24,elementDisplayX+20,elementDisplayY+49,false)
  draw_rectangle(elementDisplayX+28,elementDisplayY+24,elementDisplayX+33,elementDisplayY+49,false)
  draw_rectangle(elementDisplayX+41,elementDisplayY+24,elementDisplayX+46,elementDisplayY+49,false)
  draw_rectangle(elementDisplayX+54,elementDisplayY+24,elementDisplayX+59,elementDisplayY+49,false)
  draw_rectangle(elementDisplayX+9,elementDisplayY+58,elementDisplayX+59,elementDisplayY+62,false)

  spiritTrack=oPlayer1.spiritPercent*50
  fireTrack=oPlayer1.firePercent*25
  waterTrack=oPlayer1.waterPercent*25
  windTrack=oPlayer1.windPercent*25
  earthTrack=oPlayer1.earthPercent*25
  draw_sprite_ext(sElementTrack,0,elementDisplayX+15,elementDisplayY+49,1,-fireTrack,0,c_white,1)
  draw_sprite_ext(sElementTrack,1,elementDisplayX+28,elementDisplayY+49,1,-waterTrack,0,c_white,1)
  draw_sprite_ext(sElementTrack,2,elementDisplayX+41,elementDisplayY+49,1,-windTrack,0,c_white,1)
  draw_sprite_ext(sElementTrack,3,elementDisplayX+54,elementDisplayY+49,1,-earthTrack,0,c_white,1)
  draw_sprite_ext(sSpiritTrack,-1,elementDisplayX+9,elementDisplayY+59,spiritTrack,1,0,c_white,1)
  draw_sprite(sElementBar,-1,elementDisplayX,elementDisplayY)
  if global.p1CurrentElement=0 //None
    draw_sprite(sNull,-1,elementDisplayX,elementDisplayY)
  else
    draw_sprite(sCurrentElement,global.p1CurrentElement-1,elementDisplayX+9,elementDisplayY+4)

  //technique/spell display --------------------------------------------------
  elementDisplayX=view_xview[0]+295
  elementDisplayY=view_yview[0]+4
  draw_sprite(sTechDisplay,-1,elementDisplayX,elementDisplayY)
  if global.p1CurrentElement=0
    techColor=make_color_rgb(248,192,72)
  else if global.p1CurrentElement=1
    techColor=make_color_rgb(255,125,125)
  else if global.p1CurrentElement=2
    techColor=make_color_rgb(129,171,224)
  else if global.p1CurrentElement=3
    techColor=make_color_rgb(33,225,33)
  else if global.p1CurrentElement=4
    techColor=make_color_rgb(220,104,53)
  draw_set_color(techColor)
  draw_set_halign(fa_center)
  draw_set_font(fnt_SubMenu)
  draw_text(elementDisplayX+74,elementDisplayY+3,global.p1SpellEquip)
  draw_set_color(make_color_rgb(248,192,72))
  if global.p1TechniqueEquip!="CONJURE"
    draw_text(elementDisplayX+74,elementDisplayY+17,global.p1TechniqueEquip)
  else
  {
    if global.p1CurrentElement=1
      draw_text(elementDisplayX+74,elementDisplayY+17,"SUMMON: BLAZING")
    else if global.p1CurrentElement=2 and global.VDportals[3]>=3
      draw_text(elementDisplayX+74,elementDisplayY+17,"SUMMON: MUUGURU")
    else
      draw_text(elementDisplayX+74,elementDisplayY+17,global.p1TechniqueEquip)
  }
  //rave energy --------------------------------------------------
  if oPlayer1.bRaveActive=false
    raveTrack=(global.p1RaveEnergy/oPlayer1.raveMax)*134
  else
    raveTrack=(oPlayer1.raveTime/oPlayer1.raveTimeTotal)*134
  draw_sprite_ext(sRaveTrack,-1,elementDisplayX+7,elementDisplayY+16,raveTrack,1,0,c_white,1)
  if global.p1RaveEnergy>=oPlayer1.raveMax
    draw_text(elementDisplayX+74,elementDisplayY+28,"RAVE MODE READY")
  //casting time bar --------------------------------------------------
  if oPlayer1.attackState=oPlayer1.ACT_CASTING
  {
    castTrack=oPlayer1.castPercent*134
    draw_sprite_ext(sSpiritTrack,-1,elementDisplayX+7,elementDisplayY+16,castTrack,1,0,c_white,1)
  }

  //dash point display --------------------------------------------------
  dashPointDisplayX=view_xview[0]+50
  dashPointDisplayY=view_yview[0]+35
  if oPlayer1.dashPoints>=1
    draw_set_color(dpOn)
  else
    draw_set_color(dpOff)
  draw_circle(dashPointDisplayX,dashPointDisplayY,3,false)
  if oPlayer1.dashPoints>=2
    draw_set_color(dpOn)
  else
    draw_set_color(dpOff)
  draw_circle(dashPointDisplayX+8,dashPointDisplayY,3,false)
  if oPlayer1.dashPoints>=3
    draw_set_color(dpOn)
  else
    draw_set_color(dpOff)
  draw_circle(dashPointDisplayX+16,dashPointDisplayY,3,false)
  if oPlayer1.dashPoints>=4
    draw_set_color(dpOn)
  else
    draw_set_color(dpOff)
  draw_circle(dashPointDisplayX+24,dashPointDisplayY,3,false)
  if oPlayer1.dashPoints>=5
    draw_set_color(dpOn)
  else
    draw_set_color(dpOff)
  draw_circle(dashPointDisplayX+32,dashPointDisplayY,3,false)
  draw_set_color(dpBorder)
  draw_circle(dashPointDisplayX,dashPointDisplayY,3,true)
  draw_circle(dashPointDisplayX+8,dashPointDisplayY,3,true)
  draw_circle(dashPointDisplayX+16,dashPointDisplayY,3,true)
  draw_circle(dashPointDisplayX+24,dashPointDisplayY,3,true)
  draw_circle(dashPointDisplayX+32,dashPointDisplayY,3,true)
}

if oPlayer1.hitCombo>=3 and global.optCombo=true //hit combo counter ---------------------------------------------
{
  hitComboIndX=view_xview[0]+8
  hitComboIndY=view_yview[0]+44
  comboCl=make_color_rgb(168,64,80)
  draw_set_color(comboCl)
  draw_set_halign(fa_left)
  if oPlayer1.hitFontEffect>0
  {
    draw_set_font(fnt_ComboDisplayHit)
    oPlayer1.hitFontEffect-=1
  }
  else
    draw_set_font(fnt_ComboDisplay)
  draw_set_alpha(hitComboAlpha)
  //text shadow - downright
  draw_text(hitComboIndX+1,hitComboIndY+1,oPlayer1.hitCombo)
  draw_text(hitComboIndX+43,hitComboIndY+1,"HITS")
  //text highlight - upleft
  comboCl=make_color_rgb(250,219,154)
  draw_set_color(comboCl)
  draw_text(hitComboIndX-1,hitComboIndY-1,oPlayer1.hitCombo)
  draw_text(hitComboIndX+41,hitComboIndY-1,"HITS")
  //text
  comboCl=make_color_rgb(248,192,72)
  draw_set_color(comboCl)
  draw_text(hitComboIndX,hitComboIndY,oPlayer1.hitCombo)
  draw_text(hitComboIndX+42,hitComboIndY,"HITS")
}
if oPlayer1.killChain>=2 and global.optKillChainScreen=true //kill chain counter -----------------------------------
{
  killChainIndX=view_xview[0]+256
  killChainIndY=view_yview[0]+48
  comboCl=make_color_rgb(168,64,80)
  draw_set_color(comboCl)
  draw_set_halign(fa_center)
  draw_set_font(fnt_KillChain)
  draw_set_alpha(killChainAlpha)
  if oPlayer1.killChain=2
    killChainText="DOUBLE KILL!!"
  else if oPlayer1.killChain=3
    killChainText="MULTI KILL!!"
  else if oPlayer1.killChain=4
    killChainText="MEGA KILL!!"
  else if oPlayer1.killChain=5
    killChainText="ULTRA KILL!!"
  else if oPlayer1.killChain=6
    killChainText="MONSTER KILL!!"
  else if oPlayer1.killChain=7
    killChainText="LUDICROUS KILL!!"
  else if oPlayer1.killChain=8
    killChainText="WRECKER!!"
  else if oPlayer1.killChain=9
    killChainText="SILENCER!!"
  else if oPlayer1.killChain=10
    killChainText="HEADHUNTER!!"
  //text shadow - downright
  draw_text(killChainIndX+29,killChainIndY+1,killChainText)
  //text highlight - upleft
  comboCl=make_color_rgb(250,219,154)
  draw_set_color(comboCl)
  draw_text(killChainIndX+27,killChainIndY-1,killChainText)
  //text
  comboCl=make_color_rgb(248,192,72)
  draw_set_color(comboCl)
  draw_text(killChainIndX+28,killChainIndY,killChainText)
}

//keys --------------------------------------------------
if global.optShowHUD=1
{
  draw_set_color(c_white)
  draw_set_halign(fa_left)
  draw_set_font(fnt_Exp)
  consumeDisplayX=view_xview[0]+474
  consumeDisplayY=view_yview[0]+5
  if global.p1Keys>0
  {
    draw_sprite(sHUDkey,-1,consumeDisplayX,consumeDisplayY)
    draw_text(consumeDisplayX+17,consumeDisplayY-3,global.p1Keys)
  }
}

//Sound frequency change
if room!=rSoFS_Floor41 and room!=rStalagmiteRuins3
{
  var tempFplay;
  tempFplay=findMusic(1)
  SS_SetSoundFreq(tempFplay,findFreq()*global.soundAmplify)
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=PAUSE MENU
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//--------------------------------
//---------- PAUSE MENU ----------
//--------------------------------
if global.gamePaused=true and menuOpen=true
{
  var subMenu1,subMenu2,subMenu3,subMenu4,subMenu5,subMenu6,subMenu7,subMenu8,subMenu9;
  subMenu1="STATUS"
  subMenu2="INVENTORY"
  subMenu3="TECHNIQUES"
  subMenu4="SKILLS"
  subMenu5="OPTIONS"
  subMenu6="QUEST"
  subMenu7="RECORDS"
  subMenu8="CONTROLS"
  subMenu9="SYSTEM"
  draw_sprite(sPmenuMain,-1,menuMainX,menuMainY) //main menu
  colorLightPink=make_color_rgb(213,180,112)
  colorDarkPink=make_color_rgb(184,104,8)
  colorLightPurple=make_color_rgb(108,49,27)
  colorDarkPurple=make_color_rgb(88,32,11)
  draw_set_alpha(1)
  //game info
  draw_set_color(colorDarkPink)
  draw_rectangle(menuMainX,menuMainY+220,menuMainX+67,menuMainY+231,false)
  draw_set_color(colorLightPink)
  draw_rectangle(menuMainX,menuMainY+220,menuMainX+67,menuMainY+231,true)
  draw_line(menuMainX+15,menuMainY+220,menuMainX+15,menuMainY+231)
  draw_set_color(colorLightPink)
  draw_set_font(fnt_SubMenu)
  draw_set_halign(fa_left)
  draw_text(menuMainX+3,menuMainY+219,"F1 Game Info")
  //teleport option
  if global.gameProgress>=86
  {
    if global.teleportEnabled=0
      draw_set_color(colorLightPink)
    else
      draw_set_color(make_color_rgb(195,105,118))
    draw_rectangle(menuMainX+263,menuMainY+220,menuMainX+319,menuMainY+231,false)
    draw_set_color(colorDarkPink)
    draw_rectangle(menuMainX+263,menuMainY+220,menuMainX+319,menuMainY+231,true)
    draw_line(menuMainX+277,menuMainY+220,menuMainX+277,menuMainY+231)
    draw_set_color(colorDarkPurple)
    draw_text(menuMainX+266,menuMainY+219,"M Teleport")
  }
  //Close game note
  draw_set_font(fnt_SubMenu)
  draw_set_color(colorDarkPurple)
  draw_set_halign(fa_center)
  draw_text(menuMainX+160,menuMainY-32,"Note: You can press Esc at any time to quit the game.")
  //current submenu
  draw_set_color(colorLightPink)
  draw_rectangle(menuMainX+110,menuMainY-18,menuMainX+210,menuMainY,false)
  draw_set_color(colorDarkPurple)
  draw_rectangle(menuMainX+111,menuMainY-17,menuMainX+210,menuMainY-1,true)
  draw_set_color(colorDarkPink)
  draw_rectangle(menuMainX+110,menuMainY-18,menuMainX+211,menuMainY,true)
  draw_set_blend_mode(bm_add)
  draw_set_color(colorLightPurple)
  draw_set_alpha(0.5)
  for (iLine=0;iLine<xLineEffectMax;iLine+=1)
  {
    with xLineEffect[iLine]
    {
      draw_line(x,y,x,y+191)
      x+=0.5
      if x>=oHUD.menuMainX+316
        x=oHUD.menuMainX+4
    }
  }

  for (iLine=0;iLine<yLineEffectMax;iLine+=1)
  {
    with yLineEffect[iLine]
    {
      draw_line(x,y,x+311,y)
      y+=0.5
      if y>=oHUD.menuMainY+196
        y=oHUD.menuMainY+4
    }
  }
  draw_set_blend_mode(bm_normal)
  //menu pos
  menuPosDisplayX=menuMainX+218
  menuPosDisplayY=menuMainY-6
  draw_set_alpha(1)
  if currentMenu=1
    draw_set_color(dpOn)
  else
    draw_set_color(dpOff)
  draw_circle(menuPosDisplayX,menuPosDisplayY,3,false)
  if currentMenu=2
    draw_set_color(dpOn)
  else
    draw_set_color(dpOff)
  draw_circle(menuPosDisplayX+8,menuPosDisplayY,3,false)
  if currentMenu=3
    draw_set_color(dpOn)
  else
    draw_set_color(dpOff)
  draw_circle(menuPosDisplayX+16,menuPosDisplayY,3,false)
  if currentMenu=4
    draw_set_color(dpOn)
  else
    draw_set_color(dpOff)
  draw_circle(menuPosDisplayX+24,menuPosDisplayY,3,false)
  if currentMenu=5
    draw_set_color(dpOn)
  else
    draw_set_color(dpOff)
  draw_circle(menuPosDisplayX+32,menuPosDisplayY,3,false)
  if currentMenu=6
    draw_set_color(dpOn)
  else
    draw_set_color(dpOff)
  draw_circle(menuPosDisplayX+40,menuPosDisplayY,3,false)
  if currentMenu=7
    draw_set_color(dpOn)
  else
    draw_set_color(dpOff)
  draw_circle(menuPosDisplayX+48,menuPosDisplayY,3,false)
  if currentMenu=8
    draw_set_color(dpOn)
  else
    draw_set_color(dpOff)
  draw_circle(menuPosDisplayX+56,menuPosDisplayY,3,false)
  if currentMenu=9
    draw_set_color(dpOn)
  else
    draw_set_color(dpOff)
  draw_circle(menuPosDisplayX+64,menuPosDisplayY,3,false)
  draw_set_color(dpBorder)
  draw_circle(menuPosDisplayX,menuPosDisplayY,3,true)
  draw_circle(menuPosDisplayX+8,menuPosDisplayY,3,true)
  draw_circle(menuPosDisplayX+16,menuPosDisplayY,3,true)
  draw_circle(menuPosDisplayX+24,menuPosDisplayY,3,true)
  draw_circle(menuPosDisplayX+32,menuPosDisplayY,3,true)
  draw_circle(menuPosDisplayX+40,menuPosDisplayY,3,true)
  draw_circle(menuPosDisplayX+48,menuPosDisplayY,3,true)
  draw_circle(menuPosDisplayX+56,menuPosDisplayY,3,true)
  draw_circle(menuPosDisplayX+64,menuPosDisplayY,3,true)
  // ======================================================================
  if currentMenu=1 //Status ==================================================
  {
    draw_set_font(fnt_GoToMenu)
    subMenuBasicX=menuMainX+16
    subMenuBasicY=menuMainY+16
    draw_set_alpha(1)
    draw_set_color(colorDarkPurple)
    draw_set_halign(fa_center)
    draw_text(menuMainX+160,menuMainY-19,subMenu1)
    draw_text(menuMainX+60,menuMainY+196,subMenu9)
    draw_text(menuMainX+260,menuMainY+196,subMenu2)
    //---------- BASIC ----------
    draw_set_font(fnt_SubMenu)
    draw_set_alpha(0.9)
    draw_set_color(colorDarkPink)
    draw_rectangle(subMenuBasicX,subMenuBasicY,subMenuBasicX+120,subMenuBasicY+110,false)
    draw_set_alpha(1)
    draw_set_color(colorLightPink)
    draw_rectangle(subMenuBasicX,subMenuBasicY,subMenuBasicX+120,subMenuBasicY+110,true)
    draw_line(subMenuBasicX,subMenuBasicY+10,subMenuBasicX+120,subMenuBasicY+10)
    draw_text(subMenuBasicX+60,subMenuBasicY-2,"JUST SOME NUMBERS")
    draw_set_color(colorDarkPurple)
    draw_set_halign(fa_left)
    draw_text(subMenuBasicX+3,subMenuBasicY+9,"Life")
    draw_text(subMenuBasicX+3,subMenuBasicY+20,"Spirit")
    draw_text(subMenuBasicX+3,subMenuBasicY+31,"Element")
    draw_text(subMenuBasicX+3,subMenuBasicY+42,"Physical Power")
    draw_text(subMenuBasicX+3,subMenuBasicY+53,"Physical Defense")
    draw_text(subMenuBasicX+3,subMenuBasicY+64,"Spirit Power")
    draw_text(subMenuBasicX+3,subMenuBasicY+75,"Spirit Defense")
    draw_text(subMenuBasicX+3,subMenuBasicY+86,"Exp")
    draw_text(subMenuBasicX+3,subMenuBasicY+97,"Next Lv")
    draw_set_color(colorLightPink)
    draw_set_halign(fa_right)
    var beadPAtk,beadPDef,beadMAtk,beadMDef;
    beadPAtk=0
    beadPDef=0
    beadMAtk=0
    beadMDef=0
    if global.invBracelet[0]>=2
      beadPAtk+=20
    if global.invBracelet[1]>=2
      beadPDef+=20
    if global.invBracelet[2]>=2
      beadMAtk+=20
    if global.invBracelet[3]>=2
      beadMDef+=20
    if global.invBracelet[4]>=2
    {
      beadPAtk+=10
      beadPDef+=10
      beadMAtk+=10
      beadMDef+=10
    }
    draw_text(subMenuBasicX+119,subMenuBasicY+9,string(round(oPlayer1.life)) +string(" / ") +string(oPlayer1.maxLife))
    draw_text(subMenuBasicX+119,subMenuBasicY+20,string(round(oPlayer1.spiritEnergy)) +string(" / ") +string(oPlayer1.maxSpiritEnergy))
    draw_text(subMenuBasicX+119,subMenuBasicY+31,oPlayer1.maxFireEnergy)
    draw_text(subMenuBasicX+119,subMenuBasicY+42,oPlayer1.physicalPower+beadPAtk)
    draw_text(subMenuBasicX+119,subMenuBasicY+53,oPlayer1.physicalDefense+beadPDef)
    draw_text(subMenuBasicX+119,subMenuBasicY+64,oPlayer1.spiritPower+beadMAtk)
    draw_text(subMenuBasicX+119,subMenuBasicY+75,oPlayer1.spiritDefense+beadMDef)
    if oPlayer1.level<64
    {
      draw_text(subMenuBasicX+119,subMenuBasicY+86,oPlayer1.expCurrent)
      draw_text(subMenuBasicX+119,subMenuBasicY+97,oPlayer1.expNext)
    }
    else
    {
      draw_text(subMenuBasicX+119,subMenuBasicY+86,"-----")
      draw_text(subMenuBasicX+119,subMenuBasicY+97,"-----")
    }
    //---------- RESISTANCE ----------
    subMenuResistX=menuMainX+183
    subMenuResistY=menuMainY+16
    draw_set_alpha(0.9)
    draw_set_color(colorDarkPink)
    draw_rectangle(subMenuResistX,subMenuResistY,subMenuResistX+120,subMenuResistY+59,false)
    draw_set_alpha(1)
    draw_set_color(colorLightPink)
    draw_rectangle(subMenuResistX,subMenuResistY,subMenuResistX+120,subMenuResistY+59,true)
    draw_line(subMenuResistX,subMenuResistY+10,subMenuResistX+120,subMenuResistY+10)
    draw_set_halign(fa_center)
    draw_text(subMenuResistX+60,subMenuResistY-2,"SOME MORE NUMBERS")
    draw_set_color(colorDarkPurple)
    draw_set_halign(fa_left)
    draw_text(subMenuResistX+3,subMenuResistY+9,"Fire Resist")
    draw_text(subMenuResistX+3,subMenuResistY+21,"Water Resist")
    draw_text(subMenuResistX+3,subMenuResistY+33,"Wind Resist")
    draw_text(subMenuResistX+3,subMenuResistY+45,"Earth Resist")
    draw_set_color(colorLightPink)
    draw_set_halign(fa_right)
    var eFireRes,eWaterRes,eWindRes,eEarthRes,beadFire,beadWater,beadWind,beadEarth;
    if global.p1CurrentElement=1
      eFireRes=10
    else
      eFireRes=0
    if global.p1CurrentElement=2
      eWaterRes=10
    else
      eWaterRes=0
    if global.p1CurrentElement=3
      eWindRes=10
    else
      eWindRes=0
    if global.p1CurrentElement=4
      eEarthRes=10
    else
      eEarthRes=0
    beadFire=0
    beadWater=0
    beadWind=0
    beadEarth=0
    if global.invBracelet[5]>=2
      beadFire+=20
    if global.invBracelet[6]>=2
      beadWater+=20
    if global.invBracelet[7]>=2
      beadWind+=20
    if global.invBracelet[8]>=2
      beadEarth+=20
    if global.invBracelet[9]>=2
    {
      beadFire+=10
      beadWater+=10
      beadWind+=10
      beadEarth+=10
    }
    draw_text(subMenuResistX+119,subMenuResistY+9,global.p1FIREresist+eFireRes+beadFire)
    draw_text(subMenuResistX+119,subMenuResistY+21,global.p1WATERresist+eWaterRes+beadWater)
    draw_text(subMenuResistX+119,subMenuResistY+33,global.p1WINDresist+eWindRes+beadWind)
    draw_text(subMenuResistX+119,subMenuResistY+45,global.p1EARTHresist+eEarthRes+beadEarth)
    //---------- MONEY ----------
    subMenuMoneyX=menuMainX+16
    subMenuMoneyY=menuMainY+134
    draw_set_alpha(0.9)
    draw_set_color(colorDarkPink)
    draw_rectangle(subMenuMoneyX,subMenuMoneyY,subMenuMoneyX+120,subMenuMoneyY+35,false)
    draw_set_alpha(1)
    draw_set_color(colorLightPink)
    draw_rectangle(subMenuMoneyX,subMenuMoneyY,subMenuMoneyX+120,subMenuMoneyY+35,true)
    draw_line(subMenuMoneyX,subMenuMoneyY+10,subMenuMoneyX+120,subMenuMoneyY+10)
    draw_set_halign(fa_center)
    draw_text(subMenuMoneyX+60,subMenuMoneyY-2,"MONEY!!")
    draw_set_color(colorDarkPurple)
    draw_set_halign(fa_left)
    draw_text(subMenuMoneyX+3,subMenuMoneyY+9,"Internetz")
    draw_text(subMenuMoneyX+3,subMenuMoneyY+21,"Wallet Size")
    draw_set_color(colorLightPink)
    draw_set_halign(fa_right)
    draw_text(subMenuMoneyX+119,subMenuMoneyY+9,oPlayer1.moneyTotal)
    draw_text(subMenuMoneyX+119,subMenuMoneyY+21,global.p1MoneyMax)
    //---------- SHROUD WARN LEVEL ----------
    if global.gameProgress>=183 and global.gameProgress<=323
    {
      var shroudWarning;
      shroudWarning="Minimal"
      if global.shroudThreat<=14
        shroudWarning="None"
      else if global.shroudThreat>=15 and global.shroudThreat<=29
        shroudWarning="Minimal"
      else if global.shroudThreat>=30 and global.shroudThreat<=44
        shroudWarning="Low"
      else if global.shroudThreat>=45 and global.shroudThreat<=59
        shroudWarning="Moderate"
      else if global.shroudThreat>=60 and global.shroudThreat<=74
        shroudWarning="High"
      else if global.shroudThreat>=75 and global.shroudThreat<=89
        shroudWarning="Critical"
      else if global.shroudThreat>=90 and global.shroudThreat<=999
        shroudWarning="Imminent"
      else if global.shroudThreat>=1000
        shroudWarning="Followed"

      subMenuWarnX=menuMainX+183
      subMenuWarnY=menuMainY+84
      draw_set_alpha(0.9)
      draw_set_color(colorDarkPink)
      draw_rectangle(subMenuWarnX,subMenuWarnY,subMenuWarnX+120,subMenuWarnY+23,false)
      draw_set_alpha(1)
      draw_set_color(colorLightPink)
      draw_rectangle(subMenuWarnX,subMenuWarnY,subMenuWarnX+120,subMenuWarnY+23,true)
      draw_line(subMenuWarnX,subMenuWarnY+10,subMenuWarnX+120,subMenuWarnY+10)
      draw_set_halign(fa_center)
      draw_text(subMenuWarnX+60,subMenuWarnY-2,"SHROUD WARN LEVEL")
      draw_set_color(colorDarkPurple)
      draw_text(subMenuWarnX+60,subMenuWarnY+9,shroudWarning)
    }

    //---------- OTHER ----------
    subMenuOtherX=menuMainX+183
    subMenuOtherY=menuMainY+129
    draw_set_alpha(0.9)
    draw_set_color(colorDarkPink)
    draw_rectangle(subMenuOtherX,subMenuOtherY,subMenuOtherX+120,subMenuOtherY+59,false)
    draw_set_alpha(1)
    draw_set_color(colorLightPink)
    draw_rectangle(subMenuOtherX,subMenuOtherY,subMenuOtherX+120,subMenuOtherY+59,true)
    draw_line(subMenuOtherX,subMenuOtherY+10,subMenuOtherX+120,subMenuOtherY+10)
    draw_set_halign(fa_center)
    draw_text(subMenuOtherX+60,subMenuOtherY-2,"RANDOM STUFF")
    draw_set_color(colorDarkPurple)
    draw_set_halign(fa_left)
    draw_text(subMenuOtherX+3,subMenuOtherY+9,"Awesome")
    draw_text(subMenuOtherX+3,subMenuOtherY+21,"Kills")
    draw_text(subMenuOtherX+3,subMenuOtherY+33,"Deaths")
    draw_text(subMenuOtherX+3,subMenuOtherY+45,"Play Time")
    draw_set_color(colorLightPink)
    draw_set_halign(fa_right)
    draw_text(subMenuOtherX+119,subMenuOtherY+9,oPlayer1.awesomePoints)
    draw_text(subMenuOtherX+119,subMenuOtherY+21,global.p1KillCount)
    draw_text(subMenuOtherX+119,subMenuOtherY+33,global.deathCount)
    draw_text(subMenuOtherX+119,subMenuOtherY+45,global.playTimeSecond)
    if global.playTimeSecond<10
      draw_text(subMenuOtherX+113,subMenuOtherY+45,"0")
    draw_text(subMenuOtherX+107,subMenuOtherY+45,":")
    draw_text(subMenuOtherX+105,subMenuOtherY+45,global.playTimeMinute)
    if global.playTimeMinute<10
      draw_text(subMenuOtherX+99,subMenuOtherY+45,"0")
    draw_text(subMenuOtherX+93,subMenuOtherY+45,":")
    draw_text(subMenuOtherX+91,subMenuOtherY+45,global.playTimeHour)
    //---------- Total Exp ----------
    subMenuTotalExpX=menuMainX+16
    subMenuTotalExpY=menuMainY+177
    draw_set_alpha(0.9)
    draw_set_color(colorDarkPink)
    draw_rectangle(subMenuTotalExpX,subMenuTotalExpY,subMenuTotalExpX+162,subMenuTotalExpY+11,false)
    draw_set_alpha(1)
    draw_set_color(colorLightPink)
    draw_rectangle(subMenuTotalExpX,subMenuTotalExpY,subMenuTotalExpX+162,subMenuTotalExpY+11,true)
    draw_set_halign(fa_left)
    draw_set_color(colorDarkPurple)
    draw_text(subMenuTotalExpX+3,subMenuTotalExpY-2,"Total Exp")
    draw_set_halign(fa_right)
    draw_set_color(colorLightPink)
    draw_text(subMenuTotalExpX+161,subMenuTotalExpY-2,oPlayer1.expTotal)
  }
  // ======================================================================
  else if currentMenu=2 //Inventory ==================================================
  {
    draw_set_font(fnt_GoToMenu)
    draw_set_alpha(1)
    draw_set_color(colorDarkPurple)
    draw_set_halign(fa_center)
    draw_text(menuMainX+160,menuMainY-19,subMenu2)
    draw_text(menuMainX+60,menuMainY+196,subMenu1)
    draw_text(menuMainX+260,menuMainY+196,subMenu3)
    //---------- SHOW ITEM PICTURE ----------
    subMenuItemPicX=menuMainX+147
    subMenuItemPicY=menuMainY+16
    draw_set_alpha(0.9)
    draw_set_color(colorDarkPink)
    draw_rectangle(subMenuItemPicX,subMenuItemPicY,subMenuItemPicX+17,subMenuItemPicY+17,false)
    draw_set_alpha(1)
    draw_set_color(colorLightPink)
    draw_rectangle(subMenuItemPicX,subMenuItemPicY,subMenuItemPicX+17,subMenuItemPicY+17,true)
    if subCursorPos=1
      invItem=cursorPosY-1
    else if subCursorPos=2
      invItem=3+cursorPosY
    draw_sprite(sInvPic,invItem,subMenuItemPicX+1,subMenuItemPicY+1)
    //---------- STUFF TO USE ----------
    subMenuConsumablesX=menuMainX+16
    subMenuConsumablesY=menuMainY+16
    draw_set_font(fnt_SubMenu)
    draw_set_alpha(0.9)
    draw_set_color(colorDarkPink)
    draw_rectangle(subMenuConsumablesX,subMenuConsumablesY,subMenuConsumablesX+128,subMenuConsumablesY+110,false)
    draw_set_alpha(1)
    draw_set_color(colorLightPink)
    draw_rectangle(subMenuConsumablesX,subMenuConsumablesY,subMenuConsumablesX+128,subMenuConsumablesY+110,true)
    draw_line(subMenuConsumablesX,subMenuConsumablesY+10,subMenuConsumablesX+128,subMenuConsumablesY+10)
    draw_set_halign(fa_center)
    draw_text(subMenuConsumablesX+64,subMenuConsumablesY-2,"STUFF TO USE")
    draw_set_color(colorDarkPurple)
    draw_set_halign(fa_left)
    draw_rectangle(subMenuConsumablesX+4,subMenuConsumablesY+14,subMenuConsumablesX+12,subMenuConsumablesY+22,true)
    draw_rectangle(subMenuConsumablesX+4,subMenuConsumablesY+26,subMenuConsumablesX+12,subMenuConsumablesY+34,true)
    draw_rectangle(subMenuConsumablesX+4,subMenuConsumablesY+38,subMenuConsumablesX+12,subMenuConsumablesY+46,true)
    draw_rectangle(subMenuConsumablesX+4,subMenuConsumablesY+50,subMenuConsumablesX+12,subMenuConsumablesY+58,true)
    draw_rectangle(subMenuConsumablesX+4,subMenuConsumablesY+62,subMenuConsumablesX+12,subMenuConsumablesY+70,true)
    draw_rectangle(subMenuConsumablesX+4,subMenuConsumablesY+74,subMenuConsumablesX+12,subMenuConsumablesY+82,true)
    draw_rectangle(subMenuConsumablesX+4,subMenuConsumablesY+86,subMenuConsumablesX+12,subMenuConsumablesY+94,true)
    draw_rectangle(subMenuConsumablesX+4,subMenuConsumablesY+98,subMenuConsumablesX+12,subMenuConsumablesY+106,true)
    draw_text(subMenuConsumablesX+16,subMenuConsumablesY+11,"Skittles")
    draw_text(subMenuConsumablesX+16,subMenuConsumablesY+23,"Turbo Smoothie")
    draw_text(subMenuConsumablesX+16,subMenuConsumablesY+35,"Starburst")
    draw_text(subMenuConsumablesX+16,subMenuConsumablesY+47,"Gummy Bears")
    draw_text(subMenuConsumablesX+16,subMenuConsumablesY+59,global.p1WeaponGem)
    draw_text(subMenuConsumablesX+16,subMenuConsumablesY+71,global.p1Armor)
    draw_text(subMenuConsumablesX+16,subMenuConsumablesY+83,global.p1Ring)
    draw_text(subMenuConsumablesX+16,subMenuConsumablesY+95,"Friendship Bracelet")
    draw_set_halign(fa_right)
    draw_text(subMenuConsumablesX+110,subMenuConsumablesY+11,"x")
    draw_text(subMenuConsumablesX+110,subMenuConsumablesY+23,"x")
    draw_text(subMenuConsumablesX+110,subMenuConsumablesY+35,"x")
    draw_text(subMenuConsumablesX+110,subMenuConsumablesY+47,"x")
    draw_set_color(colorLightPink)
    draw_text(subMenuConsumablesX+117,subMenuConsumablesY+11,oPlayer1.conSkittles)
    draw_text(subMenuConsumablesX+117,subMenuConsumablesY+23,oPlayer1.conSmoothie)
    draw_text(subMenuConsumablesX+117,subMenuConsumablesY+35,oPlayer1.conStarburst)
    draw_text(subMenuConsumablesX+117,subMenuConsumablesY+47,oPlayer1.conGummyBears)
    draw_set_color(colorDarkPurple)
    draw_text(subMenuConsumablesX+127,subMenuConsumablesY+11,"/9")
    draw_text(subMenuConsumablesX+127,subMenuConsumablesY+23,"/3")
    draw_text(subMenuConsumablesX+127,subMenuConsumablesY+35,"/5")
    draw_text(subMenuConsumablesX+127,subMenuConsumablesY+47,"/7")
    //---------- OTHER STUFF ----------
    otherMenuX=menuMainX+173
    otherMenuY=menuMainY+16
    draw_set_alpha(0.9)
    draw_set_color(colorDarkPink)
    draw_rectangle(otherMenuX,otherMenuY,otherMenuX+128,otherMenuY+71,false)
    draw_set_alpha(1)
    draw_set_color(colorLightPink)
    draw_rectangle(otherMenuX,otherMenuY,otherMenuX+128,otherMenuY+71,true)
    draw_line(otherMenuX,otherMenuY+10,otherMenuX+128,otherMenuY+10)
    draw_set_halign(fa_center)
    draw_text(otherMenuX+64,otherMenuY-2,"OTHER STUFF")
    draw_set_color(colorDarkPurple)
    draw_set_halign(fa_left)
    draw_text(otherMenuX+3,otherMenuY+9,"Skill Capsules")
    draw_text(otherMenuX+3,otherMenuY+21,"Chests Opened")
    draw_text(otherMenuX+3,otherMenuY+33,"Heart Pieces")
    draw_text(otherMenuX+3,otherMenuY+45,"Spirit Auras")
    draw_text(otherMenuX+3,otherMenuY+57,"Other Stuff")
    draw_set_halign(fa_right)
    draw_set_color(colorLightPink)
    var capsuleCheck,chestCheck,heartCheck,spiritCheck,totalChest,techCheck,beadCheck;
    chestCheck=0
    heartCheck=0
    capsuleCheck=0
    spiritCheck=0
    techCheck=0
    beadCheck=0
    totalChest=global.maxMoneyChest+global.maxItemChest
    for (i=0;i<=global.maxSkillCapsules;i+=1)
      if global.skillCapsules[i]=1
        capsuleCheck+=1
    for (i=0;i<=global.maxMoneyChest;i+=1)
      if global.moneyChest[i]=1
        chestCheck+=1
    for (i=0;i<=global.maxItemChest;i+=1)
      if global.itemChest[i]=1
        chestCheck+=1
    for (i=0;i<=global.maxHeartPiece;i+=1)
      if global.heartPiece[i]=1
        heartCheck+=1
    for (i=0;i<=global.maxSpiritAuras;i+=1)
      if global.spiritAuras[i]=1
        spiritCheck+=1
    for (i=0;i<=global.maxTechCapsules;i+=1)
      if global.techCapsule[i]=1
        techCheck+=1
    for(i=0;i<18;i+=1)
      if global.invBracelet[i]>=1
        beadCheck+=1
    draw_text(otherMenuX+106,otherMenuY+9,capsuleCheck)
    draw_text(otherMenuX+106,otherMenuY+21,chestCheck+beadCheck)
    draw_text(otherMenuX+106,otherMenuY+33,heartCheck)
    draw_text(otherMenuX+106,otherMenuY+45,spiritCheck)
    draw_text(otherMenuX+106,otherMenuY+57,techCheck)
    draw_set_color(colorDarkPurple)
    draw_text(otherMenuX+127,otherMenuY+9,string("/") +string(global.maxSkillCapsules+1))
    draw_text(otherMenuX+127,otherMenuY+21,string("/") +string(totalChest+18+2))
    draw_text(otherMenuX+127,otherMenuY+33,string("/") +string(global.maxHeartPiece+1))
    draw_text(otherMenuX+127,otherMenuY+45,string("/") +string(global.maxSpiritAuras+1))
    draw_text(otherMenuX+127,otherMenuY+57,string("/") +string(global.maxTechCapsules+1))
    //---------- ITEM % ----------
    percentMenuX=menuMainX+173
    percentMenuY=menuMainY+109
    draw_set_alpha(0.9)
    draw_set_color(colorDarkPink)
    draw_rectangle(percentMenuX,percentMenuY,percentMenuX+94,percentMenuY+10,false)
    draw_set_alpha(1)
    draw_set_color(colorLightPink)
    draw_rectangle(percentMenuX,percentMenuY,percentMenuX+94,percentMenuY+10,true)
    draw_set_color(colorDarkPurple)
    draw_set_halign(fa_left)
    draw_text(percentMenuX+3,percentMenuY-2,"Item %")
    draw_set_halign(fa_right)
    draw_set_color(colorLightPink)
    var itemPercect,itemCurrent,itemTotal;
    itemCurrent=capsuleCheck+chestCheck+heartCheck+spiritCheck+techCheck+beadCheck
    itemTotal=global.maxSkillCapsules+global.maxHeartPiece+global.maxSpiritAuras+global.maxTechCapsules+totalChest+18+6
    itemPercect=(itemCurrent/itemTotal)*100
    draw_text(percentMenuX+83,percentMenuY-2,itemPercect)
    draw_text(percentMenuX+92,percentMenuY-2,"%")
    //---------- HEART PIECES ----------
    heartPieceMenuX=menuMainX+274
    heartPieceMenuY=menuMainY+94
    draw_set_alpha(0.9)
    draw_set_color(colorDarkPink)
    draw_rectangle(heartPieceMenuX,heartPieceMenuY,heartPieceMenuX+27,heartPieceMenuY+25,false)
    draw_set_alpha(1)
    draw_set_color(colorLightPink)
    draw_rectangle(heartPieceMenuX,heartPieceMenuY,heartPieceMenuX+27,heartPieceMenuY+25,true)
    draw_sprite(sInvHeartPieceCheck,global.p1HeartPieces,heartPieceMenuX+1,heartPieceMenuY+1)
  }
  // ======================================================================
  else if currentMenu=3 //Techniques ==================================================
  {
    draw_set_font(fnt_GoToMenu)
    subMenuSkillSetX=menuMainX+16
    subMenuSkillSetY=menuMainY+16
    draw_set_alpha(1)
    draw_set_color(colorDarkPurple)
    draw_set_halign(fa_center)
    draw_text(menuMainX+160,menuMainY-19,subMenu3)
    draw_text(menuMainX+60,menuMainY+196,subMenu2)
    draw_text(menuMainX+260,menuMainY+196,subMenu4)
    draw_set_font(fnt_SubMenu)
    draw_sprite(sTechTab,-1,subMenuSkillSetX,subMenuSkillSetY+49)
    draw_sprite_ext(sTechTab,-1,subMenuSkillSetX+145,subMenuSkillSetY+49,-1,1,0,c_white,1)
    if triMoveTime>=15
    {
      if triX=0
        triX=1
      else
        triX=0
      triMoveTime=0
    }
    else
      triMoveTime+=1
    draw_triangle(subMenuSkillSetX-1-triX,subMenuSkillSetY+36,subMenuSkillSetX-2-triX,subMenuSkillSetY+42,subMenuSkillSetX-4-triX,subMenuSkillSetY+39,false)
    draw_triangle(subMenuSkillSetX-1-triX,subMenuSkillSetY+56,subMenuSkillSetX-2-triX,subMenuSkillSetY+62,subMenuSkillSetX-4-triX,subMenuSkillSetY+59,false)
    draw_triangle(subMenuSkillSetX+146+triX,subMenuSkillSetY+36,subMenuSkillSetX+145+triX,subMenuSkillSetY+42,subMenuSkillSetX+149+triX,subMenuSkillSetY+39,false)
    draw_triangle(subMenuSkillSetX+146+triX,subMenuSkillSetY+56,subMenuSkillSetX+145+triX,subMenuSkillSetY+62,subMenuSkillSetX+149+triX,subMenuSkillSetY+59,false)
    draw_text(subMenuSkillSetX-5,subMenuSkillSetY+42,"A")
    draw_text(subMenuSkillSetX+150,subMenuSkillSetY+42,"D")
    draw_set_alpha(0.9)
    draw_set_color(colorDarkPink)
    draw_rectangle(subMenuSkillSetX,subMenuSkillSetY,subMenuSkillSetX+144,subMenuSkillSetY+98,false)
    draw_set_alpha(1)
    draw_set_color(colorLightPink)
    draw_rectangle(subMenuSkillSetX,subMenuSkillSetY,subMenuSkillSetX+144,subMenuSkillSetY+98,true)
    draw_line(subMenuSkillSetX,subMenuSkillSetY+10,subMenuSkillSetX+144,subMenuSkillSetY+10)
    draw_set_halign(fa_center)
    if subCursorPos=1 //PHYSICAL
    {
      draw_text(subMenuSkillSetX+72,subMenuSkillSetY-2,"PHYSICAL")
      if global.p1TechniqueEquip="MENTAL INSURRECTION"
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+14,subMenuSkillSetX+12,subMenuSkillSetY+22,false)
      if global.p1TechniqueEquip="WAVE OF AWESOME"
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+26,subMenuSkillSetX+12,subMenuSkillSetY+34,false)
      if global.p1TechniqueEquip="KUDEKU"
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+38,subMenuSkillSetX+12,subMenuSkillSetY+46,false)
      if global.p1TechniqueEquip="GRAND SLAM"
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+50,subMenuSkillSetX+12,subMenuSkillSetY+58,false)
      /*
      if global.p1TechniqueEquip="CONJURE"
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+62,subMenuSkillSetX+12,subMenuSkillSetY+70,false)*/
      draw_set_color(colorDarkPurple)
      if global.techLv>=1
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+14,subMenuSkillSetX+12,subMenuSkillSetY+22,true)
      if global.techLv>=2
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+26,subMenuSkillSetX+12,subMenuSkillSetY+34,true)
      if global.techLv>=3
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+38,subMenuSkillSetX+12,subMenuSkillSetY+46,true)
      if global.techLv>=4
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+50,subMenuSkillSetX+12,subMenuSkillSetY+58,true)
      /*
      if global.techLv>=5
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+62,subMenuSkillSetX+12,subMenuSkillSetY+70,true)*/
      draw_set_halign(fa_left)
      if global.techLv>=1
        draw_text(subMenuSkillSetX+16,subMenuSkillSetY+11,"Mental Insurrection")
      if global.techLv>=2
        draw_text(subMenuSkillSetX+16,subMenuSkillSetY+23,"Wave of Awesome")
      if global.techLv>=3
        draw_text(subMenuSkillSetX+16,subMenuSkillSetY+35,"Kudeku")
      if global.techLv>=4
        draw_text(subMenuSkillSetX+16,subMenuSkillSetY+47,"Grand Slam")
      /*
      if global.techLv>=5
        draw_text(subMenuSkillSetX+16,subMenuSkillSetY+59,"Conjure")*/
    }
    else if subCursorPos=2 //FIRE
    {
      draw_text(subMenuSkillSetX+72,subMenuSkillSetY-2,"FIRE")
      if global.p1FireEquip="FIREBALL"
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+14,subMenuSkillSetX+12,subMenuSkillSetY+22,false)
      if global.p1FireEquip="FLAME PILLAR"
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+26,subMenuSkillSetX+12,subMenuSkillSetY+34,false)
      if global.p1FireEquip="BLAST OFF"
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+38,subMenuSkillSetX+12,subMenuSkillSetY+46,false)
      if global.p1FireEquip="INFERNO"
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+50,subMenuSkillSetX+12,subMenuSkillSetY+58,false)
      if global.p1FireEquip="WILDFIRE"
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+62,subMenuSkillSetX+12,subMenuSkillSetY+70,false)
      draw_set_color(colorDarkPurple)
      draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+14,subMenuSkillSetX+12,subMenuSkillSetY+22,true)
      if global.fireLv>=2
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+26,subMenuSkillSetX+12,subMenuSkillSetY+34,true)
      if global.fireLv>=3
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+38,subMenuSkillSetX+12,subMenuSkillSetY+46,true)
      if global.fireLv>=4
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+50,subMenuSkillSetX+12,subMenuSkillSetY+58,true)
      if global.fireLv>=5
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+62,subMenuSkillSetX+12,subMenuSkillSetY+70,true)
      draw_set_halign(fa_left)
      draw_text(subMenuSkillSetX+16,subMenuSkillSetY+11,"Fireball")
      if global.fireLv>=2
        draw_text(subMenuSkillSetX+16,subMenuSkillSetY+23,"Flame Pillar")
      if global.fireLv>=3
        draw_text(subMenuSkillSetX+16,subMenuSkillSetY+35,"Blast Off")
      if global.fireLv>=4
        draw_text(subMenuSkillSetX+16,subMenuSkillSetY+47,"Inferno")
      if global.fireLv>=5
        draw_text(subMenuSkillSetX+16,subMenuSkillSetY+59,"Wildfire")
    }
    else if subCursorPos=3 //WATER
    {
      draw_text(subMenuSkillSetX+72,subMenuSkillSetY-2,"WATER")
      if global.p1WaterEquip="WATER BLAST"
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+14,subMenuSkillSetX+12,subMenuSkillSetY+22,false)
      if global.p1WaterEquip="WATER BARRIER"
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+26,subMenuSkillSetX+12,subMenuSkillSetY+34,false)
      if global.p1WaterEquip="FLOOD"
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+38,subMenuSkillSetX+12,subMenuSkillSetY+46,false)
      if global.p1WaterEquip="SOOTHING SPRING"
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+50,subMenuSkillSetX+12,subMenuSkillSetY+58,false)
      if global.p1WaterEquip="PIERCING STREAM"
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+62,subMenuSkillSetX+12,subMenuSkillSetY+70,false)
      draw_set_color(colorDarkPurple)
      draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+14,subMenuSkillSetX+12,subMenuSkillSetY+22,true)
      if global.waterLv>=2
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+26,subMenuSkillSetX+12,subMenuSkillSetY+34,true)
      if global.waterLv>=3
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+38,subMenuSkillSetX+12,subMenuSkillSetY+46,true)
      if global.waterLv>=4
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+50,subMenuSkillSetX+12,subMenuSkillSetY+58,true)
      if global.waterLv>=5
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+62,subMenuSkillSetX+12,subMenuSkillSetY+70,true)
      draw_set_halign(fa_left)
      draw_text(subMenuSkillSetX+16,subMenuSkillSetY+11,"Water Blast")
      if global.waterLv>=2
        draw_text(subMenuSkillSetX+16,subMenuSkillSetY+23,"Water Barrier")
      if global.waterLv>=3
        draw_text(subMenuSkillSetX+16,subMenuSkillSetY+35,"Flood")
      if global.waterLv>=4
        draw_text(subMenuSkillSetX+16,subMenuSkillSetY+47,"Soothing Spring")
      if global.waterLv>=5
        draw_text(subMenuSkillSetX+16,subMenuSkillSetY+59,"Piercing Stream")
    }
    else if subCursorPos=4 //WIND
    {
      draw_text(subMenuSkillSetX+72,subMenuSkillSetY-2,"WIND")
      if global.p1WindEquip="WIND BURST"
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+14,subMenuSkillSetX+12,subMenuSkillSetY+22,false)
      if global.p1WindEquip="ZEPHYR"
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+26,subMenuSkillSetX+12,subMenuSkillSetY+34,false)
      if global.p1WindEquip="CYCLONE"
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+38,subMenuSkillSetX+12,subMenuSkillSetY+46,false)
      if global.p1WindEquip="BLAST SHIELD"
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+50,subMenuSkillSetX+12,subMenuSkillSetY+58,false)
      if global.p1WindEquip="HURRICANE"
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+62,subMenuSkillSetX+12,subMenuSkillSetY+70,false)
      draw_set_color(colorDarkPurple)
      draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+14,subMenuSkillSetX+12,subMenuSkillSetY+22,true)
      if global.windLv>=2
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+26,subMenuSkillSetX+12,subMenuSkillSetY+34,true)
      if global.windLv>=3
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+38,subMenuSkillSetX+12,subMenuSkillSetY+46,true)
      if global.windLv>=4
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+50,subMenuSkillSetX+12,subMenuSkillSetY+58,true)
      if global.windLv>=5
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+62,subMenuSkillSetX+12,subMenuSkillSetY+70,true)
      draw_set_halign(fa_left)
      draw_text(subMenuSkillSetX+16,subMenuSkillSetY+11,"Wind Burst")
      if global.windLv>=2
        draw_text(subMenuSkillSetX+16,subMenuSkillSetY+23,"Zephyr")
      if global.windLv>=3
        draw_text(subMenuSkillSetX+16,subMenuSkillSetY+35,"Cyclone")
      if global.windLv>=4
        draw_text(subMenuSkillSetX+16,subMenuSkillSetY+47,"Blast Shield")
      if global.windLv>=5
        draw_text(subMenuSkillSetX+16,subMenuSkillSetY+59,"Hurricane")
    }
    else if subCursorPos=5 //EARTH
    {
      draw_text(subMenuSkillSetX+72,subMenuSkillSetY-2,"EARTH")
      if global.p1EarthEquip="ROCK SMASH"
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+14,subMenuSkillSetX+12,subMenuSkillSetY+22,false)
      if global.p1EarthEquip="NATURE'S GIFT"
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+26,subMenuSkillSetX+12,subMenuSkillSetY+34,false)
      if global.p1EarthEquip="EARTH SHIFT"
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+38,subMenuSkillSetX+12,subMenuSkillSetY+46,false)
      if global.p1EarthEquip="RUPTURE"
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+50,subMenuSkillSetX+12,subMenuSkillSetY+58,false)
      if global.p1EarthEquip="ROCK DRILL"
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+62,subMenuSkillSetX+12,subMenuSkillSetY+70,false)
      draw_set_color(colorDarkPurple)
      draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+14,subMenuSkillSetX+12,subMenuSkillSetY+22,true)
      draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+26,subMenuSkillSetX+12,subMenuSkillSetY+34,true)
      if global.earthLv>=2
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+38,subMenuSkillSetX+12,subMenuSkillSetY+46,true)
      if global.earthLv>=3
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+50,subMenuSkillSetX+12,subMenuSkillSetY+58,true)
      if global.earthLv>=4
        draw_rectangle(subMenuSkillSetX+4,subMenuSkillSetY+62,subMenuSkillSetX+12,subMenuSkillSetY+70,true)
      draw_set_halign(fa_left)
      draw_text(subMenuSkillSetX+16,subMenuSkillSetY+11,"Rock Smash")
      draw_text(subMenuSkillSetX+16,subMenuSkillSetY+23,"Nature's Gift")
      if global.earthLv>=2
        draw_text(subMenuSkillSetX+16,subMenuSkillSetY+35,"Earth Shift")
      if global.earthLv>=3
        draw_text(subMenuSkillSetX+16,subMenuSkillSetY+47,"Rupture")
      if global.earthLv>=4
        draw_text(subMenuSkillSetX+16,subMenuSkillSetY+59,"Rock Drill")
    }
  }
  // ======================================================================
  else if currentMenu=4 //Skills ==================================================
  {
    //---------- SKILL POINTS ----------
    draw_set_font(fnt_GoToMenu)
    subMenuSPX=menuMainX+32
    subMenuSPY=menuMainY+16
    draw_set_alpha(1)
    draw_set_color(colorDarkPurple)
    draw_set_halign(fa_center)
    draw_text(menuMainX+160,menuMainY-19,subMenu4)
    draw_text(menuMainX+60,menuMainY+196,subMenu3)
    draw_text(menuMainX+260,menuMainY+196,subMenu5)
    draw_set_font(fnt_SubMenu)
    draw_set_alpha(0.9)
    draw_set_color(colorDarkPink)
    draw_rectangle(subMenuSPX,subMenuSPY,subMenuSPX+140,subMenuSPY+10,false)
    draw_set_alpha(1)
    draw_set_color(colorLightPink)
    draw_rectangle(subMenuSPX,subMenuSPY,subMenuSPX+140,subMenuSPY+10,true)
    draw_set_halign(fa_left)
    draw_set_color(colorDarkPurple)
    draw_text(subMenuSPX+2,subMenuSPY-2,"SKILL POINTS")
    draw_set_color(colorLightPink)
    draw_set_halign(fa_right)
    draw_text(subMenuSPX+139,subMenuSPY-2,global.p1SkillPoints)
    //---------- LEARN SKILLS ----------
    subMenuSkillX=menuMainX+32
    subMenuSkillY=menuMainY+33
    draw_set_alpha(0.9)
    draw_set_color(colorDarkPink)
    draw_rectangle(subMenuSkillX,subMenuSkillY,subMenuSkillX+236,subMenuSkillY+110,false)
    draw_set_alpha(1)
    draw_set_color(colorLightPink)
    draw_rectangle(subMenuSkillX,subMenuSkillY,subMenuSkillX+236,subMenuSkillY+110,true)
    draw_line(subMenuSkillX,subMenuSkillY+10,subMenuSkillX+236,subMenuSkillY+10)
    draw_set_halign(fa_center)
    slSpc=13
    skTreeX=subMenuSkillX+38
    skTreeY=subMenuSkillY+1
    if subCursorPos=1 //---------- WEAPON ----------
    {
      draw_text(subMenuSkillX+118,subMenuSkillY-2,"WEAPON")
      draw_sprite_ext(sSkillTab,-1,subMenuSkillX,subMenuSkillY+23,1,1,0,c_white,1)
      draw_sprite_ext(sSkillTab,-1,subMenuSkillX,subMenuSkillY+50,1,1,0,c_white,0.5)
      draw_sprite_ext(sSkillTab,-1,subMenuSkillX,subMenuSkillY+77,1,1,0,c_white,0.5)
      draw_text_color(subMenuSkillX-6,subMenuSkillY+16,"W",colorLightPink,colorLightPink,colorLightPink,colorLightPink,1)
      draw_text_color(subMenuSkillX-5,subMenuSkillY+43,"P",colorLightPink,colorLightPink,colorLightPink,colorLightPink,0.5)
      draw_text_color(subMenuSkillX-6,subMenuSkillY+70,"S",colorLightPink,colorLightPink,colorLightPink,colorLightPink,0.5)
      draw_set_color(colorDarkPink)
      draw_line(subMenuSkillX,subMenuSkillY+11,subMenuSkillX,subMenuSkillY+35)
      draw_set_color(colorLightPink)
      if global.SkSharpen>=1
        draw_rectangle(skTreeX+(slSpc*1),skTreeY+(slSpc*1),skTreeX+(slSpc*1)+10,skTreeY+(slSpc*1)+10,false)
      if global.SkSharpen>=2
        draw_rectangle(skTreeX+(slSpc*2),skTreeY+(slSpc*1),skTreeX+(slSpc*2)+10,skTreeY+(slSpc*1)+10,false)
      if global.SkSmash>=1
        draw_rectangle(skTreeX+(slSpc*4),skTreeY+(slSpc*1),skTreeX+(slSpc*4)+10,skTreeY+(slSpc*1)+10,false)
      if global.SkDashPower>=1
        draw_rectangle(skTreeX+(slSpc*6),skTreeY+(slSpc*1),skTreeX+(slSpc*6)+10,skTreeY+(slSpc*1)+10,false)
      if global.SkComboMaster>=1
        draw_rectangle(skTreeX+(slSpc*1),skTreeY+(slSpc*2),skTreeX+(slSpc*1)+10,skTreeY+(slSpc*2)+10,false)
      if global.SkExpertise>=1
        draw_rectangle(skTreeX+(slSpc*3),skTreeY+(slSpc*2),skTreeX+(slSpc*3)+10,skTreeY+(slSpc*2)+10,false)
      if global.SkSharpen>=3
        draw_rectangle(skTreeX+(slSpc*6),skTreeY+(slSpc*2),skTreeX+(slSpc*6)+10,skTreeY+(slSpc*2)+10,false)
      if global.SkStrategist>=1
        draw_rectangle(skTreeX+(slSpc*4),skTreeY+(slSpc*3),skTreeX+(slSpc*4)+10,skTreeY+(slSpc*3)+10,false)
      if global.SkStrategist>=2
        draw_rectangle(skTreeX+(slSpc*5),skTreeY+(slSpc*3),skTreeX+(slSpc*5)+10,skTreeY+(slSpc*3)+10,false)
      if global.SkFireAffinity>=1
        draw_rectangle(skTreeX+(slSpc*1),skTreeY+(slSpc*4),skTreeX+(slSpc*1)+10,skTreeY+(slSpc*4)+10,false)
      if global.SkFireAffinity>=2
        draw_rectangle(skTreeX+(slSpc*2),skTreeY+(slSpc*4),skTreeX+(slSpc*2)+10,skTreeY+(slSpc*4)+10,false)
      if global.SkFireAffinity>=3
        draw_rectangle(skTreeX+(slSpc*3),skTreeY+(slSpc*4),skTreeX+(slSpc*3)+10,skTreeY+(slSpc*4)+10,false)
      if global.SkWaterAffinity>=1
        draw_rectangle(skTreeX+(slSpc*1),skTreeY+(slSpc*5),skTreeX+(slSpc*1)+10,skTreeY+(slSpc*5)+10,false)
      if global.SkWaterAffinity>=2
        draw_rectangle(skTreeX+(slSpc*2),skTreeY+(slSpc*5),skTreeX+(slSpc*2)+10,skTreeY+(slSpc*5)+10,false)
      if global.SkWaterAffinity>=3
        draw_rectangle(skTreeX+(slSpc*3),skTreeY+(slSpc*5),skTreeX+(slSpc*3)+10,skTreeY+(slSpc*5)+10,false)
      if global.SkWindAffinity>=1
        draw_rectangle(skTreeX+(slSpc*1),skTreeY+(slSpc*6),skTreeX+(slSpc*1)+10,skTreeY+(slSpc*6)+10,false)
      if global.SkWindAffinity>=2
        draw_rectangle(skTreeX+(slSpc*2),skTreeY+(slSpc*6),skTreeX+(slSpc*2)+10,skTreeY+(slSpc*6)+10,false)
      if global.SkWindAffinity>=3
        draw_rectangle(skTreeX+(slSpc*3),skTreeY+(slSpc*6),skTreeX+(slSpc*3)+10,skTreeY+(slSpc*6)+10,false)
      if global.SkEarthAffinity>=1
        draw_rectangle(skTreeX+(slSpc*1),skTreeY+(slSpc*7),skTreeX+(slSpc*1)+10,skTreeY+(slSpc*7)+10,false)
      if global.SkEarthAffinity>=2
        draw_rectangle(skTreeX+(slSpc*2),skTreeY+(slSpc*7),skTreeX+(slSpc*2)+10,skTreeY+(slSpc*7)+10,false)
      if global.SkEarthAffinity>=3
        draw_rectangle(skTreeX+(slSpc*3),skTreeY+(slSpc*7),skTreeX+(slSpc*3)+10,skTreeY+(slSpc*7)+10,false)
      draw_set_color(colorDarkPurple)
      draw_set_halign(fa_left)
      draw_text(subMenuSkillX+2,subMenuSkillY+25,"Power")
      draw_text(subMenuSkillX+2,subMenuSkillY+77,"Element")
      //---------- Power
      draw_rectangle(skTreeX+(slSpc*1),skTreeY+(slSpc*1),skTreeX+(slSpc*1)+10,skTreeY+(slSpc*1)+10,true)
      draw_line(subMenuSkillX+62,subMenuSkillY+19,subMenuSkillX+64,subMenuSkillY+19)
      draw_rectangle(skTreeX+(slSpc*2),skTreeY+(slSpc*1),skTreeX+(slSpc*2)+10,skTreeY+(slSpc*1)+10,true)
      draw_line(subMenuSkillX+75,subMenuSkillY+19,subMenuSkillX+90,subMenuSkillY+19)
      draw_rectangle(skTreeX+(slSpc*4),skTreeY+(slSpc*1),skTreeX+(slSpc*4)+10,skTreeY+(slSpc*1)+10,true)
      draw_line(subMenuSkillX+101,subMenuSkillY+19,subMenuSkillX+117,subMenuSkillY+19)
      draw_rectangle(skTreeX+(slSpc*6),skTreeY+(slSpc*1),skTreeX+(slSpc*6)+10,skTreeY+(slSpc*1)+10,true)
      draw_rectangle(skTreeX+(slSpc*1),skTreeY+(slSpc*2),skTreeX+(slSpc*1)+10,skTreeY+(slSpc*2)+10,true)
      draw_line(subMenuSkillX+62,subMenuSkillY+32,subMenuSkillX+77,subMenuSkillY+32)
      draw_rectangle(skTreeX+(slSpc*6),skTreeY+(slSpc*2),skTreeX+(slSpc*6)+10,skTreeY+(slSpc*2)+10,true)
      draw_line(subMenuSkillX+95,subMenuSkillY+25,subMenuSkillX+95,subMenuSkillY+32)
      draw_line(subMenuSkillX+95,subMenuSkillY+32,subMenuSkillX+116,subMenuSkillY+32)
      draw_rectangle(skTreeX+(slSpc*3),skTreeY+(slSpc*2),skTreeX+(slSpc*3)+10,skTreeY+(slSpc*2)+10,true)
      draw_line(subMenuSkillX+82,subMenuSkillY+38,subMenuSkillX+82,subMenuSkillY+45)
      draw_line(subMenuSkillX+82,subMenuSkillY+45,subMenuSkillX+90,subMenuSkillY+45)
      draw_rectangle(skTreeX+(slSpc*4),skTreeY+(slSpc*3),skTreeX+(slSpc*4)+10,skTreeY+(slSpc*3)+10,true)
      draw_line(subMenuSkillX+101,subMenuSkillY+45,subMenuSkillX+103,subMenuSkillY+45)
      draw_rectangle(skTreeX+(slSpc*5),skTreeY+(slSpc*3),skTreeX+(slSpc*5)+10,skTreeY+(slSpc*3)+10,true)
      //---------- Element
      draw_rectangle(skTreeX+(slSpc*1),skTreeY+(slSpc*4),skTreeX+(slSpc*1)+10,skTreeY+(slSpc*4)+10,true)
      draw_line(subMenuSkillX+62,subMenuSkillY+58,subMenuSkillX+64,subMenuSkillY+58)
      draw_rectangle(skTreeX+(slSpc*1),skTreeY+(slSpc*5),skTreeX+(slSpc*1)+10,skTreeY+(slSpc*5)+10,true)
      draw_line(subMenuSkillX+62,subMenuSkillY+71,subMenuSkillX+64,subMenuSkillY+71)
      draw_rectangle(skTreeX+(slSpc*1),skTreeY+(slSpc*6),skTreeX+(slSpc*1)+10,skTreeY+(slSpc*6)+10,true)
      draw_line(subMenuSkillX+62,subMenuSkillY+84,subMenuSkillX+64,subMenuSkillY+84)
      draw_rectangle(skTreeX+(slSpc*1),skTreeY+(slSpc*7),skTreeX+(slSpc*1)+10,skTreeY+(slSpc*7)+10,true)
      draw_line(subMenuSkillX+62,subMenuSkillY+97,subMenuSkillX+64,subMenuSkillY+97)
      draw_rectangle(skTreeX+(slSpc*2),skTreeY+(slSpc*4),skTreeX+(slSpc*2)+10,skTreeY+(slSpc*4)+10,true)
      draw_line(subMenuSkillX+75,subMenuSkillY+58,subMenuSkillX+77,subMenuSkillY+58)
      draw_rectangle(skTreeX+(slSpc*2),skTreeY+(slSpc*5),skTreeX+(slSpc*2)+10,skTreeY+(slSpc*5)+10,true)
      draw_line(subMenuSkillX+75,subMenuSkillY+71,subMenuSkillX+77,subMenuSkillY+71)
      draw_rectangle(skTreeX+(slSpc*2),skTreeY+(slSpc*6),skTreeX+(slSpc*2)+10,skTreeY+(slSpc*6)+10,true)
      draw_line(subMenuSkillX+75,subMenuSkillY+84,subMenuSkillX+77,subMenuSkillY+84)
      draw_rectangle(skTreeX+(slSpc*2),skTreeY+(slSpc*7),skTreeX+(slSpc*2)+10,skTreeY+(slSpc*7)+10,true)
      draw_line(subMenuSkillX+75,subMenuSkillY+97,subMenuSkillX+77,subMenuSkillY+97)
      draw_rectangle(skTreeX+(slSpc*3),skTreeY+(slSpc*4),skTreeX+(slSpc*3)+10,skTreeY+(slSpc*4)+10,true)
      draw_rectangle(skTreeX+(slSpc*3),skTreeY+(slSpc*5),skTreeX+(slSpc*3)+10,skTreeY+(slSpc*5)+10,true)
      draw_rectangle(skTreeX+(slSpc*3),skTreeY+(slSpc*6),skTreeX+(slSpc*3)+10,skTreeY+(slSpc*6)+10,true)
      draw_rectangle(skTreeX+(slSpc*3),skTreeY+(slSpc*7),skTreeX+(slSpc*3)+10,skTreeY+(slSpc*7)+10,true)
      if global.SkSharpen<=0
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*2),skTreeY+(slSpc*1))
      if global.SkSharpen<=1
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*4),skTreeY+(slSpc*1))
      if global.SkSmash<=0
      {
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*6),skTreeY+(slSpc*1))
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*6),skTreeY+(slSpc*2))
      }
      if global.SkComboMaster<=0
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*3),skTreeY+(slSpc*2))
      if global.SkExpertise<=0
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*4),skTreeY+(slSpc*3))
      if global.SkStrategist<=0
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*5),skTreeY+(slSpc*3))
      if global.SkFireAffinity<=0
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*2),skTreeY+(slSpc*4))
      if global.SkFireAffinity<=1
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*3),skTreeY+(slSpc*4))
      if global.SkWaterAffinity<=0
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*2),skTreeY+(slSpc*5))
      if global.SkWaterAffinity<=1
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*3),skTreeY+(slSpc*5))
      if global.SkWindAffinity<=0
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*2),skTreeY+(slSpc*6))
      if global.SkWindAffinity<=1
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*3),skTreeY+(slSpc*6))
      if global.SkEarthAffinity<=0
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*2),skTreeY+(slSpc*7))
      if global.SkEarthAffinity<=1
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*3),skTreeY+(slSpc*7))
    }
    else if subCursorPos=2 //---------- PLAYER ----------
    {
      draw_text(subMenuSkillX+118,subMenuSkillY-2,"PLAYER")
      draw_sprite_ext(sSkillTab,-1,subMenuSkillX,subMenuSkillY+23,1,1,0,c_white,0.5)
      draw_sprite_ext(sSkillTab,-1,subMenuSkillX,subMenuSkillY+50,1,1,0,c_white,1)
      draw_sprite_ext(sSkillTab,-1,subMenuSkillX,subMenuSkillY+77,1,1,0,c_white,0.5)
      draw_text_color(subMenuSkillX-6,subMenuSkillY+16,"W",colorLightPink,colorLightPink,colorLightPink,colorLightPink,0.5)
      draw_text_color(subMenuSkillX-5,subMenuSkillY+43,"P",colorLightPink,colorLightPink,colorLightPink,colorLightPink,1)
      draw_text_color(subMenuSkillX-6,subMenuSkillY+70,"S",colorLightPink,colorLightPink,colorLightPink,colorLightPink,0.5)
      draw_set_color(colorDarkPink)
      draw_line(subMenuSkillX,subMenuSkillY+37,subMenuSkillX,subMenuSkillY+61)
      draw_set_color(colorLightPink)
      if global.SkAgility>=1
        draw_rectangle(skTreeX+(slSpc*3),skTreeY+(slSpc*1),skTreeX+(slSpc*3)+10,skTreeY+(slSpc*1)+10,false)
      if global.SkFireResist>=1
        draw_rectangle(skTreeX+(slSpc*7),skTreeY+(slSpc*1),skTreeX+(slSpc*7)+10,skTreeY+(slSpc*1)+10,false)
      if global.SkFireResist>=2
        draw_rectangle(skTreeX+(slSpc*8),skTreeY+(slSpc*1),skTreeX+(slSpc*8)+10,skTreeY+(slSpc*1)+10,false)
      if global.SkFireResist>=3
        draw_rectangle(skTreeX+(slSpc*9),skTreeY+(slSpc*1),skTreeX+(slSpc*9)+10,skTreeY+(slSpc*1)+10,false)
      if global.SkIronBody>=1
        draw_rectangle(skTreeX+(slSpc*1),skTreeY+(slSpc*2),skTreeX+(slSpc*1)+10,skTreeY+(slSpc*2)+10,false)
      if global.SkIronBody>=2
        draw_rectangle(skTreeX+(slSpc*2),skTreeY+(slSpc*2),skTreeX+(slSpc*2)+10,skTreeY+(slSpc*2)+10,false)
      if global.SkSwiftFoot>=1
        draw_rectangle(skTreeX+(slSpc*3),skTreeY+(slSpc*2),skTreeX+(slSpc*3)+10,skTreeY+(slSpc*2)+10,false)
      if global.SkQuickRecovery>=1
        draw_rectangle(skTreeX+(slSpc*4),skTreeY+(slSpc*2),skTreeX+(slSpc*4)+10,skTreeY+(slSpc*2)+10,false)
      if global.SkWaterResist>=1
        draw_rectangle(skTreeX+(slSpc*7),skTreeY+(slSpc*2),skTreeX+(slSpc*7)+10,skTreeY+(slSpc*2)+10,false)
      if global.SkWaterResist>=2
        draw_rectangle(skTreeX+(slSpc*8),skTreeY+(slSpc*2),skTreeX+(slSpc*8)+10,skTreeY+(slSpc*2)+10,false)
      if global.SkWaterResist>=3
        draw_rectangle(skTreeX+(slSpc*9),skTreeY+(slSpc*2),skTreeX+(slSpc*9)+10,skTreeY+(slSpc*2)+10,false)
      if global.SkFreeSpirit>=1
        draw_rectangle(skTreeX+(slSpc*1),skTreeY+(slSpc*3),skTreeX+(slSpc*1)+10,skTreeY+(slSpc*3)+10,false)
      if global.SkFreeSpirit>=2
        draw_rectangle(skTreeX+(slSpc*2),skTreeY+(slSpc*3),skTreeX+(slSpc*2)+10,skTreeY+(slSpc*3)+10,false)
      if global.SkIronBody>=3
        draw_rectangle(skTreeX+(slSpc*4),skTreeY+(slSpc*3),skTreeX+(slSpc*4)+10,skTreeY+(slSpc*3)+10,false)
      if global.SkFreeSpirit>=3
        draw_rectangle(skTreeX+(slSpc*5),skTreeY+(slSpc*3),skTreeX+(slSpc*5)+10,skTreeY+(slSpc*3)+10,false)
      if global.SkWindResist>=1
        draw_rectangle(skTreeX+(slSpc*7),skTreeY+(slSpc*3),skTreeX+(slSpc*7)+10,skTreeY+(slSpc*3)+10,false)
      if global.SkWindResist>=2
        draw_rectangle(skTreeX+(slSpc*8),skTreeY+(slSpc*3),skTreeX+(slSpc*8)+10,skTreeY+(slSpc*3)+10,false)
      if global.SkWindResist>=3
        draw_rectangle(skTreeX+(slSpc*9),skTreeY+(slSpc*3),skTreeX+(slSpc*9)+10,skTreeY+(slSpc*3)+10,false)
      if global.SkEarthResist>=1
        draw_rectangle(skTreeX+(slSpc*7),skTreeY+(slSpc*4),skTreeX+(slSpc*7)+10,skTreeY+(slSpc*4)+10,false)
      if global.SkEarthResist>=2
        draw_rectangle(skTreeX+(slSpc*8),skTreeY+(slSpc*4),skTreeX+(slSpc*8)+10,skTreeY+(slSpc*4)+10,false)
      if global.SkEarthResist>=3
        draw_rectangle(skTreeX+(slSpc*9),skTreeY+(slSpc*4),skTreeX+(slSpc*9)+10,skTreeY+(slSpc*4)+10,false)
      if global.SkPerfection>=1
        draw_rectangle(skTreeX+(slSpc*4),skTreeY+(slSpc*5),skTreeX+(slSpc*4)+10,skTreeY+(slSpc*5)+10,false)
      if global.SkPerfection>=2
        draw_rectangle(skTreeX+(slSpc*5),skTreeY+(slSpc*5),skTreeX+(slSpc*5)+10,skTreeY+(slSpc*5)+10,false)
      if global.SkPrecision>=1
        draw_rectangle(skTreeX+(slSpc*1),skTreeY+(slSpc*6),skTreeX+(slSpc*1)+10,skTreeY+(slSpc*6)+10,false)
      if global.SkPrecision>=2
        draw_rectangle(skTreeX+(slSpc*2),skTreeY+(slSpc*6),skTreeX+(slSpc*2)+10,skTreeY+(slSpc*6)+10,false)
      if global.SkSpiritMaster>=1
        draw_rectangle(skTreeX+(slSpc*5),skTreeY+(slSpc*6),skTreeX+(slSpc*5)+10,skTreeY+(slSpc*6)+10,false)
      if global.SkSpiritMaster>=2
        draw_rectangle(skTreeX+(slSpc*6),skTreeY+(slSpc*6),skTreeX+(slSpc*6)+10,skTreeY+(slSpc*6)+10,false)
      if global.SkVirtue>=1
        draw_rectangle(skTreeX+(slSpc*4),skTreeY+(slSpc*7),skTreeX+(slSpc*4)+10,skTreeY+(slSpc*7)+10,false)
      if global.SkVirtue>=2
        draw_rectangle(skTreeX+(slSpc*5),skTreeY+(slSpc*7),skTreeX+(slSpc*5)+10,skTreeY+(slSpc*7)+10,false)
      draw_set_color(colorDarkPurple)
      draw_set_halign(fa_left)
      draw_text(subMenuSkillX+2,subMenuSkillY+25,"Defense")
      draw_text(subMenuSkillX+2,subMenuSkillY+77,"Skill")
      //---------- Defense
      draw_rectangle(skTreeX+(slSpc*3),skTreeY+(slSpc*1),skTreeX+(slSpc*3)+10,skTreeY+(slSpc*1)+10,true)
      draw_line(subMenuSkillX+69,subMenuSkillY+19,subMenuSkillX+77,subMenuSkillY+19)
      draw_line(subMenuSkillX+69,subMenuSkillY+19,subMenuSkillX+69,subMenuSkillY+27)
      draw_rectangle(skTreeX+(slSpc*7),skTreeY+(slSpc*1),skTreeX+(slSpc*7)+10,skTreeY+(slSpc*1)+10,true)
      draw_line(subMenuSkillX+140,subMenuSkillY+19,subMenuSkillX+142,subMenuSkillY+19)
      draw_rectangle(skTreeX+(slSpc*1),skTreeY+(slSpc*2),skTreeX+(slSpc*1)+10,skTreeY+(slSpc*2)+10,true)
      draw_line(subMenuSkillX+62,subMenuSkillY+32,subMenuSkillX+64,subMenuSkillY+32)
      draw_rectangle(skTreeX+(slSpc*2),skTreeY+(slSpc*2),skTreeX+(slSpc*2)+10,skTreeY+(slSpc*2)+10,true)
      draw_line(subMenuSkillX+75,subMenuSkillY+32,subMenuSkillX+77,subMenuSkillY+32)
      draw_rectangle(skTreeX+(slSpc*3),skTreeY+(slSpc*2),skTreeX+(slSpc*3)+10,skTreeY+(slSpc*2)+10,true)
      draw_line(subMenuSkillX+88,subMenuSkillY+32,subMenuSkillX+90,subMenuSkillY+32)
      draw_rectangle(skTreeX+(slSpc*4),skTreeY+(slSpc*2),skTreeX+(slSpc*4)+10,skTreeY+(slSpc*2)+10,true)
      draw_rectangle(skTreeX+(slSpc*7),skTreeY+(slSpc*2),skTreeX+(slSpc*7)+10,skTreeY+(slSpc*2)+10,true)
      draw_line(subMenuSkillX+140,subMenuSkillY+32,subMenuSkillX+142,subMenuSkillY+32)
      draw_rectangle(skTreeX+(slSpc*1),skTreeY+(slSpc*3),skTreeX+(slSpc*1)+10,skTreeY+(slSpc*3)+10,true)
      draw_line(subMenuSkillX+62,subMenuSkillY+45,subMenuSkillX+64,subMenuSkillY+45)
      draw_rectangle(skTreeX+(slSpc*2),skTreeY+(slSpc*3),skTreeX+(slSpc*2)+10,skTreeY+(slSpc*3)+10,true)
      draw_line(subMenuSkillX+75,subMenuSkillY+45,subMenuSkillX+83,subMenuSkillY+45)
      draw_line(subMenuSkillX+82,subMenuSkillY+38,subMenuSkillX+82,subMenuSkillY+45)
      draw_line(subMenuSkillX+83,subMenuSkillY+45,subMenuSkillX+90,subMenuSkillY+45)
      draw_rectangle(skTreeX+(slSpc*4),skTreeY+(slSpc*3),skTreeX+(slSpc*4)+10,skTreeY+(slSpc*3)+10,true)
      draw_line(subMenuSkillX+101,subMenuSkillY+45,subMenuSkillX+103,subMenuSkillY+45)
      draw_rectangle(skTreeX+(slSpc*5),skTreeY+(slSpc*3),skTreeX+(slSpc*5)+10,skTreeY+(slSpc*3)+10,true)
      draw_rectangle(skTreeX+(slSpc*7),skTreeY+(slSpc*3),skTreeX+(slSpc*7)+10,skTreeY+(slSpc*3)+10,true)
      draw_line(subMenuSkillX+140,subMenuSkillY+45,subMenuSkillX+142,subMenuSkillY+45)
      draw_rectangle(skTreeX+(slSpc*7),skTreeY+(slSpc*4),skTreeX+(slSpc*7)+10,skTreeY+(slSpc*4)+10,true)
      draw_line(subMenuSkillX+140,subMenuSkillY+58,subMenuSkillX+142,subMenuSkillY+58)
      draw_rectangle(skTreeX+(slSpc*8),skTreeY+(slSpc*1),skTreeX+(slSpc*8)+10,skTreeY+(slSpc*1)+10,true)
      draw_line(subMenuSkillX+153,subMenuSkillY+19,subMenuSkillX+155,subMenuSkillY+19)
      draw_rectangle(skTreeX+(slSpc*8),skTreeY+(slSpc*2),skTreeX+(slSpc*8)+10,skTreeY+(slSpc*2)+10,true)
      draw_line(subMenuSkillX+153,subMenuSkillY+32,subMenuSkillX+155,subMenuSkillY+32)
      draw_rectangle(skTreeX+(slSpc*8),skTreeY+(slSpc*3),skTreeX+(slSpc*8)+10,skTreeY+(slSpc*3)+10,true)
      draw_line(subMenuSkillX+153,subMenuSkillY+45,subMenuSkillX+155,subMenuSkillY+45)
      draw_rectangle(skTreeX+(slSpc*8),skTreeY+(slSpc*4),skTreeX+(slSpc*8)+10,skTreeY+(slSpc*4)+10,true)
      draw_line(subMenuSkillX+153,subMenuSkillY+58,subMenuSkillX+155,subMenuSkillY+58)
      draw_rectangle(skTreeX+(slSpc*9),skTreeY+(slSpc*1),skTreeX+(slSpc*9)+10,skTreeY+(slSpc*1)+10,true)
      draw_rectangle(skTreeX+(slSpc*9),skTreeY+(slSpc*2),skTreeX+(slSpc*9)+10,skTreeY+(slSpc*2)+10,true)
      draw_rectangle(skTreeX+(slSpc*9),skTreeY+(slSpc*3),skTreeX+(slSpc*9)+10,skTreeY+(slSpc*3)+10,true)
      draw_rectangle(skTreeX+(slSpc*9),skTreeY+(slSpc*4),skTreeX+(slSpc*9)+10,skTreeY+(slSpc*4)+10,true)
      //---------- Skill
      draw_rectangle(skTreeX+(slSpc*1),skTreeY+(slSpc*6),skTreeX+(slSpc*1)+10,skTreeY+(slSpc*6)+10,true)
      draw_line(subMenuSkillX+62,subMenuSkillY+84,subMenuSkillX+64,subMenuSkillY+84)
      draw_line(subMenuSkillX+56,subMenuSkillY+71,subMenuSkillX+56,subMenuSkillY+79)
      draw_line(subMenuSkillX+56,subMenuSkillY+71,subMenuSkillX+90,subMenuSkillY+71)
      draw_line(subMenuSkillX+56,subMenuSkillY+90,subMenuSkillX+56,subMenuSkillY+97)
      draw_line(subMenuSkillX+56,subMenuSkillY+97,subMenuSkillX+90,subMenuSkillY+97)
      draw_rectangle(skTreeX+(slSpc*2),skTreeY+(slSpc*6),skTreeX+(slSpc*2)+10,skTreeY+(slSpc*6)+10,true)
      draw_rectangle(skTreeX+(slSpc*4),skTreeY+(slSpc*5),skTreeX+(slSpc*4)+10,skTreeY+(slSpc*5)+10,true)
      draw_line(subMenuSkillX+101,subMenuSkillY+71,subMenuSkillX+103,subMenuSkillY+71)
      draw_rectangle(skTreeX+(slSpc*4),skTreeY+(slSpc*7),skTreeX+(slSpc*4)+10,skTreeY+(slSpc*7)+10,true)
      draw_line(subMenuSkillX+101,subMenuSkillY+97,subMenuSkillX+103,subMenuSkillY+97)
      draw_rectangle(skTreeX+(slSpc*5),skTreeY+(slSpc*5),skTreeX+(slSpc*5)+10,skTreeY+(slSpc*5)+10,true)
      draw_line(subMenuSkillX+108,subMenuSkillY+77,subMenuSkillX+108,subMenuSkillY+79)
      draw_rectangle(skTreeX+(slSpc*5),skTreeY+(slSpc*6),skTreeX+(slSpc*5)+10,skTreeY+(slSpc*6)+10,true)
      draw_line(subMenuSkillX+114,subMenuSkillY+84,subMenuSkillX+116,subMenuSkillY+84)
      draw_rectangle(skTreeX+(slSpc*5),skTreeY+(slSpc*7),skTreeX+(slSpc*5)+10,skTreeY+(slSpc*7)+10,true)
      draw_line(subMenuSkillX+108,subMenuSkillY+90,subMenuSkillX+108,subMenuSkillY+92)
      draw_rectangle(skTreeX+(slSpc*6),skTreeY+(slSpc*6),skTreeX+(slSpc*6)+10,skTreeY+(slSpc*6)+10,true)
      if global.SkIronBody<=1
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*3),skTreeY+(slSpc*1))
      if global.SkFireResist<=0
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*8),skTreeY+(slSpc*1))
      if global.SkFireResist<=1
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*9),skTreeY+(slSpc*1))
      if global.SkIronBody<=0
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*2),skTreeY+(slSpc*2))
      if global.SkIronBody<=1 and global.SkFreeSpirit<=1
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*3),skTreeY+(slSpc*2))
      if global.SkSwiftFoot<=0
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*4),skTreeY+(slSpc*2))
      if global.SkWaterResist<=0
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*8),skTreeY+(slSpc*2))
      if global.SkWaterResist<=1
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*9),skTreeY+(slSpc*2))
      if global.SkFreeSpirit<=0
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*2),skTreeY+(slSpc*3))
      if global.SkSwiftFoot<=0 or global.SkIronBody<=1 or global.SkFreeSpirit<=1
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*4),skTreeY+(slSpc*3))
      if global.SkIronBody<=2
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*5),skTreeY+(slSpc*3))
      if global.SkWindResist<=0
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*8),skTreeY+(slSpc*3))
      if global.SkWindResist<=1
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*9),skTreeY+(slSpc*3))
      if global.SkEarthResist<=0
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*8),skTreeY+(slSpc*4))
      if global.SkEarthResist<=1
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*9),skTreeY+(slSpc*4))
      if global.SkPrecision<=0
      {
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*4),skTreeY+(slSpc*5))
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*2),skTreeY+(slSpc*6))
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*4),skTreeY+(slSpc*7))
      }
      if global.SkPerfection<=0
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*5),skTreeY+(slSpc*5))
      if global.SkPerfection<=1 and global.SkVirtue<=1
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*5),skTreeY+(slSpc*6))
      if global.SkSpiritMaster<=0
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*6),skTreeY+(slSpc*6))
      if global.SkVirtue<=0
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*5),skTreeY+(slSpc*7))
    }
    else if subCursorPos=3 //---------- SPIRIT ----------
    {
      draw_text(subMenuSkillX+118,subMenuSkillY-2,"SPIRIT")
      draw_sprite_ext(sSkillTab,-1,subMenuSkillX,subMenuSkillY+23,1,1,0,c_white,0.5)
      draw_sprite_ext(sSkillTab,-1,subMenuSkillX,subMenuSkillY+50,1,1,0,c_white,0.5)
      draw_sprite_ext(sSkillTab,-1,subMenuSkillX,subMenuSkillY+77,1,1,0,c_white,1)
      draw_text_color(subMenuSkillX-6,subMenuSkillY+16,"W",colorLightPink,colorLightPink,colorLightPink,colorLightPink,0.5)
      draw_text_color(subMenuSkillX-5,subMenuSkillY+43,"P",colorLightPink,colorLightPink,colorLightPink,colorLightPink,0.5)
      draw_text_color(subMenuSkillX-6,subMenuSkillY+70,"S",colorLightPink,colorLightPink,colorLightPink,colorLightPink,1)
      draw_set_color(colorDarkPink)
      draw_line(subMenuSkillX,subMenuSkillY+63,subMenuSkillX,subMenuSkillY+87)
      draw_set_color(colorLightPink)
      if global.SkFireMastery>=1
        draw_rectangle(skTreeX+(slSpc*1),skTreeY+(slSpc*1),skTreeX+(slSpc*1)+10,skTreeY+(slSpc*1)+10,false)
      if global.SkFireMastery>=2
        draw_rectangle(skTreeX+(slSpc*2),skTreeY+(slSpc*1),skTreeX+(slSpc*2)+10,skTreeY+(slSpc*1)+10,false)
      if global.SkFireCraft>=1
        draw_rectangle(skTreeX+(slSpc*4),skTreeY+(slSpc*1),skTreeX+(slSpc*4)+10,skTreeY+(slSpc*1)+10,false)
      if global.SkFireCraft>=2
        draw_rectangle(skTreeX+(slSpc*5),skTreeY+(slSpc*1),skTreeX+(slSpc*5)+10,skTreeY+(slSpc*1)+10,false)
      if global.SkProtection>=1
        draw_rectangle(skTreeX+(slSpc*7),skTreeY+(slSpc*1),skTreeX+(slSpc*7)+10,skTreeY+(slSpc*1)+10,false)
      if global.SkProtection>=2
        draw_rectangle(skTreeX+(slSpc*8),skTreeY+(slSpc*1),skTreeX+(slSpc*8)+10,skTreeY+(slSpc*1)+10,false)
      if global.SkWaterMastery>=1
        draw_rectangle(skTreeX+(slSpc*1),skTreeY+(slSpc*3),skTreeX+(slSpc*1)+10,skTreeY+(slSpc*3)+10,false)
      if global.SkWaterMastery>=2
        draw_rectangle(skTreeX+(slSpc*2),skTreeY+(slSpc*3),skTreeX+(slSpc*2)+10,skTreeY+(slSpc*3)+10,false)
      if global.SkWaterCraft>=1
        draw_rectangle(skTreeX+(slSpc*4),skTreeY+(slSpc*3),skTreeX+(slSpc*4)+10,skTreeY+(slSpc*3)+10,false)
      if global.SkWaterCraft>=2
        draw_rectangle(skTreeX+(slSpc*5),skTreeY+(slSpc*3),skTreeX+(slSpc*5)+10,skTreeY+(slSpc*3)+10,false)
      if global.SkElementalMaster>=1
        draw_rectangle(skTreeX+(slSpc*7),skTreeY+(slSpc*3),skTreeX+(slSpc*7)+10,skTreeY+(slSpc*3)+10,false)
      if global.SkWindMastery>=1
        draw_rectangle(skTreeX+(slSpc*1),skTreeY+(slSpc*5),skTreeX+(slSpc*1)+10,skTreeY+(slSpc*5)+10,false)
      if global.SkWindMastery>=2
        draw_rectangle(skTreeX+(slSpc*2),skTreeY+(slSpc*5),skTreeX+(slSpc*2)+10,skTreeY+(slSpc*5)+10,false)
      if global.SkWindCraft>=1
        draw_rectangle(skTreeX+(slSpc*4),skTreeY+(slSpc*5),skTreeX+(slSpc*4)+10,skTreeY+(slSpc*5)+10,false)
      if global.SkWindCraft>=2
        draw_rectangle(skTreeX+(slSpc*5),skTreeY+(slSpc*5),skTreeX+(slSpc*5)+10,skTreeY+(slSpc*5)+10,false)
      if global.SkGoodFortune>=1
        draw_rectangle(skTreeX+(slSpc*7),skTreeY+(slSpc*5),skTreeX+(slSpc*7)+10,skTreeY+(slSpc*5)+10,false)
      if global.SkGoodFortune>=2
        draw_rectangle(skTreeX+(slSpc*8),skTreeY+(slSpc*5),skTreeX+(slSpc*8)+10,skTreeY+(slSpc*5)+10,false)
      if global.SkStatistician>=1
        draw_rectangle(skTreeX+(slSpc*8),skTreeY+(slSpc*6),skTreeX+(slSpc*8)+10,skTreeY+(slSpc*6)+10,false)
      if global.SkStatistician>=2
        draw_rectangle(skTreeX+(slSpc*9),skTreeY+(slSpc*6),skTreeX+(slSpc*9)+10,skTreeY+(slSpc*6)+10,false)
      if global.SkEarthMastery>=1
        draw_rectangle(skTreeX+(slSpc*1),skTreeY+(slSpc*7),skTreeX+(slSpc*1)+10,skTreeY+(slSpc*7)+10,false)
      if global.SkEarthMastery>=2
        draw_rectangle(skTreeX+(slSpc*2),skTreeY+(slSpc*7),skTreeX+(slSpc*2)+10,skTreeY+(slSpc*7)+10,false)
      if global.SkEarthCraft>=1
        draw_rectangle(skTreeX+(slSpc*4),skTreeY+(slSpc*7),skTreeX+(slSpc*4)+10,skTreeY+(slSpc*7)+10,false)
      if global.SkEarthCraft>=2
        draw_rectangle(skTreeX+(slSpc*5),skTreeY+(slSpc*7),skTreeX+(slSpc*5)+10,skTreeY+(slSpc*7)+10,false)
      if global.SkFaith>=1
        draw_rectangle(skTreeX+(slSpc*7),skTreeY+(slSpc*7),skTreeX+(slSpc*7)+10,skTreeY+(slSpc*7)+10,false)
      draw_set_color(colorDarkPurple)
      draw_set_halign(fa_left)
      draw_text(subMenuSkillX+2,subMenuSkillY+12,"Fire")
      draw_text(subMenuSkillX+2,subMenuSkillY+38,"Water")
      draw_text(subMenuSkillX+2,subMenuSkillY+64,"Wind")
      draw_text(subMenuSkillX+2,subMenuSkillY+90,"Earth")
      //---------- Fire
      draw_rectangle(skTreeX+(slSpc*1),skTreeY+(slSpc*1),skTreeX+(slSpc*1)+10,skTreeY+(slSpc*1)+10,true)
      draw_line(subMenuSkillX+62,subMenuSkillY+19,subMenuSkillX+64,subMenuSkillY+19)
      draw_rectangle(skTreeX+(slSpc*2),skTreeY+(slSpc*1),skTreeX+(slSpc*2)+10,skTreeY+(slSpc*1)+10,true)
      draw_rectangle(skTreeX+(slSpc*4),skTreeY+(slSpc*1),skTreeX+(slSpc*4)+10,skTreeY+(slSpc*1)+10,true)
      draw_line(subMenuSkillX+101,subMenuSkillY+19,subMenuSkillX+103,subMenuSkillY+19)
      draw_rectangle(skTreeX+(slSpc*5),skTreeY+(slSpc*1),skTreeX+(slSpc*5)+10,skTreeY+(slSpc*1)+10,true)
      draw_line(subMenuSkillX+114,subMenuSkillY+19,subMenuSkillX+129,subMenuSkillY+19)
      draw_rectangle(skTreeX+(slSpc*7),skTreeY+(slSpc*1),skTreeX+(slSpc*7)+10,skTreeY+(slSpc*1)+10,true)
      draw_line(subMenuSkillX+140,subMenuSkillY+19,subMenuSkillX+142,subMenuSkillY+19)
      draw_rectangle(skTreeX+(slSpc*8),skTreeY+(slSpc*1),skTreeX+(slSpc*8)+10,skTreeY+(slSpc*1)+10,true)
      //---------- Water
      draw_rectangle(skTreeX+(slSpc*1),skTreeY+(slSpc*3),skTreeX+(slSpc*1)+10,skTreeY+(slSpc*3)+10,true)
      draw_line(subMenuSkillX+62,subMenuSkillY+45,subMenuSkillX+64,subMenuSkillY+45)
      draw_rectangle(skTreeX+(slSpc*2),skTreeY+(slSpc*3),skTreeX+(slSpc*2)+10,skTreeY+(slSpc*3)+10,true)
      draw_rectangle(skTreeX+(slSpc*4),skTreeY+(slSpc*3),skTreeX+(slSpc*4)+10,skTreeY+(slSpc*3)+10,true)
      draw_line(subMenuSkillX+101,subMenuSkillY+45,subMenuSkillX+103,subMenuSkillY+45)
      draw_rectangle(skTreeX+(slSpc*5),skTreeY+(slSpc*3),skTreeX+(slSpc*5)+10,skTreeY+(slSpc*3)+10,true)
      draw_line(subMenuSkillX+114,subMenuSkillY+45,subMenuSkillX+129,subMenuSkillY+45)
      draw_rectangle(skTreeX+(slSpc*7),skTreeY+(slSpc*3),skTreeX+(slSpc*7)+10,skTreeY+(slSpc*3)+10,true)
      //---------- Wind
      draw_rectangle(skTreeX+(slSpc*1),skTreeY+(slSpc*5),skTreeX+(slSpc*1)+10,skTreeY+(slSpc*5)+10,true)
      draw_line(subMenuSkillX+62,subMenuSkillY+71,subMenuSkillX+64,subMenuSkillY+71)
      draw_rectangle(skTreeX+(slSpc*2),skTreeY+(slSpc*5),skTreeX+(slSpc*2)+10,skTreeY+(slSpc*5)+10,true)
      draw_rectangle(skTreeX+(slSpc*4),skTreeY+(slSpc*5),skTreeX+(slSpc*4)+10,skTreeY+(slSpc*5)+10,true)
      draw_line(subMenuSkillX+101,subMenuSkillY+71,subMenuSkillX+103,subMenuSkillY+71)
      draw_rectangle(skTreeX+(slSpc*5),skTreeY+(slSpc*5),skTreeX+(slSpc*5)+10,skTreeY+(slSpc*5)+10,true)
      draw_line(subMenuSkillX+114,subMenuSkillY+71,subMenuSkillX+129,subMenuSkillY+71)
      draw_rectangle(skTreeX+(slSpc*7),skTreeY+(slSpc*5),skTreeX+(slSpc*7)+10,skTreeY+(slSpc*5)+10,true)
      draw_line(subMenuSkillX+140,subMenuSkillY+71,subMenuSkillX+142,subMenuSkillY+71)
      draw_rectangle(skTreeX+(slSpc*8),skTreeY+(slSpc*5),skTreeX+(slSpc*8)+10,skTreeY+(slSpc*5)+10,true)
      draw_line(subMenuSkillX+134,subMenuSkillY+77,subMenuSkillX+134,subMenuSkillY+84)
      draw_line(subMenuSkillX+134,subMenuSkillY+84,subMenuSkillX+142,subMenuSkillY+84)
      draw_rectangle(skTreeX+(slSpc*8),skTreeY+(slSpc*6),skTreeX+(slSpc*8)+10,skTreeY+(slSpc*6)+10,true)
      draw_line(subMenuSkillX+153,subMenuSkillY+84,subMenuSkillX+155,subMenuSkillY+84)
      draw_rectangle(skTreeX+(slSpc*9),skTreeY+(slSpc*6),skTreeX+(slSpc*9)+10,skTreeY+(slSpc*6)+10,true)
      //---------- Earth
      draw_rectangle(skTreeX+(slSpc*1),skTreeY+(slSpc*7),skTreeX+(slSpc*1)+10,skTreeY+(slSpc*7)+10,true)
      draw_line(subMenuSkillX+62,subMenuSkillY+97,subMenuSkillX+64,subMenuSkillY+97)
      draw_rectangle(skTreeX+(slSpc*2),skTreeY+(slSpc*7),skTreeX+(slSpc*2)+10,skTreeY+(slSpc*7)+10,true)
      draw_rectangle(skTreeX+(slSpc*4),skTreeY+(slSpc*7),skTreeX+(slSpc*4)+10,skTreeY+(slSpc*7)+10,true)
      draw_line(subMenuSkillX+101,subMenuSkillY+97,subMenuSkillX+103,subMenuSkillY+97)
      draw_rectangle(skTreeX+(slSpc*5),skTreeY+(slSpc*7),skTreeX+(slSpc*5)+10,skTreeY+(slSpc*7)+10,true)
      draw_line(subMenuSkillX+114,subMenuSkillY+97,subMenuSkillX+129,subMenuSkillY+97)
      draw_rectangle(skTreeX+(slSpc*7),skTreeY+(slSpc*7),skTreeX+(slSpc*7)+10,skTreeY+(slSpc*7)+10,true)
      if global.SkFireMastery<=0
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*2),skTreeY+(slSpc*1))
      if global.SkFireCraft<=0
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*5),skTreeY+(slSpc*1))
      if global.SkFireCraft<=1
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*7),skTreeY+(slSpc*1))
      if global.SkProtection<=0
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*8),skTreeY+(slSpc*1))
      if global.SkWaterMastery<=0
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*2),skTreeY+(slSpc*3))
      if global.SkWaterCraft<=0
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*5),skTreeY+(slSpc*3))
      if global.SkWaterCraft<=1
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*7),skTreeY+(slSpc*3))
      if global.SkWindMastery<=0
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*2),skTreeY+(slSpc*5))
      if global.SkWindCraft<=0
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*5),skTreeY+(slSpc*5))
      if global.SkWindCraft<=1
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*7),skTreeY+(slSpc*5))
      if global.SkGoodFortune<=0
      {
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*8),skTreeY+(slSpc*5))
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*8),skTreeY+(slSpc*6))
      }
      if global.SkStatistician<=0
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*9),skTreeY+(slSpc*6))
      if global.SkEarthMastery<=0
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*2),skTreeY+(slSpc*7))
      if global.SkEarthCraft<=0
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*5),skTreeY+(slSpc*7))
      if global.SkEarthCraft<=1
        draw_sprite(sPmenuLock,-1,skTreeX+(slSpc*7),skTreeY+(slSpc*7))
    }
  }
  // ======================================================================
  else if currentMenu=5 //Options ==================================================
  {
    draw_set_font(fnt_GoToMenu)
    subMenuOptionsX=menuMainX+16
    subMenuOptionsY=menuMainY+16
    draw_set_alpha(1)
    draw_set_color(colorDarkPurple)
    draw_set_halign(fa_center)
    draw_text(menuMainX+160,menuMainY-19,subMenu5)
    draw_text(menuMainX+60,menuMainY+196,subMenu4)
    draw_text(menuMainX+260,menuMainY+196,subMenu6)
    draw_set_font(fnt_SubMenu)
    draw_set_alpha(0.9)
    draw_set_color(colorDarkPink)
    draw_rectangle(subMenuOptionsX,subMenuOptionsY,subMenuOptionsX+172,subMenuOptionsY+134,false)
    draw_set_alpha(1)
    draw_set_color(colorLightPink)
    draw_rectangle(subMenuOptionsX,subMenuOptionsY,subMenuOptionsX+172,subMenuOptionsY+134,true)
    draw_line(subMenuOptionsX,subMenuOptionsY+10,subMenuOptionsX+172,subMenuOptionsY+10)
    if subCursorPos=1 //---------- OPTIONS SET 1 ----------
    {
      draw_text(subMenuOptionsX+86,subMenuOptionsY-2,"OPTIONS SET 1")
      draw_set_color(colorDarkPurple)
      draw_set_halign(fa_left)
      draw_rectangle(subMenuOptionsX+4,subMenuOptionsY+14,subMenuOptionsX+12,subMenuOptionsY+22,true)
      draw_rectangle(subMenuOptionsX+4,subMenuOptionsY+26,subMenuOptionsX+12,subMenuOptionsY+34,true)
      draw_rectangle(subMenuOptionsX+4,subMenuOptionsY+38,subMenuOptionsX+12,subMenuOptionsY+46,true)
      draw_rectangle(subMenuOptionsX+4,subMenuOptionsY+50,subMenuOptionsX+12,subMenuOptionsY+58,true)
      draw_rectangle(subMenuOptionsX+4,subMenuOptionsY+62,subMenuOptionsX+12,subMenuOptionsY+70,true)
      draw_rectangle(subMenuOptionsX+4,subMenuOptionsY+74,subMenuOptionsX+12,subMenuOptionsY+82,true)
      draw_rectangle(subMenuOptionsX+4,subMenuOptionsY+86,subMenuOptionsX+12,subMenuOptionsY+94,true)
      draw_rectangle(subMenuOptionsX+4,subMenuOptionsY+98,subMenuOptionsX+12,subMenuOptionsY+106,true)
      draw_rectangle(subMenuOptionsX+4,subMenuOptionsY+110,subMenuOptionsX+12,subMenuOptionsY+118,true)
      if global.hasItemFinder>=1
        draw_rectangle(subMenuOptionsX+4,subMenuOptionsY+122,subMenuOptionsX+12,subMenuOptionsY+130,true)
      draw_text(subMenuOptionsX+16,subMenuOptionsY+11,"Low Health Warn")
      draw_text(subMenuOptionsX+16,subMenuOptionsY+23,"Show Exp Earned")
      draw_text(subMenuOptionsX+16,subMenuOptionsY+35,"Show Damage Dealt")
      draw_text(subMenuOptionsX+16,subMenuOptionsY+47,"Show Enemy Status Ailments")
      draw_text(subMenuOptionsX+16,subMenuOptionsY+59,"Remember Menu Position")
      draw_text(subMenuOptionsX+16,subMenuOptionsY+71,"Music")
      draw_line(subMenuOptionsX+64,subMenuOptionsY+79,subMenuOptionsX+164,subMenuOptionsY+79)
      draw_line(subMenuOptionsX+64,subMenuOptionsY+77,subMenuOptionsX+64,subMenuOptionsY+81)
      draw_line(subMenuOptionsX+164,subMenuOptionsY+77,subMenuOptionsX+164,subMenuOptionsY+81)
      draw_text(subMenuOptionsX+16,subMenuOptionsY+83,"Sound")
      draw_line(subMenuOptionsX+64,subMenuOptionsY+91,subMenuOptionsX+164,subMenuOptionsY+91)
      draw_line(subMenuOptionsX+64,subMenuOptionsY+89,subMenuOptionsX+64,subMenuOptionsY+93)
      draw_line(subMenuOptionsX+164,subMenuOptionsY+89,subMenuOptionsX+164,subMenuOptionsY+93)
      draw_text(subMenuOptionsX+16,subMenuOptionsY+95,"Scanner")
      draw_line(subMenuOptionsX+64,subMenuOptionsY+103,subMenuOptionsX+164,subMenuOptionsY+103)
      draw_line(subMenuOptionsX+64,subMenuOptionsY+101,subMenuOptionsX+64,subMenuOptionsY+105)
      draw_line(subMenuOptionsX+164,subMenuOptionsY+101,subMenuOptionsX+164,subMenuOptionsY+105)
      draw_text(subMenuOptionsX+16,subMenuOptionsY+107,"Show Elemental Glow")
      if global.hasItemFinder>=1
        draw_text(subMenuOptionsX+16,subMenuOptionsY+119,"Hidden Item Alert")
      draw_set_color(colorLightPink)
      if global.optLowHealthWarn=true
        draw_rectangle(subMenuOptionsX+5,subMenuOptionsY+15,subMenuOptionsX+11,subMenuOptionsY+21,false)
      if global.optShowExpEarned=true
        draw_rectangle(subMenuOptionsX+5,subMenuOptionsY+27,subMenuOptionsX+11,subMenuOptionsY+33,false)
      if global.optShowDamage=true
        draw_rectangle(subMenuOptionsX+5,subMenuOptionsY+39,subMenuOptionsX+11,subMenuOptionsY+45,false)
      if global.optEnemyStatus=true
        draw_rectangle(subMenuOptionsX+5,subMenuOptionsY+51,subMenuOptionsX+11,subMenuOptionsY+57,false)
      if global.optKeepMenuPosition=true
        draw_rectangle(subMenuOptionsX+5,subMenuOptionsY+63,subMenuOptionsX+11,subMenuOptionsY+69,false)
      if global.optMusic>0
        draw_rectangle(subMenuOptionsX+5,subMenuOptionsY+75,subMenuOptionsX+11,subMenuOptionsY+81,false)
      if global.optSound>0
        draw_rectangle(subMenuOptionsX+5,subMenuOptionsY+87,subMenuOptionsX+11,subMenuOptionsY+93,false)
      if global.optIdentifier>0
        draw_rectangle(subMenuOptionsX+5,subMenuOptionsY+99,subMenuOptionsX+11,subMenuOptionsY+105,false)
      if global.optShowGlow=true
        draw_rectangle(subMenuOptionsX+5,subMenuOptionsY+111,subMenuOptionsX+11,subMenuOptionsY+117,false)
      if global.hasItemFinder=2
        draw_rectangle(subMenuOptionsX+5,subMenuOptionsY+123,subMenuOptionsX+11,subMenuOptionsY+129,false)
    }
    else if subCursorPos=2 //---------- OPTIONS SET 2 ----------
    {
      draw_text(subMenuOptionsX+86,subMenuOptionsY-2,"OPTIONS SET 2")
      draw_set_color(colorDarkPurple)
      draw_set_halign(fa_left)
      draw_rectangle(subMenuOptionsX+4,subMenuOptionsY+14,subMenuOptionsX+12,subMenuOptionsY+22,true)
      draw_rectangle(subMenuOptionsX+4,subMenuOptionsY+26,subMenuOptionsX+12,subMenuOptionsY+34,true)
      draw_rectangle(subMenuOptionsX+4,subMenuOptionsY+38,subMenuOptionsX+12,subMenuOptionsY+46,true)
      draw_rectangle(subMenuOptionsX+4,subMenuOptionsY+50,subMenuOptionsX+12,subMenuOptionsY+58,true)
      draw_rectangle(subMenuOptionsX+4,subMenuOptionsY+62,subMenuOptionsX+12,subMenuOptionsY+70,true)
      draw_rectangle(subMenuOptionsX+4,subMenuOptionsY+74,subMenuOptionsX+12,subMenuOptionsY+82,true)
      draw_rectangle(subMenuOptionsX+4,subMenuOptionsY+86,subMenuOptionsX+12,subMenuOptionsY+94,true)
      draw_rectangle(subMenuOptionsX+4,subMenuOptionsY+98,subMenuOptionsX+12,subMenuOptionsY+106,true)
      draw_rectangle(subMenuOptionsX+4,subMenuOptionsY+110,subMenuOptionsX+12,subMenuOptionsY+118,true)
      draw_text(subMenuOptionsX+16,subMenuOptionsY+11,"Kill Chain Screen Alert")
      draw_text(subMenuOptionsX+16,subMenuOptionsY+23,"Kill Chain Sound Alert")
      draw_text(subMenuOptionsX+16,subMenuOptionsY+35,"Killing Spree Screen Alert")
      draw_text(subMenuOptionsX+16,subMenuOptionsY+47,"Killing Spree Sound Alert")
      draw_text(subMenuOptionsX+16,subMenuOptionsY+59,"Combo Alert")
      draw_text(subMenuOptionsX+16,subMenuOptionsY+71,"Show Awesome Points Awarded")
      draw_text(subMenuOptionsX+16,subMenuOptionsY+83,"Show Enemy Health")
      draw_text(subMenuOptionsX+16,subMenuOptionsY+95,"Game Priority")
      draw_text(subMenuOptionsX+16,subMenuOptionsY+107,"Game Detail")
      draw_set_color(colorLightPink)
      if global.optKillChainScreen=true
        draw_rectangle(subMenuOptionsX+5,subMenuOptionsY+15,subMenuOptionsX+11,subMenuOptionsY+21,false)
      if global.optKillChainSound=true
        draw_rectangle(subMenuOptionsX+5,subMenuOptionsY+27,subMenuOptionsX+11,subMenuOptionsY+33,false)
      if global.optKillingSpreeScreen=true
        draw_rectangle(subMenuOptionsX+5,subMenuOptionsY+39,subMenuOptionsX+11,subMenuOptionsY+45,false)
      if global.optKillingSpreeSound=true
        draw_rectangle(subMenuOptionsX+5,subMenuOptionsY+51,subMenuOptionsX+11,subMenuOptionsY+57,false)
      if global.optCombo=true
        draw_rectangle(subMenuOptionsX+5,subMenuOptionsY+63,subMenuOptionsX+11,subMenuOptionsY+69,false)
      if global.optShowAwesome=true
        draw_rectangle(subMenuOptionsX+5,subMenuOptionsY+75,subMenuOptionsX+11,subMenuOptionsY+81,false)
      if global.optEnemyHP=true
        draw_rectangle(subMenuOptionsX+5,subMenuOptionsY+87,subMenuOptionsX+11,subMenuOptionsY+93,false)
      var gPri;
      if global.gamePriority=0
        gPri="Normal"
      else if global.gamePriority=1
        gPri="High"
      else if global.gamePriority=2
        gPri="Higher"
      draw_text(subMenuOptionsX+90,subMenuOptionsY+95,gPri)
      var gDetail;
      if global.optGameDetail=0
        gDetail="Low"
      else if global.optGameDetail=1
        gDetail="Normal"
      draw_text(subMenuOptionsX+90,subMenuOptionsY+107,gDetail)
    }
    else if subCursorPos=3 //---------- OPTIONS SET 3 ----------
    {
      draw_text(subMenuOptionsX+86,subMenuOptionsY-2,"OPTIONS SET 3")
      draw_set_color(colorDarkPurple)
      draw_set_halign(fa_left)
      draw_rectangle(subMenuOptionsX+4,subMenuOptionsY+14,subMenuOptionsX+12,subMenuOptionsY+22,true)
      draw_rectangle(subMenuOptionsX+4,subMenuOptionsY+26,subMenuOptionsX+12,subMenuOptionsY+34,true)
      draw_rectangle(subMenuOptionsX+4,subMenuOptionsY+38,subMenuOptionsX+12,subMenuOptionsY+46,true)
      draw_rectangle(subMenuOptionsX+4,subMenuOptionsY+50,subMenuOptionsX+12,subMenuOptionsY+58,true)
      draw_text(subMenuOptionsX+16,subMenuOptionsY+11,"D-Pad Dash")
      draw_text(subMenuOptionsX+16,subMenuOptionsY+23,"Right is Forward")
      draw_text(subMenuOptionsX+16,subMenuOptionsY+35,"Show HUD")
      draw_text(subMenuOptionsX+16,subMenuOptionsY+47,"Dash Warn")
      draw_set_color(colorLightPink)
      if global.optDPadDash=true
        draw_rectangle(subMenuOptionsX+5,subMenuOptionsY+15,subMenuOptionsX+11,subMenuOptionsY+21,false)
      if global.optRightIsForward=true
        draw_rectangle(subMenuOptionsX+5,subMenuOptionsY+27,subMenuOptionsX+11,subMenuOptionsY+33,false)
      if global.optShowHUD=true
        draw_rectangle(subMenuOptionsX+5,subMenuOptionsY+39,subMenuOptionsX+11,subMenuOptionsY+45,false)
      if global.optDashWarn=true
        draw_rectangle(subMenuOptionsX+5,subMenuOptionsY+51,subMenuOptionsX+11,subMenuOptionsY+57,false)
    }
    //---------- HELP INFO ----------
    subMenuInfoX=menuMainX+200
    subMenuInfoY=menuMainY+16
    draw_set_alpha(0.9)
    draw_set_color(colorDarkPink)
    draw_rectangle(subMenuInfoX,subMenuInfoY,subMenuInfoX+96,subMenuInfoY+25,false)
    draw_set_alpha(1)
    draw_set_color(colorLightPink)
    draw_rectangle(subMenuInfoX,subMenuInfoY,subMenuInfoX+96,subMenuInfoY+25,true)
    draw_line(subMenuInfoX,subMenuInfoY+10,subMenuInfoX+96,subMenuInfoY+10)
    draw_set_halign(fa_center)
    draw_text(subMenuInfoX+48,subMenuInfoY-2,"HELP INFO")
    draw_set_color(colorDarkPurple)
    draw_set_halign(fa_left)
    draw_text(subMenuInfoX+3,subMenuInfoY+11,"[L]: Swap Menus")
  }
  // ======================================================================
  else if currentMenu=6 //Quest ==================================================
  {
    draw_set_font(fnt_GoToMenu)
    draw_set_alpha(1)
    draw_set_color(colorDarkPurple)
    draw_set_halign(fa_center)
    draw_text(menuMainX+160,menuMainY-19,subMenu6)
    draw_text(menuMainX+60,menuMainY+196,subMenu5)
    draw_text(menuMainX+260,menuMainY+196,subMenu7)
    //---------- MENU CREATE ----------
    draw_set_font(fnt_SubMenu)
    draw_set_alpha(0.9)
    draw_set_color(colorDarkPink)
    if global.location="Veiled Detritus" //---------- DUNGEON MAP ----------
    {
      subMenuQuestX=menuMainX+12
      subMenuQuestY=menuMainY+12
      draw_rectangle(subMenuQuestX,subMenuQuestY,subMenuQuestX+294,subMenuQuestY+176,false)
      draw_set_alpha(1)
      draw_set_color(colorLightPink)
      draw_rectangle(subMenuQuestX,subMenuQuestY,subMenuQuestX+294,subMenuQuestY+176,true)
      draw_line(subMenuQuestX,subMenuQuestY+10,subMenuQuestX+294,subMenuQuestY+10)
      draw_text(subMenuQuestX+147,subMenuQuestY-2,string_upper(global.location))
      showDungeonMap()
    }
    else //---------- WORLD SAVING STUFF ----------
    {
      subMenuQuestX=menuMainX+69
      subMenuQuestY=menuMainY+16
      draw_rectangle(subMenuQuestX,subMenuQuestY,subMenuQuestX+182,subMenuQuestY+124,false)
      draw_set_alpha(1)
      draw_set_color(colorLightPink)
      draw_rectangle(subMenuQuestX,subMenuQuestY,subMenuQuestX+182,subMenuQuestY+124,true)
      draw_line(subMenuQuestX,subMenuQuestY+10,subMenuQuestX+182,subMenuQuestY+10)
      draw_text(subMenuQuestX+91,subMenuQuestY-2,"WORLD SAVING STUFF")
      draw_sprite(sMuffinSlot,-1,subMenuQuestX+22,subMenuQuestY+71) //1
      draw_sprite(sMuffinSlot,-1,subMenuQuestX+160,subMenuQuestY+71) //2
      draw_sprite(sMuffinSlot,-1,subMenuQuestX+56,subMenuQuestY+45) //3
      draw_sprite(sMuffinSlot,-1,subMenuQuestX+126,subMenuQuestY+45) //4
      draw_sprite(sMuffinSlot,-1,subMenuQuestX+67,subMenuQuestY+90) //5
      draw_sprite(sMuffinSlot,-1,subMenuQuestX+115,subMenuQuestY+90) //6
      draw_sprite(sMuffinSlot,-1,subMenuQuestX+91,subMenuQuestY+30) //7
      if global.muffins>=1
        draw_sprite(sMagicalMuffin,0,subMenuQuestX+22,subMenuQuestY+71)
      if global.muffins>=2
        draw_sprite(sMagicalMuffin,1,subMenuQuestX+160,subMenuQuestY+71)
      if global.muffins>=3
        draw_sprite(sMagicalMuffin,2,subMenuQuestX+56,subMenuQuestY+45)
      if global.muffins>=4
        draw_sprite(sMagicalMuffin,3,subMenuQuestX+126,subMenuQuestY+45)
      if global.muffins>=5
        draw_sprite(sMagicalMuffin,4,subMenuQuestX+67,subMenuQuestY+90)
      if global.muffins>=6
        draw_sprite(sMagicalMuffin,5,subMenuQuestX+115,subMenuQuestY+90)
      if global.muffins>=7
        draw_sprite(sMagicalMuffin,6,subMenuQuestX+91,subMenuQuestY+30)
    }
  }
  // ======================================================================
  else if currentMenu=7 //Records ==================================================
  {
    draw_set_font(fnt_GoToMenu)
    subMenuRecordsX=menuMainX+7
    subMenuRecordsY=menuMainY+10
    draw_set_alpha(1)
    draw_set_color(colorDarkPurple)
    draw_set_halign(fa_center)
    draw_text(menuMainX+160,menuMainY-19,subMenu7)
    draw_text(menuMainX+60,menuMainY+196,subMenu6)
    draw_text(menuMainX+260,menuMainY+196,subMenu8)
    draw_set_font(fnt_SubMenu)
    draw_set_alpha(0.9)
    draw_set_color(colorDarkPink)
    draw_rectangle(subMenuRecordsX,subMenuRecordsY,subMenuRecordsX+186,subMenuRecordsY+181,false)
    draw_set_alpha(1)
    draw_set_color(colorLightPink)
    draw_rectangle(subMenuRecordsX,subMenuRecordsY,subMenuRecordsX+186,subMenuRecordsY+181,true)
    draw_line(subMenuRecordsX,subMenuRecordsY+10,subMenuRecordsX+186,subMenuRecordsY+10)
    draw_set_halign(fa_center)
    if subCursorPos=1 //---------- POINTLESS RECORDS ----------
    {
      draw_text(subMenuRecordsX+93,subMenuRecordsY-2,"POINTLESS RECORDS")
      draw_set_color(colorDarkPurple)
      draw_set_halign(fa_left)
      draw_text(subMenuRecordsX+3,subMenuRecordsY+11,"Physical Attacks")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+23,"Physical Hits Connected")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+35,"Physical Hit %")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+47,"Techs Used")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+59,"Techs Connected")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+71,"Tech Hit %")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+83,"Spells Cast")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+95,"Spells Connected")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+107,"Spell Hit %")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+119,"Total Attacks Used")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+131,"Total Attacks Connected")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+143,"Overall Hit %")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+155,"Dashed Forward")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+167,"Dashed Backward")
      draw_set_color(colorLightPink)
      draw_set_halign(fa_right)
      var physicalHitPercent, techHitPercent, spellHitPercent, totalAttacksUsed, totalAttacksConnected, overallHitPercent;
      physicalHitPercent=0
      techHitPercent=0
      spellHitPercent=0
      totalAttacksUsed=0
      totalAttacksConnected=0
      overallHitPercent=0
      if global.recPhysicalAttacks!=0
        physicalHitPercent=(global.recPhysicalHitsConnected/global.recPhysicalAttacks)*100
      if global.recTechsUsed!=0
        techHitPercent=(global.recTechsConnected/global.recTechsUsed)*100
      if global.recSpellsCast!=0
        spellHitPercent=(global.recSpellsConnected/global.recSpellsCast)*100
      totalAttacksUsed=global.recPhysicalAttacks+global.recTechsUsed+global.recSpellsCast
      totalAttacksConnected=global.recPhysicalHitsConnected+global.recTechsConnected+global.recSpellsConnected
      if totalAttacksUsed!=0
        overallHitPercent=(totalAttacksConnected/totalAttacksUsed)*100
      draw_text(subMenuRecordsX+185,subMenuRecordsY+11,global.recPhysicalAttacks)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+23,global.recPhysicalHitsConnected)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+35,string(round(physicalHitPercent)) +string("%"))
      draw_text(subMenuRecordsX+185,subMenuRecordsY+47,global.recTechsUsed)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+59,global.recTechsConnected)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+71,string(round(techHitPercent)) +string("%"))
      draw_text(subMenuRecordsX+185,subMenuRecordsY+83,global.recSpellsCast)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+95,global.recSpellsConnected)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+107,string(round(spellHitPercent)) +string("%"))
      draw_text(subMenuRecordsX+185,subMenuRecordsY+119,totalAttacksUsed)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+131,totalAttacksConnected)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+143,string(round(overallHitPercent)) +string("%"))
      draw_text(subMenuRecordsX+185,subMenuRecordsY+155,global.recDashedForward)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+167,global.recDashedBackward)
    }
    else if subCursorPos=2 //---------- MORE POINTLESS RECORDS ----------
    {
      draw_text(subMenuRecordsX+93,subMenuRecordsY-2,"MORE POINTLESS RECORDS")
      draw_set_color(colorDarkPurple)
      draw_set_halign(fa_left)
      draw_text(subMenuRecordsX+3,subMenuRecordsY+11,"Damage Dealt")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+23,"Damage Taken")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+35,"Taken Damage")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+47,"Max Hit Combo")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+59,"Max Kill Chain")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+71,"Max Killing Spree")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+83,"Crippled Target")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+95,"Elements Fused")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+107,"Enemies Scanned")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+119,"Longest Idle Time")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+131,"People Talked To")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+143,"Jumped")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+155,"Air Dashed")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+167,"Most Powerful Jump Attack")
      draw_set_color(colorLightPink)
      draw_set_halign(fa_right)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+11,round(global.recDamageDealt))
      draw_text(subMenuRecordsX+185,subMenuRecordsY+23,round(global.recDamageTaken))
      draw_text(subMenuRecordsX+185,subMenuRecordsY+35,global.recTakenDamageNumber)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+47,global.recMaxHitCombo)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+59,global.recMaxKillChain)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+71,global.recMaxKillingSpree)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+83,global.recCrippledTargetNumber)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+95,global.recElementsFused)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+107,global.recEnemiesScanned)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+119,global.recLongestIdleTime)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+131,global.recPeopleTalkedTo)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+143,global.recJumped)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+155,global.recAirDashed)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+167,round(global.recMostPowerfulJumpAttack))
    }
    else if subCursorPos=3 //---------- EVEN MORE POINTLESS RECORDS ----------
    {
      draw_text(subMenuRecordsX+93,subMenuRecordsY-2,"EVEN MORE POINTLESS RECORDS")
      draw_set_color(colorDarkPurple)
      draw_set_halign(fa_left)
      draw_text(subMenuRecordsX+3,subMenuRecordsY+11,"Used Rave Mode")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+23,"Achievements Completed")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+35,"Weakest Non-0 Damage Hit")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+47,"Most Powerful Hit (In Rave)")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+59,"Most Powerful Hit (No Rave)")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+71,"Saved")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+83,"Fallen Off Level")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+95,"Items Used")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+107,"Items Bought")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+119,"Total Internetz Earned")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+131,"Total Internetz Spent")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+143,"Opened Menu")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+155,"Used Area Exit")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+167,"Objects Broken")
      draw_set_color(colorLightPink)
      draw_set_halign(fa_right)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+11,global.recUsedRaveMode)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+23,global.recAchievementsCompleted)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+35,round(global.recWeakestHit))
      draw_text(subMenuRecordsX+185,subMenuRecordsY+47,round(global.recStrongestHitInRave))
      draw_text(subMenuRecordsX+185,subMenuRecordsY+59,round(global.recStrongestHitNoRave))
      draw_text(subMenuRecordsX+185,subMenuRecordsY+71,global.recSavedNumber)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+83,global.recFallenOffLevelNumber)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+95,global.recItemsUsed)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+107,global.recItemsBought)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+119,global.recTotalInternetzEarned)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+131,global.recTotalInternetzSpent)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+143,global.recOpenedMenuNumber)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+155,global.recUsedAreaExit)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+167,global.recObjectsBroken)
    }
    else if subCursorPos=4 //---------- YEP ... MORE POINTLESS RECORDS ----------
    {
      draw_text(subMenuRecordsX+93,subMenuRecordsY-2,"YEP ... MORE POINTLESS RECORDS")
      draw_set_color(colorDarkPurple)
      draw_set_halign(fa_left)
      draw_text(subMenuRecordsX+3,subMenuRecordsY+11,"Current Day of the Week")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+23,"Days Till End of the World")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+35,"Days Till Next Christmas")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+47,"Distance Run (Pixels)")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+59,"Distance In Air (Pixels)")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+71,"Question Mark Blocks Hit")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+83,"Seen Kirby")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+95,"Seen Michael Jackson")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+107,"Signs Read")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+119,"Binary Indexes Decrypted")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+131,"Current Time")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+143,"Time on Beginner Mode")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+155,"Time on Veteran Mode")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+167,"Time on Hardcore Mode")
      draw_set_color(colorLightPink)
      draw_set_halign(fa_right)
      var weekDay, endOfWorld, tillChristmas, cHour;
      if current_weekday=1
        weekDay="Sunday"
      else if current_weekday=2
        weekDay="Monday"
      else if current_weekday=3
        weekDay="Tuesday"
      else if current_weekday=4
        weekDay="Wednesday"
      else if current_weekday=5
        weekDay="Thursday"
      else if current_weekday=6
        weekDay="Friday"
      else if current_weekday=7
        weekDay="Saturday"
      endOfWorld=date_create_datetime(2012,12,21,0,0,0)-date_current_datetime()
      if current_month=12 and current_day>25
        tillChristmas=date_create_datetime(current_year+1,12,25,0,0,0)-date_current_datetime()
      else
        tillChristmas=date_create_datetime(current_year,12,25,0,0,0)-date_current_datetime()
      if current_hour>12
      {
        cHour=current_hour-12
        dt="PM"
      }
      else
      {
        cHour=current_hour
        dt="AM"
      }
      draw_text(subMenuRecordsX+185,subMenuRecordsY+11,weekDay)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+23,round(endOfWorld))
      draw_text(subMenuRecordsX+185,subMenuRecordsY+35,round(tillChristmas))
      draw_text(subMenuRecordsX+185,subMenuRecordsY+47,round(global.recDistanceRun))
      draw_text(subMenuRecordsX+185,subMenuRecordsY+59,round(global.recDistanceInAir))
      draw_text(subMenuRecordsX+185,subMenuRecordsY+71,global.recQuestionMarkBlocksHit)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+83,global.recSeenKirby)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+95,global.recSeenMichaelJackson)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+107,global.recSignsRead)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+119,global.recBinariesRead)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+131,string(cHour) +string(":") +string(current_minute) +string(":") +string(current_second) +string(dt))
      draw_text(subMenuRecordsX+185,subMenuRecordsY+143,round(global.recEasyTime/30))
      draw_text(subMenuRecordsX+185,subMenuRecordsY+155,round(global.recNormalTime/30))
      draw_text(subMenuRecordsX+185,subMenuRecordsY+167,round(global.recHardTime/30))
    }
    else if subCursorPos=5 //---------- OMG STOP THE POINTLESS RECORDS ----------
    {
      draw_text(subMenuRecordsX+93,subMenuRecordsY-2,"OMG STOP THE POINTLESS RECORDS")
      draw_set_color(colorDarkPurple)
      draw_set_halign(fa_left)
      draw_text(subMenuRecordsX+3,subMenuRecordsY+11,"A Random Number")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+23,"Time Spent Off-screen")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+35,"Play Time This Session")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+47,"Exp Bonus")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+59,"Buster Shots Used")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+71,"Max Bubbles On Screen")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+83,"Map ID")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+95,"Player X")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+107,"Player Y")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+119,"Blazing Appearances")
      draw_text(subMenuRecordsX+3,subMenuRecordsY+131,"Difficulty")
      draw_set_color(colorLightPink)
      draw_set_halign(fa_right)
      var ranNumber,expBonus,currDifficulty; //, sesPtHour, sesPtMinute, sesPtSec;
      ranNumber=round(random(899999999)+100000000)
      expBonus=round((oPlayer1.awesomePoints/100000)*100)
      if expBonus>100 {expBonus=100}
      expBonus+=global.SkStatistician*5

      if global.difficulty=1
      {
        expBonus-=10
        currDifficulty="Beginner"
      }
      else if global.difficulty=2
        currDifficulty="Veteran"
      else if global.difficulty=3
      {
        expBonus+=10
        currDifficulty="Hardcore"
      }
      else if global.difficulty=4
      {
        expBonus+=11
        currDifficulty="Distorted"
      }
      if current_weekday=1 or current_weekday=7
        expBonus+=1
      else if current_weekday=2
        expBonus-=1
      draw_text(subMenuRecordsX+185,subMenuRecordsY+11,ranNumber)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+23,global.recTimeSpentOffscreen)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+35,global.sessionPlayTime)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+47,string(expBonus) +string("%"))
      draw_text(subMenuRecordsX+185,subMenuRecordsY+59,global.recBusterShotsUsed)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+71,global.recMaxBubbles)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+83,room)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+95,oPlayer1.x)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+107,oPlayer1.y)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+119,global.recBlazingAppear)
      draw_text(subMenuRecordsX+185,subMenuRecordsY+131,currDifficulty)

      //draw_text(subMenuRecordsX+185,subMenuRecordsY+35,string(sesPtHour) +string(":") +string(sesPtMinute) +string(":") +string(sesPtSec))
    }
    //---------- HELP INFO ----------
    subMenuInfoX=menuMainX+200
    subMenuInfoY=menuMainY+10
    draw_set_alpha(0.9)
    draw_set_color(colorDarkPink)
    draw_rectangle(subMenuInfoX,subMenuInfoY,subMenuInfoX+112,subMenuInfoY+37,false)
    draw_set_alpha(1)
    draw_set_color(colorLightPink)
    draw_rectangle(subMenuInfoX,subMenuInfoY,subMenuInfoX+112,subMenuInfoY+37,true)
    draw_line(subMenuInfoX,subMenuInfoY+10,subMenuInfoX+112,subMenuInfoY+10)
    draw_set_halign(fa_center)
    draw_text(subMenuInfoX+56,subMenuInfoY-2,"HELP INFO")
    draw_set_color(colorDarkPurple)
    draw_set_halign(fa_left)
    draw_text(subMenuInfoX+3,subMenuInfoY+11,"[A]: Swap Menus")
    draw_text(subMenuInfoX+3,subMenuInfoY+23,"[D]: Swap Menus")
    //---------- CURRENT SUBSUB-MENU ----------
    subSubMenuX=menuMainX+200
    subSubMenuY=menuMainY+49
    draw_set_alpha(0.9)
    draw_set_color(colorDarkPink)
    draw_rectangle(subSubMenuX,subSubMenuY,subSubMenuX+6,subSubMenuY+10,false)
    draw_rectangle(subSubMenuX+8,subSubMenuY,subSubMenuX+14,subSubMenuY+10,false)
    draw_rectangle(subSubMenuX+16,subSubMenuY,subSubMenuX+22,subSubMenuY+10,false)
    draw_rectangle(subSubMenuX+24,subSubMenuY,subSubMenuX+30,subSubMenuY+10,false)
    draw_rectangle(subSubMenuX+32,subSubMenuY,subSubMenuX+38,subSubMenuY+10,false)
    draw_set_alpha(1)
    draw_set_color(colorLightPink)
    draw_rectangle(subSubMenuX,subSubMenuY,subSubMenuX+6,subSubMenuY+10,true)
    draw_rectangle(subSubMenuX+8,subSubMenuY,subSubMenuX+14,subSubMenuY+10,true)
    draw_rectangle(subSubMenuX+16,subSubMenuY,subSubMenuX+22,subSubMenuY+10,true)
    draw_rectangle(subSubMenuX+24,subSubMenuY,subSubMenuX+30,subSubMenuY+10,true)
    draw_rectangle(subSubMenuX+32,subSubMenuY,subSubMenuX+38,subSubMenuY+10,true)
    draw_set_color(colorDarkPurple)
    var currentSubInd;
    currentSubInd=(subCursorPos*8)-8
    draw_rectangle(subSubMenuX+1+currentSubInd,subSubMenuY+1,subSubMenuX+5+currentSubInd,subSubMenuY+9,false)
  }
  else if currentMenu=8 //Controls ==================================================
  {
    draw_set_font(fnt_GoToMenu)
    subMenuControlsX=menuMainX+16
    subMenuControlsY=menuMainY+16
    draw_set_alpha(1)
    draw_set_color(colorDarkPurple)
    draw_set_halign(fa_center)
    draw_text(menuMainX+160,menuMainY-19,subMenu8)
    draw_text(menuMainX+60,menuMainY+196,subMenu7)
    draw_text(menuMainX+260,menuMainY+196,subMenu9)
    draw_set_font(fnt_SubMenu)
    draw_set_alpha(0.9)
    draw_set_color(colorDarkPink)
    draw_rectangle(subMenuControlsX,subMenuControlsY,subMenuControlsX+170,subMenuControlsY+173,false)
    draw_set_alpha(1)
    draw_set_color(colorLightPink)
    draw_rectangle(subMenuControlsX,subMenuControlsY,subMenuControlsX+170,subMenuControlsY+173,true)
    draw_line(subMenuControlsX,subMenuControlsY+10,subMenuControlsX+170,subMenuControlsY+10)
    draw_set_halign(fa_center)
    draw_text(subMenuControlsX+85,subMenuControlsY-2,"CONTROL CONFIGURATION")
    draw_set_color(colorDarkPurple)
    draw_set_halign(fa_left)
    draw_text(subMenuControlsX+3,subMenuControlsY+11,"Key")
    draw_text(subMenuControlsX+35,subMenuControlsY+11,"Action")
    if subCursorPos=1
    {
      draw_rectangle(subMenuControlsX+4,subMenuControlsY+28,subMenuControlsX+12,subMenuControlsY+36,true)
      draw_rectangle(subMenuControlsX+4,subMenuControlsY+40,subMenuControlsX+12,subMenuControlsY+48,true)
      draw_rectangle(subMenuControlsX+4,subMenuControlsY+52,subMenuControlsX+12,subMenuControlsY+60,true)
      draw_rectangle(subMenuControlsX+4,subMenuControlsY+64,subMenuControlsX+12,subMenuControlsY+72,true)
      draw_rectangle(subMenuControlsX+4,subMenuControlsY+76,subMenuControlsX+12,subMenuControlsY+84,true)
      draw_rectangle(subMenuControlsX+4,subMenuControlsY+88,subMenuControlsX+12,subMenuControlsY+96,true)
      draw_rectangle(subMenuControlsX+4,subMenuControlsY+100,subMenuControlsX+12,subMenuControlsY+108,true)
      draw_rectangle(subMenuControlsX+4,subMenuControlsY+112,subMenuControlsX+12,subMenuControlsY+120,true)
      draw_rectangle(subMenuControlsX+4,subMenuControlsY+124,subMenuControlsX+12,subMenuControlsY+132,true)
      draw_line(subMenuControlsX+32,subMenuControlsY+13,subMenuControlsX+32,subMenuControlsY+122)
      //--------------------------------------------------
      draw_text(subMenuControlsX+16,subMenuControlsY+25,global.ctrlUp)
      draw_text(subMenuControlsX+16,subMenuControlsY+37,global.ctrlDown)
      draw_text(subMenuControlsX+16,subMenuControlsY+49,global.ctrlLeft)
      draw_text(subMenuControlsX+16,subMenuControlsY+61,global.ctrlRight)
      draw_text(subMenuControlsX+16,subMenuControlsY+73,global.ctrlAttack)
      draw_text(subMenuControlsX+16,subMenuControlsY+85,global.ctrlJump)
      draw_text(subMenuControlsX+16,subMenuControlsY+97,global.ctrlTech)
      draw_text(subMenuControlsX+16,subMenuControlsY+109,global.ctrlSpell)
      //--------------------------------------------------
      draw_text(subMenuControlsX+35,subMenuControlsY+25,"Up")
      draw_text(subMenuControlsX+35,subMenuControlsY+37,"Down")
      draw_text(subMenuControlsX+35,subMenuControlsY+49,"Left")
      draw_text(subMenuControlsX+35,subMenuControlsY+61,"Right")
      draw_text(subMenuControlsX+35,subMenuControlsY+73,"Attack")
      draw_text(subMenuControlsX+35,subMenuControlsY+85,"Jump")
      draw_text(subMenuControlsX+35,subMenuControlsY+97,"Use Tech")
      draw_text(subMenuControlsX+35,subMenuControlsY+109,"Cast Spell")
      draw_text(subMenuControlsX+16,subMenuControlsY+121,"Set to Default Controls")
      //--------------------------------------------------
      draw_text(subMenuControlsX+80,subMenuControlsY+25,"- Arrow Up")
      draw_text(subMenuControlsX+80,subMenuControlsY+37,"- Arrow Down")
      draw_text(subMenuControlsX+80,subMenuControlsY+49,"- Arrow Left")
      draw_text(subMenuControlsX+80,subMenuControlsY+61,"- Arrow Right")
    }
    else if subCursorPos=2
    {
      draw_rectangle(subMenuControlsX+4,subMenuControlsY+28,subMenuControlsX+12,subMenuControlsY+36,true)
      draw_rectangle(subMenuControlsX+4,subMenuControlsY+40,subMenuControlsX+12,subMenuControlsY+48,true)
      draw_rectangle(subMenuControlsX+4,subMenuControlsY+52,subMenuControlsX+12,subMenuControlsY+60,true)
      draw_rectangle(subMenuControlsX+4,subMenuControlsY+64,subMenuControlsX+12,subMenuControlsY+72,true)
      draw_rectangle(subMenuControlsX+4,subMenuControlsY+76,subMenuControlsX+12,subMenuControlsY+84,true)
      draw_rectangle(subMenuControlsX+4,subMenuControlsY+88,subMenuControlsX+12,subMenuControlsY+96,true)
      draw_rectangle(subMenuControlsX+4,subMenuControlsY+100,subMenuControlsX+12,subMenuControlsY+108,true)
      draw_rectangle(subMenuControlsX+4,subMenuControlsY+112,subMenuControlsX+12,subMenuControlsY+120,true)
      draw_line(subMenuControlsX+32,subMenuControlsY+13,subMenuControlsX+32,subMenuControlsY+110)
      //--------------------------------------------------
      draw_text(subMenuControlsX+16,subMenuControlsY+25,global.ctrlCycleBack)
      draw_text(subMenuControlsX+16,subMenuControlsY+37,global.ctrlCycleForward)
      draw_text(subMenuControlsX+16,subMenuControlsY+49,global.ctrlRave)
      draw_text(subMenuControlsX+16,subMenuControlsY+61,global.ctrlAbilityBack)
      draw_text(subMenuControlsX+16,subMenuControlsY+73,global.ctrlAbilityForward)
      draw_text(subMenuControlsX+16,subMenuControlsY+85,global.ctrlDashLeft)
      draw_text(subMenuControlsX+16,subMenuControlsY+97,global.ctrlDashRight)
      draw_text(subMenuControlsX+16,subMenuControlsY+109,"Set to Default Controls")
      //--------------------------------------------------
      draw_text(subMenuControlsX+35,subMenuControlsY+25,"Cycle Element - Back")
      draw_text(subMenuControlsX+35,subMenuControlsY+37,"Cycle Element - Forward")
      draw_text(subMenuControlsX+35,subMenuControlsY+49,"Engage Rave Mode")
      draw_text(subMenuControlsX+35,subMenuControlsY+61,"Cycle Ability - Back")
      draw_text(subMenuControlsX+35,subMenuControlsY+73,"Cycle Ability - Forward")
      draw_text(subMenuControlsX+35,subMenuControlsY+85,"Dash Left")
      draw_text(subMenuControlsX+35,subMenuControlsY+97,"Dash Right")
    }

    //---------- HELP INFO ----------
    subMenuInfoX=menuMainX+190
    subMenuInfoY=menuMainY+16
    draw_set_alpha(0.9)
    draw_set_color(colorDarkPink)
    draw_rectangle(subMenuInfoX,subMenuInfoY,subMenuInfoX+122,subMenuInfoY+37,false)
    draw_set_alpha(1)
    draw_set_color(colorLightPink)
    draw_rectangle(subMenuInfoX,subMenuInfoY,subMenuInfoX+122,subMenuInfoY+37,true)
    draw_line(subMenuInfoX,subMenuInfoY+10,subMenuInfoX+122,subMenuInfoY+10)
    draw_set_halign(fa_center)
    draw_text(subMenuInfoX+61,subMenuInfoY-2,"HELP INFO")
    draw_set_color(colorDarkPurple)
    draw_set_halign(fa_left)
    draw_text(subMenuInfoX+3,subMenuInfoY+11,"[J]: Select action")
    draw_text(subMenuInfoX+3,subMenuInfoY+23,"[L]: Swap Menus")
  }
  else if currentMenu=9 //System ==================================================
  {
    draw_set_font(fnt_GoToMenu)
    subMenuSystemX=menuMainX+16
    subMenuSystemY=menuMainY+16
    draw_set_alpha(1)
    draw_set_color(colorDarkPurple)
    draw_set_halign(fa_center)
    draw_text(menuMainX+160,menuMainY-19,subMenu9)
    draw_text(menuMainX+60,menuMainY+196,subMenu8)
    draw_text(menuMainX+260,menuMainY+196,subMenu1)
    draw_set_font(fnt_SubMenu)
    draw_set_alpha(0.9)
    draw_set_color(colorDarkPink)
    draw_rectangle(subMenuSystemX,subMenuSystemY,subMenuSystemX+124,subMenuSystemY+38,false)
    draw_set_alpha(1)
    draw_set_color(colorLightPink)
    draw_rectangle(subMenuSystemX,subMenuSystemY,subMenuSystemX+124,subMenuSystemY+38,true)
    draw_line(subMenuSystemX,subMenuSystemY+10,subMenuSystemX+124,subMenuSystemY+10)
    //---------- SYSTEM MENU ----------
    draw_text(subMenuSystemX+62,subMenuSystemY-2,"SYSTEM MENU")
    draw_set_color(colorDarkPurple)
    draw_set_halign(fa_left)
    draw_rectangle(subMenuSystemX+4,subMenuSystemY+14,subMenuSystemX+12,subMenuSystemY+22,true)
    draw_rectangle(subMenuSystemX+4,subMenuSystemY+26,subMenuSystemX+12,subMenuSystemY+34,true)

    draw_text(subMenuSystemX+16,subMenuSystemY+11,"Force Game Over")
    draw_text(subMenuSystemX+16,subMenuSystemY+23,"Return to Title Screen")
  }
  else if currentMenu>=100 //Bead Equip ==================================================
    menuBeadEquip(0)

  if currentMenu<10
  {
    //menu cursor
    draw_set_alpha(1)
    draw_set_color(colorLightPink)
    if currentMenu=2
      draw_rectangle(menuCursorX,menuCursorY,menuCursorX+12,menuCursorY+12,true)
    else if currentMenu=3
      draw_rectangle(menuCursorX,menuCursorY,menuCursorX+12,menuCursorY+12,true)
    else if currentMenu=4
      draw_rectangle(menuCursorX,menuCursorY,menuCursorX+14,menuCursorY+14,true)
    else if currentMenu=5
    {
      draw_rectangle(menuCursorX,menuCursorY,menuCursorX+12,menuCursorY+12,true)
      if subCursorPos=1
      {
        draw_rectangle(identCursorX+global.optMusic,identCursorY-12,identCursorX+global.optMusic+4,identCursorY-6,true)
        draw_rectangle(identCursorX+global.optSound,identCursorY,identCursorX+global.optSound+4,identCursorY+6,true)
        draw_rectangle(identCursorX+global.optIdentifier,identCursorY+12,identCursorX+global.optIdentifier+4,identCursorY+18,true)
      }
    }
    else if currentMenu=8
      draw_rectangle(menuCursorX,menuCursorY,menuCursorX+12,menuCursorY+12,true)
    else if currentMenu=9
      draw_rectangle(menuCursorX,menuCursorY,menuCursorX+12,menuCursorY+12,true)
  }
  menuSlotDisplay()
  menuQuote()
}
#define KeyPress_80
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gameOver=false
{
  if menuOpen=false and global.gamePaused=false
  {
    playSound(global.snd_MenuOpen,0,1)
    depth=-150
    //fix items going over max
    if oPlayer1.conSkittles>9
      oPlayer1.conSkittles=9
    if oPlayer1.conSmoothie>3
      oPlayer1.conSmoothie=3
    if oPlayer1.conStarburst>5
      oPlayer1.conStarburst=5
    if oPlayer1.conGummyBears>7
      oPlayer1.conGummyBears=7
    menuMainX=view_xview[0]+96
    menuMainY=view_yview[0]+82
    xLineEffectMax=26
    xLineEffect=0
    xCreate=menuMainX+4
    yCreate=menuMainY+4
    oLineDummy=object_add()
    for (iCreate=0;iCreate<xLineEffectMax;iCreate+=1)
    {
      xLineEffect[iCreate]=instance_create(xCreate,yCreate,oLineDummy)
      xCreate+=12
    }

    yLineEffectMax=16
    yLineEffect=0
    xCreate=menuMainX+4
    yCreate=menuMainY+4
    for (iCreate=0;iCreate<yLineEffectMax;iCreate+=1)
    {
      yLineEffect[iCreate]=instance_create(xCreate,yCreate,oLineDummy)
      yCreate+=12
    }
    menuOpen=true
    global.gamePaused=true
    oPlayer1.image_speed=0
    if global.optKeepMenuPosition=false
      currentMenu=1
    else
    {
      if global.menuPosition>=100
        global.menuPosition=2
      currentMenu=global.menuPosition
    }
    global.recOpenedMenuNumber+=1
    bChangedMenu=true
    subCursorPos=1
    cursorPosX=1
    cursorPosY=1
    menuCursorX=menuMainX
    menuCursorY=menuMainX
    identCursorX=menuMainX
    identCursorY=menuMainX
    cursorIncX=1
    cursorIncY=1
    triX=0
    triMoveTime=0
  }
  else if menuOpen=true and global.gamePaused=true
  {
    playSound(global.snd_MenuClose,0,1)
    depth=-99
    global.menuPosition=currentMenu
    menuOpen=false
    global.gamePaused=false
    with oMessageMenuPopup
      instance_destroy()
    with oLineDummy
      instance_destroy()
    object_delete(oLineDummy)
  }
}
