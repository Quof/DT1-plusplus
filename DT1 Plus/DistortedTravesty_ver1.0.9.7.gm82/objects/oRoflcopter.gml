#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=0.33

//Enemy base statistics
eName="Roflcopter"
maxLife=1100
life=maxLife
expWorth=1780
physicalDefense=110
spiritPower=240
spiritDefense=120
FIREresist=100
WATERresist=100
WINDresist=-100
EARTHresist=100
baseItemChance=70
dropInd=-10
moneyWorth=160
bCanDealDamage=false
initDir=0
if global.difficulty=1
{
  runAcc=2.5
  reShootTime=50
  reMissileTime=115
  multiShotMax=5
  turnAroundTimeMax=55
}
else if global.difficulty=2
{
  runAcc=2.8
  reShootTime=35
  reMissileTime=105
  multiShotMax=7
  turnAroundTimeMax=40
}
else if global.difficulty=3
{
  runAcc=3.1
  reShootTime=20
  reMissileTime=95
  multiShotMax=9
  turnAroundTimeMax=25
}
else if global.difficulty=4
{
  runAcc=3.4
  reShootTime=15
  reMissileTime=80
  multiShotMax=11
  turnAroundTimeMax=15
}
if directory_exists("C:\Program Files\Messenger")=1
  messengerExists=1
else
  messengerExists=0
shootTime=reShootTime-25
missileTime=reMissileTime-40
multiShot=multiShotMax
turnAroundTime=0
detectDistX=320
dieEffect=sMMExplosion
dieSound=global.snd_CASdie
effectXscale=1.5
difficultyAdjustments(global.difficulty)
combatText="These will go pew pew in a straight line downward. They also try to track you, but they are slightly delayed, not as delayed as some, but a little. They also have a secondary attack where they toss bombs everywhere. When these bombs explode, they cause quite a large explosion, and trust me, you can miss it."
sideText="Let's hope we don't run into too many Internet memes here. What really scares me about seeing this is that it is associated with the Internet. Whenever you have that association, you are in danger of possibly seeing something you'll want to quickly wish you could unsee. Also...#lol#rofl#lmao#omgwtfbbq#I needed to get that out of my system."
cripplePointText=">None#Well... MSN Messenger exists"
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
    //movement
    if initDir=false
    {
      xVel=runAcc
      if x>oPlayer1.x
        xVel*=-1
      initDir=true
    }
    if xVel>0
      image_xscale=1
    else
      image_xscale=-1
    //x+=xVel
    x+=xVel*gDeltaTime //60fps change: per 30fps tick
    //turn delay around if player is behind it
    if image_xscale=1 and x>oPlayer1.x //right
      //turnAroundTime+=1
      turnAroundTime+=gDeltaTime //60fps change: counts 30fps ticks
    else if image_xscale=-1 and x<oPlayer1.x //left
      //turnAroundTime+=1
      turnAroundTime+=gDeltaTime //60fps change: counts 30fps ticks
    else if (image_xscale=1 and x<oPlayer1.x) or (image_xscale=-1 and x>oPlayer1.x)
      turnAroundTime=0
    if turnAroundTime>=turnAroundTimeMax
    {
      turnAroundTime=0
      image_xscale*=-1
      xVel*=-1
      shootTime=0
      multiShot=multiShotMax
    }
    //shoot
    //shootTime+=1
    shootTime+=gDeltaTime //60fps change: counts 30fps ticks
    if shootTime>=reShootTime
    {
      //if multiShot>0 and shootTime mod 5=0
      if multiShot>0 and scrModPass(shootTime,5) //60fps change: once each time the count reaches a multiple of it
      {
        var x1;
        if image_xscale=1
          x1=80
        else
          x1=-80
        newAttack=instance_create(x+x1,y+46,oCannonBullet)
        newAttack.sprite_index=sPewPew
        newAttack.spiritPower=spiritPower
        newAttack.damageType="SPIRIT"
        if image_xscale=1
        {
          //newAttack.direction=340
          newAttack._direction=340 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          newAttack.image_angle=340
        }
        else
        {
          //newAttack.direction=200
          newAttack._direction=200 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          newAttack.image_angle=200
        }
        newAttack.bulletSpeed=8
        multiShot-=1
        if multiShot=0
        {
          shootTime=0
          multiShot=multiShotMax
        }
      }
    }
    //missile
    //missileTime+=1
    missileTime+=gDeltaTime //60fps change: counts 30fps ticks
    if missileTime>=reMissileTime
    {
      for(i=0;i<3;i+=1)
      {
        newAttack=instance_create(x,y-20,oGASGrenade)
        newAttack.sprite_index=sOmgBomb
        newAttack.damageType="SPIRIT"
        newAttack.spiritPower=spiritPower
        newAttack.yVel=-4.25-random(2)
        newAttack.xVel=random(3)-1.5
      }
      missileTime=0
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
if damageTime=flashTime and dieFade=0 and messengerExists=1
{
  inflictStatus(0)
}
