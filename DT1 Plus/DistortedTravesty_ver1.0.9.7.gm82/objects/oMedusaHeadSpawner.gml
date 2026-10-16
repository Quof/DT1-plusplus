#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spawnDirection=0
spawnX=0
spawnTime=0
if global.location="Distortion WTF 1" or global.location="Distortion WTF 2"
  enemySpawn=oSkullHead
else
  enemySpawn=oMedusaHead
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if spawnDirection=0
  {
    difSpawnChange=round(reSpawnSpeed/5)
    if global.difficulty=1
      reSpawnSpeed+=difSpawnChange
    else if global.difficulty=3
      reSpawnSpeed-=difSpawnChange
    else if global.difficulty=4
      reSpawnSpeed-=round(difSpawnChange*1.1)
    if oPlayer1.x<128
      spawnDirection=1
    else
      spawnDirection=2
  }
  if spawnTime>=reSpawnSpeed
  {
    if spawnDirection=1
      spawnX=view_xview+view_wview+64
    else
      spawnX=view_xview-64
    ranSpawn=(oPlayer1.y-64)+random(128)
    mHead=instance_create(spawnX,ranSpawn,enemySpawn)
    mHead.bActive=true
    mHead.bobTime=round(random(54))
    spawnTime=0
  }
  else
    spawnTime+=1
}
