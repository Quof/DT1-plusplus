#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

//Enemy base statistics
bCanTakeDamage=false
bCauseKnockback=false
bShowHealthBar=false
moving=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  makeEnemyActive()
  if moving=true
  {
    if type=0 //down
    {
      y+=4
      if y>=room_height+16
        instance_destroy()
    }
    else if type=1 //up
    {
      y-=4
      if y<=-16
        instance_destroy()
    }
    else if type=2 //right
    {
      x+=4
      if x>=room_width+16
        instance_destroy()
    }
    else
    if type=3 //left
    {
      x-=4
      if x<=-16
        instance_destroy()
    }
  }
}
#define Collision_oPlayer1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if oPlayer1.bCanTakeHit=true and oPlayer1.dashInvulnerabilityTime=0 and oPlayer1.jumpSlashPower<=49
  oPlayer1.life-=oPlayer1.maxLife
event_inherited()
