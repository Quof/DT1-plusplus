#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
parent="enemy"
setCollisionBounds(-1,-1,1,1)
event_inherited()
#define Mouse_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false and combatText!=""
{
  with oMessageEnemy
    instance_destroy()
  newMessage=instance_create(view_xview[0]+32,view_yview[0]+24,oMessageEnemy)
  newMessage.name=eName
  newMessage.currentDisplay=combatText
  newMessage.combatData=combatText
  newMessage.sideComment=sideText
  newMessage.crippleData=cripplePointText
  newMessage.bossInfo=bIsBoss
  newMessage.life=maxLife
  newMessage.pPower=physicalPower
  newMessage.pDefense=physicalDefense
  newMessage.sPower=spiritPower
  newMessage.sDefense=spiritDefense
  newMessage.fireRes=FIREresist
  newMessage.waterRes=WATERresist
  newMessage.windRes=WINDresist
  newMessage.earthRes=EARTHresist
  newMessage.skillRes=skillResist
  newMessage.xPos=x
  newMessage.yPos=y
  newMessage.effectX=mouse_x
  newMessage.effectY=mouse_y
  newMessage.xFind=findTargetX
  newMessage.yFind=findTargetY
  newMessage.currentLife=life
}
