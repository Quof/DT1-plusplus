#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle=270
image_xscale=4
image_yscale=0.5
image_speed=0.6
image_blend=make_color_rgb(200,70,0)
#define Collision_oHurricaneDash
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if oArrghus.breakProgress=1
{
  playSound(global.snd_BreakOut,0,1)
  oVDbossBlocks.lbMoveDir=1
  oVDbossBlocks.rbMoveDir=1
  oVDbossBlocks.blsbMoveDir=1
  oVDbossBlocks.brsbMoveDir=1
  oVDbossBlocks.bllbMoveDir=1
  oVDbossBlocks.brlbMoveDir=1
  oEvVeiledDetritusW1.bossFinishFadeAlpha=1
  oArrghus.breakProgress=2
  instance_destroy()
}
