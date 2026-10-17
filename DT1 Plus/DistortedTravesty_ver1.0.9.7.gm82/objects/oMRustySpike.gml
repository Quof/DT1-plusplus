#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

//Enemy base statistics
physicalPower=400
bCanTakeDamage=false
bShowHealthBar=false
detectDistX=96
detectDistY=304
fallingProgress=0
shakeDir=1
if global.difficulty=1
  fallSpeed=3.5
else if global.difficulty=2
  fallSpeed=4
else if global.difficulty=3
  fallSpeed=4.5
else if global.difficulty=4
  fallSpeed=5.1
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.location="Black Rock Fortress" or room=rBR_NeoGuardian
{
  physicalPower+=200
  fallSpeed+=1.5
  sprite_index=sBRFSpike
  image_blend=c_purple
}
else if global.location="Distortion Reckoning"
{
  physicalPower+=250
  fallSpeed+=1.25
  sprite_index=sBRFSpike
  image_blend=c_black
}
difficultyAdjustments(global.difficulty)
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
    //fallingProgress+=1
    fallingProgress+=gDeltaTime //60fps change: counts 30fps ticks
    //if fallingProgress=1
    if scrCountPass(fallingProgress,1) //60fps change: once, when the count reaches it
      x+=1
    //else if fallingProgress>=2 and fallingProgress<=30
    else if fallingProgress>=2 and fallingProgress<=30 and scrModPass(fallingProgress,1) //60fps change: the shake once per 30fps tick (each time the count reaches a whole number), as at 30fps
    {
      if shakeDir=1
        x-=2
      else
        x+=2
      shakeDir*=-1
    }
    //else if fallingProgress=31
    else if scrCountPass(fallingProgress,31) //60fps change: once, when the count reaches it
      x=xstart
    //else if fallingProgress>=32
    else if fallingProgress>31 //60fps change: the same 30fps ticks, counted in gDeltaTime steps
      //y+=fallSpeed
      y+=fallSpeed*gDeltaTime //60fps change: per 30fps tick
  }
  if y>room_height+24
    instance_destroy()
}
