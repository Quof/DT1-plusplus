gameEvent=instance_create(0,0,oEvDistortionW4)
eventBackDummy=instance_create(0,0,oEvDistortion4_BackDummy)
eventLight=instance_create(0,0,oEvDistortion4_PlayerLamp)
eventBlackLayer=instance_create(0,0,oEvDistortion4_BlackLayer)
if global.gameProgress<=256
  global.gameProgress=257
if global.gameProgress<=258
  levelEvent=instance_create(0,0,oEvDistortionConvo4)
