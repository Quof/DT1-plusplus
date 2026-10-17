#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-8,-16,8,-1)
image_speed=0.15

//Enemy base statistics
eName="Bomber"
maxLife=400
life=maxLife
expWorth=210
physicalPower=150
physicalDefense=50
spiritPower=240
spiritDefense=40
FIREresist=-50
WATERresist=50
WINDresist=50
baseItemChance=65
dropInd=-5
moneyWorth=20
initDir=0
explodeCheck=0
if global.difficulty=1
{
  runAcc=1
  explodeTime=170
}
else if global.difficulty=2
{
  runAcc=1.2
  explodeTime=150
}
else if global.difficulty=3
{
  runAcc=1.4
  explodeTime=130
}
else if global.difficulty=4
{
  runAcc=1.7
  explodeTime=90
}
difficultyAdjustments(global.difficulty)
combatText="Tricky little guys. When they stop and suddenly light up a bit, they are about to explode. They will explode after a certain amount of time, but hitting them will also get them closer to that. Fire will make them explode really fast, though you don't get the Experience when they do that."
sideText="I guess this makes up for the fact that we didn't see any Bobombs in the Mushroom Kingdom. I always thought it would be funny to see one of these explode in Kirby's stomach. It may be sadistic, but it's still funny."
cripplePointText=">Downward Strike#>Full Swing"
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
    if initDir=false
    {
      xVel=runAcc
      if x>oPlayer1.x
        xVel*=-1
      initDir=true
    }
    //explodeCheck+=1
    explodeCheck+=gDeltaTime //60fps change: counts 30fps ticks
    //if explodeCheck>=explodeTime
    if explodeCheck>explodeTime-1 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps; with >= it walked half a tick more)
    {
      if image_speed>0
      {
        xVel=0
        image_speed=0
        image_index=0
        baseColor=c_maroon
        image_blend=baseColor
      }
      //if explodeCheck>=explodeTime+(explodeTime/4)
      if explodeCheck>=ceil(explodeTime+(explodeTime/4)) //60fps change: the 30fps tick it reaches it (it counts in gDeltaTime steps)
      {
        explosion=instance_create(x,y-9,oGASGExplosion)
        explosion.spiritPower=spiritPower
        explosion.damageType="SPIRIT"
        explosion.elementType=1
        explosion.sprite_index=sBomberExplosion
        playSound(global.snd_CASdie,0,1)
        if questType>0
          enemyQuest(questType)
        instance_destroy()
      }
    }
    //yVel+=0.2
    yVel=scrGravAcc(yVel,0.2,1) //60fps change: gravity per 30fps tick, following the 30fps arc
    if isCollisionBottom(1)
      yVel=0
    if isCollisionTop(1)
      yVel=0
    //if isCollisionLeft(1)
    //  xVel*=-1
    //if isCollisionRight(1)
    //  xVel*=-1
    //60fps change: only turn around when moving into the wall (it can still touch it on the next frame above 30fps)
    if isCollisionLeftEdit(1)
      xVel*=-1
    if isCollisionRightEdit(1)
      xVel*=-1
    if isCollisionSolid()
      y-=2
    if xVel>0
      image_xscale=1
    else
      image_xscale=-1
    //moveTo(xVel,yVel)
    moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick
    if y>room_height+24
    {
      if questType>0
        enemyQuest(questType)
      instance_destroy()
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
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_V_SLASH
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
}
else if cripplePointProgress=1
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_H_SLASH
    inflictStatus(0)
}
if other.elementType=1 or other.elementType=4
  //explodeCheck+=20
  explodeCheck+=20*gDeltaTime //60fps change: added every frame the attack touches it: per 30fps tick
else
  //explodeCheck+=10
  explodeCheck+=10*gDeltaTime //60fps change: see above
#define Collision_oSpell
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if other.elementType=1 or other.elementType=4
{
  if other.currentSpell="FIREBALL" or other.currentSpell="FLAME PILLAR"
    //explodeCheck+=50
    explodeCheck+=50*gDeltaTime //60fps change: added every frame the spell touches it: per 30fps tick
  else
    //explodeCheck+=20
    explodeCheck+=20*gDeltaTime //60fps change: see above
}
else
  //explodeCheck+=10
  explodeCheck+=10*gDeltaTime //60fps change: see above
