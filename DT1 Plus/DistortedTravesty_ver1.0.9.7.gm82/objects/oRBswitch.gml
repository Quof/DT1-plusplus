#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
reHitTime=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if reHitTime>0
    //reHitTime-=1
    reHitTime-=gDeltaTime //60fps change: counts 30fps ticks
}
#define Collision_oEProjectileBase
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if reHitTime=0 and global.gamePaused=false
if reHitTime<=0 and global.gamePaused=false //60fps change: <= so it can still be hit if the frame rate changes mid-count
{
  playSound(global.snd_RBSwitch,0,1)
  if global.rbSwitchBlueOn=false
    global.rbSwitchBlueOn=true
  else
    global.rbSwitchBlueOn=false
  with oRBswitch
    reHitTime=20
}
#define Collision_oAttackBase
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if reHitTime=0 and global.gamePaused=false
if reHitTime<=0 and global.gamePaused=false //60fps change: <= so it can still be hit if the frame rate changes mid-count
{
  playSound(global.snd_RBSwitch,0,1)
  if global.rbSwitchBlueOn=false
    global.rbSwitchBlueOn=true
  else
    global.rbSwitchBlueOn=false
  with oRBswitch
    reHitTime=20
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,global.rbSwitchBlueOn,x,y)
