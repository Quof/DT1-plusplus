mHeadSpawner=instance_create(0,0,oMedusaHeadSpawner)
mHeadSpawner.reSpawnSpeed=110
if global.gameProgress<=89
  global.gameProgress=90
if global.gameProgress=90
  convoEvent=instance_create(0,0,oEvFTrainConvo1)
trainNumbers=instance_create(0,0,oEvFTrainNumbers)
mapShroudSpawn(1)
