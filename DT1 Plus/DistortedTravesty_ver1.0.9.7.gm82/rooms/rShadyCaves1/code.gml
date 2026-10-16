global.location="Shady Caves"
backFollow1=instance_create(0,0,oBackgroundFollow)
backFollow1.type=2
backFollow1.backSet=backShadyCavesWall
backFollow1.image_xscale=2
backFollow1.image_yscale=2
backFollow1.xMoveScale=0.9
backFollow1.yMoveScale=0.9
backFollow2=instance_create(0,0,oBackgroundFollow)
backFollow2.type=2
backFollow2.backSet=backShadyCaves
backFollow2.image_xscale=2.5
backFollow2.image_yscale=2.5
backFollow2.xMoveScale=0.85
backFollow2.yMoveScale=0.85
backFollow2.depth=1400000

if global.showArea=true and global.gameProgress>=267
{
  areaDisplay=instance_create(0,0,oAreaDisplay)
  areaDisplay.areaString="Shady Caves"
}
fDemonSpawner=instance_create(0,0,oFlyingDemonSpawner)
fDemonSpawner.reSpawnSpeed=240
if global.gameProgress<=266
  global.gameProgress=267
if global.gameProgress=267
  levelEvent=instance_create(0,0,oEvShadyWoodsW1)
if global.gameProgress<=268
  levelEvent=instance_create(0,0,oEvShadyWoodsConvo1)
mapShroudSpawn(1)
if global.gameProgress>=268
{
  var tempMplay;
  tempMplay=findMusic()
  playMusic(tempMplay,0)
}
