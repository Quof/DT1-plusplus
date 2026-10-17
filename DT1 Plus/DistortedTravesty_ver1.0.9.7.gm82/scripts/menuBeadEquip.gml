/*
This script is called in the HUD pause menu.
It is used to control the bead equip menu in the inventory submenu.
(This could just go in the execute code, but it takes too long to load all that.)
argument0: 0-draw, 1-control
*/
if argument0=0 //draw menu
{
  //---------- FRIENDSHIP BRACELET ----------
  subMenuBeadX=menuMainX+42
  subMenuBeadY=menuMainY+12
  draw_set_font(fnt_SubMenu)
  draw_set_alpha(0.9)
  draw_set_color(colorDarkPink)
  draw_rectangle(subMenuBeadX,subMenuBeadY,subMenuBeadX+117,subMenuBeadY+137,false)
  draw_set_alpha(1)
  draw_set_color(colorLightPink)
  draw_rectangle(subMenuBeadX,subMenuBeadY,subMenuBeadX+117,subMenuBeadY+137,true)
  draw_line(subMenuBeadX,subMenuBeadY+10,subMenuBeadX+117,subMenuBeadY+10)
  draw_set_halign(fa_center)
  draw_text(subMenuBeadX+59,subMenuBeadY-2,"FRIENDSHIP BRACELET")
  //Bead Equip Slot
  draw_rectangle(subMenuBeadX+8,subMenuBeadY+18,subMenuBeadX+25,subMenuBeadY+35,true)
  draw_rectangle(subMenuBeadX+36,subMenuBeadY+18,subMenuBeadX+53,subMenuBeadY+35,true)
  draw_rectangle(subMenuBeadX+64,subMenuBeadY+18,subMenuBeadX+81,subMenuBeadY+35,true)
  draw_rectangle(subMenuBeadX+92,subMenuBeadY+18,subMenuBeadX+109,subMenuBeadY+35,true)
  draw_line(subMenuBeadX,subMenuBeadY+44,subMenuBeadX+117,subMenuBeadY+44)
  draw_rectangle(subMenuBeadX+4,subMenuBeadY+48,subMenuBeadX+21,subMenuBeadY+65,true) //Sword
  draw_rectangle(subMenuBeadX+27,subMenuBeadY+48,subMenuBeadX+44,subMenuBeadY+65,true) //Shield
  draw_rectangle(subMenuBeadX+50,subMenuBeadY+48,subMenuBeadX+67,subMenuBeadY+65,true) //Mage
  draw_rectangle(subMenuBeadX+73,subMenuBeadY+48,subMenuBeadX+90,subMenuBeadY+65,true) //Mental
  draw_rectangle(subMenuBeadX+96,subMenuBeadY+48,subMenuBeadX+113,subMenuBeadY+65,true) //Triforce

  draw_rectangle(subMenuBeadX+4,subMenuBeadY+71,subMenuBeadX+21,subMenuBeadY+88,true) //Fire
  draw_rectangle(subMenuBeadX+27,subMenuBeadY+71,subMenuBeadX+44,subMenuBeadY+88,true) //Water
  draw_rectangle(subMenuBeadX+50,subMenuBeadY+71,subMenuBeadX+67,subMenuBeadY+88,true) //Wind
  draw_rectangle(subMenuBeadX+73,subMenuBeadY+71,subMenuBeadX+90,subMenuBeadY+88,true) //Earth
  draw_rectangle(subMenuBeadX+96,subMenuBeadY+71,subMenuBeadX+113,subMenuBeadY+88,true) //Elemental

  draw_rectangle(subMenuBeadX+4,subMenuBeadY+94,subMenuBeadX+21,subMenuBeadY+111,true) //Vamp
  draw_rectangle(subMenuBeadX+27,subMenuBeadY+94,subMenuBeadX+44,subMenuBeadY+111,true) //Spirit
  draw_rectangle(subMenuBeadX+50,subMenuBeadY+94,subMenuBeadX+67,subMenuBeadY+111,true) //Ribbon
  draw_rectangle(subMenuBeadX+73,subMenuBeadY+94,subMenuBeadX+90,subMenuBeadY+111,true) //Revenge
  draw_rectangle(subMenuBeadX+96,subMenuBeadY+94,subMenuBeadX+113,subMenuBeadY+111,true) //Rave

  draw_rectangle(subMenuBeadX+4,subMenuBeadY+117,subMenuBeadX+21,subMenuBeadY+134,true) //Trap
  draw_rectangle(subMenuBeadX+27,subMenuBeadY+117,subMenuBeadX+44,subMenuBeadY+134,true) //Stun
  draw_rectangle(subMenuBeadX+50,subMenuBeadY+117,subMenuBeadX+67,subMenuBeadY+134,true) //Poison
  draw_rectangle(subMenuBeadX+73,subMenuBeadY+117,subMenuBeadX+90,subMenuBeadY+134,true) //NotInUse
  draw_rectangle(subMenuBeadX+96,subMenuBeadY+117,subMenuBeadX+113,subMenuBeadY+134,true) //NotInUse

  //---------- SHOW LOCKED SLOTS ----------
  draw_set_color(colorDarkPurple)
  if global.p1BraceletSlots<4
  {
    draw_line_width(subMenuBeadX+94,subMenuBeadY+20,subMenuBeadX+107,subMenuBeadY+33,2)
    draw_line_width(subMenuBeadX+107,subMenuBeadY+20,subMenuBeadX+94,subMenuBeadY+33,2)
  }
  if global.p1BraceletSlots<3
  {
    draw_line_width(subMenuBeadX+66,subMenuBeadY+20,subMenuBeadX+79,subMenuBeadY+33,2)
    draw_line_width(subMenuBeadX+79,subMenuBeadY+20,subMenuBeadX+66,subMenuBeadY+33,2)
  }
  if global.p1BraceletSlots<2
  {
    draw_line_width(subMenuBeadX+38,subMenuBeadY+20,subMenuBeadX+51,subMenuBeadY+33,2)
    draw_line_width(subMenuBeadX+51,subMenuBeadY+20,subMenuBeadX+38,subMenuBeadY+33,2)
  }
  //2 empty spots
  draw_line_width(subMenuBeadX+75,subMenuBeadY+119,subMenuBeadX+88,subMenuBeadY+132,2)
  draw_line_width(subMenuBeadX+88,subMenuBeadY+119,subMenuBeadX+75,subMenuBeadY+132,2)

  draw_line_width(subMenuBeadX+98,subMenuBeadY+119,subMenuBeadX+111,subMenuBeadY+132,2)
  draw_line_width(subMenuBeadX+111,subMenuBeadY+119,subMenuBeadX+98,subMenuBeadY+132,2)

  //---------- SHOW EQUIP PICTURE ----------
  for(i=0;i<18;i+=1) //Slot 1
  {
    if global.invBracelet[i]=2
    {
      draw_sprite(sFriendBeads,i,subMenuBeadX+9,subMenuBeadY+19)
      break;
    }
  }
  for(i=0;i<18;i+=1) //Slot 2
  {
    if global.invBracelet[i]=3
    {
      draw_sprite(sFriendBeads,i,subMenuBeadX+37,subMenuBeadY+19)
      break;
    }
  }
  for(i=0;i<18;i+=1) //Slot 3
  {
    if global.invBracelet[i]=4
    {
      draw_sprite(sFriendBeads,i,subMenuBeadX+65,subMenuBeadY+19)
      break;
    }
  }
  for(i=0;i<18;i+=1) //Slot 4
  {
    if global.invBracelet[i]=5
    {
      draw_sprite(sFriendBeads,i,subMenuBeadX+93,subMenuBeadY+19)
      break;
    }
  }

  //---------- SHOW BEAD PICTURE ----------
  if global.invBracelet[0]>=1
    draw_sprite(sFriendBeads,0,subMenuBeadX+5,subMenuBeadY+49)
  if global.invBracelet[1]>=1
    draw_sprite(sFriendBeads,1,subMenuBeadX+28,subMenuBeadY+49)
  if global.invBracelet[2]>=1
    draw_sprite(sFriendBeads,2,subMenuBeadX+51,subMenuBeadY+49)
  if global.invBracelet[3]>=1
    draw_sprite(sFriendBeads,3,subMenuBeadX+74,subMenuBeadY+49)
  if global.invBracelet[4]>=1
    draw_sprite(sFriendBeads,4,subMenuBeadX+97,subMenuBeadY+49)

  if global.invBracelet[5]>=1
    draw_sprite(sFriendBeads,5,subMenuBeadX+5,subMenuBeadY+72)
  if global.invBracelet[6]>=1
    draw_sprite(sFriendBeads,6,subMenuBeadX+28,subMenuBeadY+72)
  if global.invBracelet[7]>=1
    draw_sprite(sFriendBeads,7,subMenuBeadX+51,subMenuBeadY+72)
  if global.invBracelet[8]>=1
    draw_sprite(sFriendBeads,8,subMenuBeadX+74,subMenuBeadY+72)
  if global.invBracelet[9]>=1
    draw_sprite(sFriendBeads,9,subMenuBeadX+97,subMenuBeadY+72)

  if global.invBracelet[10]>=1
    draw_sprite(sFriendBeads,10,subMenuBeadX+5,subMenuBeadY+95)
  if global.invBracelet[11]>=1
    draw_sprite(sFriendBeads,11,subMenuBeadX+28,subMenuBeadY+95)
  if global.invBracelet[12]>=1
    draw_sprite(sFriendBeads,12,subMenuBeadX+51,subMenuBeadY+95)
  if global.invBracelet[13]>=1
    draw_sprite(sFriendBeads,13,subMenuBeadX+74,subMenuBeadY+95)
  if global.invBracelet[14]>=1
    draw_sprite(sFriendBeads,14,subMenuBeadX+97,subMenuBeadY+95)

  if global.invBracelet[15]>=1
    draw_sprite(sFriendBeads,15,subMenuBeadX+5,subMenuBeadY+118)
  if global.invBracelet[16]>=1
    draw_sprite(sFriendBeads,16,subMenuBeadX+28,subMenuBeadY+118)
  if global.invBracelet[17]>=1
    draw_sprite(sFriendBeads,17,subMenuBeadX+51,subMenuBeadY+118)

  //menu cursor ----------
  draw_set_alpha(1)
  draw_rectangle(beadCursorPosX,beadCursorPosY,beadCursorPosX+21,beadCursorPosY+21,true)

  //---------- HELP INFO ----------
  subMenuInfoX=menuMainX+173
  subMenuInfoY=menuMainY+16
  draw_set_alpha(0.9)
  draw_set_color(colorDarkPink)
  draw_rectangle(subMenuInfoX,subMenuInfoY,subMenuInfoX+128,subMenuInfoY+51,false)
  draw_set_alpha(1)
  draw_set_color(colorLightPink)
  draw_rectangle(subMenuInfoX,subMenuInfoY,subMenuInfoX+128,subMenuInfoY+51,true)
  draw_line(subMenuInfoX,subMenuInfoY+10,subMenuInfoX+128,subMenuInfoY+10)
  draw_set_halign(fa_center)
  draw_text(subMenuInfoX+64,subMenuInfoY-2,"HELP INFO")
  draw_set_color(colorDarkPurple)
  draw_set_halign(fa_left)
  //draw_text(subMenuInfoX+3,subMenuInfoY+9,"[J]: Confirm/Equip#[K]: Cancel/Previous Menu#[L]: Unequip Selected Slot")
  scrDrawHint(subMenuInfoX+3,subMenuInfoY+9,"[J]: Confirm/Equip#[K]: Cancel/Previous Menu#[L]: Unequip Selected Slot",fa_left,1) //pad hints change: the gamepad's buttons while it's in use
}
else if argument0=1 //menu control
{
  if subCursorPos=1 //equip slots ==================================================
  {
    //if keyboard_check_pressed(curLeft) or keyboard_check_pressed(vk_left)
    if keyboard_check_pressed(curLeft) or (keyboard_check_pressed(vk_left) or scrPadPressed(1)) //gamepad change: and the gamepad's Left (scrGamepadInit)
    {
      playSound(global.snd_MenuCursor,0,1)
      if cursorPosX=1
      {
        cursorPosX=4
        beadCursorPosX+=cursorIncX*3
      }
      else
      {
        cursorPosX-=1
        beadCursorPosX-=cursorIncX
      }
    }
    //if keyboard_check_pressed(curRight) or keyboard_check_pressed(vk_right)
    if keyboard_check_pressed(curRight) or (keyboard_check_pressed(vk_right) or scrPadPressed(2)) //gamepad change: and the gamepad's Right (scrGamepadInit)
    {
      playSound(global.snd_MenuCursor,0,1)
      if cursorPosX=4
      {
        cursorPosX=1
        beadCursorPosX-=cursorIncX*3
      }
      else
      {
        cursorPosX+=1
        beadCursorPosX+=cursorIncX
      }
    }
    //if keyboard_check_pressed(curConfirm)
    if (keyboard_check_pressed(curConfirm) or scrPadPressed(17)) //gamepad change: and the gamepad's Menu Confirm (scrGamepadInit)
    {
      remCurPos=cursorPosX
      if remCurPos>global.p1BraceletSlots
        playSound(global.snd_MenuCancel,0,1)
      else
      {
        playSound(global.snd_MenuConfirm,0,1)
        cursorPosX=1
        cursorPosY=1
        cursorIncX=23
        beadCursorPosX=subMenuBeadX+2
        beadCursorPosY=subMenuBeadY+46
        subCursorPos=2
      }
    }
    //if keyboard_check_pressed(curChange)
    if (keyboard_check_pressed(curChange) or scrPadPressed(21)) //gamepad change: and the gamepad's Y (swap lists) (scrGamepadInit)
    {
      playSound(global.snd_MenuConfirm,0,1)
      remCurPos=cursorPosX
      menuBeadUnequip(remCurPos+1)
    }
    //if keyboard_check_pressed(curCancel)
    if (keyboard_check_pressed(curCancel) or scrPadPressed(18)) //gamepad change: and the gamepad's Menu Cancel (scrGamepadInit)
    {
      playSound(global.snd_MenuCancel,0,1)
      cursorPosY=8
      subCursorPos=1
      currentMenu=2
    }
  }
  else if subCursorPos=2 //bead slots ==================================================
  {
    //if keyboard_check_pressed(curUp) or keyboard_check_pressed(vk_up)
    if keyboard_check_pressed(curUp) or (keyboard_check_pressed(vk_up) or scrPadPressed(3)) //gamepad change: and the gamepad's Up (scrGamepadInit)
    {
      playSound(global.snd_MenuCursor,0,1)
      if cursorPosY=1
      {
        cursorPosY=4
        beadCursorPosY+=cursorIncX*3
      }
      else
      {
        cursorPosY-=1
        beadCursorPosY-=cursorIncX
      }
    }
    //if keyboard_check_pressed(curDown) or keyboard_check_pressed(vk_down)
    if keyboard_check_pressed(curDown) or (keyboard_check_pressed(vk_down) or scrPadPressed(4)) //gamepad change: and the gamepad's Down (scrGamepadInit)
    {
      playSound(global.snd_MenuCursor,0,1)
      if cursorPosY=4
      {
        cursorPosY=1
        beadCursorPosY-=cursorIncX*3
      }
      else
      {
        cursorPosY+=1
        beadCursorPosY+=cursorIncX
      }
    }
    //if keyboard_check_pressed(curLeft) or keyboard_check_pressed(vk_left)
    if keyboard_check_pressed(curLeft) or (keyboard_check_pressed(vk_left) or scrPadPressed(1)) //gamepad change: and the gamepad's Left (scrGamepadInit)
    {
      playSound(global.snd_MenuCursor,0,1)
      if cursorPosX=1
      {
        cursorPosX=5
        beadCursorPosX+=cursorIncX*4
      }
      else
      {
        cursorPosX-=1
        beadCursorPosX-=cursorIncX
      }
    }
    //if keyboard_check_pressed(curRight) or keyboard_check_pressed(vk_right)
    if keyboard_check_pressed(curRight) or (keyboard_check_pressed(vk_right) or scrPadPressed(2)) //gamepad change: and the gamepad's Right (scrGamepadInit)
    {
      playSound(global.snd_MenuCursor,0,1)
      if cursorPosX=5
      {
        cursorPosX=1
        beadCursorPosX-=cursorIncX*4
      }
      else
      {
        cursorPosX+=1
        beadCursorPosX+=cursorIncX
      }
    }
    //if keyboard_check_pressed(curConfirm)
    if (keyboard_check_pressed(curConfirm) or scrPadPressed(17)) //gamepad change: and the gamepad's Menu Confirm (scrGamepadInit)
    {
      playSound(global.snd_MenuConfirm,0,1)
      if cursorPosY=1
      {
        if cursorPosX=1 and global.invBracelet[0]=1
        {
          menuBeadUnequip(remCurPos+1)
          global.invBracelet[0]=remCurPos+1
        }
        else if cursorPosX=2 and global.invBracelet[1]=1
        {
          menuBeadUnequip(remCurPos+1)
          global.invBracelet[1]=remCurPos+1
        }
        else if cursorPosX=3 and global.invBracelet[2]=1
        {
          menuBeadUnequip(remCurPos+1)
          global.invBracelet[2]=remCurPos+1
        }
        else if cursorPosX=4 and global.invBracelet[3]=1
        {
          menuBeadUnequip(remCurPos+1)
          global.invBracelet[3]=remCurPos+1
        }
        else if cursorPosX=5 and global.invBracelet[4]=1
        {
          menuBeadUnequip(remCurPos+1)
          global.invBracelet[4]=remCurPos+1
        }
      }
      else if cursorPosY=2
      {
        if cursorPosX=1 and global.invBracelet[5]=1
        {
          menuBeadUnequip(remCurPos+1)
          global.invBracelet[5]=remCurPos+1
        }
        else if cursorPosX=2 and global.invBracelet[6]=1
        {
          menuBeadUnequip(remCurPos+1)
          global.invBracelet[6]=remCurPos+1
        }
        else if cursorPosX=3 and global.invBracelet[7]=1
        {
          menuBeadUnequip(remCurPos+1)
          global.invBracelet[7]=remCurPos+1
        }
        else if cursorPosX=4 and global.invBracelet[8]=1
        {
          menuBeadUnequip(remCurPos+1)
          global.invBracelet[8]=remCurPos+1
        }
        else if cursorPosX=5 and global.invBracelet[9]=1
        {
          menuBeadUnequip(remCurPos+1)
          global.invBracelet[9]=remCurPos+1
        }
      }
      else if cursorPosY=3
      {
        if cursorPosX=1 and global.invBracelet[10]=1
        {
          menuBeadUnequip(remCurPos+1)
          global.invBracelet[10]=remCurPos+1
        }
        else if cursorPosX=2 and global.invBracelet[11]=1
        {
          menuBeadUnequip(remCurPos+1)
          global.invBracelet[11]=remCurPos+1
        }
        else if cursorPosX=3 and global.invBracelet[12]=1
        {
          menuBeadUnequip(remCurPos+1)
          global.invBracelet[12]=remCurPos+1
        }
        else if cursorPosX=4 and global.invBracelet[13]=1
        {
          menuBeadUnequip(remCurPos+1)
          global.invBracelet[13]=remCurPos+1
        }
        else if cursorPosX=5 and global.invBracelet[14]=1
        {
          menuBeadUnequip(remCurPos+1)
          global.invBracelet[14]=remCurPos+1
        }
      }
      else if cursorPosY=4
      {
        if cursorPosX=1 and global.invBracelet[15]=1
        {
          menuBeadUnequip(remCurPos+1)
          global.invBracelet[15]=remCurPos+1
        }
        else if cursorPosX=2 and global.invBracelet[16]=1
        {
          menuBeadUnequip(remCurPos+1)
          global.invBracelet[16]=remCurPos+1
        }
        else if cursorPosX=3 and global.invBracelet[17]=1
        {
          menuBeadUnequip(remCurPos+1)
          global.invBracelet[17]=remCurPos+1
        }
      }
    }
    //if keyboard_check_pressed(curCancel)
    if (keyboard_check_pressed(curCancel) or scrPadPressed(18)) //gamepad change: and the gamepad's Menu Cancel (scrGamepadInit)
    {
      playSound(global.snd_MenuCancel,0,1)
      cursorPosX=remCurPos
      subCursorPos=1
      cursorIncX=28
      beadCursorPosX=subMenuBeadX+6+((remCurPos-1)*cursorIncX)
      beadCursorPosY=subMenuBeadY+16
    }
  }
}
