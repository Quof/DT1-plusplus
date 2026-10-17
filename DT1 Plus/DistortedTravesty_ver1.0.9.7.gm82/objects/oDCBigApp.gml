#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
setCollisionBounds(-1,-1,1,1)

//Enemy base statistics
damageType="SPIRIT"
if global.difficulty=1
  dropTime=30
else if global.difficulty=2
  dropTime=20
else if global.difficulty=3
  dropTime=10
else if global.difficulty=4
  dropTime=5
dropSpeed=2
dropTick=0 //60fps change (added): counts its 30fps ticks of moving (when to speed up, below)
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
bCanDealDamage=false
size=2
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
    image_xscale=(xDrag/32)
    image_yscale=(yDrag/29)
    init=1
  }

  if dropTime<=0
  {
    dropTick+=gDeltaTime //60fps change (added): see the Create event
    if bCanDealDamage=false
      bCanDealDamage=true

    if type=0 //down
    {
      //y+=dropSpeed
      //dropSpeed+=0.25
      y+=dropSpeed*gDeltaTime //60fps change: per 30fps tick
      if scrModPass(dropTick,1) //60fps change: speeds up at the end of each of its 30fps ticks of moving (each time the count reaches a whole number), after it moves, as at 30fps
        dropSpeed+=0.25
      if dropSpeed>12
        dropSpeed=12
      if y>=room_height+256
        instance_destroy()
    }
    if type=1 //up
    {
      //y-=dropSpeed
      //dropSpeed+=0.25
      y-=dropSpeed*gDeltaTime //60fps change: see above
      if scrModPass(dropTick,1) //60fps change: see above
        dropSpeed+=0.25
      if dropSpeed>12
        dropSpeed=12
      if y<=-256
        instance_destroy()
    }
    if type=2 //right
    {
      //x+=dropSpeed
      //dropSpeed+=0.25
      x+=dropSpeed*gDeltaTime //60fps change: see above
      if scrModPass(dropTick,1) //60fps change: see above
        dropSpeed+=0.25
      if dropSpeed>12
        dropSpeed=12
      if x>=room_width+256
        instance_destroy()
    }
    if type=3 //left
    {
      //x-=dropSpeed
      //dropSpeed+=0.25
      x-=dropSpeed*gDeltaTime //60fps change: see above
      if scrModPass(dropTick,1) //60fps change: see above
        dropSpeed+=0.25
      if dropSpeed>12
        dropSpeed=12
      if x<=-256
        instance_destroy()
    }
  }
  else
    //dropTime-=1
    dropTime-=gDeltaTime //60fps change: counts 30fps ticks
}
