#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-28,-64,28,-1)
image_speed=0
y+=1

//Enemy base statistics
eName="Bergrift"
maxLife=1200
life=maxLife
expWorth=2200
physicalPower=270
physicalDefense=120
spiritPower=270
spiritDefense=200
FIREresist=-55
WATERresist=-20
WINDresist=50
EARTHresist=50
inactiveDist=room_width
baseItemChance=80
dropInd=-10
moneyWorth=150
if global.difficulty=1
{
  reJumpTime=65
  blastDist=2
  riseBase=0.75
}
else if global.difficulty=2
{
  reJumpTime=55
  blastDist=2
  riseBase=1
}
else if global.difficulty=3
{
  reJumpTime=45
  blastDist=2
  riseBase=1.25
}
else if global.difficulty=4
{
  reJumpTime=35
  blastDist=2
  riseBase=1.5
}
disappearTime=0
blastRise=riseBase
currentBlast=0
jumpTime=reJumpTime-30
remXvel=0
remYvel=0
difficultyAdjustments(global.difficulty)
combatText="This thing has a tough skin that is very resilient to spirit based attacks. At first it may seem similar to the Gorades, but it is definitely not. While it's shockwave like attack it uses is not as effective as the Gorades, this thing can disappear when it jumps. When it reappears, it will either continue with what it was doing, or it will appear right above you. Luckily when it is phasing in and out, it can hurt you."
sideText="One of the more nasty guards that The Darkness has put in place here. Its armor plated skin can refract light, which gives it it's phasing qualities."
cripplePointText=">Thrust Attack#>Upward Strike"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  makeEnemyActive()
  if bActive=true and stunnedTime=0 and dieFade=0
  {
    if jumpTime<reJumpTime-15 and jumpTime>6
    {
      if x>oCharacter.x
        image_xscale=-1
      else
        image_xscale=1
    }

    //jump
    if jumpTime<reJumpTime+5
      jumpTime+=1
    if jumpTime>=reJumpTime
    {
      if jumpTime=reJumpTime
      {
        sprite_index=sBergriftJump
        y-=4
        yVel=-8
        if image_xscale=1
          xVel=4
        else
          xVel=-4
        xOffset=38
        if point_distance(x,0,oPlayer1.x,0)>520
          disappearTime=1
        else
          if random(10)<8
            disappearTime=1
      }
    }
    if disappearTime>0
      disappearTime+=1
    if disappearTime>=6 and disappearTime<1000
    {
      bCanDealDamage=false
      bCanTakeDamage=false
      if image_alpha>0
        image_alpha-=0.1
      else
      {
        remXvel=xVel
        remYvel=yVel
        xVel=0
        yVel=0
        disappearTime=1000
      }
    }
    else if disappearTime>1040
    {
      if disappearTime<2000
      {
        disappearTime=2000
        var actChoose;
        if point_distance(x,0,oPlayer1.x,0)>520
          actChoose=2
        else
          actChoose=choose(1,2)
        if actChoose=1 //continue from disappear spot
        {
          xVel=remXvel
          yVel=remYvel
        }
        else if actChoose=2 //appear above player
        {
          var xRem,yRem;
          xRem=x
          yRem=y
          x=oPlayer1.x
          y=oPlayer1.y-96
          if place_meeting(x,y,oSolid)
          {
            x=xRem
            y=yRem
            xVel=remXvel
            yVel=remYvel
          }
          else
            yVel=2
        }
      }

      //reappear
      if image_alpha<1
        image_alpha+=0.1
      else
      {
        bCanDealDamage=true
        bCanTakeDamage=true
        disappearTime=0
      }
    }

    if disappearTime<1000 or disappearTime>1500
      yVel+=0.45
    if isCollisionBottom(1)
    {
      yVel=0
      if jumpTime>=reJumpTime+4 and jumpTime<10000
      {
        xVel=0
        jumpTime=10000
        sprite_index=sBergriftStand
      }
    }
    if isCollisionLeft(1)
      xVel*=-1
    if isCollisionRight(1)
      xVel*=-1
    moveTo(xVel,yVel)

    if y>room_height+30
    {
      if questType>0
        enemyQuest(questType)
      instance_destroy()
    }
  }

  if jumpTime>=10000 //ground hit
  {
    jumpTime+=1
    if jumpTime mod 6=0
    {
      for(i=0;i<2;i+=1)
      {
        newAttack=instance_create(x+xOffset,y,oGASGExplosion)
        newAttack.sprite_index=sKMfirePillar
        newAttack.damageType="SPIRIT"
        newAttack.spiritPower=spiritPower
        newAttack.image_speed=0.8
        newAttack.image_yscale=blastRise
        xOffset*=-1
      }
      xOffset+=20
      blastRise*=1.2
      currentBlast+=1
      if currentBlast>=blastDist
      {
        blastRise=riseBase
        currentBlast=0
        jumpTime=0
      }
    }
  }

  enemyStepEvent()
}
#define Collision_oPartSlashes
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if cripplePointProgress=0
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_STAB
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
}
else if cripplePointProgress=1
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_UP_SLASH
    inflictStatus(0)
}
