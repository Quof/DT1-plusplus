image_blend=c_blue
swAmount=2
switchID[0]=instance_create(2224,224,oTimedSwitch)
switchID[1]=instance_create(2304,224,oTimedSwitch)
triggerID=12
if global.switchTrigger[12]=1
{
  switchID[0].activated=2
  switchID[0].image_speed=1
  switchID[1].activated=2
  switchID[1].image_speed=1
  instance_destroy()
}
