/*
This script is called to find casting time.
*/
idleTime=0
effect=instance_create(oPlayer1.x,oPlayer1.y+4,oEffect)
effect.sprite_index=sSpellCast
castingTime=castingTimeTotal
if global.SkElementalMaster>0
{
  castingTime=round(castingTime*0.75)
  if castingTime<1
    castingTime=1
  castingTimeTotal=round(castingTime)
}
