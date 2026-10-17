#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spawnDirection=0
spawnX=0
spawnTime=0
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
      spawnX=view_xview+view_wview+32
    else
      spawnX=view_xview-32
    ranSpawn=view_yview[0]+random_range(96,176)
    fDemon=instance_create(spawnX,ranSpawn,oFlyingDemon)
    fDemon.bActive=true
    //spawnTime=irandom_range(0,30)
    //60fps change: counts 30fps ticks; the frame that resets it counts as a whole tick, as at 30fps (it doesn't count up), so the count starts that far back (0 at 30fps)
    spawnTime=irandom_range(0,30)+gDeltaTime-1
  }
  else
    //spawnTime+=1
    spawnTime+=gDeltaTime //60fps change: see above
}
