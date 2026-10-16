#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
bDestroyIfOffScreen=1
bulProg=0
straightTime=10
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if global.gamePaused=false
{
  if bulProg=0 //move to position
  {
    straightTime-=1
    if straightTime=0
    {
      bulletSpeed=0
      bulProg+=1
    }
  }
  else if bulProg=1 //stopped wait time
  {
    stopTime-=1
    if stopTime=0
    {
      direction=point_direction(x,y,oPlayerShip.x,oPlayerShip.y)
      direction+=random_range(-3,3)
      bulletSpeed=7
      bulProg+=1
    }
  }
}
