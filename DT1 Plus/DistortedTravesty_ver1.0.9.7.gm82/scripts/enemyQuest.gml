/*
This script is called when an enemy dies that has a quest value attached to it.
It is used for scripted events such as bosses.
*/
if global.location!="Boss Room"
{
  if argument0=1
    oGlobalEvent.enemyCount-=1
  else if argument0=2
    oEvIEF.enemyCount-=1
  else if argument0=3
    oEvMarioW1.enemyCount-=1
  else if argument0=4
    oEvTransylvaniaW1.enemyCount-=1
  else if argument0=5
    oEvFTrainW1.enemyCount-=1
  else if argument0=6
    oEvDistortionW2.enemyCount-=1
}
