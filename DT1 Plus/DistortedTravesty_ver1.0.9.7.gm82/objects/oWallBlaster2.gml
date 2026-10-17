#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(1,-1,1,-1)
image_speed=0
if image_xscale<0
  x+=16
//Enemy base statistics
eName="Wall Blaster 2"
maxLife=420
life=maxLife
expWorth=550
physicalPower=250
physicalDefense=100
spiritDefense=100
baseItemChance=65
dropInd=-10
moneyWorth=105
hitSound=global.snd_MMeHit
dieEffect=sMMExplosion
dieSound=global.snd_CASdie
reHitTime=5
if global.difficulty=1
  reShootTime=70
else if global.difficulty=2
  reShootTime=60
else if global.difficulty=3
  reShootTime=50
else if global.difficulty=4
  reShootTime=40
shootTime=25
gunAngle=0
imageOffset=0
difficultyAdjustments(global.difficulty)
combatText="A wall mounted gun that just stays on the wall. In the original source, it can only fire in 3 directions, but this has been modified to fire directly at you.#First Appearance: Mega Man 6"
sideText="These actually had an appearance in Mega Man 4, but it was called Wall Blaster without the 2. Umm... nothing else can be said nor do I want to say anything more about them."
cripplePointText=">None"
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
    gunAngle=point_direction(x,y,oPlayer1.x,oPlayer1.y-28)
    if image_xscale=1 //right
    {
      if gunAngle>45 and gunAngle<180
        gunAngle=45
      else if gunAngle>180 and gunAngle<315
        gunAngle=315
    }
    else //left
    {
      if gunAngle<135
        gunAngle=135
      else if gunAngle>225
        gunAngle=225
    }
    if shootTime>=reShootTime
    {
      var dirOffset;
      if image_xscale=1
        dirOffset=8
      else
        dirOffset=-8
      newAttack=instance_create(x+dirOffset,y,oMMeShot1)
      newAttack.physicalPower=physicalPower
      newAttack.bulletSpeed=7
      //newAttack.direction=gunAngle
      newAttack._direction=gunAngle //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      //shootTime=0
      //60fps change: counts 30fps ticks; the frame that shoots counts as a whole tick, as at 30fps (it doesn't count
      //up), so the count starts that far back (0 at 30fps)
      shootTime=gDeltaTime-1
    }
    else
      //shootTime+=1
      shootTime+=gDeltaTime //60fps change: see above
  }
  enemyStepEvent()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if image_xscale=1
  imageOffset=8
else
  imageOffset=-8
draw_sprite_ext(sWallBlaster2Gun,-1,x+imageOffset,y,1,1,gunAngle,image_blend,1)
event_inherited()
