#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=0.4

//Enemy base statistics
eName="Data Crystal"
maxLife=12000
life=maxLife
expWorth=100000
physicalPower=300
physicalDefense=150
spiritPower=450
spiritDefense=200
WATERresist=25
dieEffect=100001
dieSound=global.snd_CASdie
bCanDealDamage=false
eShotDistorted=0
if global.difficulty=1
{
  shotWait=130
  shotAmt=6
  sprayLength=130
  sprayFreq=9
}
else if global.difficulty=2
{
  shotWait=120
  shotAmt=7
  sprayLength=150
  sprayFreq=8
}
else if global.difficulty=3
{
  shotWait=110
  shotAmt=8
  sprayLength=170
  sprayFreq=7
}
else if global.difficulty=4
{
  shotWait=100
  shotAmt=10
  sprayLength=190
  sprayFreq=6
  eShotDistorted=1
}
shotTime=shotWait-30
sprayProgress=0
sprayTime=0
if room=rDS_2_3
{
  maxLife=18000
  life=maxLife
  hitSound=global.snd_MMeHit
  flashTime=3
  WATERresist=60
  WINDresist=30
  if global.difficulty=1
    sprayLength=150
  else if global.difficulty=2
    sprayLength=180
  else if global.difficulty=3
    sprayLength=210
  else if global.difficulty=4
    sprayLength=240
}
difficultyAdjustments(global.difficulty)
combatText="This is one of the data structures that The Darkness has placed up to guard the inner workings of the Data Segment. Destroying all three of these will reveal the way forward. It has a single attack in which it shoots out bullets carrying Data Bombs. Well actually... it has two attacks, when you knock it down half way, it will go into a one time hyper mode thing where it sprays Data Bombs everywhere. Try to hide from this."
sideText="I wonder if putting up these data structures in a crystalized form is a joke at something. I can't help but feel like this area of the Data Segment is one big satire of typical cliche final dungeons in your standard rpg."
cripplePointText=">None"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  makeEnemyActive()

  if sprayProgress=0 //wait for life to be at 50%
  {
    if lifePercent<0.5
      sprayProgress=1
  }
  else if sprayProgress=1 //warn player
  {
    //sprayTime+=1
    sprayTime+=gDeltaTime //60fps change: counts 30fps ticks
    //if sprayTime=1
    if scrCountPass(sprayTime,1) //60fps change: once, when the count reaches it
    {
      afterImage=instance_create(x,y,oEnemyAfterImage)
      afterImage.image_alpha=1
      afterImage.sprite_index=sprite_index
      afterImage.image_angle=image_angle
      afterImage.imageFade=0.02
      afterImage.xScalingSet=0.12
      afterImage.yScalingSet=0.12
    }
    //else if sprayTime=50
    else if sprayTime>=50 //60fps change: >= so it still resets if the frame rate changes mid-count
    {
      if shotTime>shotWait
        shotTime-=30
      shotDir=0
      sprayTime=0
      sprayProgress=2
    }
  }
  else if sprayProgress=2 //spray attack
  {
    //sprayTime+=1
    sprayTime+=gDeltaTime //60fps change: counts 30fps ticks
    //if sprayTime mod sprayFreq=0
    if scrModPass(sprayTime,sprayFreq) //60fps change: once each time the count reaches a multiple of it
    {
      dir=0
      for(i=0;i<round(shotAmt/2)+eShotDistorted;i+=1)
      {
        effect=instance_create(x,y,oEffect)
        effect.x=x+lengthdir_x(24,shotDir+dir)
        effect.y=y+lengthdir_y(24,shotDir+dir)
        effect.sprite_index=sEnergyRip1
        effect.image_speed=0.75
        effect.image_xscale=0.2
        effect.image_yscale=0.2
        effect.newBlend=1

        newBullet=instance_create(x,y,oBTurretShot)
        newBullet.x=x+lengthdir_x(24,shotDir+dir)
        newBullet.y=y+lengthdir_y(24,shotDir+dir)
        newBullet.image_xscale=0.6
        newBullet.image_yscale=0.6
        newBullet.damageType="SPIRIT"
        newBullet.spiritPower=spiritPower
        newBullet.elementType=elementType
        newBullet.bulletSpeed=5
        //newBullet.direction=shotDir+dir
        newBullet._direction=shotDir+dir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)

        dir+=360/(round(shotAmt/2)+eShotDistorted)
      }
      shotDir+=12
    }
    if sprayTime>=sprayLength
      sprayProgress=3
  }

  if bActive=true and stunnedTime=0 and dieFade=0 and (sprayProgress<1 or sprayProgress>2)
  {
    //shotTime+=1
    shotTime+=gDeltaTime //60fps change: counts 30fps ticks
    //if shotTime=shotWait
    if scrCountPass(shotTime,shotWait) //60fps change: once, when the count reaches it
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
      dir=point_direction(x,y,oPlayer1.x,oPlayer1.y-26)
      for(i=0;i<shotAmt;i+=1)
      {
        effect=instance_create(x,y,oEffect)
        effect.x=x+lengthdir_x(24,dir)
        effect.y=y+lengthdir_y(24,dir)
        effect.sprite_index=sEnergyRip1
        effect.image_speed=0.75
        effect.image_xscale=0.2
        effect.image_yscale=0.2
        effect.newBlend=1

        newBullet=instance_create(x,y,oBTurretShot)
        newBullet.x=x+lengthdir_x(24,dir)
        newBullet.y=y+lengthdir_y(24,dir)
        newBullet.image_xscale=0.6
        newBullet.image_yscale=0.6
        newBullet.damageType="SPIRIT"
        newBullet.spiritPower=spiritPower
        newBullet.elementType=elementType
        newBullet.bulletSpeed=5
        //newBullet.direction=dir
        newBullet._direction=dir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)

        dir+=360/shotAmt
      }
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
