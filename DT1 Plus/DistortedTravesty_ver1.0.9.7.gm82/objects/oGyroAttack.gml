#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

//Enemy base statistics
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
seek=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if seek=0
  {
    //x+=bulletSpeed
    x+=bulletSpeed*gDeltaTime //60fps change: per 30fps tick
    if point_distance(x,0,oPlayer1.x,0)<16
    {
      if y>oPlayer1.y //below player
        bulletSpeed=-8.5
      else //above player
        bulletSpeed=8.5
      seek=1
    }
  }
  else if seek=1
    //y+=bulletSpeed
    y+=bulletSpeed*gDeltaTime //60fps change: per 30fps tick
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
