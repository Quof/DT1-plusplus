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
    if image_alpha=0.9
      image_alpha=0.6
    else
      image_alpha=0.9

    if effectDelay=0
    {
      effect_create_above(ef_smoke,x,y,0,c_gray)
      effectDelay=3
    }
    else
      effectDelay-=1
  }
  else if sprite_index=sNapalmBomb or sprite_index=sShroudDiamond or sprite_index=sGreenYoshiEgg or sprite_index=sKMbombShell or sprite_index=sTTurretBomb
  {
    if xVel>0
      image_angle-=15
    else if xVel<0
      image_angle+=15
  }

  yVel+=grav
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
  moveTo(xVel,yVel)

  if y>room_height+32
    instance_destroy()
}
