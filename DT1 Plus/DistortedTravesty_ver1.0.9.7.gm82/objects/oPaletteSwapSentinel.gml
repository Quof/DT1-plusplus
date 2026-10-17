#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-1,1,1,-1)
image_speed=0.1
baseColor=c_orange
image_blend=baseColor

//Enemy base statistics
eName="Palette Swap Sentinel"
maxLife=1300
life=maxLife
expWorth=1650
physicalPower=250
physicalDefense=115
spiritDefense=125
FIREresist=-70
WATERresist=0
WINDresist=100
EARTHresist=70
skillResist=15
baseItemChance=85
moneyWorth=150
bCanDealDamage=false
if global.difficulty=1
{
  hoverAcc=2.2
  reShootTime=105
  multiShotMax=1
}
else if global.difficulty=2
{
  hoverAcc=2.5
  reShootTime=85
  multiShotMax=2
}
else if global.difficulty=3
{
  hoverAcc=2.8
  reShootTime=65
  multiShotMax=3
}
else if global.difficulty=4
{
  hoverAcc=3.1
  reShootTime=50
  multiShotMax=4
}
shootTime=reShootTime-25
multiShot=multiShotMax
shotCycle=0
hoverEffect=0
detectDistY=256
dieEffect=sMMExplosion
dieSound=global.snd_CASdie
effectYscale=2
difficultyAdjustments(global.difficulty)
combatText="A large combat robot. Very high durability and Physical Defense can make trashing them a pain. I highly recommend Crippling them as its the best way to bring them down fast. They have a very distinct movement pattern. It will wait till it finds a target, then hover down, and fire lasers at it. The lasers are a 3-way spread. After a few shots, it will hover back up and will choose a new spot and repeat."
sideText="Wait wait WAIT!!#This is the same thing you saw on the Train, what the hell man, it's a palette swap! That's LAME!#Oh well, we've seen worse. Oh and because I hate palette swaps, using Flame Pillar will stop them for awhile."
cripplePointText=">Full Swing#>Fireball#>Full Swing"
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
    //direction
    //if shotCycle!=4
    if shotCycle<4 or shotCycle>=5 //60fps change: not for the whole 30fps tick it's at 4 (from 4 it counts in gDeltaTime steps)
    {
      if x<=oPlayer1.x
        image_xscale=1
      else
        image_xscale=-1
    }
    //attack pattern
    if shotCycle>=0 and shotCycle<=2 //hover down
    {
      if y<ystart+160
        //y+=hoverAcc
        y+=hoverAcc*gDeltaTime //60fps change: per 30fps tick
      else
        //shootTime+=1
        shootTime+=gDeltaTime //60fps change: counts 30fps ticks
    }
    else if shotCycle=3 //hover up
    {
      sprite_index=sTSentinelStand
      if y>ystart-32
        //y-=hoverAcc
        y-=hoverAcc*gDeltaTime //60fps change: per 30fps tick
      else
        shotCycle+=1
    }
    else if shotCycle>=4 //hover over
    {
      //shotCycle+=1
      shotCycle+=gDeltaTime //60fps change: counts 30fps ticks (from 4 here it's a timer)
      if shotCycle<=50
      {
        if image_xscale=1
          //x+=hoverAcc
          x+=hoverAcc*gDeltaTime //60fps change: per 30fps tick
        else
          //x-=hoverAcc
          x-=hoverAcc*gDeltaTime //60fps change: per 30fps tick
      }
      if shotCycle>=70
        shotCycle=0
    }
    //shoot
    if shootTime>=reShootTime-10
      sprite_index=sTSentinelShoot
    if shootTime>=reShootTime
    {
      //if multiShot>0 and shootTime mod 18=0
      if multiShot>0 and scrModPass(shootTime,18) //60fps change: once each time the count reaches a multiple of it
      {
        var x1,dir;
        if image_xscale=1
          x1=28
        else
          x1=-28
        dir=point_direction(x+x1,y-60,oPlayer1.x,oPlayer1.y-22)
        dir-=12
        for (i=0;i<2;i+=1)
        {
          newAttack[i]=instance_create(x+x1,y-60,oLaserB)
          newAttack[i].physicalPower=physicalPower
          //newAttack[i].direction=dir
          newAttack[i]._direction=dir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          newAttack[i].bulletSpeed=5
          dir+=24
        }
        multiShot-=1
        if multiShot=0
        {
          shootTime=0
          multiShot=multiShotMax
          shotCycle+=1
        }
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
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_H_SLASH
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
}
else if cripplePointProgress=2
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_H_SLASH
    inflictStatus(0)
}
#define Collision_oSpell
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if cripplePointProgress=1
{
  if damageTime=flashTime and dieFade=0 and other.currentSpell="FIREBALL"
  {
    cripplePointPTime=30
    cripplePointProgress=2
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//hoverEffect+=1
hoverEffect+=gDeltaTime //60fps change: counts 30fps ticks
//if hoverEffect mod 2=0
if ceil(hoverEffect) mod 2=0 //60fps change: every other 30fps tick (on the frames of the even ticks)
{
  if image_xscale=1
  {
    rX1=4
    rX2=12
  }
  else
  {
    rX1=-4
    rX2=-12
  }
  draw_sprite(sTSentinelRocketFire,-1,x+rX1,y+4)
  draw_sprite(sTSentinelRocketFire,-1,x-rX2,y+10)
}
event_inherited()
