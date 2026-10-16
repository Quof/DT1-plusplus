background_index[0]=backHideout
background_visible[0]=true

if global.switchTrigger[11]=false
{
  instance_deactivate_object(oUseElevator)
  instance_deactivate_object(oObjTeleCon)
  levelEvent=instance_create(0,0,oEvTheHideoutW1)
}
mapShroudSpawn(1)
