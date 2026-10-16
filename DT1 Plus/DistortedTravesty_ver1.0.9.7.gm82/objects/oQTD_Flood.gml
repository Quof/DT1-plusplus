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
      y-=4
    else
      flowProgress=1
  }
  else if flowProgress>=1 and flowProgress<=45
    flowProgress+=1
  else if flowProgress=46
  {
    y+=4
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
