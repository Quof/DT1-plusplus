#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-7,-22,7,-1)
image_speed=0.1

//Enemy base statistics
maxLife=1
life=maxLife
expWorth=5
rupeeWorth=2
baseItemChance=10
hitSound=0
dieSound=global.snd_CASdie
dieEffect=sRobotExplosion
effectSpeed=0.8
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
  makeEnemyActive()
