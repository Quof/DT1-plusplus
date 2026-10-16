#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-35,-58,35,-1)
image_speed=0
frameCount=0

//Enemy base statistics
eName="Sagym"
maxLife=940
life=maxLife
expWorth=1500
physicalPower=260
physicalDefense=130
spiritPower=230
spiritDefense=80
WATERresist=-15
WINDresist=-60
EARTHresist=50
skillResist=10
baseItemChance=70
dropInd=-10
moneyWorth=135
if global.difficulty=1
{
  runAcc=2.5
  powerGain=35
  reShootTime=50
  moveFreq=32
}
else if global.difficulty=2
{
  runAcc=3
  powerGain=50
  reShootTime=45
  moveFreq=30
}
else if global.difficulty=3
{
  runAcc=3.5
  powerGain=65
  reShootTime=40
  moveFreq=25
}
else if global.difficulty=4
{
  runAcc=4
  powerGain=85
  reShootTime=35
  moveFreq=20
}
shootTime=10
extraPower=0
curFrame=0
moveTime=0
difficultyAdjustments(global.difficulty)
setPDefense=physicalDefense
setSDefense=spiritDefense
setSAttack=spiritPower
combatText="You have to watch this thing closely. When it has it's legs far apart, it will absorb all your attacks. When you see it lower it's arm, it is ready to fire a very fast beam. It isn't too powerful, however the power it absorbs from your attacks will be transferred into this beam. The size of this beam is proportionate to the power it absorbs as well. Not all it's energy is wasted in each shot either, it slowly uses up the absorbed energy with each shot. As long as you are careful where you are attacking while one of these things are around, you should be alright. I should also mention that it's beam draws from the water element and can go through walls."
sideText="These are the Fortress' standard guards, which means you know that far scarier things lie within. The Darkness didn't hold back with this place did it? I'm really curious what we find in here."
cripplePointText=">Wind Fused Full Swing#>Wind Fused Thrust Attack"
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
    //stat changes
    if (sprite_index=sSagymWalk and image_index=0) or sprite_index=sSagymFire
    {
      physicalDefense=setPDefense*5
      spiritDefense=setSDefense*5
    }
    else
    {
      physicalDefense=setPDefense
      spiritDefense=setSDefense
    }
    spiritPower=setSAttack+extraPower

    if shootTime<reShootTime and moveTime=0
    {
      if x>oCharacter.x
        image_xscale=-1
      else
        image_xscale=1
    }

    //shoot
    if sprite_index=sSagymFire
      shootTime+=1
    if shootTime>=reShootTime+116
    {
      var x1;
      if image_xscale=1
        x1=30
      else
        x1=-30
      effect=instance_create(x+x1,y-16,oEffect)
      effect.sprite_index=sEnergyRip1
      effect.image_speed=0.75
      effect.image_xscale=0.35
      effect.image_yscale=0.35
      effect.newBlend=1
      effect.followID=id
      effect.xFollow=x1
      effect.yFollow=-16

      newAttack=instance_create(x+x1,y-16,oMMeShot1)
      newAttack.sprite_index=sSagymBlast
      newAttack.damageType="SPIRIT"
      newAttack.spiritPower=spiritPower
      newAttack.elementType=2
      newAttack.image_xscale=1+(extraPower/100)
      newAttack.image_yscale=1+(extraPower/100)
      newAttack.bulletSpeed=14
      if image_xscale=1
      {
        newAttack.direction=0
        if oPlayer1.y<y-32
          newAttack.direction=25
        else if oPlayer1.y>y+32
          newAttack.direction=335
      }
      else
      {
        newAttack.direction=180
        if oPlayer1.y<y-32
          newAttack.direction=155
        else if oPlayer1.y>y+32
          newAttack.direction=205
      }
      newAttack.image_angle=newAttack.direction
      extraPower-=40
      if extraPower<0
        extraPower=0
      sprite_index=sSagymWalk
      shootTime=0
    }

    //movement
    if sprite_index=sSagymWalk and image_index!=curFrame
    {
      moveTime+=1
      shootTime+=1
      if moveTime=1
      {
        xVel=runAcc
        if x>oCharacter.x
          xVel*=-1
      }
      if moveTime>=8
      {
        playSound(global.snd_Clang,0,0.95)
        curFrame=image_index
        moveTime=0
        shootTime+=4
        xVel=0
      }
      if shootTime>=reShootTime
      {
        sprite_index=sSagymFire
        shootTime=reShootTime+100
        curFrame=image_index
        moveTime=0
        xVel=0
      }
    }
    //animation
    if sprite_index=sSagymWalk
    {
      frameCount+=1
      if frameCount mod moveFreq=0
      {
        if image_index=0
          image_index=1
        else
          image_index=0
      }
    }

    yVel+=0.3
    if isCollisionBottom(1)
      yVel=0
    if isCollisionLeft(1)
      xVel*=-1
    if isCollisionRight(1)
      xVel*=-1
    if isCollisionSolid()
      y-=2

    moveTo(xVel,yVel)
    if y>room_height+30
    {
      if questType>0
        enemyQuest(questType)
      instance_destroy()
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
if bTakingDamage=false and other.bCanDealDamage=true and bActive=true
{
  if (sprite_index=sSagymWalk and image_index=0) or sprite_index=sSagymFire
  {
    effect=instance_create(x,y,oEffect)
    effect.sprite_index=sEnergyRip1
    effect.image_speed=0.75
    effect.image_xscale=0.6
    effect.image_yscale=0.6
    effect.image_alpha=0.75
    effect.newBlend=1
    effect.followID=id
    effect.xFollow=0
    effect.yFollow=-32

    if other.elementType=2
      extraPower+=round(powerGain*1.5)
    else
      extraPower+=powerGain
    shootTime+=8
  }
}
event_inherited()
if cripplePointProgress=0
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_H_SLASH and other.elementType=3
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
}
else if cripplePointProgress=1
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_STAB and other.elementType=3
    inflictStatus(0)
}
