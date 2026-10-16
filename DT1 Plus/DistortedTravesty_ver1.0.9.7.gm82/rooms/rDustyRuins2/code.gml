if global.difficulty>1
  boulder=instance_create(560,-48,oBigBoulder)
boulder=instance_create(2496,-48,oBigBoulder)
if global.difficulty>1
  boulder=instance_create(2688,-48,oBigBoulder)
boulder=instance_create(2880,-48,oBigBoulder)
if global.difficulty>1
  boulder=instance_create(3072,-48,oBigBoulder)
boulder=instance_create(3264,-48,oBigBoulder)
boulder=instance_create(3792,-48,oBigBoulder)

if global.gameProgress<=72
  global.gameProgress=73
if global.gameProgress=73
  levelEvent=instance_create(0,0,oEvDustyRuinsW1)
mapShroudSpawn(1)
