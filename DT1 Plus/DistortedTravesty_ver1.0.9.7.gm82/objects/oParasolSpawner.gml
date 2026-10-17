#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spawnInit=0
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
  if spawnInit=0
  {
    difSpawnChange=round(reSpawnSpeed/5)
    if global.difficulty=1
      reSpawnSpeed+=difSpawnChange
    else if global.difficulty=3
      reSpawnSpeed-=difSpawnChange
    else if global.difficulty=4
      reSpawnSpeed-=round(difSpawnChange*1.1)
    spawnInit=1
  }
  if spawnTime>=reSpawnSpeed
  {
    spawnX=view_xview+random(view_wport)
    parasol=instance_create(spawnX,view_yview,oParasol)
    parasol.bActive=true
    //spawnTime=0
    //60fps change: counts 30fps ticks; the frame that resets it counts as a whole tick, as at 30fps (it doesn't count up), so the count starts that far back (0 at 30fps)
    spawnTime=gDeltaTime-1
  }
  else
    //spawnTime+=1
    spawnTime+=gDeltaTime //60fps change: see above
}
