#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-13,-21,13,-1)
image_speed=0.3

//Enemy base statistics
eName="Light Bulb Bat"
maxLife=410
life=maxLife
expWorth=290
damageType="SPIRIT"
physicalDefense=40
spiritPower=210
spiritDefense=50
FIREresist=50
WATERresist=40
WINDresist=-25
EARTHresist=-65
baseItemChance=70
moneyWorth=37
fadeInTime=0
weight=120
if global.difficulty=1
  runAcc=1.1
else if global.difficulty=2
  runAcc=1.3
else if global.difficulty=3
  runAcc=1.5
else if global.difficulty=4
  runAcc=1.9
difficultyAdjustments(global.difficulty)
combatText="These things are a little weird. They track you, but at the same time, they're a little random with this. It's like they see you but they're cross-eyed or something. If they bug you that much, just ignore them."
sideText="I think these things are a little stupid. And Light Bulb Bat? Why a name like that? Oh well, the light they give off is nice and... somewhat annoying."
cripplePointText=">Earth Fused Full Swing"
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
      ran1=-50+random(25)
      ran2=-50+random(25)
      dir=point_direction(x,y,oCharacter.x,oCharacter.y-22)
      dir1=dir+ran1
      dir2=dir+ran2
      moveTo(runAcc*cos(degtorad(dir1)),-runAcc*sin(degtorad(dir2)))
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
if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_H_SLASH and other.elementType=4
{
  inflictStatus(0)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
draw_set_alpha(random(0.25)+0.15)
draw_set_blend_mode(bm_add)
draw_circle_color(x,y-6,18,make_color_rgb(240,193,64),c_black,false)
draw_set_blend_mode(bm_normal)
