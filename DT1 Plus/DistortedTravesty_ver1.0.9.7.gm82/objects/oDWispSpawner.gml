#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
detectDistX=272
detectDistY=208
inactiveDist=detectDistX*3
if global.difficulty=1
  reSpawnTime=270
else if global.difficulty=2
  reSpawnTime=240
else if global.difficulty=3
  reSpawnTime=210
else if global.difficulty=4
  reSpawnTime=180
spawnDelay=60
bActive=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  makeEnemyActive()
  if bActive=true
  {
    if spawnDelay<=0
    {
      dWisp=instance_create(x,y,oDistortedWisp)
      dWisp.bActive=true
      spawnDelay=reSpawnTime
    }
    else
      spawnDelay-=1
  }
}
