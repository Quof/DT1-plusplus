#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-12,-12,12,12)

//Enemy base statistics
eName="Blade Arm"
maxLife=800
life=maxLife
expWorth=2700
physicalPower=300
physicalDefense=170
spiritPower=490
spiritDefense=200
baseItemChance=65
moneyWorth=185
dieEffect=100001
dieSound=global.snd_CASdie
if global.difficulty=1
{
  runAcc=1.5
  shotWait=75
  fireAmount=5
}
else if global.difficulty=2
{
  runAcc=1.75
  shotWait=70
  fireAmount=6
}
else if global.difficulty=3
{
  runAcc=2
  shotWait=65
  fireAmount=7
}
else if global.difficulty=4
{
  runAcc=2.25
  shotWait=55
  fireAmount=7
}
shotTime=shotWait-30
difficultyAdjustments(global.difficulty)
combatText="It's a spinning blade thing, which means don't touch it. It can fire off arcing bullets and at a decent rate, so be careful when dealing with more than one of them at a time."
sideText="I laugh at the visual representation for this thing. Did a 9 year old draw it? What was The Darkness thinking? I wonder if these are test or stand in graphics for when The Darkness was in early stages. Weren't there any artists on the team?"
cripplePointText=">Identical First Level Spell"
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
elementType=eType
if elementType=1
{
  eName="Fire Blade Arm"
  baseColor=make_color_rgb(255,110,110)
  FIREresist=100
  WATERresist=-65
  WINDresist=25
  EARTHresist=50
}
else if elementType=2
{
  eName="Water Blade Arm"
  baseColor=make_color_rgb(120,120,255)
  FIREresist=50
  WATERresist=100
  WINDresist=-65
  EARTHresist=25
}
else if elementType=3
{
  eName="Wind Blade Arm"
  baseColor=make_color_rgb(120,255,120)
  FIREresist=25
  WATERresist=50
  WINDresist=100
  EARTHresist=-65
}
else if elementType=4
{
  eName="Earth Blade Arm"
  baseColor=make_color_rgb(255,160,110)
  FIREresist=-65
  WATERresist=25
  WINDresist=50
  EARTHresist=100
}
image_blend=baseColor
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  makeEnemyActive()
  if bActive=true and stunnedTime=0 and dieFade=0
  {
    if instance_exists(oCharacter)
    {
      moveDir=point_direction(x,y,oCharacter.x,oCharacter.y-22)
      moveTo(runAcc*cos(degtorad(moveDir)),-runAcc*sin(degtorad(moveDir)))
    }
    image_angle-=3

    shotTime+=1
    if shotTime>=shotWait
    {
      if shotTime=shotWait
      {
        afterImage=instance_create(x,y,oEnemyAfterImage)
        afterImage.image_alpha=1
        afterImage.sprite_index=sprite_index
        afterImage.image_index=image_index
        afterImage.imageFade=0.04
        afterImage.xScalingSet=0.1
        afterImage.yScalingSet=0.1
      }
      else if shotTime=shotWait+20
      {
        var dir;
        dir=image_angle
        for(i=0;i<fireAmount;i+=1)
        {
          effect=instance_create(x,y,oEffect)
          effect.x=x+lengthdir_x(12,dir)
          effect.y=y+lengthdir_y(12,dir)
          effect.sprite_index=sEnergyRip1
          effect.image_speed=0.75
          effect.image_xscale=0.2
          effect.image_yscale=0.2
          effect.newBlend=1

          newBullet=instance_create(x,y,oMMeShotArc)
          newBullet.x=x+lengthdir_x(12,dir)
          newBullet.y=y+lengthdir_y(12,dir)
          newBullet.sprite_index=sBMFireball
          newBullet.image_xscale=0.6
          newBullet.image_yscale=0.6
          newBullet.damageType="SPIRIT"
          newBullet.spiritPower=spiritPower
          newBullet.elementType=elementType
          newBullet.bDestroyOnOutside=1
          newBullet.bulletSpeed=3
          newBullet.direction=dir
          newBullet.arcTime=30
          newBullet.bulletArc=3
          newBullet.image_blend=baseColor

          dir+=360/fireAmount
        }
        shotTime=0
      }
    }
  }
  enemyStepEvent()
}
#define Collision_oSpell
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if damageTime=flashTime and dieFade=0 and elementType=1 and other.currentSpell="FIREBALL"
{
  inflictStatus(0)
}
else if damageTime=flashTime and dieFade=0 and elementType=2 and other.currentSpell="WATER BLAST"
{
  inflictStatus(0)
}
else if damageTime=flashTime and dieFade=0 and elementType=3 and other.currentSpell="WIND STORM"
{
  inflictStatus(0)
}
else if damageTime=flashTime and dieFade=0 and elementType=4 and other.currentSpell="ROCK SMASH"
{
  inflictStatus(0)
}
