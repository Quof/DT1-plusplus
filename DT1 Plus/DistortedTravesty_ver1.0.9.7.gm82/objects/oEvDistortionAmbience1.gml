#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
scaling=2
scaleTime=0
cR=255
cG=255
cB=255
make_color_rgb(cR,cG,cB)
distortMentalI=0
distortDamage=0
distortCasting=0
distortKChain=0
dRx=0
dRa=0.4
dRalphaTimer=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  //dRalphaTimer+=1
  dRalphaTimer+=gDeltaTime //60fps change: counts 30fps ticks
  //if dRalphaTimer>=1 and dRalphaTimer<=300
  if dRalphaTimer>0 and dRalphaTimer<=300 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    //dRa+=0.001
    dRa+=0.001*gDeltaTime //60fps change: per 30fps tick
  //else if dRalphaTimer>=301 and dRalphaTimer<=600
  else if dRalphaTimer>300 and dRalphaTimer<=600 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    //dRa-=0.001
    dRa-=0.001*gDeltaTime //60fps change: per 30fps tick

  if dRalphaTimer>=600
    dRalphaTimer=0

  //scaleTime+=1
  scaleTime+=gDeltaTime //60fps change: counts 30fps ticks
  //if scaleTime>=1 and scaleTime<=400
  if scaleTime>0 and scaleTime<=400 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    //scaling+=0.0005
    scaling+=0.0005*gDeltaTime //60fps change: per 30fps tick
  //else if scaleTime>=401 and scaleTime<=800
  else if scaleTime>400 and scaleTime<=800 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    //scaling-=0.0005
    scaling-=0.0005*gDeltaTime //60fps change: per 30fps tick

  if scaleTime>=800
    scaleTime=0
  //sCheck=frac(scaleTime/10)
  //60fps change: checked on the whole tick number, as at 30fps. There scaleTime is always whole, so this is at most 0.9
  //(4.9 gives 0.9000000000000004, which GM8 counts as equal to 0.9) and the tint below never runs: the background is
  //only tinted while the player is hit, casting or on a kill chain (the Draw). Counted in half/quarter ticks it gave
  //0.95 every 10 ticks, so the background darkened bit by bit until the colour went negative and flickered through
  //garbage colours
  sCheck=frac(ceil(scaleTime)/10) //60fps change: see above
  if sCheck>0.9
  {
    //cR-=2
    cR-=2*gDeltaTime //60fps change: per 30fps tick
    //cG-=5
    cG-=5*gDeltaTime //60fps change: per 30fps tick
    //cB-=0.01
    cB-=0.01*gDeltaTime //60fps change: per 30fps tick
  }
  if oPlayer1.attackState=oPlayer1.TECH_MENTAL_INSURRECTION
  { //60fps change (added): braces, so the else below stays with this if. Without them it paired with the "if gDeltaDoTicks" gate: the effect never went back to 0 afterwards, and while it was on it flickered to 0 between ticks (the same below)
    //distortMentalI=random(0.5)
    if gDeltaDoTicks distortMentalI=random(0.5) //60fps change: once per 30fps tick
  } //60fps change (added): see above
  else
    distortMentalI=0

  if oPlayer1.sprite_index=sPlayerDamaged
  { //60fps change (added): braces (see above): the red-out never went back to 0 after a hit
    //distortDamage=random(70)+30
    if gDeltaDoTicks distortDamage=random(70)+30 //60fps change: once per 30fps tick
  } //60fps change (added): see above
  else
    distortDamage=0

  if oPlayer1.attackState=oPlayer1.ACT_CASTING
  { //60fps change (added): braces (see above): the green-out never went back to 0 after a cast
    //distortCasting=random(70)+30
    if gDeltaDoTicks distortCasting=random(70)+30 //60fps change: once per 30fps tick
  } //60fps change (added): see above
  else
    distortCasting=0

  if oPlayer1.killChain=0
    distortKChain=0
  else
    distortKChain=oPlayer1.killChain*10
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
backScale=scaling+distortMentalI
//dRx-=0.5
dRx-=0.5*gDeltaTime //60fps change: per 30fps tick
draw_background_tiled_ext(global.backDistortion1,0,0,backScale,backScale,make_color_rgb(cR-distortDamage,cG-distortCasting,cB-distortKChain),1)
draw_background_tiled_ext(backDistortedRclouds,dRx,0,2,2,c_white,dRa)
