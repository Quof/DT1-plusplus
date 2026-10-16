#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//set in the instance creation code
//GM8.2 change (added): the room gives the switches' old GM8.1 ids (doorCache1/doorCache2); look them up (see GID)
if variable_local_exists("doorCache1") {doorId1=GID(doorCache1)}
if variable_local_exists("doorCache2") {doorId2=GID(doorCache2)}
if !variable_local_exists("doorId2")
  image_yscale=doorId1.stepScale*scaleFactor
else
{
  if doorId1.stepScale<doorId2.stepScale
    image_yscale=doorId1.stepScale*scaleFactor
  else
    image_yscale=doorId2.stepScale*scaleFactor
}

if image_yscale<1 {image_yscale=1}
draw_sprite_ext(sStepSwitchBottom,-1,x,y,1,image_yscale,image_angle,image_blend,1)
