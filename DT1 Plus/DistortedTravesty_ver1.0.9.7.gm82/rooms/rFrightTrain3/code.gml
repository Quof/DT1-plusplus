if global.gameProgress<=90
  global.gameProgress=91
if global.gameProgress<=92
  levelEvent=instance_create(0,0,oEvFTrainW1)
convoEvent=instance_create(0,0,oEvFTrainConvo1)

newEnemy=instance_create(464,-1,oBubblyPop)
newEnemy.detectDistY=288
newEnemy=instance_create(1328,-1,oBubblyPop)
newEnemy.detectDistY=288
newEnemy=instance_create(1424,-1,oBubblyPop)
newEnemy.detectDistY=288
newEnemy=instance_create(1728,-1,oBubblyPop)
newEnemy.detectDistY=288
newEnemy=instance_create(1792,-1,oBubblyPop)
newEnemy.detectDistY=288
mapShroudSpawn(1)
