#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0.15

if y<room_height
{
  newWaterfall=instance_create(x,y+16,oWaterfallEffect)
  newWaterfall.sprite_index=sTileWaterfallBody
}

if position_meeting(x,y,oInvisibleSolid)
  instance_destroy()
findTargetX=0
findTargetY=0
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if position_meeting(x,y+16,oInvisibleSolid)
  sprite_index=sTileWaterfallBottom
if position_meeting(x,y-16,oInvisibleSolid)
  sprite_index=sTileWaterfallShadow
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
findTargetX=point_distance(oCharacter.x,0,x,0)
findTargetY=point_distance(0,oCharacter.y,0,y)
if findTargetX<512 and findTargetY<384
  draw_sprite(sprite_index,image_index,x,y)
