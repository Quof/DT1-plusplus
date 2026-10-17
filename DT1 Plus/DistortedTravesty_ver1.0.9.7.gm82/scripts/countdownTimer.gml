/*
Displays the timer and makes it work.
argument0: 0 - don't countdown or display timer
argument1: timer color
*/
if argument0=1 and global.gamePaused=false
{
  var bTimeOut;
  bTimeOut=0
  //count down time
  //global.cTimerHundred-=3.3
  global.cTimerHundred-=3.3*gDeltaTime //60fps change: per 30fps tick (it's called every frame from a Draw event), so a second still takes 30 ticks
  
  if global.cTimerMinute<=0 and global.cTimerSecond<=0 and global.cTimerHundred<=0 {bTimeOut=1}
  
  if global.cTimerHundred<=0
  {
    global.cTimerHundred+=99
    if global.cTimerSecond<=0
    {
      global.cTimerMinute-=1
      global.cTimerSecond+=60
    }
    global.cTimerSecond-=1
  }
  
  if bTimeOut=1
  {
    global.cTimerMinute=0
    global.cTimerSecond=0
    global.cTimerHundred=0
    oPlayer1.life-=oPlayer1.maxLife
  }
  
  if global.cTimerSecond<10
    cTimerSecondZero=0
  else
    cTimerSecondZero=""
  if global.cTimerHundred<=9
    cTimerHundredZero=0
  else
    cTimerHundredZero=""
  //draw timer
  countdownTimerX=view_xview[0]+220
  countdownTimerY=view_yview[0]+44
  draw_set_font(fnt_Timer)
  draw_set_halign(fa_left)
  draw_set_alpha(1)
  draw_set_color(argument1)
  draw_text(countdownTimerX,countdownTimerY,string(global.cTimerMinute) +string(":") +string(cTimerSecondZero) +string(global.cTimerSecond) +string(":") +string(cTimerHundredZero) +string(round(global.cTimerHundred)))
}
