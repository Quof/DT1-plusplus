#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timeX=view_shooter_x-4
timeY=1
frameTime=30
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  //frameTime-=1
  frameTime-=gDeltaTime //60fps change: counts 30fps ticks
  if frameTime<=0
  {
    timeLeft-=1
    frameTime=30

    if timeLeft<=0
    {
      bossID.timeout=1
      bossID.life=0
    }
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(bossID)
{
  draw_set_alpha(1)
  draw_set_color(c_black)
  draw_set_font(fnt_AreaName)
  draw_set_halign(fa_right)
  //border
  draw_text(timeX+1,timeY,timeLeft)
  draw_text(timeX-1,timeY,timeLeft)
  draw_text(timeX,timeY+1,timeLeft)
  draw_text(timeX,timeY-1,timeLeft)
  //text
  if timeLeft>10
    draw_set_color(c_white)
  else
    draw_set_color(c_red)
  draw_text(timeX,timeY,timeLeft)
}
else
  instance_destroy()
