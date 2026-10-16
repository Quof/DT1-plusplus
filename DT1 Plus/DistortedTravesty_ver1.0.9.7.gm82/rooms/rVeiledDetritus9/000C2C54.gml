image_yscale=1.5
image_blend=c_blue
swAmount=3
switchID[0]=instance_create(1552,208,oTimedSwitch)
switchID[1]=instance_create(1760,208,oTimedSwitch)
switchID[2]=instance_create(1672,200,oTimedSwitch)
triggerID=13
if global.switchTrigger[13]=1
{
  switchID[0].activated=2
  switchID[0].image_speed=1
  switchID[1].activated=2
  switchID[1].image_speed=1
  switchID[2].activated=2
  switchID[2].image_speed=1
  instance_destroy()
}
