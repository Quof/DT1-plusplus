#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
global.recPhysicalAttacks+=1
global.recBusterShotsUsed+=1
playSound(global.snd_MMbuster,0,0.88)
attackType=BUSTER
physicalPower=oPlayer1.physicalPower
decayTime=35
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
oPlayer1.busterNum-=1
if decayTime>0
{
  effect=instance_create(x,y,oEffect)
  effect.sprite_index=sBusterHit
  effect.image_speed=0.7
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if global.gamePaused=false
{
  //x+=shootSpeed
  x+=shootSpeed*gDeltaTime //60fps change: per 30fps tick
  if x<view_xview[0]
    instance_destroy()
  if x>view_xview[0]+view_wview[0]
    instance_destroy()
  //decayTime-=1
  decayTime-=gDeltaTime //60fps change: counts 30fps ticks
  if decayTime<=0
    instance_destroy()
}
