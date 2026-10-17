#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
  makeEnemyActive()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if elementHit>0
  //draw_sprite(sPuzzleCrystal,elementHit-1,x,y-48)
  scrDrawElemSprite(0,elementHit,x,y-48,1,1,0,1) //element colors change: its crystal in the colour picked for its element (Element Colors, Options Set 3)
