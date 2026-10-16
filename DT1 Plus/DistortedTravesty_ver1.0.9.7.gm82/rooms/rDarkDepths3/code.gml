mHeadSpawner=instance_create(0,0,oMedusaHeadSpawner)
mHeadSpawner.reSpawnSpeed=115
if global.gameProgress<=38
  global.gameProgress=39

if global.gameProgress=39
  convoEvent=instance_create(0,0,oEvTransylvaniaConvo1)
mapShroudSpawn(1)
