#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-13,10,13,-10)
image_speed=0.25

//Enemy base statistics
eName="Aero Scanner"
maxLife=650
life=maxLife
expWorth=850
physicalPower=220
physicalDefense=105
WATERresist=-50
WINDresist=90
baseItemChance=70
dropInd=-20
moneyWorth=110
bCanDealDamage=false
dieEffect=sMMExplosion
dieSound=global.snd_CASdie
if global.difficulty=1
{
  runAcc=0.3
  reShootTime=135
}
else if global.difficulty=2
{
  runAcc=0.4
  reShootTime=120
}
else if global.difficulty=3
{
  runAcc=0.5
  reShootTime=105
}
else if global.difficulty=4
{
  runAcc=0.7
  reShootTime=80
}
shootTime=20
difficultyAdjustments(global.difficulty)
lineW=1
combatText="Oh wow, this thing is quite a nuisance. You don't want to leave these things hanging around. It will stop suddenly and target you with it's laser sight. If it is red, it has you in it's sight, but if it's blue, you are fine.When the line starts to grow, you need to be sure to be out of the way or dodge."
sideText="This is a pretty impressive peace of machinery. Also have you noticed that it seems everything in here can shoot at you. Whoever this guy is, he loves guns and explosives... I like him already."
cripplePointText=">Flood"
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
    if shootTime<reShootTime-30 and shootTime>5
    {
      if x>oCharacter.x
      {
        image_xscale=-1
        xVel=-runAcc
      }
      else
      {
        image_xscale=1
        xVel=runAcc
      }
    }

    //if shootTime>=reShootTime-30
    if shootTime>reShootTime-31 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps; with >= it moved half a tick more each cycle)
      xVel=0
    if shootTime>=reShootTime-15
      //lineW+=0.33
      lineW+=0.33*gDeltaTime //60fps change: per 30fps tick

    if shootTime>=reShootTime
    {
      if !collision_line(x,y,oPlayer1.x,oPlayer1.y-24,oSolid,true,true)
      {
        with oPlayer1
          hitPlayer()
      }
      lineW=1
      //shootTime=0
      //60fps change: counts 30fps ticks; the frame that resets it counts as a whole tick, as at 30fps (it doesn't count up), so the count starts that far back (0 at 30fps)
      shootTime=gDeltaTime-1
    }
    else
      //shootTime+=1
      shootTime+=gDeltaTime //60fps change: see above

    if isCollisionLeft(1)
      xVel=runAcc
    if isCollisionRight(1)
      xVel=-runAcc
    //moveTo(xVel,yVel)
    moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick
  }
  enemyStepEvent()
}
#define Collision_oSpell
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if damageTime=flashTime and dieFade=0 and other.currentSpell="FLOOD"
{
  inflictStatus(0)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bActive=true
{
  if shootTime>=reShootTime-30
  {
    if !collision_line(x,y,oPlayer1.x,oPlayer1.y-24,oSolid,true,true)
      draw_set_color(c_red)
    else
      draw_set_color(c_blue)
    draw_line_width(x,y,oPlayer1.x,oPlayer1.y-24,lineW)
  }
}
event_inherited()
