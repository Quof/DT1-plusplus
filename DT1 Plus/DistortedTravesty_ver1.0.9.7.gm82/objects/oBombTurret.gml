#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

//Enemy base statistics
eName="Bomb Turret"
maxLife=900
life=maxLife
expWorth=2850
physicalPower=300
physicalDefense=180
spiritPower=480
spiritDefense=170
baseItemChance=60
moneyWorth=187
dieEffect=100001
dieSound=global.snd_CASdie
bCanDealDamage=false
if global.difficulty=1
  shotWait=80
else if global.difficulty=2
  shotWait=75
else if global.difficulty=3
  shotWait=70
else if global.difficulty=4
  shotWait=60
shotTime=shotWait-30
difficultyAdjustments(global.difficulty)
combatText="A stationary turret that can come in one of four colors. It is always completely resistant to the element depicted by it's color, but vulnerable to the next element. If that doesn't make sense, look at your HUD. Fire -> Water -> Wind -> Earth -> Fire. They fire off Data Bombs, which disrupt data in the area they make contact with. These are typically indicated by the colors inverting in that area."
sideText="You know, I could draw that thing in MS Paint in a few minutes. The Darkness must have a sense of humor of it's not good at coming up with original content. Which, by the way, I think it's the latter."
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
  eName="Fire Bomb Turret"
  baseColor=make_color_rgb(255,110,110)
  FIREresist=100
  WATERresist=-65
  WINDresist=25
  EARTHresist=50
}
else if elementType=2
{
  eName="Water Bomb Turret"
  baseColor=make_color_rgb(120,120,255)
  FIREresist=50
  WATERresist=100
  WINDresist=-65
  EARTHresist=25
}
else if elementType=3
{
  eName="Wind Bomb Turret"
  baseColor=make_color_rgb(120,255,120)
  FIREresist=25
  WATERresist=50
  WINDresist=100
  EARTHresist=-65
}
else if elementType=4
{
  eName="Earth Bomb Turret"
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
    direction=point_direction(x,y,oPlayer1.x,oPlayer1.y-26)
    image_angle=direction
    shotTime+=1
    if shotTime=shotWait
      {
        afterImage=instance_create(x,y,oEnemyAfterImage)
        afterImage.image_alpha=1
        afterImage.sprite_index=sprite_index
        afterImage.image_angle=image_angle
        afterImage.imageFade=0.04
        afterImage.xScalingSet=0.1
        afterImage.yScalingSet=0.1
      }
    if shotTime>=shotWait+15
    {
      newBullet=instance_create(x,y,oBTurretShot)
      newBullet.x=x+lengthdir_x(12,direction)
      newBullet.y=y+lengthdir_y(12,direction)
      newBullet.image_xscale=0.6
      newBullet.image_yscale=0.6
      newBullet.damageType="SPIRIT"
      newBullet.spiritPower=spiritPower
      newBullet.elementType=elementType
      newBullet.bulletSpeed=5
      newBullet.direction=direction
      newBullet.image_blend=baseColor
      shotTime=0
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
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sBombTurretBase,-1,x,y)
event_inherited()
