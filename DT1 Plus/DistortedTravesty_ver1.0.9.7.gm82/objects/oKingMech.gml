#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-78,-175,78,-1)
y+=1
treadFrame=0
frameCount=0
moveSpeed=0

//Enemy base statistics
eName="King Mech"
maxLife=23000
life=maxLife
expWorth=52000
physicalPower=330
physicalDefense=100
spiritDefense=150
bIsBoss=true
barAmount=2
questType=1
activateBoss=0
attackTime=0
attackType=0
hitSound=global.snd_MMeHit
dieSound=global.snd_CASdie
reHitTime=5
if global.difficulty=1
{
  bigBombDelay=380
  spreadBombDelay=280
  bulletStormDelay=380
}
else if global.difficulty=2
{
  bigBombDelay=350
  spreadBombDelay=250
  bulletStormDelay=330
}
else if global.difficulty=3
{
  bigBombDelay=320
  spreadBombDelay=220
  bulletStormDelay=300
}
else if global.difficulty=4
{
  bigBombDelay=270
  spreadBombDelay=200
  bulletStormDelay=270
}
moveDelay=290
moveTime=0
moveCheck=0
moveType=0
moveStop=0
bigBombTime=50
spreadBombTime=spreadBombDelay-20
bulletStormTime=50
bigBombAmount=1
spreadBombAmount=1
currentBomb=0
quickSpread=3
dropShot=1
bossProgress=0
difficultyAdjustments(global.difficulty)
setPAttack=physicalPower

