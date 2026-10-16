#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_number(self)>1
  instance_destroy()
changeShake=2
viewDirChange=changeShake/2
viewDirShake="Right"
alarm[0]=8
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
view_wview=512
view_hview=384
instance_destroy()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
viewDirChange+=1

if viewDirChange=changeShake
{
  if viewDirShake="Right"
    viewDirShake="Left"
  else
    viewDirShake="Right"
  viewDirChange=0
}

if viewDirShake="Right"
  view_wview+=6
else
  view_wview-=6
