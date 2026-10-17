#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
visible=false
//Enemy base statistics
eName="Clippy"
maxLife=700
life=maxLife
expWorth=1000
damageType="SPIRIT"
physicalDefense=80
spiritPower=230
spiritDefense=80
FIREresist=100
WATERresist=-100
WINDresist=100
EARTHresist=100
baseItemChance=60
moneyWorth=120
if directory_exists("C:\Program Files\OpenOffice")=1
  openOExists=1
else
  openOExists=0
inactiveDist=detectDistX*2
difficultyAdjustments(global.difficulty)
combatText="What's there to say about it? It just pops up and gets in the way."
sideText="I hate this thing sooo much! Actually, is there anyone in the world that doesn't hate it? I'm starting to think that MS Office has the employees held hostage because no one in their right mind would create such a thing... Wait, that explains it."
cripplePointText=">None#Well... Open Office exists"
messageShowProg=0
msgPopupWidth=164
msgPopupHeight=64
var stringChoose;
stringChoose=choose(0,1)
if stringChoose=0
  stringToShow="Sometimes I just pop up for no#particular reason, like now."
else if stringChoose=1
  stringToShow="I seem to be getting in the way.#Lol, it's what I do."
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
    if messageShowProg=0
    {
      visible=true
      x=view_xview[0]+view_wview[0]-100
      y=view_yview[0]+view_hview[0]
      yOrig=y
      messageShowProg=1
    }
    else if messageShowProg=1
    {
      //y-=6
      y-=6*gDeltaTime //60fps change: per 30fps tick
      if y<yOrig-100
      {
        messageShowProg=2
        y=yOrig-6*ceil((yOrig-y)/6) //60fps change (added): stops where 30fps stops (a whole number of 6px ticks up)
      }
    }
  }
  enemyStepEvent()
}
#define Collision_oAttackBase
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if damageTime=flashTime and dieFade=0 and openOExists=1
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
if messageShowProg=2
{
  draw_set_alpha(image_alpha)
  draw_set_color(make_color_rgb(254,254,204))
  draw_roundrect(x-74,y-84,x-74+msgPopupWidth,y-84+msgPopupHeight,false)
  draw_set_color(c_black)
  draw_roundrect(x-74,y-84,x-74+msgPopupWidth,y-84+msgPopupHeight,true)
  draw_set_color(make_color_rgb(254,254,204))
  draw_triangle(x-10,y-20,x,y-20,x,y-4,false)
  draw_set_color(c_black)
  draw_triangle(x-10,y-20,x,y-20,x,y-4,true)
  draw_set_color(make_color_rgb(254,254,204))
  draw_line(x-9,y-20,x-1,y-20)
  draw_set_color(c_black)
  draw_set_font(fnt_MSWorld)
  draw_set_halign(fa_left)
  draw_text(x-62,y-75,stringToShow)
}
