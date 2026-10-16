background_alpha[0]=0.9
background_visible[1]=1
background_alpha[1]=0
background_xscale[1]=0.5
background_yscale[1]=0.5

if global.gameProgress<=334
  global.gameProgress=335
gameEvent=instance_create(0,0,oEvPrimaryMemoryW1)
levelEvent=instance_create(0,0,oEvPrimaryMemoryConvo1)

if global.gameProgress>=338
{
  exitMidDoor=instance_create(1616,288,oExit)
  exitMidDoor.sprite_index=sMidLevelDoor
  exitMidDoor.bShowArrow=false
  exitMidDoor.exitType=0
  exitMidDoor.newMapX=160
  exitMidDoor.newMapY=256
  exitMidDoor.toRoom=rPrimaryMemory1

  exitToCore=instance_create(1840,288,oExit)
  exitToCore.sprite_index=sDataPortal
  exitToCore.image_yscale=1.5
  exitToCore.bShowArrow=false
  exitToCore.exitType=0
  exitToCore.newMapX=0
  exitToCore.newMapY=0
  exitToCore.toRoom=rPrimaryMemory7
  exitToCore.newStep=60
  exitToCore.newTrans=20
}

if global.currentBoss="Mecha Guardian"
{
  barrier=instance_create(512,0,oBossBarrier)
  barrier.image_yscale=5
  barrierTop=instance_create(1648,-320,oBossBarrier)
  barrierTop.image_yscale=5
  oPlayer1.x=1744
  oPlayer1.y=320
  oPlayer1.bUseBusterShot=1
  storeStatus(1)
  bulletBarrier=instance_create(1344,320,oMisc)
  bulletBarrier.sprite_index=sDTorsoLightning
  bulletBarrier.image_xscale=0.75
  bulletBarrier.image_yscale=5
  bulletBarrier.image_speed=0.33
  bulletBarrier.image_blend=c_green
  bulletBarrier.image_alpha=0.4
  bulletBarrier.type=1
  boss=instance_create(1950,246,oMechaGuardian)
  boss.activateBoss=1
}
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
