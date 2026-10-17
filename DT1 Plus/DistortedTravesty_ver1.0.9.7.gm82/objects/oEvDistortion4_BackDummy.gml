#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//path_start(pTGbackCurve,1.25,2,0)
path_start(pTGbackCurve,1.25*gDeltaTime,2,0) //60fps change: a path moves path_speed every frame; 1.25 per 30fps tick (kept in step below)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
path_speed=1.25*gDeltaTime //60fps change (added): keeps the path at 1.25 per 30fps tick if the frame rate changes
