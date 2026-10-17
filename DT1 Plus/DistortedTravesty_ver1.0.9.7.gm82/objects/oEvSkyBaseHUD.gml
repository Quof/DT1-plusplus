#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
color_HUD_Back=make_color_rgb(88,32,11)
color_HUD_Border1=make_color_rgb(184,104,8)
color_HUD_Border2=make_color_rgb(108,49,27)
color_HUD_Text=make_color_rgb(213,180,112)
drawTime=0
surfaceUsed=global.optGameDetail
if surfaceUsed=0
  lowAdjust=view_shooter_x-1
HUD_xW=176
HUD_yH=384
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//drawTime+=1
drawTime+=gDeltaTime //60fps change: counts 30fps ticks (the Draw shows the HUD from 9)
//if drawTime=1
if scrCountPass(drawTime,1) //60fps change: once, when the count reaches it
{
  //**************************************** set HUD surface ****************************************
  if surfaceUsed=1
  {
    playerHUD=surface_create(HUD_xW,HUD_yH)
    surface_set_target(playerHUD)
    //********** draw HUD back **********
    draw_set_alpha(1)
    draw_set_color(color_HUD_Back)
    draw_rectangle(0,0,HUD_xW-1,HUD_yH-1,false) //back
    draw_set_color(color_HUD_Border1)
    draw_rectangle(0,0,HUD_xW-1,HUD_yH-1,true) //border outer 1
    draw_rectangle(2,2,HUD_xW-3,HUD_yH-3,true) //border outer 2
    draw_set_color(color_HUD_Border2)
    draw_rectangle(1,1,HUD_xW-2,HUD_yH-2,true) //border inner
    draw_set_color(color_HUD_Border1)
    draw_rectangle(2,191,HUD_xW-4,191,true) //mid outer 1
    draw_rectangle(2,193,HUD_xW-4,193,true) //mid outer 2
    draw_set_color(color_HUD_Border2)
    draw_rectangle(1,192,HUD_xW-3,192,true) //mid inner
    //********** draw difficulty **********
    draw_sprite_ext(sDifficultySelect,global.difficulty-1,88,24,0.5,0.5,0,c_white,1)
    //********** draw text shadow **********
    draw_set_font(fnt_HUD_Shooter)
    draw_set_halign(fa_right)
    draw_set_color(c_black)
    //up
    draw_text(78,43,"Hi Score#Score##Lives#Bomb#Graze")
    //down
    draw_text(78,45,"Hi Score#Score##Lives#Bomb#Graze")
    //left
    draw_text(77,44,"Hi Score#Score##Lives#Bomb#Graze")
    //right
    draw_text(79,44,"Hi Score#Score##Lives#Bomb#Graze")
    //********** draw text normal **********
    draw_set_color(color_HUD_Text)
    draw_text(78,44,"Hi Score#Score##Lives#Bomb#Graze")
    //********** draw lives and bombs **********
    var maxLivesXplace;
    maxLivesXplace=84
    for(i=0;i<oPlayerShip.lifeMax;i+=1) //lives slots
    {
      draw_sprite(sHUDshipSlot,1,maxLivesXplace,114)
      maxLivesXplace+=11
    }
    maxLivesXplace=84
    for(i=0;i<oPlayerShip.bombMax;i+=1) //bomb slots
    {
      draw_sprite(sHUDshipSlot,1,maxLivesXplace,135)
      maxLivesXplace+=11
    }
    //********** draw controls **********
    draw_set_color(c_black)
    draw_set_halign(fa_left)
    //up
    draw_text(13,200,global.ctrlAttack)
    draw_text(17,226,global.ctrlJump)
    draw_text(13,256,global.ctrlTech)
    draw_text(37,200,"Fire")
    draw_text(37,228,"Focus")
    draw_text(37,256,"Bomb")
    //down
    draw_text(13,202,global.ctrlAttack)
    draw_text(17,228,global.ctrlJump)
    draw_text(13,258,global.ctrlTech)
    draw_text(37,202,"Fire")
    draw_text(37,230,"Focus")
    draw_text(37,258,"Bomb")
    //left
    draw_text(12,201,global.ctrlAttack)
    draw_text(16,227,global.ctrlJump)
    draw_text(12,257,global.ctrlTech)
    draw_text(36,201,"Fire")
    draw_text(36,229,"Focus")
    draw_text(36,257,"Bomb")
    //right
    draw_text(14,201,global.ctrlAttack)
    draw_text(18,227,global.ctrlJump)
    draw_text(14,257,global.ctrlTech)
    draw_text(38,201,"Fire")
    draw_text(38,229,"Focus")
    draw_text(38,257,"Bomb")
    //normal
    draw_set_color(color_HUD_Border1)
    draw_circle(19,210,12,true)
    draw_circle(19,238,12,true)
    draw_circle(19,266,12,true)
    draw_set_color(color_HUD_Text)
    draw_text(13,201,global.ctrlAttack)
    draw_text(17,227,global.ctrlJump)
    draw_text(13,257,global.ctrlTech)
    draw_text(37,201,"Fire")
    draw_text(37,229,"Focus")
    draw_text(37,257,"Bomb")
    //********** draw message window **********
    draw_set_color(color_HUD_Border1)
    draw_rectangle(16,291,159,370,true)
    surface_reset_target()
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if drawTime>=9
{
  //********** draw HUD back **********
  if surfaceUsed=1
    draw_surface(playerHUD,view_shooter_x,0)
  else
  {
    //********** draw HUD back **********
    draw_set_alpha(1)
    draw_set_color(color_HUD_Back)
    draw_rectangle(view_shooter_x+0,0,view_shooter_x+HUD_xW-1,HUD_yH-1,false) //back
    draw_set_color(color_HUD_Border1)
    draw_rectangle(view_shooter_x+0,0,view_shooter_x+HUD_xW-1,HUD_yH-1,true) //border outer 1
    draw_rectangle(view_shooter_x+2,2,view_shooter_x+HUD_xW-3,HUD_yH-3,true) //border outer 2
    draw_set_color(color_HUD_Border2)
    draw_rectangle(view_shooter_x+1,1,view_shooter_x+HUD_xW-2,HUD_yH-2,true) //border inner
    draw_set_color(color_HUD_Border1)
    draw_rectangle(view_shooter_x+2,191,view_shooter_x+HUD_xW-4,191,true) //mid outer 1
    draw_rectangle(view_shooter_x+2,193,view_shooter_x+HUD_xW-4,193,true) //mid outer 2
    draw_set_color(color_HUD_Border2)
    draw_rectangle(view_shooter_x+1,192,view_shooter_x+HUD_xW-3,192,true) //mid inner
    //********** draw difficulty **********
    draw_sprite_ext(sDifficultySelect,global.difficulty-1,lowAdjust+88,24,0.5,0.5,0,c_white,1)
    //********** draw text shadow **********
    draw_set_font(fnt_HUD_Shooter)
    draw_set_halign(fa_right)
    draw_set_color(c_black)
    //up
    draw_text(lowAdjust+78,43,"Hi Score#Score##Lives#Bomb#Graze")
    //down
    draw_text(lowAdjust+78,45,"Hi Score#Score##Lives#Bomb#Graze")
    //left
    draw_text(lowAdjust+77,44,"Hi Score#Score##Lives#Bomb#Graze")
    //right
    draw_text(lowAdjust+79,44,"Hi Score#Score##Lives#Bomb#Graze")
    //********** draw text normal **********
    draw_set_color(color_HUD_Text)
    draw_text(lowAdjust+78,44,"Hi Score#Score##Lives#Bomb#Graze")
    //********** draw lives and bombs **********
    var maxLivesXplace;
    maxLivesXplace=view_shooter_x+84
    for(i=0;i<oPlayerShip.lifeMax;i+=1) //lives slots
    {
      draw_sprite(sHUDshipSlot,1,maxLivesXplace,114)
      maxLivesXplace+=11
    }
    maxLivesXplace=view_shooter_x+84
    for(i=0;i<oPlayerShip.bombMax;i+=1) //bomb slots
    {
      draw_sprite(sHUDshipSlot,1,maxLivesXplace,135)
      maxLivesXplace+=11
    }
    //********** draw controls **********
    draw_set_halign(fa_left)
    draw_set_color(color_HUD_Border1)
    draw_circle(lowAdjust+19,210,12,true)
    draw_circle(lowAdjust+19,238,12,true)
    draw_circle(lowAdjust+19,266,12,true)
    draw_set_color(color_HUD_Text)
    draw_text(lowAdjust+13,201,global.ctrlAttack)
    draw_text(lowAdjust+17,227,global.ctrlJump)
    draw_text(lowAdjust+13,257,global.ctrlTech)
    draw_text(lowAdjust+37,201,"Fire")
    draw_text(lowAdjust+37,229,"Focus")
    draw_text(lowAdjust+37,257,"Bomb")
    //********** draw message window **********
    draw_set_color(color_HUD_Border1)
    draw_rectangle(lowAdjust+16,291,lowAdjust+159,370,true)
  }
  draw_set_alpha(1)
  draw_set_color(c_black)
  draw_set_halign(fa_left)
  draw_set_font(fnt_HUD_Shooter)
  //up
  draw_text(424,43,string(oPlayerShip.shooterHiScore) +string("#") +string(oPlayerShip.shooterCurrentScore))
  draw_text(424,148,oPlayerShip.grazeCount)
  //down
  draw_text(424,45,string(oPlayerShip.shooterHiScore) +string("#") +string(oPlayerShip.shooterCurrentScore))
  draw_text(424,150,oPlayerShip.grazeCount)
  //left
  draw_text(423,44,string(oPlayerShip.shooterHiScore) +string("#") +string(oPlayerShip.shooterCurrentScore))
  draw_text(423,149,oPlayerShip.grazeCount)
  //right
  draw_text(425,44,string(oPlayerShip.shooterHiScore) +string("#") +string(oPlayerShip.shooterCurrentScore))
  draw_text(425,149,oPlayerShip.grazeCount)
  draw_set_color(color_HUD_Text)
  draw_text(424,44,string(oPlayerShip.shooterHiScore) +string("#") +string(oPlayerShip.shooterCurrentScore))
  draw_text(424,149,oPlayerShip.grazeCount)
  //********** draw lives and bombs **********
  var maxLivesXplace;
  maxLivesXplace=420
  for(i=0;i<oPlayerShip.life;i+=1) //lives
  {
    draw_sprite(sCurrentElement,0,maxLivesXplace,114)
    maxLivesXplace+=11
  }
  maxLivesXplace=420
  for(i=0;i<oPlayerShip.bomb;i+=1) //bomb
  {
    draw_sprite(sCurrentElement,1,maxLivesXplace,135)
    maxLivesXplace+=11
  }
}
