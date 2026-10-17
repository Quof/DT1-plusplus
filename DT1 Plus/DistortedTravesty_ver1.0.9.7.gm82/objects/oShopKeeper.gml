#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y+=32
image_speed=0
shopProgress=0
menuCursorX=0
menuCursorY=0
menuCursorPos=1
cursorIncY=12
menuMax=8
var braceStockCheck;
braceStockCheck=1
if global.gameProgress>=82
  braceStockCheck+=1
if global.gameProgress>=196
  braceStockCheck+=1
if global.gameProgress>=279
  braceStockCheck+=1
stockBracelet=braceStockCheck-global.p1BraceletSlots
//input commands==========
curUp=ord("W")
curDown=ord("S")
curConfirm=ord("J")
curCancel=ord("K")
//item info==========
itemInfoShow[0]="Restores 30% Health."
itemInfoShow[1]="Restores 100% Health."
itemInfoShow[2]="Restores 100% Spirit Energy."
itemInfoShow[3]="Removes all negative status ailments."
itemInfoShow[4]="Upgrades the gemstone in your hand,#increasing your Physical and Spirit Power.#Automatic application when bought."
itemInfoShow[5]="Upgrades your jacket,#increasing your Physical Defense.#Automatic application when bought."
itemInfoShow[6]="Upgrades your friendship ring,#increasing your Spirit Defense.#Automatic application when bought."
itemInfoShow[7]="Upgrades your friendship bracelet,#increasing the amount of bead slots it has.#Automatic application when bought."
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
    if menuCursorPos=1
    {
      if oPlayer1.conSkittles<9
      {
        if oPlayer1.moneyTotal>=80
        {
          playSound(global.snd_MenuConfirm,0,1)
          global.recItemsBought+=1
          oPlayer1.conSkittles+=1
          oPlayer1.moneyTotal-=80
          global.recTotalInternetzSpent+=80
          global.p1MoneyTotal=oPlayer1.moneyTotal
        }
        else
        {
          playSound(global.snd_MenuCancel,0,1)
          with oMessageMenuPopup
            instance_destroy()
          stringToShow="You don't have enough Internetz to purchase this."
          messageWidth=string_width(stringToShow)
          newMessage=instance_create(256-(messageWidth/2),192,oMessageMenuPopup)
          newMessage.message=stringToShow
          newMessage.fadingTime=40
        }
      }
      else
      {
        playSound(global.snd_MenuCancel,0,1)
        with oMessageMenuPopup
          instance_destroy()
        stringToShow="You cannot hold anymore of these."
        messageWidth=string_width(stringToShow)
        newMessage=instance_create(256-(messageWidth/2),192,oMessageMenuPopup)
        newMessage.message=stringToShow
        newMessage.fadingTime=40
      }
    }
    if menuCursorPos=2
    {
      if oPlayer1.conSmoothie<3
      {
        if oPlayer1.moneyTotal>=300
        {
          playSound(global.snd_MenuConfirm,0,1)
          global.recItemsBought+=1
          oPlayer1.conSmoothie+=1
          oPlayer1.moneyTotal-=300
          global.recTotalInternetzSpent+=300
          global.p1MoneyTotal=oPlayer1.moneyTotal
        }
        else
        {
          playSound(global.snd_MenuCancel,0,1)
          with oMessageMenuPopup
            instance_destroy()
          stringToShow="You don't have enough Internetz to purchase this."
          messageWidth=string_width(stringToShow)
          newMessage=instance_create(256-(messageWidth/2),192,oMessageMenuPopup)
          newMessage.message=stringToShow
          newMessage.fadingTime=40
        }
      }
      else
      {
        playSound(global.snd_MenuCancel,0,1)
        with oMessageMenuPopup
          instance_destroy()
        stringToShow="You cannot hold anymore of these."
        messageWidth=string_width(stringToShow)
        newMessage=instance_create(256-(messageWidth/2),192,oMessageMenuPopup)
        newMessage.message=stringToShow
        newMessage.fadingTime=40
      }
    }
    if menuCursorPos=3
    {
      if oPlayer1.conStarburst<5
      {
        if oPlayer1.moneyTotal>=160
        {
          playSound(global.snd_MenuConfirm,0,1)
          global.recItemsBought+=1
          oPlayer1.conStarburst+=1
          oPlayer1.moneyTotal-=160
          global.recTotalInternetzSpent+=160
          global.p1MoneyTotal=oPlayer1.moneyTotal
        }
        else
        {
          playSound(global.snd_MenuCancel,0,1)
          with oMessageMenuPopup
            instance_destroy()
          stringToShow="You don't have enough Internetz to purchase this."
          messageWidth=string_width(stringToShow)
          newMessage=instance_create(256-(messageWidth/2),192,oMessageMenuPopup)
          newMessage.message=stringToShow
          newMessage.fadingTime=40
        }
      }
      else
      {
        playSound(global.snd_MenuCancel,0,1)
        with oMessageMenuPopup
          instance_destroy()
        stringToShow="You cannot hold anymore of these."
        messageWidth=string_width(stringToShow)
        newMessage=instance_create(256-(messageWidth/2),192,oMessageMenuPopup)
        newMessage.message=stringToShow
        newMessage.fadingTime=40
      }
    }
    if menuCursorPos=4
    {
      if oPlayer1.conGummyBears<7
      {
        if oPlayer1.moneyTotal>=130
        {
          playSound(global.snd_MenuConfirm,0,1)
          global.recItemsBought+=1
          oPlayer1.conGummyBears+=1
          oPlayer1.moneyTotal-=130
          global.recTotalInternetzSpent+=130
          global.p1MoneyTotal=oPlayer1.moneyTotal
        }
        else
        {
          playSound(global.snd_MenuCancel,0,1)
          with oMessageMenuPopup
            instance_destroy()
          stringToShow="You don't have enough Internetz to purchase this."
          messageWidth=string_width(stringToShow)
          newMessage=instance_create(256-(messageWidth/2),192,oMessageMenuPopup)
          newMessage.message=stringToShow
          newMessage.fadingTime=40
        }
      }
      else
      {
        playSound(global.snd_MenuCancel,0,1)
        with oMessageMenuPopup
          instance_destroy()
        stringToShow="You cannot hold anymore of these."
        messageWidth=string_width(stringToShow)
        newMessage=instance_create(256-(messageWidth/2),192,oMessageMenuPopup)
        newMessage.message=stringToShow
        newMessage.fadingTime=40
      }
    }
    if menuCursorPos=5
    {
      if global.stockWeaponGem>0
      {
        if oPlayer1.moneyTotal>=global.priceWeaponGem
        {
          playSound(global.snd_MenuConfirm,0,1)
          global.recItemsBought+=1
          global.stockWeaponGem-=1
          oPlayer1.moneyTotal-=global.priceWeaponGem
          global.recTotalInternetzSpent+=global.priceWeaponGem
          global.p1MoneyTotal=oPlayer1.moneyTotal
          global.priceWeaponGem+=70
          global.p1PhysicalPower=oPlayer1.physicalPower-oPlayer1.gemBonusP
          global.p1SpiritPower=oPlayer1.spiritPower-oPlayer1.gemBonusS
          //check inventory
          itemCheck=1
          for (i=0;i<=15;i+=1)
          {
            if global.p1WeaponGem=global.invWeaponGems[i]
              break;
            itemCheck+=1
          }
          global.p1WeaponGem=global.invWeaponGems[itemCheck]

          //equip new item
          oPlayer1.gemBonusP=100
          oPlayer1.gemBonusS=100
          for (i=0;i<=15;i+=1)
          {
            if global.p1WeaponGem=global.invWeaponGems[i]
              break;
            oPlayer1.gemBonusP+=10
            oPlayer1.gemBonusS+=6
          }
          oPlayer1.physicalPower=global.p1PhysicalPower+oPlayer1.gemBonusP
          oPlayer1.spiritPower=global.p1SpiritPower+oPlayer1.gemBonusS
        }
        else
        {
          playSound(global.snd_MenuCancel,0,1)
          with oMessageMenuPopup
            instance_destroy()
          stringToShow="You don't have enough Internetz to purchase this."
          messageWidth=string_width(stringToShow)
          newMessage=instance_create(256-(messageWidth/2),192,oMessageMenuPopup)
          newMessage.message=stringToShow
          newMessage.fadingTime=40
        }
      }
      else
      {
        playSound(global.snd_MenuCancel,0,1)
        with oMessageMenuPopup
          instance_destroy()
        stringToShow="There are none of these in stock."
        messageWidth=string_width(stringToShow)
        newMessage=instance_create(256-(messageWidth/2),192,oMessageMenuPopup)
        newMessage.message=stringToShow
        newMessage.fadingTime=40
      }
    }
    if menuCursorPos=6
    {
      if global.stockArmor>0
      {
        if oPlayer1.moneyTotal>=global.priceArmor
        {
          playSound(global.snd_MenuConfirm,0,1)
          global.recItemsBought+=1
          global.stockArmor-=1
          oPlayer1.moneyTotal-=global.priceArmor
          global.recTotalInternetzSpent+=global.priceArmor
          global.p1MoneyTotal=oPlayer1.moneyTotal
          global.priceArmor+=60
          global.p1PhysicalDefense=oPlayer1.physicalDefense-oPlayer1.armorBonus

          //check inventory
          itemCheck=1
          for (i=0;i<=9;i+=1)
          {
            if global.p1Armor=global.invArmor[i]
              break;
            itemCheck+=1
          }
          global.p1Armor=global.invArmor[itemCheck]

          //equip new item
          oPlayer1.armorBonus=10
          for (i=0;i<=9;i+=1)
          {
            if global.p1Armor=global.invArmor[i]
              break;
            oPlayer1.armorBonus+=10
          }
          oPlayer1.physicalDefense=global.p1PhysicalDefense+oPlayer1.armorBonus
        }
        else
        {
          playSound(global.snd_MenuCancel,0,1)
          with oMessageMenuPopup
            instance_destroy()
          stringToShow="You don't have enough Internetz to purchase this."
          messageWidth=string_width(stringToShow)
          newMessage=instance_create(256-(messageWidth/2),192,oMessageMenuPopup)
          newMessage.message=stringToShow
          newMessage.fadingTime=40
        }
      }
      else
      {
        playSound(global.snd_MenuCancel,0,1)
        with oMessageMenuPopup
          instance_destroy()
        stringToShow="There are none of these in stock."
        messageWidth=string_width(stringToShow)
        newMessage=instance_create(256-(messageWidth/2),192,oMessageMenuPopup)
        newMessage.message=stringToShow
        newMessage.fadingTime=40
      }
    }
    if menuCursorPos=7
    {
      if global.stockRing>0
      {
        if oPlayer1.moneyTotal>=global.priceRing
        {
          playSound(global.snd_MenuConfirm,0,1)
          global.recItemsBought+=1
          global.stockRing-=1
          oPlayer1.moneyTotal-=global.priceRing
          global.recTotalInternetzSpent+=global.priceRing
          global.p1MoneyTotal=oPlayer1.moneyTotal
          global.priceRing+=30
          global.p1SpiritDefense=oPlayer1.spiritDefense-oPlayer1.ringBonus

          //check inventory
          itemCheck=1
          for (i=0;i<=13;i+=1)
          {
            if global.p1Ring=global.invRing[i]
              break;
            itemCheck+=1
          }
          global.p1Ring=global.invRing[itemCheck]

          //equip new item
          oPlayer1.ringBonus=7
          for (i=0;i<=13;i+=1)
          {
            if global.p1Ring=global.invRing[i]
              break;
            oPlayer1.ringBonus+=7
          }
          oPlayer1.spiritDefense=global.p1SpiritDefense+oPlayer1.ringBonus
        }
        else
        {
          playSound(global.snd_MenuCancel,0,1)
          with oMessageMenuPopup
            instance_destroy()
          stringToShow="You don't have enough Internetz to purchase this."
          messageWidth=string_width(stringToShow)
          newMessage=instance_create(256-(messageWidth/2),192,oMessageMenuPopup)
          newMessage.message=stringToShow
          newMessage.fadingTime=40
        }
      }
      else
      {
        playSound(global.snd_MenuCancel,0,1)
        with oMessageMenuPopup
          instance_destroy()
        stringToShow="There are none of these in stock."
        messageWidth=string_width(stringToShow)
        newMessage=instance_create(256-(messageWidth/2),192,oMessageMenuPopup)
        newMessage.message=stringToShow
        newMessage.fadingTime=40
      }
    }
    if menuCursorPos=8
    {
      if stockBracelet>0
      {
        if oPlayer1.moneyTotal>=global.priceBracelet
        {
          playSound(global.snd_MenuConfirm,0,1)
          global.recItemsBought+=1
          stockBracelet-=1
          oPlayer1.moneyTotal-=global.priceBracelet
          global.recTotalInternetzSpent+=global.priceBracelet
          global.p1MoneyTotal=oPlayer1.moneyTotal
          if global.priceBracelet<=100
            global.priceBracelet=600
          else if global.priceBracelet=600
            global.priceBracelet=1400
          global.p1BraceletSlots+=1
        }
        else
        {
          playSound(global.snd_MenuCancel,0,1)
          with oMessageMenuPopup
            instance_destroy()
          stringToShow="You don't have enough Internetz to purchase this."
          messageWidth=string_width(stringToShow)
          newMessage=instance_create(256-(messageWidth/2),192,oMessageMenuPopup)
          newMessage.message=stringToShow
          newMessage.fadingTime=40
        }
      }
      else
      {
        playSound(global.snd_MenuCancel,0,1)
        with oMessageMenuPopup
          instance_destroy()
        stringToShow="There are none of these in stock."
        messageWidth=string_width(stringToShow)
        newMessage=instance_create(256-(messageWidth/2),192,oMessageMenuPopup)
        newMessage.message=stringToShow
        newMessage.fadingTime=40
      }
    }
  }
  //if keyboard_check_pressed(curCancel)=true
  if (keyboard_check_pressed(curCancel) or scrPadPressed(18))=true //gamepad change: and the gamepad's Menu Cancel (scrGamepadInit)
  {
    io_clear()
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
  draw_text(shopMessageX+92,shopMessageY-2,talker)
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
  draw_rectangle(shopMenuX,shopMenuY,shopMenuX+152,shopMenuY+111,false)
  draw_set_color(colorLightPink)
  draw_rectangle(shopMenuX,shopMenuY,shopMenuX+152,shopMenuY+111,true)
  draw_line(shopMenuX,shopMenuY+10,shopMenuX+152,shopMenuY+10)
  draw_set_halign(fa_center)
  draw_text(shopMenuX+76,shopMenuY-2,"SHOP MENU")
  draw_set_color(colorDarkPurple)
  draw_rectangle(shopMenuX+4,shopMenuY+14,shopMenuX+12,shopMenuY+22,true)
  draw_rectangle(shopMenuX+4,shopMenuY+26,shopMenuX+12,shopMenuY+34,true)
  draw_rectangle(shopMenuX+4,shopMenuY+38,shopMenuX+12,shopMenuY+46,true)
  draw_rectangle(shopMenuX+4,shopMenuY+50,shopMenuX+12,shopMenuY+58,true)
  draw_rectangle(shopMenuX+4,shopMenuY+62,shopMenuX+12,shopMenuY+70,true)
  draw_rectangle(shopMenuX+4,shopMenuY+74,shopMenuX+12,shopMenuY+82,true)
  draw_rectangle(shopMenuX+4,shopMenuY+86,shopMenuX+12,shopMenuY+94,true)
  draw_rectangle(shopMenuX+4,shopMenuY+98,shopMenuX+12,shopMenuY+106,true)
  draw_set_halign(fa_left)
  draw_text(shopMenuX+15,shopMenuY+11,"Skittles")
  draw_text(shopMenuX+15,shopMenuY+23,"Turbo Smoothie")
  draw_text(shopMenuX+15,shopMenuY+35,"Starburst")
  draw_text(shopMenuX+15,shopMenuY+47,"Gummy Bears")
  draw_text(shopMenuX+15,shopMenuY+59,"Weapon Gem")
  draw_text(shopMenuX+15,shopMenuY+71,"Armor Temperment")
  draw_text(shopMenuX+15,shopMenuY+83,"Ring Craft")
  draw_text(shopMenuX+15,shopMenuY+95,"Bracelet Extension")
  draw_set_color(colorLightPink)
  draw_set_halign(fa_right)
  draw_text(shopMenuX+150,shopMenuY+11,"80")
  draw_text(shopMenuX+150,shopMenuY+23,"300")
  draw_text(shopMenuX+150,shopMenuY+35,"160")
  draw_text(shopMenuX+150,shopMenuY+47,"130")
  if global.stockWeaponGem>0
    draw_text(shopMenuX+150,shopMenuY+59,global.priceWeaponGem)
  else
    draw_text(shopMenuX+150,shopMenuY+59,"n/a")
  if global.stockArmor>0
    draw_text(shopMenuX+150,shopMenuY+71,global.priceArmor)
  else
    draw_text(shopMenuX+150,shopMenuY+71,"n/a")
  if global.stockRing>0
    draw_text(shopMenuX+150,shopMenuY+83,global.priceRing)
  else
    draw_text(shopMenuX+150,shopMenuY+83,"n/a")
  if stockBracelet>0
    draw_text(shopMenuX+150,shopMenuY+95,global.priceBracelet)
  else
    draw_text(shopMenuX+150,shopMenuY+95,"n/a")
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
  draw_text(controlMenuX+3,controlMenuY+9,"[J] Confirm#[K]Cancel")
  //---------- ITEM INFO ----------
  itemInfoX=view_xview[0]+152
  itemInfoY=view_yview[0]+308
  draw_set_color(colorDarkPink)
  draw_rectangle(itemInfoX,itemInfoY,itemInfoX+198,itemInfoY+52,false)
  draw_set_color(colorLightPink)
  draw_rectangle(itemInfoX,itemInfoY,itemInfoX+198,itemInfoY+52,true)
  draw_line(itemInfoX,itemInfoY+10,itemInfoX+198,itemInfoY+10)
  draw_set_halign(fa_center)
  draw_text(itemInfoX+92,itemInfoY-2,talker)
  draw_set_color(colorDarkPurple)
  draw_set_halign(fa_left)
  draw_text(itemInfoX+3,itemInfoY+9,itemInfoShow[menuCursorPos-1])
  //menu cursor
  draw_set_color(colorLightPink)
  menuCursorX=view_xview[0]+176
  draw_rectangle(menuCursorX,menuCursorY,menuCursorX+12,menuCursorY+12,true)
}