xCenter=336
yGround=304
roomSpan=192
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
    combatText="It only has 3 weapons, you can handle that. Probably the most notable is the bomb it sends way up. When this bomb comes back down, it creates a nasty pillar-wave-thing of fire. Another is it's Spread Bomb, which it fires overhead, and will then explode and drop a bunch of mini-bombs on you. The last is it's spread gun, which it shoots starting from the ground up. As it's armor gets closer to being destroyed, it will execute programs to further enhance each of these attacks as a last ditch effort. Don't forget about your abilities and this shouldn't be too much of a hassle. Oh it can also move around and make the playing field smaller. I recommend you DO NOT go behind it as it will do insane damage to you."
    sideText="It definitely doesn't match this area at all. It kinda hurts my eyes to see something so out of place. You better destroy this thing fast so I don't have to look at it. Though seeing you scramble about trying to dodge it's attacks is quite humorous. I'm guessing this thing was set up to guard the holding cells, which are right beyond this room.#Appears in: Mega Man & Bass"
    activateBoss=2
  }

  if bActive=true and dieFade=0
  {
    //******************** movement ********************
    moveTime+=1
    if x-(sprite_width/2)>xCenter+roomSpan-12 or x<xCenter+4
      moveTime+=1
    if moveTime>=moveDelay
    {
      moveCheck+=1
      if moveCheck=1 //set
      {
        moveSpeed=random_range(-0.75,0.75)
        //minimum speed
        if moveSpeed<0 and moveSpeed>-0.35
          moveSpeed=-0.35
        else if moveSpeed>0 and moveSpeed<0.35
          moveSpeed=0.35

        if x<xCenter+16
          moveSpeed=1
        if x>xCenter+90
          moveSpeed=-1
        moveStop=irandom(90)+75
      }
      else if moveCheck>=moveStop //stop
      {
        moveSpeed=0
        moveCheck=0
        moveTime=0
      }
    }

    if oPlayer1.x>x //if player goes behind robot
    {
      if moveTime>moveDelay-60
        moveTime=moveDelay-60
      moveSpeed=6
    }
    //power check
    if moveSpeed>4
      physicalPower=setPAttack*3
    else
      physicalPower=setPAttack

    if moveSpeed<0 //left check
    {
      if x<xCenter-16
      {
        moveSpeed=0
        moveCheck=0
        moveTime=0
        x=xCenter-15
      }
    }
    else if moveSpeed>0 //right check
    {
      if x-(sprite_width/2)>xCenter+roomSpan+12
      {
        moveSpeed=0
        moveCheck=0
        moveTime=0
        x=xCenter+roomSpan+11+(sprite_width/2)
      }
    }
    x+=moveSpeed
    //******************** big bomb attack ********************
    bigBombTime+=1
    if bigBombTime>=bigBombDelay and attackType!=2 and attackType!=3
    {
      attackType=1
      attackTime+=1
      if attackTime=20
      {
        playSound(global.snd_GASlaunch,0,1)
        effect=instance_create(x+61,y-76,oEffect)
        effect.sprite_index=sGrenadeExplosion
        bigBomb=instance_create(x+61,y-76,oKMbigBomb)
        bigBomb.physicalPower=physicalPower
        currentBomb+=1
        if currentBomb<bigBombAmount
          attackTime-=15
      }
      if attackTime>=35
      {
        bigBombTime=0
        currentBomb=0
        attackTime=0
        attackType=0
      }
    }
    //******************** spread bomb attack ********************
    spreadBombTime+=1
    if spreadBombTime>=spreadBombDelay and attackType!=1 and attackType!=3
    {
      attackType=2
      attackTime+=1
      if attackTime=20
      {
        for(i=0;i<spreadBombAmount;i+=1)
        {
          effect=instance_create(x+30,y-120,oEffect)
          effect.sprite_index=sGrenadeExplosion
          spreadBomb=instance_create(x+30,y-120,oKMspreadBomb)
          spreadBomb.physicalPower=physicalPower
          spreadBomb.xVel=-random(3)-3
          spreadBomb.yVel=-random(2)-4.5
        }
        if bossProgress>=7
        {
          quickSpread+=1
          if quickSpread=4
          {
            quickSpread=0
            attackTime=5
          }
        }
      }
      if attackTime>=35
      {
        spreadBombTime=0
        attackTime=0
        attackType=0
      }
    }
    //******************** bullet storm attack ********************
    bulletStormTime+=1
    if bulletStormTime>=bulletStormDelay and attackType!=1 and attackType!=2
    {
      attackType=3
      attackTime+=1
      if attackTime=1
      {
        if dropShot>=10
          shotStart=144
        else
          shotStart=240
      }
      if attackTime mod 3=0 and attackTime<100
      {
        effect=instance_create(x-26,y-91,oEffect)
        effect.sprite_index=sGrenadeExplosion
        effect.image_xscale=0.7
        effect.image_yscale=0.7
        newBullet=instance_create(x-26,y-91,oCannonBullet)
        newBullet.physicalPower=physicalPower
        newBullet.bulletSpeed=8
        newBullet.direction=shotStart
        newBullet.image_angle=shotStart
        if dropShot>=10
          shotStart+=6
        else
          shotStart-=6
      }
      if attackTime>=50 and attackTime<100
      {
        if bossProgress>=5
        {
          dropShot+=1
          if dropShot=3
          {
            dropShot=10
            attackTime=0
          }
          else if dropShot>=10
          {
            dropShot=0
            attackTime=100
          }
          else
            attackTime=100
        }
        else
          attackTime=100
      }
      if attackTime>=100
      {
        if attackTime>=110
        {
          bulletStormTime=0
          attackTime=0
          attackType=0
        }
      }
    }

    //tread anim
    frameCount+=1
    if frameCount mod 3=0
    {
      if moveSpeed>0
        treadFrame-=1
      else if moveSpeed<0
        treadFrame+=1
      if treadFrame=-1
        treadFrame=3
      if treadFrame=4
        treadFrame=0
    }

    //scale difficulty
    if lifePercent<=0.9 and lifePercent>=0.81 and bossProgress=0
    {
      bigBombDelay-=5
      spreadBombDelay-=5
      bulletStormDelay-=10
      bossProgress+=1
    }
    else if lifePercent<=0.8 and lifePercent>=0.71 and bossProgress=1
    {
      bigBombDelay-=5
      spreadBombDelay-=5
      bulletStormDelay-=10
      bossProgress+=1
    }
    else if lifePercent<=0.7 and lifePercent>=0.61 and bossProgress=2
    {
      if global.difficulty>=3
        spreadBombDelay-=10
      else
        spreadBombDelay-=5
      bigBombDelay-=10
      bulletStormDelay-=5
      bigBombAmount+=1
      bossProgress+=1
    }
    else if lifePercent<=0.6 and lifePercent>=0.51 and bossProgress=3
    {
      bigBombDelay-=10
      spreadBombDelay-=10
      bulletStormDelay-=10
      bossProgress+=1
    }
    else if lifePercent<=0.5 and lifePercent>=0.41 and bossProgress=4
    {
      if global.difficulty>=3
      {
        bigBombDelay-=16
        bigBombAmount+=1
      }
      else
        bigBombDelay-=8
      spreadBombDelay-=5
      bulletStormDelay-=5
      spreadBombAmount+=1
      bossProgress+=1
    }
    else if lifePercent<=0.4 and lifePercent>=0.31 and bossProgress=5
    {
      if global.difficulty>=3
      {
        bigBombDelay-=10
        spreadBombDelay-=10
        bulletStormDelay-=10
      }
      else
      {
        bigBombDelay-=5
        spreadBombDelay-=5
        bulletStormDelay-=5
      }
      bossProgress+=1
    }
    else if lifePercent<=0.3 and lifePercent>=0.21 and bossProgress=6
    {
      bigBombDelay-=10
      spreadBombDelay-=5
      bulletStormDelay-=5
      bossProgress+=1
    }
    else if lifePercent<=0.2 and lifePercent>=0.11 and bossProgress=7
    {
      if global.difficulty!=1
        bigBombAmount+=1
      bigBombDelay-=10
      spreadBombDelay-=5
      bulletStormDelay-=10
      bossProgress+=1
    }
    else if lifePercent<=0.1 and lifePercent>=0 and bossProgress=8
    {
      if global.difficulty>=3
        spreadBombAmount+=1
      bigBombDelay-=10
      spreadBombDelay-=10
      bulletStormDelay-=10
      bossProgress+=1
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
if collision_rectangle(x-49,y-122,x-23,y-98,oAttackBase,true,true)
{
  event_inherited()
}

/***************************************************
x:26 / 13
y:24 / 12

x-36 (49/23)
y-110 (122/98)
***************************************************/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if activateBoss=2
{
  draw_sprite_ext(sKingMech,-1,x,y,-1,1,0,c_white,1)
  draw_sprite_ext(sKingMechTreads,treadFrame,x,y,-1,1,0,c_white,1)
  draw_sprite_ext(sKingMechWeakspot,-1,x-37,y-111,-1,1,0,image_blend,1)
}
