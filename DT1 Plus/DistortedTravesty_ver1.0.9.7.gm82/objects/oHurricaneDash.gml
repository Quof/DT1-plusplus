#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
global.recPhysicalAttacks+=1
attackType=HURRICANE_DASH
physicalPower=oPlayer1.physicalPower*2

sprite_index=oPlayer1.sprite_index
image_index=oPlayer1.image_index
image_xscale=oPlayer1.image_xscale
image_alpha=1 //0.8
image_speed=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if global.gamePaused=false
{
  //image_alpha-=0.1
  image_alpha-=0.1*gDeltaTime //60fps change: per 30fps tick
  //image_blend=make_color_rgb(irandom(255),irandom(255),irandom(255))
  if gDeltaDoTicks image_blend=make_color_rgb(irandom(255),irandom(255),irandom(255)) //60fps change: a new colour once per 30fps tick
}
if image_alpha<=0
  instance_destroy()
