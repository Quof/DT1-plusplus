global.location="Dusty Ruins"
if global.showArea=true and global.gameProgress>=71
{
  areaDisplay=instance_create(0,0,oAreaDisplay)
  areaDisplay.areaString="Dusty Ruins"
}
if global.difficulty>1
  boulder=instance_create(2352,-48,oBigBoulder)
boulder=instance_create(3328,-48,oBigBoulder)
boulder=instance_create(3680,-48,oBigBoulder)

if global.gameProgress<=70
  global.gameProgress=71
if global.gameProgress=71
  levelEvent=instance_create(0,0,oEvDustyRuinsW1)
mapShroudSpawn(1)
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
