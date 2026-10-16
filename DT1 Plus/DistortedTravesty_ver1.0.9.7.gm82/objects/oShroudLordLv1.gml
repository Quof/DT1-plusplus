#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-40,-35,40,35)
image_speed=0.14
sLordMoveTime=0
sLordMove=0

//Enemy base statistics
eName="Shroud Lord"
maxLife=50000
life=maxLife
expWorth=250000
physicalPower=450
physicalDefense=130
spiritPower=420
spiritDefense=160
FIREresist=100
WATERresist=-65
WINDresist=-30
bIsBoss=true
barAmount=1
questType=1
bCanDealDamage=false
activateBoss=0
controlType=0 //0: normal AI, 1: event scripted
if global.difficulty=1
{
  lHandRecoveryDelay=1700
  rHandRecoveryDelay=1700
  darkEnergyWait=370
}
else if global.difficulty=2
{
  lHandRecoveryDelay=1600
  rHandRecoveryDelay=1600
  darkEnergyWait=320
}
else if global.difficulty=3
{
  lHandRecoveryDelay=1500
  rHandRecoveryDelay=1500
  darkEnergyWait=280
}
else if global.difficulty=4
{
  lHandRecoveryDelay=1400
  rHandRecoveryDelay=1400
  darkEnergyWait=230
}
currSpd=0
maxSpd=7
lHandRecoveryTime=0
rHandRecoveryTime=0
darkEnergyTime=100
darkEnergyDelay=0
pDist=0
pDistOrig=0
bossProgress=0
difficultyAdjustments(global.difficulty)
cripplePointText=">Any attack while mouth is open#Full Swing"

if room=rDistortionW3_3
{
  xCenter=720
  yGround=288
  roomSpan=176
}
else if room=rDistortionW3_9
{
  xCenter=2048
  yGround=256
  roomSpan=160
}

bossSL_Rhand=instance_create(x+88,y-18,oShroudArmLv1)
bossSL_Rhand.type=1

bossSL_Lhand=instance_create(x-88,y-18,oShroudArmLv1)
bossSL_Lhand.type=2
bossSL_Lhand.image_xscale=-1
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
    bShowHealthBar=true
    showBossHP=instance_create(0,0,oBossLifeDisplay)
    showBossHP.bossID=id
    combatText="It mainly throws those large energy balls at you. Dodging those should be your biggest priority. Not only do they do a massive amount of damage, but it also syphons energy back to itself when they hit you. The other major attack is it's hand slam."
    sideText="This is that thing that pulled you into this world. Looks like it's trying to get rid of you for good this time."
    activateBoss=2
  }
  if bActive=true and dieFade=0
  {
    //movement **************************************************
    if controlType=0
    {
      pDistOrig=point_distance(x,0,oPlayer1.x,0)
      pDist=pDistOrig/25
      if x>oPlayer1.x //go left
      {
        if currSpd>=0
        {
          currSpd-=pDist/5
          if pDistOrig<16 and currSpd<3
            currSpd=0
        }
        else
          currSpd-=pDist/10
      }
      else //go right
      {
        if currSpd<=0
        {
          currSpd+=pDist/5
          if pDistOrig<16 and currSpd>-3
            currSpd=0
        }
        else
          currSpd+=pDist/10
      }

      if currSpd>maxSpd
        currSpd=maxSpd
      else if currSpd<-maxSpd
        currSpd=-maxSpd
      x+=currSpd
    }
    //attacks **************************************************
    darkEnergyTime+=1
    if darkEnergyDelay=0
    {
      if darkEnergyTime>=darkEnergyWait
      {
        darkEnergyDelay=darkEnergyWait
        darkEnergyTime=darkEnergyWait
      }
    }
    if darkEnergyTime>=darkEnergyDelay and darkEnergyDelay!=0
    {
      if darkEnergyTime=darkEnergyDelay+1
        sprite_index=sShroudLHeadM
      else if darkEnergyTime=darkEnergyDelay+40
      {
        darkBall=instance_create(x,y-19,oShroudLFire)
        darkBall.throwSpeed=6
        darkBall.ownerID=id
        sprite_index=sShroudLHead
        darkEnergyTime=0
        darkEnergyDelay=0
      }
    }
    //hand recovery **************************************************
    if !instance_exists(bossSL_Lhand) //left hand recovery
    {
      if darkEnergyTime<darkEnergyWait
      {
        darkEnergyTime+=0.25
        if darkEnergyTime>darkEnergyWait
          darkEnergyTime=darkEnergyWait
      }
      lHandRecoveryTime+=1
      if lHandRecoveryTime>=lHandRecoveryDelay
      {
        effect_create_above(ef_smoke,x-88,y-18,2,c_black)
        bossSL_Lhand=instance_create(x-88,y-18,oShroudArmLv1)
        bossSL_Lhand.type=2
        bossSL_Lhand.image_xscale=-1
        bossSL_Lhand.activateBoss=1
        lHandRecoveryTime=0
      }
    }
    if !instance_exists(bossSL_Rhand) //right hand recovery
    {
      if darkEnergyTime<darkEnergyWait
      {
        darkEnergyTime+=0.25
        if darkEnergyTime>darkEnergyWait
          darkEnergyTime=darkEnergyWait
      }
      rHandRecoveryTime+=1
      if rHandRecoveryTime>=rHandRecoveryDelay
      {
        effect_create_above(ef_smoke,x+88,y-18,2,c_black)
        bossSL_Rhand=instance_create(x+88,y-18,oShroudArmLv1)
        bossSL_Rhand.type=1
        bossSL_Rhand.activateBoss=1
        rHandRecoveryTime=0
      }
    }

    //scale difficulty
    if lifePercent<=0.9 and lifePercent>=0.76 and bossProgress=0
    {
      darkEnergyWait-=global.difficulty*5
      bossProgress+=1
    }
    else if lifePercent<=0.75 and lifePercent>=0.51 and bossProgress=1
    {
      darkEnergyWait-=global.difficulty*5
      bossProgress+=1
    }
    else if lifePercent<=0.5 and lifePercent>=0.26 and bossProgress=2
      life+=round(maxLife/4)
    else if lifePercent<=0.25 and lifePercent>=0 and bossProgress=3
    {
      darkEnergyWait-=global.difficulty*5
      bossProgress+=1
    }
  }
  sLordMoveTime+=1
  if sLordMoveTime>=1 and sLordMoveTime<=21
    sLordMove+=0.04
  else if sLordMoveTime>=22 and sLordMoveTime<=42
    sLordMove-=0.04
  else if sLordMoveTime>=52 and sLordMoveTime<=72
    sLordMove-=0.04
  else if sLordMoveTime>=73 and sLordMoveTime<=93
    sLordMove+=0.04
  else if sLordMoveTime>=103
    sLordMoveTime=0
  y+=sLordMove
  enemyStepEvent()
}
#define Collision_oAttackBase
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if cripplePointProgress=0
{
  if damageTime=flashTime and dieFade=0 and sprite_index=sShroudLHeadM
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
}
else if cripplePointProgress=1
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_H_SLASH
  {
    inflictStatus(0)
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha(0.25)
draw_set_color(make_color_rgb(255,57,214))
draw_triangle(x,-384,x+96,room_height,x-96,room_height,false)
draw_set_alpha(0.5)
draw_set_blend_mode(bm_add)
draw_circle_color(x,y-16,128,make_color_rgb(255,57,214),c_black,false)
draw_set_blend_mode(bm_normal)
draw_sprite(sShroudLBody,-1,x,y-40)
event_inherited()
