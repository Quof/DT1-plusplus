#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
redFadeAlpha=0.3
redFadeTime=0
explosionDelay=0
explosionX=0
explosionY=0
expSize=0
expType=0
soundEffectTime=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//-------------------- Explosion Effect --------------------
explosionDelay-=1
if explosionDelay<=0
{
  explosionX=(view_xview[0]-8)+random(view_wview[0]+16)
  explosionY=(view_yview[0]-8)+random(view_hview[0]+16)
  expSize=random_range(1,1.5)
  effect=instance_create(explosionX,explosionY,oEffect)
  effect.image_speed=0.5
  effect.image_xscale=expSize
  effect.image_yscale=expSize
  expType=irandom_range(1,3)
  if expType=1
    effect.sprite_index=sMetroidExp1
  else if expType=2
    effect.sprite_index=sMetroidExp2
  else if expType=3
    effect.sprite_index=sMetroidExp3
  explosionDelay=irandom_range(2,5)
  soundEffectTime-=1
  if soundEffectTime<=0
  {
    playSound(global.snd_MetroidBomb,0,0.91)
    soundEffectTime=irandom_range(2,6)
  }
}
//-------------------- Red Fade Effect --------------------
redFadeTime+=1
if redFadeTime>=1 and redFadeTime<=50
  redFadeAlpha+=0.002
else if redFadeTime>=51 and redFadeTime<=100
{
  redFadeAlpha-=0.002
  if redFadeTime=100
    redFadeTime=0
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha(redFadeAlpha)
draw_set_color(c_red)
draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false)

if room=rPrimaryMemoryEscape4
{
  draw_set_color(c_black)
  draw_set_alpha(1)
  draw_rectangle(-8,0,64,room_height,0)
  draw_rectangle(448,0,room_width+8,room_height,0)
}
