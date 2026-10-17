#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0.1
shopProgress=0
menuCursorX=0
menuCursorY=0
menuCursorPos=1
cursorIncY=12
menuMax=2
//input commands==========
curUp=ord("W")
curDown=ord("S")
curConfirm=ord("J")
curCancel=ord("K")
shopMessage="Only 25 Internetz to reset your skill tree."
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if x<=oPlayer1.x
    image_xscale=1
  else
    image_xscale=-1
}
if shopProgress>0
{
  //if keyboard_check_pressed(curUp) or keyboard_check_pressed(vk_up)
  if keyboard_check_pressed(curUp) or (keyboard_check_pressed(vk_up) or scrPadPressed(3)) //gamepad change: and the gamepad's Up (scrGamepadInit)
  {
    playSound(global.snd_MenuCursor,0,1)
    if menuCursorPos=1
    {
      menuCursorPos=menuMax
      menuCursorY+=cursorIncY*(menuMax-1)
    }
    else
    {
      menuCursorPos-=1
      menuCursorY-=cursorIncY
    }
  }
  //if keyboard_check_pressed(curDown) or keyboard_check_pressed(vk_down)
  if keyboard_check_pressed(curDown) or (keyboard_check_pressed(vk_down) or scrPadPressed(4)) //gamepad change: and the gamepad's Down (scrGamepadInit)
  {
    playSound(global.snd_MenuCursor,0,1)
    if menuCursorPos=menuMax
    {
      menuCursorPos=1
      menuCursorY-=cursorIncY*(menuMax-1)
    }
    else
    {
      menuCursorPos+=1
      menuCursorY+=cursorIncY
    }
  }
  //if keyboard_check_pressed(curConfirm)=true
  if (keyboard_check_pressed(curConfirm) or scrPadPressed(17))=true //gamepad change: and the gamepad's Menu Confirm (scrGamepadInit)
  {
    if menuCursorPos=1 //Yes
    {
      if oPlayer1.moneyTotal>=25
      {
        playSound(global.snd_MenuConfirm,0,1)
        stringToShow="Skills have been reset."
        messageWidth=string_width(stringToShow)
        newMessage=instance_create(256-(messageWidth/2),192,oMessageMenuPopup)
        newMessage.message=stringToShow
        newMessage.fadingTime=40
        oPlayer1.moneyTotal-=25
        global.recTotalInternetzSpent+=25
        var spCount;
        spCount=0
        //=====================================================================================
        if global.SkSharpen=1
          spCount+=1
        else if global.SkSharpen=2
          spCount+=3
        else if global.SkSharpen=3
          spCount+=6

        spCount+=global.SkComboMaster

        if global.SkSmash=1
          spCount+=2

        spCount+=global.SkExpertise

        if global.SkDashPower=1
          spCount+=2

        if global.SkStrategist=1
          spCount+=1
        else if global.SkStrategist=2
          spCount+=3

        if global.SkFireAffinity=1
          spCount+=1
        else if global.SkFireAffinity=2
          spCount+=3
        else if global.SkFireAffinity=3
          spCount+=5

        if global.SkWaterAffinity=1
          spCount+=1
        else if global.SkWaterAffinity=2
          spCount+=3
        else if global.SkWaterAffinity=3
          spCount+=5

        if global.SkWindAffinity=1
          spCount+=1
        else if global.SkWindAffinity=2
          spCount+=3
        else if global.SkWindAffinity=3
          spCount+=5

        if global.SkEarthAffinity=1
          spCount+=1
        else if global.SkEarthAffinity=2
          spCount+=3
        else if global.SkEarthAffinity=3
          spCount+=5

        if global.SkIronBody=1
          spCount+=1
        else if global.SkIronBody=2
          spCount+=3
        else if global.SkIronBody=3
          spCount+=5

        if global.SkFreeSpirit=1
          spCount+=1
        else if global.SkFreeSpirit=2
          spCount+=3
        else if global.SkFreeSpirit=3
          spCount+=6

        spCount+=global.SkAgility

        if global.SkSwiftFoot=1
          spCount+=2

        if global.SkQuickRecovery=1
          spCount+=2

        if global.SkFireResist=1
          spCount+=1
        else if global.SkFireResist=2
          spCount+=3
        else if global.SkFireResist=3
          spCount+=6

        if global.SkWaterResist=1
          spCount+=1
        else if global.SkWaterResist=2
          spCount+=3
        else if global.SkWaterResist=3
          spCount+=6

        if global.SkWindResist=1
          spCount+=1
        else if global.SkWindResist=2
          spCount+=3
        else if global.SkWindResist=3
          spCount+=6

        if global.SkEarthResist=1
          spCount+=1
        else if global.SkEarthResist=2
          spCount+=3
        else if global.SkEarthResist=3
          spCount+=6

        if global.SkPrecision=1
          spCount+=1
        else if global.SkPrecision=2
          spCount+=3

        if global.SkPerfection=1
          spCount+=1
        else if global.SkPerfection=2
          spCount+=3

        if global.SkVirtue=1
          spCount+=1
        else if global.SkVirtue=2
          spCount+=3

        if global.SkSpiritMaster=1
          spCount+=2
        else if global.SkSpiritMaster=2
          spCount+=5
        //========================
        if global.SkFireMastery=1
          spCount+=1
        else if global.SkFireMastery=2
          spCount+=3

        if global.SkWaterMastery=1
          spCount+=1
        else if global.SkWaterMastery=2
          spCount+=3

        if global.SkWindMastery=1
          spCount+=1
        else if global.SkWindMastery=2
          spCount+=3

        if global.SkEarthMastery=1
          spCount+=1
        else if global.SkEarthMastery=2
          spCount+=3

        if global.SkFireCraft=1
          spCount+=1
        else if global.SkFireCraft=2
          spCount+=3

        if global.SkWaterCraft=1
          spCount+=1
        else if global.SkWaterCraft=2
          spCount+=3

        if global.SkWindCraft=1
          spCount+=1
        else if global.SkWindCraft=2
          spCount+=3

        if global.SkEarthCraft=1
          spCount+=1
        else if global.SkEarthCraft=2
          spCount+=3

        if global.SkElementalMaster=1
          spCount+=4

        if global.SkGoodFortune=1
          spCount+=2
        else if global.SkGoodFortune=2
          spCount+=5

        if global.SkStatistician=1
          spCount+=2
        else if global.SkStatistician=2
          spCount+=5

        if global.SkFaith=1
          spCount+=2

        if global.SkProtection=1
          spCount+=1
        else if global.SkProtection=2
          spCount+=3
        //=====================================================================================
        global.p1SkillPoints+=spCount
        global.p1FIREresist-=global.SkFireResist*5
        global.p1WATERresist-=global.SkWaterResist*5
        global.p1WINDresist-=global.SkWindResist*5
        global.p1EARTHresist-=global.SkEarthResist*5

        global.SkSharpen=0
        global.SkComboMaster=0
        global.SkSmash=0
        global.SkExpertise=0
        global.SkDashPower=0
        global.SkStrategist=0
        global.SkFireAffinity=0
        global.SkWaterAffinity=0
        global.SkWindAffinity=0
        global.SkEarthAffinity=0
        global.SkFireResist=0
        global.SkWaterResist=0
        global.SkWindResist=0
        global.SkEarthResist=0
        global.SkIronBody=0
        global.SkFreeSpirit=0
        global.SkAgility=0
        global.SkSwiftFoot=0
        global.SkQuickRecovery=0
        global.SkPrecision=0
        global.SkPerfection=0
        global.SkVirtue=0
        global.SkSpiritMaster=0
        global.SkFireMastery=0
        global.SkFireCraft=0
        global.SkProtection=0
        global.SkWaterMastery=0
        global.SkWaterCraft=0
        global.SkElementalMaster=0
        global.SkWindMastery=0
        global.SkWindCraft=0
        global.SkGoodFortune=0
        global.SkStatistician=0
        global.SkEarthMastery=0
        global.SkEarthCraft=0
        global.SkFaith=0
      }
      else
      {
        playSound(global.snd_MenuCancel,0,1)
        with oMessageMenuPopup
          instance_destroy()
        stringToShow="Are you serious? You don't even have 25 Internetz!#Wow you fail... Also, The game."
        messageWidth=string_width(stringToShow)
        newMessage=instance_create(256-(messageWidth/2),192,oMessageMenuPopup)
        newMessage.message=stringToShow
        newMessage.fadingTime=40
      }
    }
    io_clear()
    scrGamepadSync() //gamepad change (added): and the gamepad's presses (io_clear only clears the keyboard's, so a pad press it was meant to use up still counted for the rest of the frame: A that closed dialogue also jumped, Up at a door went through the door it arrived at and back)
    oPlayer1.image_alpha=1
    shopProgress=0
    depth=50
    global.gamePaused=false
  }
  //if keyboard_check_pressed(curCancel)=true
  if (keyboard_check_pressed(curCancel) or scrPadPressed(18))=true //gamepad change: and the gamepad's Menu Cancel (scrGamepadInit)
  {
    io_clear()
    scrGamepadSync() //gamepad change (added): and the gamepad's presses (io_clear only clears the keyboard's, so a pad press it was meant to use up still counted for the rest of the frame: A that closed dialogue also jumped, Up at a door went through the door it arrived at and back)
    oPlayer1.image_alpha=1
    shopProgress=0
    depth=50
    global.gamePaused=false
  }
}
#define Collision_oPlayer1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*
Shop script.
*/
//if (keyboard_check_pressed(ord(global.ctrlUp))) or keyboard_check_pressed(vk_up) and global.gamePaused=false and shopProgress=0
if (keyboard_check_pressed(ord(global.ctrlUp))) or (keyboard_check_pressed(vk_up) or scrPadPressed(3)) and global.gamePaused=false and shopProgress=0 //gamepad change: and the gamepad's Up (scrGamepadInit)
{
  depth=0
  oPlayer1.image_alpha=0
  menuCursorX=view_xview[0]+176
  menuCursorY=view_yview[0]+160
  menuCursorPos=1
  shopProgress=1
  global.gamePaused=true
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale,0,image_blend,1)
if shopProgress>0
{
  colorLightPink=make_color_rgb(213,180,112)
  colorDarkPink=make_color_rgb(184,104,8)
  colorLightPurple=make_color_rgb(108,49,27)
  colorDarkPurple=make_color_rgb(88,32,11)
  draw_set_font(fnt_SubMenu)
  draw_set_alpha(1)
  //---------- SHOPKEEPER MESSAGE ----------
  shopMessageX=view_xview[0]+142
  shopMessageY=view_yview[0]+76
  draw_set_color(colorDarkPink)
  draw_rectangle(shopMessageX,shopMessageY,shopMessageX+216,shopMessageY+50,false)
  draw_set_color(colorLightPink)
  draw_rectangle(shopMessageX,shopMessageY,shopMessageX+216,shopMessageY+50,true)
  draw_line(shopMessageX,shopMessageY+10,shopMessageX+216,shopMessageY+10)
  draw_set_halign(fa_center)
  draw_text(shopMessageX+92,shopMessageY-2,"Firebrand")
  draw_set_color(colorDarkPurple)
  draw_set_halign(fa_left)
  draw_text(shopMessageX+3,shopMessageY+9,shopMessage)
  //---------- INTERNETZ ----------
  showInternetzX=view_xview[0]+194
  showInternetzY=view_yview[0]+134
  draw_set_color(colorDarkPink)
  draw_rectangle(showInternetzX,showInternetzY,showInternetzX+110,showInternetzY+10,false)
  draw_set_color(colorLightPink)
  draw_rectangle(showInternetzX,showInternetzY,showInternetzX+110,showInternetzY+10,true)
  draw_set_color(colorDarkPurple)
  draw_set_halign(fa_left)
  draw_text(showInternetzX+3,showInternetzY-2,"Internetz")
  draw_set_halign(fa_right)
  draw_text(showInternetzX+108,showInternetzY-2,oPlayer1.moneyTotal)
  //---------- SHOP MENU ----------
  shopMenuX=view_xview[0]+174
  shopMenuY=view_yview[0]+148
  draw_set_color(colorDarkPink)
  draw_rectangle(shopMenuX,shopMenuY,shopMenuX+152,shopMenuY+46,false)
  draw_set_color(colorLightPink)
  draw_rectangle(shopMenuX,shopMenuY,shopMenuX+152,shopMenuY+46,true)
  draw_line(shopMenuX,shopMenuY+10,shopMenuX+152,shopMenuY+10)
  draw_set_halign(fa_center)
  draw_text(shopMenuX+76,shopMenuY-2,"SHOP MENU")
  draw_set_color(colorDarkPurple)
  draw_rectangle(shopMenuX+4,shopMenuY+14,shopMenuX+12,shopMenuY+22,true)
  draw_rectangle(shopMenuX+4,shopMenuY+26,shopMenuX+12,shopMenuY+34,true)
  draw_set_halign(fa_left)
  draw_text(shopMenuX+15,shopMenuY+11,"Yes, I want to reset my skills.")
  draw_text(shopMenuX+15,shopMenuY+23,"No thanks.")
  //---------- CONTROLS ----------
  controlMenuX=view_xview[0]+204
  controlMenuY=view_yview[0]+268
  draw_set_color(colorDarkPink)
  draw_rectangle(controlMenuX,controlMenuY,controlMenuX+92,controlMenuY+36,false)
  draw_set_color(colorLightPink)
  draw_rectangle(controlMenuX,controlMenuY,controlMenuX+92,controlMenuY+36,true)
  draw_line(controlMenuX,controlMenuY+10,controlMenuX+92,controlMenuY+10)
  draw_set_halign(fa_center)
  draw_text(controlMenuX+46,controlMenuY-2,"CONTROLS")
  draw_set_color(colorDarkPurple)
  draw_set_halign(fa_left)
  //draw_text(controlMenuX+3,controlMenuY+9,"[J] Confirm#[K]Cancel")
  scrDrawHint(controlMenuX+3,controlMenuY+9,"[J] Confirm#[K]Cancel",fa_left,1) //pad hints change: the gamepad's buttons while it's in use
  //menu cursor
  draw_set_color(colorLightPink)
  draw_rectangle(menuCursorX,menuCursorY,menuCursorX+12,menuCursorY+12,true)
}
