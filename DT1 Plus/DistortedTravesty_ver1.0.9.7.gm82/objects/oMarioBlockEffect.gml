#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
_hspeed=0 //60fps change (added): _hspeed/_vspeed stand in for the built-in hspeed/vspeed (see correctHSpeedVSpeed in the Step)
_vspeed=0 //60fps change (added)
decay=20
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if type=0 //top left
{
  //hspeed=-2
  _hspeed=-2 //60fps change: _hspeed (see correctHSpeedVSpeed in the Step)
  //vspeed=-6
  _vspeed=-6 //60fps change: _vspeed (see correctHSpeedVSpeed in the Step)
}
else if type=1 //top right
{
  //hspeed=2
  _hspeed=2 //60fps change: _hspeed (see correctHSpeedVSpeed in the Step)
  //vspeed=-6
  _vspeed=-6 //60fps change: _vspeed (see correctHSpeedVSpeed in the Step)
}
else if type=2 //bottom left
{
  //hspeed=-2
  _hspeed=-2 //60fps change: _hspeed (see correctHSpeedVSpeed in the Step)
  //vspeed=-3
  _vspeed=-3 //60fps change: _vspeed (see correctHSpeedVSpeed in the Step)
}
else if type=3 //bottom right
{
  //hspeed=2
  _hspeed=2 //60fps change: _hspeed (see correctHSpeedVSpeed in the Step)
  //vspeed=-3
  _vspeed=-3 //60fps change: _vspeed (see correctHSpeedVSpeed in the Step)
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//vspeed+=0.4
_vspeed=scrGravAcc(_vspeed,0.4,1) //60fps change: gravity per 30fps tick, following the 30fps arc

//decay-=1
decay-=gDeltaTime //60fps change: counts 30fps ticks
if decay<=0
  instance_destroy()
correctHSpeedVSpeed(id) //60fps change (added): moves it by _hspeed/_vspeed, this frame's share of a 30fps tick
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if type=0 //top left
  draw_sprite_general(sMarioBreakBlock,0,0,0,8,8,x,y,1,1,image_angle,c_white,c_white,c_white,c_white,1)
else if type=1 //top right
  draw_sprite_general(sMarioBreakBlock,0,8,0,8,8,x,y,1,1,image_angle,c_white,c_white,c_white,c_white,1)
else if type=2 //bottom left
  draw_sprite_general(sMarioBreakBlock,0,0,8,8,8,x,y,1,1,image_angle,c_white,c_white,c_white,c_white,1)
else if type=3 //bottom right
  draw_sprite_general(sMarioBreakBlock,0,8,8,8,8,x,y,1,1,image_angle,c_white,c_white,c_white,c_white,1)
