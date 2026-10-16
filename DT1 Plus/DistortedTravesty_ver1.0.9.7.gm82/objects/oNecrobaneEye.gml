#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0.26
init=0
pos=0
bSpinning=false
gColor=c_red
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
  image_xscale=oNecrobane.image_xscale
if oNecrobane.life<=0
  instance_destroy()
