#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-1,-1,1,1)
image_speed=0.33
global.recSummonsUsed+=1
summonRotate=0
summonCircle=0.1
effectDelay=0

init=0
damageType="SKILL"
physicalPower=oPlayer1.physicalPower/1.25
elementType=1

flySpd=-5
if oPlayer1.image_xscale=-1
{
  image_xscale=-1
  flySpd*=-1
}
attackType=BLAZING
lifeTime=900
skillPower=5
bSummoning=true
summonTime=25
oPlayer1.bCanTakeDamage=false
flyDist=60
flyDir=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if global.gamePaused=false
{
  if bSummoning=true
  {
    if summonCircle<0.6
      //summonCircle+=0.05
      summonCircle+=0.05*gDeltaTime //60fps change: per 30fps tick
    //summonRotate+=5
    summonRotate+=5*gDeltaTime //60fps change: per 30fps tick
    //summonTime-=1
    summonTime-=gDeltaTime //60fps change: counts 30fps ticks
    if summonTime<=0
    {
      bSummoning=false
      oPlayer1.bCanTakeDamage=true
      //return the character to a non-attack state
      oPlayer1.reAttackTime=oPlayer1.attackSpeed //delay after attack
      oPlayer1.attackState=0
    }
  }
  else
  {
    //flyDir+=flySpd
    flyDir+=flySpd*gDeltaTime //60fps change: per 30fps tick
    if oPlayer1.image_xscale=1
      image_xscale=1
    else if oPlayer1.image_xscale=-1
      image_xscale=-1
    x=oPlayer1.x+lengthdir_x(flyDist,flyDir)
    y=oPlayer1.y-26+lengthdir_y(flyDist,flyDir)
    //effectDelay+=1
    effectDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if effectDelay>=4
    {
      effect_create_below(ef_spark,x,y,0,c_red)
      effectDelay=0
    }
    //lifeTime-=1
    lifeTime-=gDeltaTime //60fps change: counts 30fps ticks
    if lifeTime<=0
      instance_destroy()
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bSummoning=true
{
  draw_set_blend_mode(bm_add)
  draw_sprite_ext(sShipFocusEffect,-1,oPlayer1.x,oPlayer1.y-26,summonCircle,summonCircle,summonRotate,c_white,0.25)
  draw_set_blend_mode(bm_normal)
}
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,1,image_angle,image_blend,image_alpha)
