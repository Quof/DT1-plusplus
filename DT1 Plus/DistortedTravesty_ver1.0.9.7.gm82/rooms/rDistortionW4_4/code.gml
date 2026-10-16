gameEvent=instance_create(0,0,oEvDistortionW4)
if global.gameProgress<=254
  global.gameProgress=255
if global.gameProgress<=256
{
  levelEvent=instance_create(0,0,oEvDistortionConvo4)
  eventLight=instance_create(0,0,oEvDistortion4_PlayerLamp)
}
trapEvent=instance_create(0,0,oEvDistortion4_Traps)
