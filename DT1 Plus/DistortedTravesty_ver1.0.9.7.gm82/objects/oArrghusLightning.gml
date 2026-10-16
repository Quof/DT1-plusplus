#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=0.3
sprite_index=sNull
image_xscale=0.8
image_yscale=4.25
size=2

//Enemy base statistics
damageType="SPIRIT"
elementType=3
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
bCanDealDamage=false
decayTime=0
warnTime=45
warnAlpha=1
alphaChange=0
if global.difficulty=1
  fireAmount=2
else if global.difficulty=2
  fireAmount=3
else if global.difficulty=3
  fireAmount=4
else if global.difficulty=4
  fireAmount=5

if room=rVDlock5_3 or room=rBR_Arrghus
  yAdjust=0
else if room=rDataSegment9 or rBR_DataCollector
  yAdjust=64
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if bCanDealDamage=true
  {
    decayTime+=1
    if decayTime>=10
      instance_destroy()
  }
  else
  {
    warnTime-=1
    if warnTime<=0
    {
      if bShake=1
      {
        playSound(global.snd_Shock,0,0.9)
        instance_create(0,0,oViewShaker)
      }
      if bMakeFire=1
      {
        for(i=0;i<fireAmount;i+=1)
        {
          newAttack=instance_create(x,y-6,oShotzoBullet)
          newAttack.sprite_index=sALfireball
          newAttack.damageType="SPIRIT"
          newAttack.spiritPower=spiritPower
          newAttack.elementType=1
          newAttack.image_xscale=0.8
          newAttack.image_yscale=0.8
          newAttack.xVel=random_range(-2.5,2.5)
          if room=rVDlock5_3
            newAttack.yVel=random_range(-6,-3)
          else if room=rDataSegment9
            newAttack.yVel=random_range(-7,-5)
        }
      }
      sprite_index=sDTorsoLightning
      bCanDealDamage=true
    }
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if warnTime>0
{
  draw_sprite_ext(sWarningSymbol,-1,x,y-yAdjust,0.6,0.6,0,c_white,warnAlpha)
  alphaChange+=1
  if alphaChange=8
  {
    if warnAlpha=1
      warnAlpha=0
    else
      warnAlpha=1
    alphaChange=0
  }
}
