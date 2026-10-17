#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=0.17

//Enemy base statistics
damageType="SPIRIT"
elementType=2
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
flowProgress=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  //flow
  if flowProgress=0
  {
    if y>oQuickTimeDistorter.yGround-8
      //y-=4
      y-=4*gDeltaTime //60fps change: per 30fps tick
    else
      flowProgress=1
  }
  //else if flowProgress>=1 and flowProgress<=45
  else if flowProgress>=1 and flowProgress<46 //60fps change: it counts in gDeltaTime steps (the same as <=45 in whole ticks)
    //flowProgress+=1
    flowProgress+=gDeltaTime //60fps change: counts 30fps ticks
  //else if flowProgress=46
  else if flowProgress>=46 //60fps change: see above
  {
    //y+=4
    y+=4*gDeltaTime //60fps change: per 30fps tick
    if y>room_height+8
    {
      oQuickTimeDistorter.waterAttackDelay=0
      oQuickTimeDistorter.bWaterActive=false
      oQuickTimeDistorter.WATERresist=100
      oQuickTimeDistorter.waterOrb.image_speed=0
      oQuickTimeDistorter.waterOrb.image_index=0
      oQuickTimeDistorter.elementsActive-=1
      instance_destroy()
    }
  }
  //deal damage
  if y<=oPlayer1.y
  {
    if bCanDealDamage=true
    {
      with oPlayer1
      {
        if bCanTakeHit=true and dashInvulnerabilityTime=0 and jumpSlashPower<=49
        {
          if bRaveActive=false
            takeDamage()
          else
          {
            if other.parent!="enemy" and other.parent!="projectile"
              takeDamage()
          }
        }
      }
    }
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for(i=0;i<room_width;i+=16)
{
  draw_sprite(sprite_index,image_index,x+i,y)
}
for(ii=16;ii<room_height-y+16;ii+=16)
{
  for(iii=0;iii<room_width;iii+=16)
  {
    draw_sprite(sFloodEffectMid,image_index,x+iii,y+ii-8)
  }
}
