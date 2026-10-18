#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(bossID)
{
  if bossID.life>0 and bossID.bShowHealthBar=true
  {
    draw_set_font(fnt_EnemyName)
    nameLength=string_width(bossID.eName)+2
    draw_set_color(make_color_rgb(248,192,72))
    draw_set_halign(fa_left)
    bossBarX=view_xview[0]+4
    bossBarY=view_yview[0]+366
    draw_set_alpha(1)
    draw_sprite(sBossHBLeft,-1,bossBarX,bossBarY+1)
    draw_sprite_ext(sBossHBNameZone,-1,bossBarX+2,bossBarY,nameLength,1,0,c_white,1)
    draw_text(bossBarX+4,bossBarY-1,bossID.eName)
    draw_sprite(sBossHBMid,-1,bossBarX+nameLength+2,bossBarY)
    draw_sprite_ext(sBossHBBarZone,-1,bossBarX+nameLength+5,bossBarY,200,1,0,c_white,1)
    draw_sprite(sBossHBRight,-1,bossBarX+nameLength+205,bossBarY)
    if bossID.barAmount=4 //---------- 4 bars ----------
    {
      healthTrack=(bossID.life/bossID.maxLife)*200
      healthTrackBar1=((bossID.life-(bossID.maxLife/4))/bossID.maxLife)*800
      healthTrackBar2=((bossID.life-(bossID.maxLife/2))/bossID.maxLife)*800
      healthTrackBar3=((bossID.life-(bossID.maxLife/1.3335))/bossID.maxLife)*800
      if healthTrack>=150
      {
        draw_sprite_ext(sHealthTrack,0,bossBarX+nameLength+5,bossBarY+4,200,1,0,c_white,1)
        draw_sprite_ext(sHealthTrack,3,bossBarX+nameLength+5,bossBarY+4,healthTrackBar3,1,0,c_white,1)
      }
      else if healthTrack>=100 and healthTrack<=149.999
      {
        draw_sprite_ext(sHealthTrack,1,bossBarX+nameLength+5,bossBarY+4,200,1,0,c_white,1)
        draw_sprite_ext(sHealthTrack,0,bossBarX+nameLength+5,bossBarY+4,healthTrackBar2,1,0,c_white,1)
      }
      else if healthTrack>=50 and healthTrack<=99.999
      {
        draw_sprite_ext(sHealthTrack,2,bossBarX+nameLength+5,bossBarY+4,200,1,0,c_white,1)
        draw_sprite_ext(sHealthTrack,1,bossBarX+nameLength+5,bossBarY+4,healthTrackBar1,1,0,c_white,1)
      }
      else
        draw_sprite_ext(sHealthTrack,2,bossBarX+nameLength+5,bossBarY+4,healthTrack*4,1,0,c_white,1)
    }
    else if bossID.barAmount=3 //---------- 3 bars ----------
    {
      healthTrack=(bossID.life/bossID.maxLife)*200
      healthTrackBar1=((bossID.life-(bossID.maxLife/3))/bossID.maxLife)*600
      healthTrackBar2=((bossID.life-(bossID.maxLife/1.5))/bossID.maxLife)*600
      if healthTrack>=133
      {
        draw_sprite_ext(sHealthTrack,1,bossBarX+nameLength+5,bossBarY+4,200,1,0,c_white,1)
        draw_sprite_ext(sHealthTrack,0,bossBarX+nameLength+5,bossBarY+4,healthTrackBar2,1,0,c_white,1)
      }
      else if healthTrack>=66.6 and healthTrack<=132.999
      {
        draw_sprite_ext(sHealthTrack,2,bossBarX+nameLength+5,bossBarY+4,200,1,0,c_white,1)
        draw_sprite_ext(sHealthTrack,1,bossBarX+nameLength+5,bossBarY+4,healthTrackBar1,1,0,c_white,1)
      }
      else
        draw_sprite_ext(sHealthTrack,2,bossBarX+nameLength+5,bossBarY+4,healthTrack*3,1,0,c_white,1)
    }
    else if bossID.barAmount=2 //---------- 2 bars ----------
    {
      healthTrack=(bossID.life/bossID.maxLife)*200
      healthTrackBar=((bossID.life-(bossID.maxLife/2))/bossID.maxLife)*400
      if healthTrack>=100
      {
        draw_sprite_ext(sHealthTrack,2,bossBarX+nameLength+5,bossBarY+4,200,1,0,c_white,1)
        draw_sprite_ext(sHealthTrack,1,bossBarX+nameLength+5,bossBarY+4,healthTrackBar,1,0,c_white,1)
      }
      else
        draw_sprite_ext(sHealthTrack,2,bossBarX+nameLength+5,bossBarY+4,healthTrack*2,1,0,c_white,1)
    }
    else if bossID.barAmount=1 //---------- 1 bar ----------
    {
      healthTrack=(bossID.life/bossID.maxLife)*200
      draw_sprite_ext(sHealthTrack,2,bossBarX+nameLength+5,bossBarY+4,healthTrack,1,0,c_white,1)
    }
    //cripple icon change (added): a skull badge (sBossCrippled, 15x16, in the bar's colours) over the bar's left end
    //while the boss is crippled (statusCripple: 300 ticks plus the Strategist skill's bonus, -40% defense), gone once
    //it wears off
    if bossID.statusCripple>0
      draw_sprite(sBossCrippled,0,bossBarX,bossBarY-18)
  }
}
else
  instance_destroy()
