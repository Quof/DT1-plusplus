#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
_hspeed=0 //60fps change (added): _hspeed/_vspeed stand in for the built-in hspeed/vspeed (see correctHSpeedVSpeed in the Step)
_vspeed=0 //60fps change (added)
noteCreate=0
fadeTime=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if sprite_index=sKKSlider
{
  //noteCreate-=1
  noteCreate-=gDeltaTime //60fps change: counts 30fps ticks
  if noteCreate<=0
  {
    var noteX,noteY,noteSprite;
    noteX=x-16+random(32)
    noteY=y-sprite_height-random_range(10,14)
    noteSprite=irandom_range(1,3)
    kkNote=instance_create(noteX,noteY,oEvCreditCharacter)
    kkNote.depth=111
    //kkNote.direction=random_range(50,130)
    //kkNote.speed=random_range(0.3,0.8)
    //60fps change: _hspeed/_vspeed (see correctHSpeedVSpeed): the direction and speed split up as GM did it (the same
    //random calls, in the same order)
    var noteDir,noteSpd;
    noteDir=random_range(50,130)
    noteSpd=random_range(0.3,0.8)
    kkNote._hspeed=lengthdir_x(noteSpd,noteDir)
    kkNote._vspeed=lengthdir_y(noteSpd,noteDir)
    if noteSprite=1
      kkNote.sprite_index=sNoteSingle
    else if noteSprite=2
      kkNote.sprite_index=sNoteDouble
    else if noteSprite=3
      kkNote.sprite_index=sNoteHalf
    noteCreate=irandom_range(20,40)
  }
}
else if sprite_index=sNoteSingle or sprite_index=sNoteDouble or sprite_index=sNoteHalf
{
  //fadeTime+=1
  fadeTime+=gDeltaTime //60fps change: counts 30fps ticks
  //if fadeTime>=15
  if fadeTime>14 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
  {
    //image_alpha-=0.05
    image_alpha-=0.05*gDeltaTime //60fps change: per 30fps tick
    if image_alpha<=0
      instance_destroy()
  }
}
else
{
  if x>=room_width*2 or x<=-room_width*2
    instance_destroy()
}
correctHSpeedVSpeed(id) //60fps change (added): moves it by _hspeed/_vspeed, this frame's share of a 30fps tick
