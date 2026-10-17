#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spawnTime=0
init=0
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
    realSpawnTime=reSpawnSpeed
    init=1
  }
  if spawnTime>=realSpawnTime
  {
    if dir=0
      xSpawn=view_xview[0]+(view_hview[0]/1.25)+random(view_hview[0])
    else if dir=1
      xSpawn=view_xview[0]-(view_hview[0]/1.25)+random(view_hview[0])

    if random(10)>=5 //up
    {
      mole=instance_create(xSpawn,room_height+16,oMole)
      //mole.direction=90
      mole._direction=90 //60fps change: _direction instead of GM's direction (oMole)
    }
    else //down
    {
      mole=instance_create(xSpawn,-16,oMole)
      //mole.direction=270
      mole._direction=270 //60fps change: see above
    }
    mole.bActive=true
    realSpawnTime=reSpawnSpeed+round(random(2)-1)
    //spawnTime=0
    //60fps change: counts 30fps ticks; the frame that spawns counts as a whole tick, as at 30fps (it doesn't count up),
    //so the count starts that far back (0 at 30fps)
    spawnTime=gDeltaTime-1
  }
  else
    //spawnTime+=1
    spawnTime+=gDeltaTime //60fps change: see above
}
