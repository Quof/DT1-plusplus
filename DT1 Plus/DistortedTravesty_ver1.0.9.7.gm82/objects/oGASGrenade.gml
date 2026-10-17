#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-6,-6,6,6)
image_alpha=0.9

//Enemy base statistics
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
effectDelay=0
weight=50
bBlownUp=false
grav=0.2
init=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if init=0
  {
    if sprite_index=sNapalmBomb
      grav=0.4
    init=1
  }
  if sprite_index=sMobileSentryGrenade
  {
    if gDeltaDoTicks //60fps change (added): flickers once per 30fps tick
    {
      if image_alpha=0.9
        image_alpha=0.6
      else
        image_alpha=0.9
    }

    //if effectDelay=0
    if effectDelay<=0 //60fps change: see below
    {
      effect_create_above(ef_smoke,x,y,0,c_gray)
      //effectDelay=3
      effectDelay=4-gDeltaTime //60fps change: counts down 30fps ticks; the frame that makes the smoke counts as a whole tick, as at 30fps (it doesn't count down), so the count starts that much lower (3 at 30fps)
    }
    else
      //effectDelay-=1
      effectDelay-=gDeltaTime //60fps change: counts 30fps ticks
  }
  else if sprite_index=sNapalmBomb or sprite_index=sShroudDiamond or sprite_index=sGreenYoshiEgg or sprite_index=sKMbombShell or sprite_index=sTTurretBomb
  {
    if xVel>0
      //image_angle-=15
      image_angle-=15*gDeltaTime //60fps change: per 30fps tick
    else if xVel<0
      //image_angle+=15
      image_angle+=15*gDeltaTime //60fps change: per 30fps tick
  }

  //yVel+=grav
  yVel=scrGravAcc(yVel,grav,1) //60fps change: gravity per 30fps tick, following the 30fps arc
  if isCollisionTop(1)
    bBlownUp=true
  if isCollisionBottom(1)
    bBlownUp=true
  if isCollisionLeft(1)
    bBlownUp=true
  if isCollisionRight(1)
    bBlownUp=true
  if bBlownUp=true
  {
    if sprite_index=sMobileSentryGrenade or sprite_index=sDataBombLauncherGrenade or sprite_index=sShroudDiamond
      explosion=instance_create(x,y,oDataBomb)
    else
      explosion=instance_create(x,y,oGASGExplosion)
    if damageType="PHYSICAL"
      explosion.physicalPower=physicalPower
    else if damageType="SPIRIT"
    {
      explosion.spiritPower=spiritPower
      explosion.damageType="SPIRIT"
    }
    if sprite_index=sGreenYoshiEgg
    {
      explosion.image_xscale=1.5
      explosion.image_yscale=1.5
    }
    else if sprite_index=sOmgBomb
      explosion.sprite_index=sBoomlol
    playSound(global.snd_CASdie,0,0.85)
    instance_destroy()
  }
  //moveTo(xVel,yVel)
  moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick

  if y>room_height+32
    instance_destroy()
}
