background_index[0]=backHideout
background_visible[0]=true

oObjectDispenser.y-=64

if global.gameProgress=111
  levelEvent=instance_create(0,0,oEvTheHideoutW1)

if global.gameProgress>=113
{
  with oSwitchBarrier
    instance_destroy()
}
mapShroudSpawn(1)
