#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-7,-15,7,-1)
image_speed=0.1

//Enemy base statistics
maxLife=1
life=maxLife
bShowHealthBar=false
bShowDamage=false
bCanDealDamage=false
hitSound=0
dieSound=global.snd_PotShatter
dieEffect=sShatterPot
effectSpeed=0.35
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
baseItemChance=potItemChance
dropInd=potDropInd
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if global.gamePaused=false
    makeEnemyActive()
  yVel+=0.3
  if isCollisionBottom(1)
    yVel=0
  if isCollisionSolid()
    y-=2
  if y>room_height+24
    instance_destroy()
  moveTo(xVel,yVel)
}
