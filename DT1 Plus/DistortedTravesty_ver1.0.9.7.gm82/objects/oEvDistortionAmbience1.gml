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
  dRalphaTimer+=1
  if dRalphaTimer>=1 and dRalphaTimer<=300
    dRa+=0.001
  else if dRalphaTimer>=301 and dRalphaTimer<=600
    dRa-=0.001

  if dRalphaTimer>=600
    dRalphaTimer=0

  scaleTime+=1
  if scaleTime>=1 and scaleTime<=400
    scaling+=0.0005
  else if scaleTime>=401 and scaleTime<=800
    scaling-=0.0005

  if scaleTime>=800
    scaleTime=0
  sCheck=frac(scaleTime/10)
  if sCheck>0.9
  {
    cR-=2
    cG-=5
    cB-=0.01
  }
  if oPlayer1.attackState=oPlayer1.TECH_MENTAL_INSURRECTION
    distortMentalI=random(0.5)
  else
    distortMentalI=0

  if oPlayer1.sprite_index=sPlayerDamaged
    distortDamage=random(70)+30
  else
    distortDamage=0

  if oPlayer1.attackState=oPlayer1.ACT_CASTING
    distortCasting=random(70)+30
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
dRx-=0.5
draw_background_tiled_ext(global.backDistortion1,0,0,backScale,backScale,make_color_rgb(cR-distortDamage,cG-distortCasting,cB-distortKChain),1)
draw_background_tiled_ext(backDistortedRclouds,dRx,0,2,2,c_white,dRa)
