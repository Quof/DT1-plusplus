#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-13,-32,13,-1)
image_speed=0
//Enemy base statistics
eName="Dive Man"
maxLife=7000
life=maxLife
expWorth=15000
physicalPower=320
physicalDefense=100
spiritDefense=100
hitSound=global.snd_MMeHit
dieEffect=sMMExplosion
dieSound=global.snd_CASdie
reHitTime=5
attackProgress=0
attackType=0
if global.difficulty=1
  missileSpeed=2.6
else if global.difficulty=2
  missileSpeed=3
else if global.difficulty=3
  missileSpeed=3.4
else if global.difficulty=4
  missileSpeed=3.8
shootTime=0
attackPriority=0 //positive: missile, negative: dive
difficultyAdjustments(global.difficulty)
setPAttack=physicalPower
combatText="His actions are almost the same as they were in the original source. He will do one of 2 attacks. Either stand there and shoot a homing missile, or spin at you while close to the ground. Only his missile is threatening. Well his twirl attack does some pretty good damage.#First Appearance: Mega Man 4"
sideText="Model Number: DWN-031# An aquatic-themed Robot created by Dr. Cossack. He was created for deep sea exploration and is equipped with homing torpedoes."
cripplePointText=">None"
yGround=320
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  makeEnemyActive()
  if bActive=true and dieFade=0
  {
    if sprite_index=sDiveManDive
      physicalPower=setPAttack*1.25
    else
      physicalPower=setPAttack

    if attackProgress=0 //choose attack type
    {
      attackProgress=irandom(100)+attackPriority
      if attackProgress>=50
      {
        sprite_index=sDiveManShoot
        attackType=0
        attackPriority-=5
      }
      else
      {
        attackType=1
        attackPriority+=2
      }
      if x>oCharacter.x
        image_xscale=-1
      else
        image_xscale=1
      attackProgress=1
    }
    else if attackProgress=1 //missiles
    {
      shootTime+=1
      if attackType=0
      {
        if shootTime=15
        {
          newBullet=instance_create(x,y-18,oSubMissile)
          newBullet.sprite_index=sDiveMissile
          newBullet.damageType="PHYSICAL"
          newBullet.physicalPower=physicalPower
          newBullet.bulletSpeed=missileSpeed
        }
        if shootTime>=30
        {
          sprite_index=sDiveManIdle
          shootTime=0
          attackProgress+=1
        }
      }
      else if attackType=1 //dive
      {
        if shootTime=15
        {
          y-=24
          sprite_index=sDiveManDive
          image_speed=0.33
          if x>oCharacter.x
          {
            image_xscale=-1
            xVel=-8
          }
          else
          {
            image_xscale=1
            xVel=8
          }
        }
        xDist=point_distance(x,0,oPlayer1.x,0)
        if shootTime>=50 or xDist<8
        {
          xVel=0
          sprite_index=sDiveManIdle
          image_speed=0
          y+=24
          shootTime=0
          attackProgress+=1
        }
      }
    }
    else if attackProgress=2 //wait time
    {
      shootTime+=1
      if attackType=0 and shootTime>=60
      {
        shootTime=0
        attackProgress=0
      }
      else if attackType=1 and shootTime>=15
      {
        shootTime=0
        attackProgress=0
      }
    }

    if isCollisionBottom(1)
      yVel=0
    if isCollisionLeft(1)
      xVel*=-1
    if isCollisionRight(1)
      xVel*=-1
    if isCollisionSolid()
      y-=2
    moveTo(xVel,yVel)
  }
  enemyStepEvent()
}
