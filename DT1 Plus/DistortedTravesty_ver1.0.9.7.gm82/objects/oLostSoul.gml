#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-9,-24,9,-1)
image_speed=0.3
image_alpha=0
detectDistX=160
detectDistY=192

//Enemy base statistics
eName="Lost Soul"
maxLife=800
life=maxLife
expWorth=2300
damageType="SPIRIT"
elementType=1
physicalPower=400
physicalDefense=220
spiritPower=460
spiritDefense=120
FIREresist=100
WATERresist=-50
WINDresist=-25
baseItemChance=60
moneyWorth=135
appearance=0
appearDist=100
appearDir=0
for(i=0;i<8;i+=1)
{
  ix[i]=0
  iy[i]=0
}
if global.difficulty=1
{
  runAcc=1
  shotWait=80
  fireAmount=5
}
else if global.difficulty=2
{
  runAcc=1.25
  shotWait=70
  fireAmount=6
}
else if global.difficulty=3
{
  runAcc=1.5
  shotWait=60
  fireAmount=7
}
else if global.difficulty=4
{
  runAcc=1.75
  shotWait=50
  fireAmount=8
}
shotTime=shotWait-30
bCanDealDamage=false
bCanTakeDamage=false
difficultyAdjustments(global.difficulty)
combatText="Simple homing enemy. When you see it stop, it is going to rain down large gravity based bullets. Just observe it once, you'll see what I mean. It's Physical Defense, as you can see, is very high. Either destroy it with spells or cripple it. Deals Fire damage."
sideText="I believe this is from the game Demon's Crest. I bet you remember that game. I'm sure you remember the hidden and very hard boss that shows up when you get all the crests. What a great moment that was when it was beaten."
cripplePointText=">Wind Fused Full Swing#>Wind Fused Upward Strike"
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
    if appearance=1
    {
      //if instance_exists(oCharacter) and shotTime<=shotWait+2
      if instance_exists(oCharacter) and shotTime<shotWait+3 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps; the same as <=shotWait+2 in whole ticks)
      {
        dir=point_direction(x,y,oCharacter.x,oCharacter.y-22)
        //moveTo(runAcc*cos(degtorad(dir)),-runAcc*sin(degtorad(dir)))
        moveTo(runAcc*cos(degtorad(dir))*gDeltaTime,-runAcc*sin(degtorad(dir))*gDeltaTime) //60fps change: this frame's share of a 30fps tick
      }

      //shotTime+=1
      shotTime+=gDeltaTime //60fps change: counts 30fps ticks
      if shotTime>=shotWait
      {
        //if shotTime=shotWait
        if scrCountPass(shotTime,shotWait) //60fps change: once, when the count reaches it
        {
          afterImage=instance_create(x,y,oEnemyAfterImage)
          afterImage.image_alpha=1
          afterImage.sprite_index=sprite_index
          afterImage.image_index=image_index
          afterImage.imageFade=0.04
          afterImage.xScalingSet=0.1
          afterImage.yScalingSet=0.1
        }
        //else if shotTime=shotWait+20
        else if scrCountPass(shotTime,shotWait+20) //60fps change: once, when the count reaches it
        {
          var dir;
          dir=point_direction(x,y,oPlayer1.x,oPlayer1.y-22)
          for(i=0;i<fireAmount;i+=1)
          {
            effect=instance_create(x,y,oEffect)
            effect.x=x+lengthdir_x(24,dir)
            effect.y=y+lengthdir_y(24,dir)
            effect.sprite_index=sEnergyRip1
            effect.image_speed=0.75
            effect.image_xscale=0.35
            effect.image_yscale=0.35
            effect.newBlend=1

            newAttack=instance_create(x,y,oShotzoBullet)
            newAttack.x=x+lengthdir_x(24,dir)
            newAttack.y=y+lengthdir_y(24,dir)
            newAttack.sprite_index=sBMFireball
            newAttack.damageType="SPIRIT"
            newAttack.spiritPower=spiritPower
            newAttack.elementType=1
            newAttack.yVel=random_range(-6,-3)
            newAttack.xVel=random_range(-2,2)
            dir+=360/fireAmount
          }
        }
        //else if shotTime=shotWait+45
        else if shotTime>=shotWait+45 //60fps change: >= so it still resets if the frame rate changes mid-count
          shotTime=0
      }
    }
  }
  enemyStepEvent()
}
#define Collision_oPartSlashes
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if cripplePointProgress=0
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_H_SLASH and other.elementType=3
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
}
else if cripplePointProgress=1
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_UP_SLASH and other.elementType=3
    inflictStatus(0)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if bActive=true and appearance=0 and global.gamePaused=false
{
  for(i=0;i<8;i+=1)
  {
    ix[i]=x+lengthdir_x(appearDist,appearDir+(i*45))
    iy[i]=y+lengthdir_y(appearDist,appearDir+(i*45))
    draw_sprite_ext(sprite_index,image_index,ix[i],iy[i],0.6,0.6,0,image_blend,0.75)
  }
  //appearDir+=5
  appearDir+=5*gDeltaTime //60fps change: per 30fps tick
  //appearDist-=2
  appearDist-=2*gDeltaTime //60fps change: per 30fps tick
  if appearDist<=0
  {
    detectDistX=280
    detectDistY=224
    bCanDealDamage=true
    bCanTakeDamage=true
    image_alpha=0.75
    appearance=1
  }
}
