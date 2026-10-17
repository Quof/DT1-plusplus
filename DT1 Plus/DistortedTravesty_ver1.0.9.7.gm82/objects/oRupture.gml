#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
damageType="SPIRIT"
spiritPower=oPlayer1.spiritPower
currentSpell="RUPTURE"
elementType=4
skillPower=110
init=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if global.gamePaused=false
{
  if init=0
  {
    yInc=initYinc
    lifeTime=baseLifeTime
    image_xscale=scaling
    image_yscale=scaling
    init=1
  }
  //y-=yInc
  //yInc-=initYinc/10
  //60fps change: it moves by yInc and then slows by initYinc/10, per 30fps tick; scrGravAcc (move first, then
  //accelerate) follows the 30fps arc
  yInc=scrGravAcc(yInc,-initYinc/10,-1)
  y-=yInc*gDeltaTime
  if gDeltaTime==1
    yInc-=initYinc/10

  //lifeTime-=1
  lifeTime-=gDeltaTime //60fps change: counts 30fps ticks
  //if lifeTime=baseLifeTime-5 and rocksLeft>0
  if scrCountPassDown(lifeTime,baseLifeTime-5) and rocksLeft>0 //60fps change: once, when the count reaches it
  {
    if type=0
    {
      playSound(global.snd_BoulderHit,0,1)
      xx=16
    }
    else
      xx=-16
    ruptureSpell=instance_create(x+xx,curY,oRupture)
    ruptureSpell.type=type
    ruptureSpell.baseLifeTime=baseLifeTime+2
    ruptureSpell.rocksLeft=rocksLeft-1
    ruptureSpell.initYinc=initYinc+1.5
    ruptureSpell.scaling=scaling-0.1
    ruptureSpell.curY=curY
  }
  if lifeTime<=0
    instance_destroy()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,1,image_angle,image_blend,image_alpha)
