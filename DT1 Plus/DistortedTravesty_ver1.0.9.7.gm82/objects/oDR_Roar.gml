#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for (i=0;i<50;i+=1)
{
  effectLineX[i]=oPlayer1.x-384+random(768)
  effectLineY[i]=oPlayer1.y-192+random(384)
}
soundRepeat=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  //soundRepeat-=1
  soundRepeat-=gDeltaTime //60fps change: counts 30fps ticks
  if soundRepeat<=0
  {
    playSound(global.snd_WindGust,0,0.8)
    soundRepeat=22
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color(make_color_rgb(1,140,0))
draw_set_alpha(0.3)
for (i=0;i<50;i+=1)
{
  if windDir="RIGHT"
  {
    //effectLineX[i]+=8
    effectLineX[i]+=8*gDeltaTime //60fps change: per 30fps tick
    if effectLineX[i]>=oPlayer1.x+384
    {
      effectLineX[i]=oPlayer1.x-384
      effectLineY[i]=oPlayer1.y-192+random(384)
    }
    draw_rectangle(effectLineX[i],effectLineY[i],effectLineX[i]+48,effectLineY[i]+1,false)
  }
  else
  {
    //effectLineX[i]-=8
    effectLineX[i]-=8*gDeltaTime //60fps change: per 30fps tick
    if effectLineX[i]<=oPlayer1.x-384
    {
      effectLineX[i]=oPlayer1.x+384
      effectLineY[i]=oPlayer1.y-192+random(384)
    }
    draw_rectangle(effectLineX[i],effectLineY[i],effectLineX[i]-48,effectLineY[i]+1,false)
  }

}
