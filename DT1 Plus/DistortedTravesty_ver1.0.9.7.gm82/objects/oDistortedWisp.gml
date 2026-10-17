#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(1,1,15,15)
sprite_index=sNull

//Enemy base statistics
eName="Distorted Wisp"
maxLife=440
life=maxLife
expWorth=310
damageType="SPIRIT"
physicalDefense=60
spiritPower=200
spiritDefense=70
FIREresist=-30
WATERresist=30
WINDresist=-60
EARTHresist=60
skillResist=5
baseItemChance=70
moneyWorth=35
effectDelay=0
circleRad[0]=1
circleRad[1]=12
circleAlpha=0.2
circleTime=0
if global.difficulty=1
  runAcc=1.25
else if global.difficulty=2
  runAcc=1.5
else if global.difficulty=3
  runAcc=1.75
else if global.difficulty=4
  runAcc=2.15
difficultyAdjustments(global.difficulty)
combatText="A rather odd enemy that has no physical form. It will try to seek you out and can cloak itself. These cloaking abilities phase out when it gets too close to you luckily. The awesome radiating from you seems to kill it off."
sideText="They are the distorted remains of some unknown form caught in this dimension. Their only purpose now is to make the lives of those who find their way here a living hell."
cripplePointText=">Full Swing#>Upward Strike"
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
    if instance_exists(oCharacter)
    {
      dir=point_direction(x,y,oCharacter.x,oCharacter.y-22)
      //moveTo(runAcc*cos(degtorad(dir)),-runAcc*sin(degtorad(dir)))
      moveTo(runAcc*cos(degtorad(dir))*gDeltaTime,-runAcc*sin(degtorad(dir))*gDeltaTime) //60fps change: this frame's share of a 30fps tick
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
else if cripplePointProgress=1
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_UP_SLASH
    inflictStatus(0)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
dist=point_distance(x,y,oCharacter.x,oCharacter.y-22)
if dist<=detectDistX
{
  if global.gamePaused=false
  {
    if image_blend=c_white
      image_blend=c_black
    if effectDelay<=0
    {
      pX=x+random(16)
      pY=y+random(16)
      effect_create_above(ef_smoke,pX,pY,0,image_blend)
      //effectDelay=3
      effectDelay=4-gDeltaTime //60fps change: counts down 30fps ticks; the frame that makes the smoke counts as a whole tick, as at 30fps (it doesn't count down), so the count starts that much lower (3 at 30fps)
    }
    else
      //effectDelay-=1
      effectDelay-=gDeltaTime //60fps change: counts 30fps ticks
  }

  //looping circles
  //circleTime+=1
  circleTime+=gDeltaTime //60fps change: counts 30fps ticks
  //if circleTime>=1 and circleTime<=48
  if circleTime>0 and circleTime<=48 //60fps change: the same 30fps ticks, counted in gDeltaTime steps
  {
    //circleRad[0]+=0.25
    circleRad[0]+=0.25*gDeltaTime //60fps change: per 30fps tick
    //circleRad[1]-=0.25
    circleRad[1]-=0.25*gDeltaTime //60fps change: per 30fps tick
    //circleAlpha-=0.004
    circleAlpha-=0.004*gDeltaTime //60fps change: per 30fps tick
  }
  else if circleTime>=48 and circleTime<=96
  {
    //circleRad[0]-=0.25
    circleRad[0]-=0.25*gDeltaTime //60fps change: per 30fps tick
    //circleRad[1]+=0.25
    circleRad[1]+=0.25*gDeltaTime //60fps change: per 30fps tick
    //circleAlpha+=0.004
    circleAlpha+=0.004*gDeltaTime //60fps change: per 30fps tick
    if circleTime>=96
      circleTime=0
  }
  draw_set_alpha(circleAlpha)
  draw_set_color(image_blend)
  draw_circle(x+8,y+8,circleRad[0],true)
  draw_circle(x+8,y+8,circleRad[1],true)
}
