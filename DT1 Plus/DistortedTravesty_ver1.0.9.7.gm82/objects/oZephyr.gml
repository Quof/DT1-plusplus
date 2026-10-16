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
  if soundRepeat=0
  {
    playSound(global.snd_WindGust,0,0.8)
    soundRepeat=22
  }
  else
    soundRepeat-=1
  with oEnemyBase
  {
    if weight<10000
    {
      if oZephyr.windDir="RIGHT"
        directionMod=30
      else
        directionMod=-30
      moveTo(directionMod/weight,0)
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
      xVel+=directionMod/weight
    }
  }
  with oEarthShift
  {
    if oZephyr.windDir="RIGHT"
      directionMod=5
    else
      directionMod=-5
    xVel+=directionMod/weight
  }
  with oSpell
  {
    if currentSpell="ROCK SMASH"
    {
      if oZephyr.windDir="RIGHT"
        directionMod=30
      else
        directionMod=-30
      moveTo(directionMod/weight,0)
      //xVel+=directionMod/weight
    }
  }
  with oCharacter
  {
    if oZephyr.windDir="RIGHT"
      directionMod=15
    else
      directionMod=-15
    moveTo(directionMod/weight,0)
    //xVel+=directionMod/weight
  }
  if lifeTime<=0
    instance_destroy()
  else
    lifeTime-=1
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
    effectLineX[i]+=8
    if effectLineX[i]>=oPlayer1.x+384
    {
      effectLineX[i]=oPlayer1.x-384
      effectLineY[i]=oPlayer1.y-192+random(384)
    }
    draw_rectangle(effectLineX[i],effectLineY[i],effectLineX[i]+48,effectLineY[i]+1,false)
  }
  else
  {
    effectLineX[i]-=8
    if effectLineX[i]<=oPlayer1.x-384
    {
      effectLineX[i]=oPlayer1.x+384
      effectLineY[i]=oPlayer1.y-192+random(384)
    }
    draw_rectangle(effectLineX[i],effectLineY[i],effectLineX[i]-48,effectLineY[i]+1,false)
  }

}
