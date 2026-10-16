#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
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
  noteCreate-=1
  if noteCreate<=0
  {
    var noteX,noteY,noteSprite;
    noteX=x-16+random(32)
    noteY=y-sprite_height-random_range(10,14)
    noteSprite=irandom_range(1,3)
    kkNote=instance_create(noteX,noteY,oEvCreditCharacter)
    kkNote.depth=111
    kkNote.direction=random_range(50,130)
    kkNote.speed=random_range(0.3,0.8)
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
  fadeTime+=1
  if fadeTime>=15
  {
    image_alpha-=0.05
    if image_alpha<=0
      instance_destroy()
  }
}
else
{
  if x>=room_width*2 or x<=-room_width*2
    instance_destroy()
}
