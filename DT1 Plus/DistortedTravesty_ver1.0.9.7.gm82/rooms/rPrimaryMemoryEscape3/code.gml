backFollow1=instance_create(0,0,oBackgroundFollow)
backFollow1.type=4
backFollow1.backSet=backPrimaryMemory2
backFollow1.xMoveScale=0.8
backFollow1.yMoveScale=0.8
backFollow1.shakeTime=0
gameEvent=instance_create(0,0,oEvPrimaryMemoryW1)
levelEvent=instance_create(0,0,oEvPrimaryMemoryConvo1)
escapeEvent=instance_create(0,0,oEvEscapeEffects)

if global.gameProgress<=344
  global.gameProgress=345
