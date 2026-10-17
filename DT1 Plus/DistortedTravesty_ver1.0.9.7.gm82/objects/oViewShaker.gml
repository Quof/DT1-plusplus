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
//alarm[0]=8
alarm[0]=8/gDeltaTime //60fps change: alarms count frames; 8 30fps ticks as before
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
//60fps change: the shake counts and moves per 30fps tick (*gDeltaTime)
//viewDirChange+=1
viewDirChange+=gDeltaTime

//if viewDirChange=changeShake
if viewDirChange>=changeShake //60fps change: (it counts in fractions)
{
  if viewDirShake="Right"
    viewDirShake="Left"
  else
    viewDirShake="Right"
  viewDirChange=0
}

if viewDirShake="Right"
  //view_wview+=6
  view_wview+=6*gDeltaTime //60fps change: see above
else
  //view_wview-=6
  view_wview-=6*gDeltaTime //60fps change: see above
