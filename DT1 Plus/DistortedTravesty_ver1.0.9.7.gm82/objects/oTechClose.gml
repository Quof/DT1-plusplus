#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=oPlayer1.attackAnimSpeed
damageType="SKILL"
physicalPower=oPlayer1.physicalPower

if oPlayer1.image_xscale=-1
  image_xscale=-1
image_alpha=0.7

if oPlayer1.attackState=oPlayer1.TECH_MENTAL_INSURRECTION
{
  if oPlayer1.runSwap=1
    oPlayer1.runSwap=2
  else if oPlayer1.runSwap=2
    oPlayer1.runSwap=1
  attackType=TECH_MENTAL_INSURRECTION
  if global.location="Fortress Area" or global.location="Fortress Inner Area" or room=rBR_CopyX
  {
    physicalPower=0
    skillPower=0
  }
  else
    skillPower=40

  //60fps change: alarms count frames, so the lengths are /gDeltaTime (in 30fps ticks, as before)
  //alarm[0]=5/image_speed
  //alarm[1]=7
  alarm[0]=5/image_speed/gDeltaTime
  alarm[1]=7/gDeltaTime
}
else if oPlayer1.attackState=oPlayer1.TECH_KUDEKU
{
  cirRad=4
  if image_xscale=1
    x+=34
  else
    x-=34
  attackType=TECH_KUDEKU
  sprite_index=sTechKudeku
  skillPower=200+(oPlayer1.hitCombo*3)
  kudekuString=choose("KUDEKU!!","AWESOME!!","SWEET!!","BAD ASS!!")
  //alarm[0]=4/image_speed
  //alarm[1]=6
  alarm[0]=4/image_speed/gDeltaTime //60fps change: see above
  alarm[1]=6/gDeltaTime //60fps change: see above
}
else if oPlayer1.attackState=oPlayer1.TECH_GRAND_SLAM
{
  attackType=TECH_GRAND_SLAM
  sprite_index=sKMfirePillar
  skillPower=oPlayer1.jumpSlashPower*1.1
  image_xscale=1+(skillPower/200)
  image_yscale=1+(skillPower/150)
  //alarm[0]=10/image_speed
  alarm[0]=10/image_speed/gDeltaTime //60fps change: see above
}

if attackType=TECH_KUDEKU
{
  if global.p1CurrentElement=1 and oPlayer1.firePercent>0.3
  {
    elementType=global.p1CurrentElement
    oPlayer1.fireEnergy-=145-(global.SkFireAffinity*15)
    //image_blend=make_color_rgb(246,54,54)
    image_blend=scrElemColor(1,make_color_rgb(246,54,54)) //element colors change: in the colour picked for its element (Element Colors, Options Set 3)
  }
  else if global.p1CurrentElement=2 and oPlayer1.waterPercent>0.3
  {
    elementType=global.p1CurrentElement
    oPlayer1.waterEnergy-=145-(global.SkWaterAffinity*15)
    //image_blend=make_color_rgb(51,117,201)
    image_blend=scrElemColor(2,make_color_rgb(51,117,201)) //element colors change: in the colour picked for its element (Element Colors, Options Set 3)
  }
  if global.p1CurrentElement=3 and oPlayer1.windPercent>0.3
  {
    elementType=global.p1CurrentElement
    oPlayer1.windEnergy-=145-(global.SkWindAffinity*15)
    //image_blend=make_color_rgb(0,214,0)
    image_blend=scrElemColor(3,make_color_rgb(0,214,0)) //element colors change: in the colour picked for its element (Element Colors, Options Set 3)
  }
  if global.p1CurrentElement=4 and oPlayer1.earthPercent>0.3
  {
    elementType=global.p1CurrentElement
    oPlayer1.earthEnergy-=145-(global.SkEarthAffinity*15)
    //image_blend=make_color_rgb(175,76,33)
    image_blend=scrElemColor(4,make_color_rgb(175,76,33)) //element colors change: in the colour picked for its element (Element Colors, Options Set 3)
  }
}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//destroy instance
instance_destroy()
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//return the character to a non-attack state
if attackType!=TECH_GRAND_SLAM
{
  oPlayer1.reAttackTime=oPlayer1.attackSpeed //delay after attack
  oPlayer1.attackState=0
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if attackType=TECH_KUDEKU
{
  //60fps change: grows, shrinks and spins per 30fps tick (*gDeltaTime)
  //cirRad+=3
  cirRad+=3*gDeltaTime

  if image_xscale>0
    x=oPlayer1.x+34
  else
    x=oPlayer1.x-34
  y=oPlayer1.y-32

  if image_xscale>0
    //image_xscale-=0.07
    image_xscale-=0.07*gDeltaTime
  else
    //image_xscale+=0.07
    image_xscale+=0.07*gDeltaTime
  //image_yscale-=0.07
  image_yscale-=0.07*gDeltaTime

  if image_xscale>0
    //image_angle-=15
    image_angle-=15*gDeltaTime
  else
    //image_angle+=15
    image_angle+=15*gDeltaTime
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
if attackType=TECH_KUDEKU
{
  draw_set_alpha(1)
  draw_set_color(c_green)
  draw_circle(x,y,cirRad,true)

  draw_set_color(c_black)
  draw_set_halign(fa_center)
  draw_set_font(fnt_EnemyScan)
  draw_text(oPlayer1.x,oPlayer1.y-64,kudekuString)
}
