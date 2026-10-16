#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
global.recPhysicalAttacks+=1
image_speed=oPlayer1.attackAnimSpeed
physicalPower=oPlayer1.physicalPower
if global.p1CurrentElement=1 and oPlayer1.firePercent>0.3
{
  global.recElementsFused+=1
  elementType=global.p1CurrentElement
  oPlayer1.fireEnergy-=44-(global.SkFireAffinity*3)
  image_blend=make_color_rgb(246,54,54)
}
else if global.p1CurrentElement=2 and oPlayer1.waterPercent>0.3
{
  global.recElementsFused+=1
  elementType=global.p1CurrentElement
  oPlayer1.waterEnergy-=44-(global.SkWaterAffinity*3)
  image_blend=make_color_rgb(51,117,201)
}
else if global.p1CurrentElement=3 and oPlayer1.windPercent>0.3
{
  global.recElementsFused+=1
  elementType=global.p1CurrentElement
  oPlayer1.windEnergy-=44-(global.SkWindAffinity*3)
  image_blend=make_color_rgb(0,214,0)
}
else if global.p1CurrentElement=4 and oPlayer1.earthPercent>0.3
{
  global.recElementsFused+=1
  elementType=global.p1CurrentElement
  oPlayer1.earthEnergy-=44-(global.SkEarthAffinity*3)
  image_blend=make_color_rgb(175,76,33)
}

if oPlayer1.image_xscale=-1
  image_xscale=-1
image_alpha=0.7
if oPlayer1.attackState=oPlayer1.PART_H_SLASH
{
  attackType=PART_H_SLASH
  alarm[0]=4/image_speed
}
else if oPlayer1.attackState=oPlayer1.PART_V_SLASH
{
  attackType=PART_V_SLASH
  sprite_index=sPartisanVSlash
  alarm[0]=4/image_speed
}
else if oPlayer1.attackState=oPlayer1.PART_STAB
{
  attackType=PART_STAB
  sprite_index=sPartisanStab
  alarm[0]=4/image_speed
}
else if oPlayer1.attackState=oPlayer1.PART_JUMP_SLASH_2
{
  attackType=PART_JUMP_SLASH_2
  sprite_index=sPartisanJumpSlash
  jumpSlashPower=oPlayer1.jumpSlashPower
  image_xscale*=jumpSlashPower*0.005+1
  image_yscale*=jumpSlashPower*0.005+1
  if oPlayer1.bRaveActive=true
  {
    image_xscale*=1.5
    image_yscale*=1.5
  }
  alarm[0]=4/image_speed
}
else if oPlayer1.attackState=oPlayer1.PART_UP_SLASH
{
  attackType=PART_UP_SLASH
  sprite_index=sPartisanUpSlash
  alarm[0]=3/image_speed
}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//return the character to a non-attack state
if oPlayer1.currentAttackCombo=3
{
  oPlayer1.reAttackTime=oPlayer1.attackFinishSpeed
  oPlayer1.currentAttackCombo=0
}
else
  oPlayer1.reAttackTime=oPlayer1.attackSpeed //delay between attacks
oPlayer1.attackState=0
instance_destroy()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if attackType!=PART_JUMP_SLASH_2
{
  x=oPlayer1.x
  y=oPlayer1.y
  image_xscale=oPlayer1.image_xscale
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale,0,image_blend,image_alpha)
