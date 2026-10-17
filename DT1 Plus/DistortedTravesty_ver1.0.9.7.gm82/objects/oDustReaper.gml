#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
//makeActive()
//setCollisionBounds(-15,-45,15,-1)
image_speed=0.1

//Enemy base statistics
eName="Dust Reaper"
maxLife=590
life=maxLife
expWorth=360
physicalPower=190
physicalDefense=45
spiritPower=200
spiritDefense=90
FIREresist=-50
WATERresist=-25
WINDresist=25
EARTHresist=50
skillResist=5
baseItemChance=70
moneyWorth=51
bCanDealDamage=false
flyTime=0
scytheTime=0
if global.difficulty=1
{
  runAcc=2.7
  scytheDelay=50
  difAdjustSpd=0.1
}
else if global.difficulty=2
{
  runAcc=3
  scytheDelay=40
  difAdjustSpd=1
}
else if global.difficulty=3
{
  runAcc=3.3
  scytheDelay=30
  difAdjustSpd=2.4
}
else if global.difficulty=4
{
  runAcc=3.6
  scytheDelay=20
  difAdjustSpd=5
}
if x>=oPlayer1.x
{
  image_xscale=-1
  dir=0
}
else
  dir=1
difficultyAdjustments(global.difficulty)
combatText="These things can be a menace. They fly up for a bit and when they put their scythe into the air and start to float down, they'll shot off 2 mini-scythes at you. Keep your distance if they get too high and then dash for them when they are about to fire off their scythes."
sideText="Dust Reaper eh? So does that mean it reaps dust? The name is quite perplexing. I'm thinking it's just a joke though."
cripplePointText=">Fire Fused Full Swing#>Fire Fused Upward Strike"
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
    //flyTime+=1
    flyTime+=gDeltaTime //60fps change: counts 30fps ticks
    //if flyTime>=60
    if flyTime>59 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps; with >= it flew half a tick more each cycle)
    {
      if scytheTime=0
      {
        sprite_index=sDustReaperReap
        bCanDealDamage=true
        if x>=oPlayer1.x
          image_xscale=-1
        else
          image_xscale=1
      }
      //scytheTime+=1
      scytheTime+=gDeltaTime //60fps change: counts 30fps ticks
      if scytheTime>5
        //y+=runAcc+(runAcc/3.2)*difAdjustSpd
        y+=(runAcc+(runAcc/3.2)*difAdjustSpd)*gDeltaTime //60fps change: per 30fps tick
      //if scytheTime=scytheDelay //fire scythe
      if scrCountPass(scytheTime,scytheDelay) //fire scythe //60fps change: once, when the count reaches it
      {
        if image_xscale=1
          xOffset=36
        else
          xOffset=-36
        newBullet=instance_create(x+xOffset,y-48,oDustRScythe)
        newBullet.type=1
        newBullet.spiritPower=spiritPower
        newBullet.bulletSpeed=8
        //newBullet.direction=point_direction(x,y,oCharacter.x,oCharacter.y-22)+10
        newBullet._direction=point_direction(x,y,oCharacter.x,oCharacter.y-22)+10 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        newBullet=instance_create(x+xOffset,y-48,oDustRScythe)
        newBullet.type=1
        newBullet.spiritPower=spiritPower
        newBullet.bulletSpeed=8
        //newBullet.direction=point_direction(x,y,oCharacter.x,oCharacter.y-22)-10
        newBullet._direction=point_direction(x,y,oCharacter.x,oCharacter.y-22)-10 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      }
      //if scytheTime>=scytheDelay+(scytheDelay/3) //revert
      if scytheTime>=ceil(scytheDelay+(scytheDelay/3)) //revert //60fps change: the 30fps tick it reaches it (it counts in gDeltaTime steps)
      {
        sprite_index=sDustReaperFly
        bCanDealDamage=false
        if x>=oPlayer1.x
        {
          image_xscale=-1
          dir=0
        }
        else
        {
          image_xscale=1
          dir=1
        }
        scytheTime=0
        flyTime=0
      }
    }
    else
    {
      if dir=0
        //x-=runAcc/2.1
        x-=runAcc/2.1*gDeltaTime //60fps change: per 30fps tick
      else
        //x+=runAcc/2.1
        x+=runAcc/2.1*gDeltaTime //60fps change: per 30fps tick
      //y-=runAcc
      y-=runAcc*gDeltaTime //60fps change: per 30fps tick
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
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_H_SLASH and other.elementType=1
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
}
else if cripplePointProgress=1
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_UP_SLASH and other.elementType=1
    inflictStatus(0)
}
