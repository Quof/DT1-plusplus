#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
_speed=0 //60fps change (added): _speed/_direction stand in for the built-in speed/direction, which start at 0
_direction=0 //60fps change (added): (they must exist before anything reads them)
event_inherited()
image_speed=0.5

//Enemy base statistics
currentSpell="NPC"
damageType="PHYSICAL"
physicalPower=round(oPlayer1.physicalPower*1.6)+20
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
decayTime=45

shotEffect1Time=0
shotEffect1DistX=16
shotEffect1DistY=32
shotEffect1Dir=0
for(i=0;i<6;i+=1)
{
  shotEffectX1[i]=x+lengthdir_x(shotEffect1DistX,shotEffect1Dir+(i*60))
  shotEffectY1[i]=y+lengthdir_y(shotEffect1DistY,shotEffect1Dir+(i*60))
}
shotEffect2=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if global.gamePaused=false
{
  //shotEffect2=random_range(-8,8)
  if gDeltaDoTicks shotEffect2=random_range(-8,8) //60fps change: once per 30fps tick
  if gDeltaDoTicks //60fps change (added): the trail once per 30fps tick
  { //60fps change (added)
  effect=instance_create(x,y,oEffect)
  //effect.x=x+lengthdir_x(10,direction+180)+shotEffect2
  effect.x=x+lengthdir_x(10,_direction+180)+shotEffect2 //60fps change: _speed/_direction stand in for speed/direction (see correctSpeedDirection at the end of the Step)
  //effect.y=y+lengthdir_y(10,direction+180)+shotEffect2
  effect.y=y+lengthdir_y(10,_direction+180)+shotEffect2 //60fps change: see above
  effect.sprite_index=sXshotEffect2
  effect.image_speed=0.5
  effect.image_xscale=image_xscale
  effect.image_yscale=image_yscale
  } //60fps change (added)

  //image_xscale+=0.04
  image_xscale+=0.04*gDeltaTime //60fps change: per 30fps tick
  //image_yscale+=0.04
  image_yscale+=0.04*gDeltaTime //60fps change: per 30fps tick
  //image_angle=direction
  image_angle=_direction //60fps change: see above
  //speed=fireSpeed
  _speed=fireSpeed //60fps change: see above

  //decayTime-=1
  decayTime-=gDeltaTime //60fps change: counts 30fps ticks
  if decayTime<=0
    instance_destroy()
}
else
  //speed=0
  _speed=0 //60fps change: see above
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction, this frame's share of a 30fps tick
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)

//shotEffect1Time+=1
shotEffect1Time+=gDeltaTime //60fps change: counts 30fps ticks
//if shotEffect1Time>=1 and shotEffect1Time<=16
if shotEffect1Time>0 and shotEffect1Time<=16 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
{
  //shotEffect1DistX+=1
  shotEffect1DistX+=gDeltaTime //60fps change: counts 30fps ticks
  //shotEffect1DistY-=1
  shotEffect1DistY-=gDeltaTime //60fps change: counts 30fps ticks
}
//else if shotEffect1Time>=17 and shotEffect1Time<=32
else if shotEffect1Time>16 and shotEffect1Time<=32 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
{
  //shotEffect1DistX-=1
  shotEffect1DistX-=gDeltaTime //60fps change: counts 30fps ticks
  //shotEffect1DistY+=1
  shotEffect1DistY+=gDeltaTime //60fps change: counts 30fps ticks
}
else if shotEffect1Time>=33
  shotEffect1Time=0

for(i=0;i<6;i+=1)
{
  shotEffectX1[i]=x+lengthdir_x(shotEffect1DistX+(image_xscale*2),shotEffect1Dir+(i*60))
  shotEffectY1[i]=y+lengthdir_y(shotEffect1DistY+(image_yscale*2),shotEffect1Dir+(i*60))
  draw_sprite_ext(sXshotEffect1,-1,shotEffectX1[i],shotEffectY1[i],(image_xscale*0.75),(image_yscale*0.75),image_angle,image_blend,image_alpha)
}
//shotEffect1Dir+=4
shotEffect1Dir+=4*gDeltaTime //60fps change: per 30fps tick
