#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=0.6

//Enemy base statistics
maxLife=1
life=maxLife
expWorth=10
rupeeWorth=5
baseItemChance=3
hitSound=0
dieSound=0
dieEffect=sGrenadeExplosion
effectXscale=0.5
effectYscale=0.9
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
  makeEnemyActive()
