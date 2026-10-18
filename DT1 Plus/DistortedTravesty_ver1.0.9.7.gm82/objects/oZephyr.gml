#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.recSpellsConnected+=1
lifeTime=390
directionMod=0
if oPlayer1.image_xscale=1
  windDir="RIGHT"
else
  windDir="LEFT"
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
  //if soundRepeat=0
  if soundRepeat<=0 //60fps change: <= so it still plays if the frame rate changes mid-count
  {
    playSound(global.snd_WindGust,0,0.8)
    //soundRepeat=22
    //60fps change: counts down 30fps ticks; the frame that plays it counts as a whole tick, as at 30fps (it doesn't
    //count down), so the count starts that much higher (22 at 30fps)
    soundRepeat=23-gDeltaTime
  }
  else
    //soundRepeat-=1
    soundRepeat-=gDeltaTime //60fps change: see above
  with oEnemyBase
  {
    if weight<10000
    {
      if oZephyr.windDir="RIGHT"
        directionMod=30
      else
        directionMod=-30
      //moveTo(directionMod/weight,0)
      moveTo(directionMod/weight*gDeltaTime,0) //60fps change: this frame's share of a 30fps tick's push
      //xVel+=directionMod/weight
    }
  }
  with oEProjectileBase
  {
    if weight<10000
    {
      if oZephyr.windDir="RIGHT"
        directionMod=5
      else
        directionMod=-5
      //xVel+=directionMod/weight
      xVel+=directionMod/weight*gDeltaTime //60fps change: per 30fps tick
    }
  }
  with oEarthShift
  {
    if oZephyr.windDir="RIGHT"
      directionMod=5
    else
      directionMod=-5
    //xVel+=directionMod/weight
    //xVel+=directionMod/weight*gDeltaTime //60fps change: per 30fps tick
    //60fps change: the whole tick's push at once, on the tick's last frame, after the block's own logic (oEarthShift's
    //Step comes before oZephyr's), as at 30fps. The platform engine (gameStepEvent) reads xVel only at the next tick's
    //start, and zeroes anything under 0.1 there (approximatelyZero). Spread over the frames, half the push came before
    //the block's friction took 0.05 off, so the tick started at 0.05, which was zeroed: Zephyr never moved it above 30fps
    if gDeltaDoTicks {xVel+=directionMod/weight}
  }
  with oSpell
  {
    if currentSpell="ROCK SMASH"
    {
      if oZephyr.windDir="RIGHT"
        directionMod=30
      else
        directionMod=-30
      //moveTo(directionMod/weight,0)
      moveTo(directionMod/weight*gDeltaTime,0) //60fps change: this frame's share of a 30fps tick's push
      //xVel+=directionMod/weight
    }
  }
  with oCharacter
  {
    if oZephyr.windDir="RIGHT"
      directionMod=15
    else
      directionMod=-15
    //moveTo(directionMod/weight,0)
    moveTo(directionMod/weight*gDeltaTime,0) //60fps change: this frame's share of a 30fps tick's push
    //xVel+=directionMod/weight
  }
  if lifeTime<=0
    instance_destroy()
  else
    //lifeTime-=1
    lifeTime-=gDeltaTime //60fps change: counts 30fps ticks
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color(make_color_rgb(1,214,0))
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
