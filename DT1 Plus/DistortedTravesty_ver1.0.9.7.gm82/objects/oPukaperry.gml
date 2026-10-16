#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-1,-1,1,1)
image_speed=0
//Enemy base statistics
eName="Pukaperry"
maxLife=220
life=maxLife
expWorth=400
physicalPower=240
physicalDefense=100
spiritDefense=100
baseItemChance=60
dropInd=-10
moneyWorth=70
hitSound=global.snd_MMeHit
dieEffect=sMMExplosion
dieSound=global.snd_CASdie
reHitTime=5
if global.difficulty=1
{
  waitTime=60
  shootSpeed=6
}
else if global.difficulty=2
{
  waitTime=50
  shootSpeed=7
}
else if global.difficulty=3
{
  waitTime=40
  shootSpeed=8
}
else if global.difficulty=4
{
  waitTime=30
  shootSpeed=9
}
shootTime=0
bFindDirection=false
difficultyAdjustments(global.difficulty)
combatText="In the original source this is based on, it doesn't fire at you, but it's been slightly modified. I know that in a later Mega Man game, there was something exactly like this.#First Appearance: Mega Man 5"
sideText="This type of enemy has many other similar types of enemies. Such as the 'Flying Shell', 'Lyric', 'Propeller Eye', Tripropellern', and 'Diarn'."
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
  if bActive=true and dieFade=0
  {
    shootTime+=1
    if image_index=0 //roaming
    {
      speed=6
      if bFindDirection=false
      {
        direction=point_direction(x,y,oPlayer1.x,oPlayer1.y-28)
        bFindDirection=true
      }
      if shootTime>=20
      {
        image_index=1
        shootTime=0
        if x>oCharacter.x
          image_xscale=-1
        else
          image_xscale=1
        bFindDirection=false
      }
    }
    else if image_index=1 //shooting/waiting
    {
      speed=0
      if shootTime=waitTime/2
      {
        newAttack=instance_create(x,y,oMMeShot1)
        newAttack.physicalPower=physicalPower
        newAttack.bulletSpeed=shootSpeed
        newAttack.direction=point_direction(x,y,oPlayer1.x,oPlayer1.y-28)
      }
      else if shootTime>=waitTime
      {
        image_index=0
        shootTime=0
      }
    }
  }
  enemyStepEvent()
}
else
  speed=0
