#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
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
if oQuickTimeDistorter.life<=0
  instance_destroy()
if init=0
{
  path_start(pQTD_Orb,3,2,false)
  path_position=0.25*type
  pos=path_position
  init=1
}
path_end()
x=oQuickTimeDistorter.x+20
y=oQuickTimeDistorter.y-28

path_start(pQTD_Orb,3,2,false)
if bSpinning=true
{
  //pos+=0.01
  pos+=0.01*gDeltaTime //60fps change: per 30fps tick
  if pos>=1
    pos=0
}
path_position=pos
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if image_speed>0
{
  if type=0
    gColor=c_red
  else if type=1
    gColor=c_blue
  else if type=2
    gColor=c_green
  else if type=3
    gColor=make_color_rgb(150,85,0)
  draw_set_blend_mode(bm_add)
  draw_circle_color(x,y,16,gColor,c_black,false)
  draw_set_blend_mode(bm_normal)
}
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale,0,image_blend,image_alpha)
