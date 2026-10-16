#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-16,59,16,67)
image_speed=0.1
effectDelay=0

//Enemy base statistics
eName="Shroud Lord Hand"
maxLife=7500
life=maxLife
expWorth=0
physicalPower=540
physicalDefense=150
spiritPower=440
spiritDefense=200
FIREresist=100
WATERresist=-30
WINDresist=-65
bCanDealDamage=false
activateBoss=1
currentAttack=0
if global.difficulty=1
{
  slamWait=370
  bulletStormWait=420
  handLaserWait=270
}
else if global.difficulty=2
{
  slamWait=340
  bulletStormWait=400
  handLaserWait=250
}
else if global.difficulty=3
{
  slamWait=320
  bulletStormWait=380
  handLaserWait=240
}
else if global.difficulty=4
{
  slamWait=300
  bulletStormWait=360
  handLaserWait=230
}
slamTime=130+irandom(90)
slamDelay=0
bulletStormTime=200
bulletStormDelay=0
bulletFreq=1
handLaserTime=100
handLaserDelay=0
handLaser=0

laserOffsetX=0
bossProgress=0
difficultyAdjustments(global.difficulty)
cripplePointText=">Any attack while slamming"

xCenter=256
yNeutral=176
yGround=320
roomSpan=192
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(handLaser)
{
  with handLaser
    instance_destroy()
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if activateBoss=1
  {
    oGlobalEvent.enemyCount=1
    bActive=true
    var eInfo;
    if type=1
      eInfo="right"
    else if type=2
      eInfo="left"
    combatText="The Shroud Lord's " +string(eInfo) +string(" hand. It performs a hand slam. This is a very fast attack and the only way to dodge it is by carefully watching it's hands. When it's hand shakes, it is getting ready to slam it's hand onto the ground. The moment it stops, it will strike at lightning speeds. As long as you are not on the ground or dodge when it stops shaking, it won't hit you. Speaking of lightning speeds, the hands have a lightning attack among many other new ones. I can't identify them all though. Just a tip, you may want to kill off the hands just before you take off an entire life bar from the Shroud Lord.")
    sideText="These come in handy, har har... Yeah I know I used that joke the first time you fought this. I would suggest taking out the hands first. They won't regenerate for quite some time. It seems attacking the head while the hands are active will cause them to attack much faster. On a side note, the head will attack slightly faster when one or both of the hands are gone."
    activateBoss=2
  }
  if bActive=true and dieFade=0
  {
    if currentAttack=0 //*************** Normal Attack: Hand Slam Attack ***************
    {
      slamTime+=1
      if slamDelay=0
      {
        if slamTime>=slamWait
          slamDelay=slamWait
      }
      if slamTime>=slamDelay and slamDelay!=0
      {
        if slamTime=slamDelay+1 //start hand shake
        {
          image_speed=0.83
          sprite_index=sShroudLArmFist
        }
        else if slamTime=slamDelay+30 //stop hand shake
          sprite_index=sShroudLArmUp
        else if slamTime=slamDelay+40 //slam hand down
        {
          bCanDealDamage=true
          image_speed=0.1
          sprite_index=sShroudLArmSlam
          yVel=64
          var xDist;
          xDist=point_distance(x,0,oPlayer1.x,0)
          xDist/=3
          if xDist>20
            xDist=20
          if x>oPlayer1.x
            xVel=-xDist
          else
            xVel=xDist
        }
        else if slamTime>=slamDelay+60 and slamTime<=slamDelay+79 //effect
        {
          if effectDelay<=0
          {
            effect_create_above(ef_smoke,x,y,1,c_black)
            effect_create_above(ef_smokeup,x,y,1,c_black)
            effectDelay=3
          }
          else
            effectDelay-=1
        }
        else if slamTime=slamDelay+80 //end attack
        {
          if type=1
            handOffset=88
          else if type=2
            handOffset=-88
          bCanDealDamage=false
          sprite_index=sShroudLArm
          x=oShroudLordLv2.x+handOffset
          y=oShroudLordLv2.y-18
          effect_create_above(ef_smoke,x,y,1,c_black)
          slamTime=irandom(60)
          slamDelay=0
          if oShroudLordLv2.maxHandAtk>0
            currentAttack+=1
        }
      }

      if slamTime>=slamDelay+40 and slamDelay!=0
      {
        if isCollisionBottom(1) and yVel>0 //slam into the ground
        {
          xVel=0
          yVel=0
          playSound(global.snd_BreakOut,0,1)
          instance_create(0,0,oViewShaker)
          if oShroudLordLv2.bossProgress>=2 //ground lightning
          {
            var dir,xLightningOffset;
            if type=1
              xLightningOffset=-7
            else if type=2
              xLightningOffset=7
            dir=0
            for(i=0;i<2;i+=1)
            {
              groundAttack=instance_create(x+xLightningOffset,y+56,oMMeShot1)
              groundAttack.damageType="SPIRIT"
              groundAttack.spiritPower=spiritPower
              groundAttack.elementType=3
              groundAttack.sprite_index=sZapTrap
              groundAttack.image_xscale=1.5
              groundAttack.bulletSpeed=7
              groundAttack.direction=dir
              dir=180
            }
          }
          if oShroudLordLv2.bossProgress>=7 //ground blast
          {
            var xGBOffset;
            if type=1
              xGBOffset=-7
            else if type=2
              xGBOffset=7
            gbWave=instance_create(x+xGBOffset+34,y+70,oGASGExplosion)
            gbWave.sprite_index=sKMfirePillar
            gbWave.damageType="SPIRIT"
            gbWave.spiritPower=spiritPower
            gbWave.image_yscale=2
            gbWave=instance_create(x+xGBOffset-34,y+70,oGASGExplosion)
            gbWave.sprite_index=sKMfirePillar
            gbWave.damageType="SPIRIT"
            gbWave.spiritPower=spiritPower
            gbWave.image_yscale=2
          }
        }
        if isCollisionLeft(1)
          xVel=0
        if isCollisionRight(1)
          xVel=0
        moveTo(xVel,yVel)
      }
    }
    else if currentAttack=1 //*************** Normal Attack: Hand Bullet Storm ***************
    {
      bulletStormTime+=1
      if bulletStormDelay=0
      {
        if bulletStormTime>=bulletStormWait
          bulletStormDelay=bulletStormWait
      }
      if bulletStormTime>=bulletStormDelay and bulletStormDelay!=0
      {
        if bulletStormTime=bulletStormDelay+1 //start hand shake
        {
          image_speed=0.83
          sprite_index=sShroudLArmFist
          if oShroudLordLv2.bossProgress>=15
            bulletFreq=5
          else if oShroudLordLv2.bossProgress>=8 and oShroudLordLv2.bossProgress<=14
            bulletFreq=6
          else
            bulletFreq=7
        }
        else if bulletStormTime=bulletStormDelay+30 //stop hand shake
        {
          image_speed=0.1
          sprite_index=sShroudLArmUp
          bulletStormDir=0
        }
        else if bulletStormTime>=bulletStormDelay+61 and bulletStormTime<=bulletStormDelay+80 //bullet wave
        {
          if type=1
            bulletStormDir+=1.5
          else if type=2
            bulletStormDir-=1.5
        }
        else if bulletStormTime>=bulletStormDelay+81 and bulletStormTime<=bulletStormDelay+100 //bullet wave
        {
          if type=1
            bulletStormDir-=1.5
          else if type=2
            bulletStormDir+=1.5
        }
        else if bulletStormTime>=bulletStormDelay+101 //end attack
        {
          sprite_index=sShroudLArm
          bulletStormTime=0
          bulletStormDelay=0
          if oShroudLordLv2.maxHandAtk>1
            currentAttack+=1
          else
            currentAttack=0
        }

        if bulletStormTime>=bulletStormDelay+60 and bulletStormTime mod bulletFreq=0 //create bullets
        {
          if type=1
          {
            shotDir=190
            handOffset=9
          }
          else if type=2
          {
            shotDir=320
            handOffset=-9
          }
          for(i=0;i<3;i+=1)
          {
            newBullet=instance_create(x+handOffset,y-31,oMMeShot1)
            newBullet.sprite_index=sEbulletLong
            newBullet.damageType="SPIRIT"
            newBullet.spiritPower=spiritPower
            newBullet.bulletSpeed=6
            newBullet.direction=shotDir+bulletStormDir
            newBullet.image_angle=shotDir+bulletStormDir
            shotDir+=5
          }
        }
      }
    }
    else if currentAttack=2 //*************** Normal Attack: Hand Laser ***************
    {
      handLaserTime+=1
      if handLaserDelay=0
      {
        if handLaserTime>=handLaserWait
          handLaserDelay=handLaserWait
      }
      if handLaserTime>=handLaserDelay and handLaserDelay!=0
      {
        if handLaserTime=handLaserDelay+1 //start hand shake
        {
          afterImage=instance_create(x,y,oEnemyAfterImage)
          afterImage.sprite_index=sprite_index
          afterImage.image_index=image_index
          afterImage.imageFade=0.04
          afterImage.xScalingSet=0.1
          afterImage.yScalingSet=0.1
          image_speed=0.83
          sprite_index=sShroudLArmFist
          if type=1
            laserOffsetX=10
          else if type=2
            laserOffsetX=-10
        }
        else if handLaserTime=handLaserDelay+30 //stop hand shake
        {
          image_speed=0.1
          sprite_index=sShroudLArmUp
        }
        else if handLaserTime=handLaserDelay+40 //create laser
        {
          handLaser=instance_create(x+laserOffsetX,y-31,oSLHeadLaser)
          handLaser.spiritPower=spiritPower
          handLaser.image_angle=270
        }
        else if handLaserTime>=handLaserDelay+41 and handLaserTime<=handLaserDelay+200 //laser effect
        {
          handLaser.x=x+laserOffsetX
          handLaser.y=y-31
          effectDelay-=1
          if effectDelay<=0
          {
            effect_create_above(ef_firework,x+laserOffsetX,y-31,0,make_color_rgb(155+random(100),155+random(100),155+random(100)))
            effectDelay=7
          }
        }
        else if handLaserTime>=handLaserDelay+201 //end attack
        {
          with handLaser
            instance_destroy()
          sprite_index=sShroudLArm
          handLaserTime=0
          handLaserDelay=0
          currentAttack=0
        }
      }
    }

    //scale difficulty
    if lifePercent<=0.9 and lifePercent>=0.76 and bossProgress=0
    {
      slamWait-=global.difficulty*3
      bulletStormWait-=global.difficulty*3
      handLaserWait-=global.difficulty*3
      bossProgress+=1
    }
    else if lifePercent<=0.75 and lifePercent>=0.51 and bossProgress=1
    {
      slamWait-=global.difficulty*3
      bulletStormWait-=global.difficulty*3
      handLaserWait-=global.difficulty*3
      bossProgress+=1
    }
    else if lifePercent<=0.5 and lifePercent>=0.26 and bossProgress=2
    {
      slamWait-=global.difficulty*3
      bulletStormWait-=global.difficulty*3
      handLaserWait-=global.difficulty*3
      bossProgress+=1
    }
    else if lifePercent<=0.25 and lifePercent>=0 and bossProgress=3
    {
      slamWait-=global.difficulty*3
      bulletStormWait-=global.difficulty*3
      handLaserWait-=global.difficulty*3
      bossProgress+=1
    }
  }
  if instance_exists(oShroudLordLv2)
  {
    var handOffset;
    if type=1
      handOffset=88
    else if type=2
      handOffset=-88
    if slamTime<slamWait+40
    {
      x=oShroudLordLv2.x+handOffset
      y=oShroudLordLv2.y-18
    }
  }
  enemyStepEvent()
}
#define Collision_oAttackBase
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if damageTime=flashTime and dieFade=0 and sprite_index=sShroudLArmSlam
{
  inflictStatus(0)
}
