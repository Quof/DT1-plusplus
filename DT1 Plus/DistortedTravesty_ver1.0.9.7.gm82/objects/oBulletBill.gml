#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1

//Enemy base statistics
eName="Bullet Bill"
maxLife=190
life=maxLife
expWorth=25
physicalPower=200
physicalDefense=55
spiritDefense=50
FIREresist=30
WATERresist=-70
WINDresist=45
EARTHresist=60
skillResist=5
noMoneyBonus=true
baseItemChance=20
if global.difficulty=1
  runAcc=6
else if global.difficulty=2
  runAcc=7
else if global.difficulty=3
  runAcc=8
else if global.difficulty=4
  runAcc=9.1
difficultyAdjustments(global.difficulty)
if x>oPlayer1.x
  runAcc*=-1
if runAcc>0
  image_xscale=1
else
  image_xscale=-1
inactiveDist*=2
combatText="The infamous Bullet Bill. You know these are going to cause some annoyance. They just go in one direction and only left or right. They are resistant to most elements, but I'm seeing a Water weakness for them. Also here's a fun fact about Bill Blasters. If you stand close to them, they won't fire Bullet Bills. They get scared."
sideText="My combat related info keeps getting mixed in with my own personal side comments for all these Mario related bad guys. It's interesting the lives that Bullet Bills have. I mean you can't help but feel sorry for them a little bit. I understand why they are so angry all the time too. I mean seriously, their whole life consists of being shot out of a large cannon. Who knows what happens to them then. They just fly off the screen and then disappear forever."
cripplePointText=">Any Water Fused Physical Attack"
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
    if findTargetX>inactiveDist/2
    {
      if questType>0
        enemyQuest(questType)
      instance_destroy()
    }

    x+=runAcc
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
if damageTime=flashTime and dieFade=0 and other.elementType=2
{
  inflictStatus(0)
}
