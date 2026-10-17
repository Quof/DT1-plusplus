#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
init=0
spawnX=0
spawnTime=0
enemySpawn=oZWolfHead
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if variable_local_exists("newEnemySpawn")
  enemySpawn=newEnemySpawn
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if init=0
  {
    difSpawnChange=round(reSpawnSpeed/5)
    if global.difficulty=1
      reSpawnSpeed+=difSpawnChange
    else if global.difficulty=3
      reSpawnSpeed-=difSpawnChange
    else if global.difficulty=4
      reSpawnSpeed-=round(difSpawnChange*1.1)
    init=1
  }

  //spawnTime+=1
  spawnTime+=gDeltaTime //60fps change: counts 30fps ticks
  if spawnTime>=reSpawnSpeed
  {
    if oPlayer1.image_xscale=1 //spawn from right
      spawnX=view_xview+view_wview+16
    else //spawn from left
      spawnX=view_xview-16
    if enemySpawn=oZWolfHead
      ranSpawn=(oPlayer1.y-30)+random(4)
    else
      ranSpawn=(oPlayer1.y-56)+random(60)
    wHead=instance_create(spawnX,ranSpawn,enemySpawn)
    wHead.bActive=true
    spawnTime=0
  }
}
