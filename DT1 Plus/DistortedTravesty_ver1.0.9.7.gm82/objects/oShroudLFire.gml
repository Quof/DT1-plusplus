#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-9,-9,9,9)

//Enemy base statistics
if global.difficulty=1
  spiritPower=oPlayer1.maxLife/7
else if global.difficulty=2
  spiritPower=oPlayer1.maxLife/6
else if global.difficulty=3
  spiritPower=oPlayer1.maxLife/5
else if global.difficulty=4
  spiritPower=oPlayer1.maxLife/4
damageType="SPIRIT"
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
init=0
size=2
spiralTime=0
imageSize=0
if global.difficulty=1
  growSpeed=0.04
else if global.difficulty=2
  growSpeed=0.05
else if global.difficulty=3
  growSpeed=0.06
else if global.difficulty=4
  growSpeed=0.07
wallHit=false
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
    dir=point_direction(x,y,oCharacter.x,oCharacter.y-22)
    init=1
  }
  if wallHit=false
  {
    //spiritPower+=global.difficulty
    spiritPower+=global.difficulty*gDeltaTime //60fps change: per 30fps tick
    //image_angle-=10
    image_angle-=10*gDeltaTime //60fps change: per 30fps tick
    //image_xscale+=growSpeed
    image_xscale+=growSpeed*gDeltaTime //60fps change: per 30fps tick
    //image_yscale+=growSpeed
    image_yscale+=growSpeed*gDeltaTime //60fps change: per 30fps tick
    if isCollisionBottom(1)
      wallHit=true
    if isCollisionLeft(1)
      wallHit=true
    if isCollisionRight(1)
      wallHit=true
    if isCollisionTop(1)
      wallHit=true
    //moveTo(throwSpeed*cos(degtorad(dir)),-throwSpeed*sin(degtorad(dir)))
    moveTo(throwSpeed*cos(degtorad(dir))*gDeltaTime,-throwSpeed*sin(degtorad(dir))*gDeltaTime) //60fps change: this frame's share of a 30fps tick
  }
  else
  {
    if imageSize=0
    {
      if room!=rDataSegment20
        image_blend=c_black
      spiritPower-=50
      imageSize=image_xscale/20
    }
    //image_xscale-=imageSize
    image_xscale-=imageSize*gDeltaTime //60fps change: per 30fps tick
    //image_yscale-=imageSize
    image_yscale-=imageSize*gDeltaTime //60fps change: per 30fps tick
    //image_alpha-=0.02
    image_alpha-=0.02*gDeltaTime //60fps change: per 30fps tick
    //spiralTime+=1
    spiralTime+=gDeltaTime //60fps change: counts 30fps ticks
    if spiralTime>=19
      instance_destroy()
  }
}
#define Collision_oPlayer1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if oPlayer1.bCanTakeHit=true and oPlayer1.dashInvulnerabilityTime=0 and oPlayer1.jumpSlashPower<=49
{
  if instance_exists(ownerID)
  {
    var lifeHeal;
    lifeHeal=(spiritPower-oPlayer1.spiritDefense)*10
    newDamage=instance_create(ownerID.x,ownerID.y-(ownerID.sprite_height/2),oDamageNotice);
    newDamage.damageValue=lifeHeal
    newDamage.damageColor=c_green
    ownerID.life+=lifeHeal
    if ownerID.life>ownerID.maxLife
      ownerID.life=ownerID.maxLife
  }
}
event_inherited()
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
