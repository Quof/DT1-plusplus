#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
activateBoss=0
bCanDealDamage=false
bCanTakeDamage=false
lHandRecoveryTime=0
rHandRecoveryTime=0
if global.difficulty=1
{
  lHandRecoveryDelay=1050
  rHandRecoveryDelay=1050
}
else if global.difficulty=2
{
  lHandRecoveryDelay=900
  rHandRecoveryDelay=900
}
else if global.difficulty=3
{
  lHandRecoveryDelay=750
  rHandRecoveryDelay=750
}
else if global.difficulty=4
{
  lHandRecoveryDelay=600
  rHandRecoveryDelay=600
}

bossAL_Head=instance_create(x,y,oAbyssLord)

bossAL_Rhand=instance_create(x+128,y+8,oAbyssLordHand)
bossAL_Rhand.type=1

bossAL_Lhand=instance_create(x-128,y+8,oAbyssLordHand)
bossAL_Lhand.type=2
bossAL_Lhand.image_xscale=-1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if activateBoss=1
  {
    image_alpha=1
    oAbyssLord.activateBoss=1
    oAbyssLordHand.activateBoss=1
    activateBoss=2
  }
  if !instance_exists(bossAL_Rhand) //right hand recovery
  {
    if oAbyssLord.laserTime<oAbyssLord.laserDelay
    {
      oAbyssLord.laserTime+=0.25
      if oAbyssLord.laserTime>oAbyssLord.laserDelay
        oAbyssLord.laserTime=oAbyssLord.laserDelay
    }
    lHandRecoveryTime+=1
    if lHandRecoveryTime>=lHandRecoveryDelay
    {
      effect_create_above(ef_smoke,x+128,y+8,2,c_black)
      bossAL_Rhand=instance_create(x+128,y+8,oAbyssLordHand)
      bossAL_Rhand.type=1
      bossAL_Rhand.activateBoss=1
      lHandRecoveryTime=0
    }
  }
  if !instance_exists(bossAL_Lhand) //left hand recovery
  {
    if oAbyssLord.fireballTime<oAbyssLord.fireballDelay
    {
      oAbyssLord.fireballTime+=0.25
      if oAbyssLord.fireballTime>oAbyssLord.fireballDelay
        oAbyssLord.fireballTime=oAbyssLord.fireballDelay
    }
    rHandRecoveryTime+=1
    if rHandRecoveryTime>=rHandRecoveryDelay
    {
      effect_create_above(ef_smoke,x-128,y+8,2,c_black)
      bossAL_Lhand=instance_create(x-128,y+8,oAbyssLordHand)
      bossAL_Lhand.type=2
      bossAL_Lhand.image_xscale=-1
      bossAL_Lhand.activateBoss=1
      rHandRecoveryTime=0
    }
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode_ext(bm_dest_color,bm_zero)
event_inherited()
draw_set_blend_mode(bm_normal)
