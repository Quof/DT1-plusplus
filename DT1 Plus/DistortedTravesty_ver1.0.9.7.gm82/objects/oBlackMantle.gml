#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-14,-24,14,24)
image_speed=0.1
xSplit=0

//Enemy base statistics
eName="Black Mantle"
maxLife=1300
life=maxLife
expWorth=2250
physicalPower=310
physicalDefense=130
spiritPower=330
spiritDefense=160
FIREresist=50
WATERresist=-50
WINDresist=-75
EARTHresist=75
skillResist=5
baseItemChance=70
dropInd=-10
moneyWorth=145
bCanDealDamage=false
bCanTakeDamage=false
if global.difficulty=1
{
  idleWait=55
  phaseWait=40
  fireAmount=6
}
else if global.difficulty=2
{
  idleWait=45
  phaseWait=30
  fireAmount=8
}
else if global.difficulty=3
{
  idleWait=35
  phaseWait=20
  fireAmount=10
}
else if global.difficulty=4
{
  idleWait=25
  phaseWait=10
  fireAmount=12
}
idleTime=0
phaseTime=phaseWait-10
attackProgress=0
difficultyAdjustments(global.difficulty)
combatText="Easy pattern for these guys. They'll simply teleport and attack... and then repeat it."
sideText="This comes from a game called 'Pocky and Rocky'."
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
    if attackProgress=0 //wait to phase in
    {
      phaseTime+=1
      if phaseTime>=phaseWait
      {
        //find new spot
        x=random_range(oPlayer1.x-208,oPlayer1.x+208)
        y=random_range(oPlayer1.y-128,oPlayer1.y+96)
        while(place_meeting(x,y,oSolid)) //and x<16 and x>room_width-16 and y<16 and y>room_height-16)
        {
          x=random_range(oPlayer1.x-208,oPlayer1.x+208)
          y=random_range(oPlayer1.y-128,oPlayer1.y+96)
        }
        phaseTime=0
        xSplit=32
        attackProgress=1
      }
    }
    else if attackProgress=1 //phase in
    {
      xSplit-=1
      if xSplit<=0
      {
        bCanDealDamage=true
        bCanTakeDamage=true
        attackProgress=2
      }
    }
    else if attackProgress=2 //wait and attack
    {
      idleTime+=1
      if idleTime>=idleWait
      {
        if idleTime=idleWait
          sprite_index=sBlackMantleArmUp
        else if idleTime=idleWait+15
        {
          sprite_index=sBlackMantleCast
          var dir,arc;
          dir=0
          arc=15+irandom(10)
          for(i=0;i<fireAmount;i+=1)
          {
            newBullet=instance_create(x,y,oMMeShotArc)
            newBullet.sprite_index=sBMFireball
            newBullet.depth=9
            newBullet.damageType="SPIRIT"
            newBullet.spiritPower=spiritPower
            newBullet.bDestroyOnOutside=1
            newBullet.elementType=1
            newBullet.bulletSpeed=5
            newBullet.direction=dir
            newBullet.arcTime=arc
            newBullet.bulletArc=10
            dir+=360/fireAmount
          }
        }
        else if idleTime=idleWait+40
        {
          sprite_index=sBlackMantleIdle
          bCanDealDamage=false
          bCanTakeDamage=false
          idleTime=0
          attackProgress=3
        }
      }
    }
    else if attackProgress=3 //phase out
    {
      xSplit+=1
      if xSplit>=32
        attackProgress=0
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
if attackProgress=1 or attackProgress=3
{
  draw_set_blend_mode(bm_add)
  for(i=0;i<sprite_height;i+=2)
    draw_sprite_part(sprite_index,image_index,0,i,sprite_width,1,x+xSplit-(sprite_width/2),y+i-(sprite_height/2))
  for(i=1;i<sprite_height;i+=2)
    draw_sprite_part(sprite_index,image_index,0,i,sprite_width,1,x-xSplit-(sprite_width/2),y+i-(sprite_height/2))
  draw_set_blend_mode(bm_normal)
}
if attackProgress=2
  event_inherited()
