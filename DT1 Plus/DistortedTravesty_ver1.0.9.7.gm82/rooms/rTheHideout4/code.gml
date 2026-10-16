background_index[0]=backHideout
background_visible[0]=true
if global.gameProgress<=110
{
  instance_deactivate_object(oPlatformScale)
  levelEvent=instance_create(0,0,oEvTheHideoutW1)
}
mapShroudSpawn(1)
