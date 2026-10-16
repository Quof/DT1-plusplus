#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
parent="none"
damageType="PHYSICAL"
elementType=0
bCauseKnockback=true

rotateAmt=-1
elementToShow=1
bWillDamagePlayer=0 //on 0, it WILL damage the player

if global.difficulty=1
{
  physicalPower=1000
}
else if global.difficulty=2
{
  physicalPower=1200
}
else if global.difficulty=3
{
  physicalPower=1400
}
else if global.difficulty=4
{
  physicalPower=1600
}

damageDelay=30
warnAmt=3
warnCycle=0
warnTime=0
damageTime=0
bWarnStart=0

visualWarnSize=1
visualWarnAlpha=0.75
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if bWillDamagePlayer>0
    bWillDamagePlayer-=1
  warnTime+=1
  if warnTime>=warnDelay
  {
    if warnTime=warnDelay
    {
      rotateAmt=-5
      if elementToShow=1
        oColorIndicator.image_blend=c_red
      else if elementToShow=2
        oColorIndicator.image_blend=c_blue
      else if elementToShow=3
        oColorIndicator.image_blend=c_green
      else if elementToShow=4
        oColorIndicator.image_blend=make_color_rgb(120,60,0)
      elementType=elementToShow
    }

    if bWarnStart=0 and warnTime>=warnDelay
    {
      playSound(global.snd_ColorPulseA,0,0.96,1)
      bWarnStart=1
    }
    else if bWarnStart=1 and warnTime>=warnDelay+30
    {
      playSound(global.snd_ColorPulseA,0,0.97,22050)
      bWarnStart=2
    }
    else if bWarnStart=2 and warnTime>=warnDelay+60
    {
      playSound(global.snd_ColorPulseA,0,0.98,33075)
      bWarnStart=3
    }

    damageTime+=1
    if damageTime>=damageDelay
    {
      warnCycle+=1
      if warnCycle=warnAmt
      {
        //deal damage to player if not inside the appropriate zone
        if bWillDamagePlayer=0
        {
          with oPlayer1
          {
            invertScreen=instance_create(0,0,oScreenInvert)
            invertScreen.invertTime=3
            takeDamage()
          }
        }
        //return to normal state
        playSound(global.snd_ColorPulseB,0,0.99,1)
        oColorIndicator.image_blend=c_white
        elementToShow+=1
        if elementToShow=5
          elementToShow=1
        rotateAmt=-1
        visualWarnSize=1
        visualWarnAlpha=0.75
        warnCycle=0
        warnTime=0
        bWarnStart=0
        damageTime=0
      }
      else
      {
        visualWarnSize=1
        visualWarnAlpha=0.75
        damageTime=0
      }
    }
    visualWarnSize+=0.05
    visualWarnAlpha-=0.0125
  }
}
