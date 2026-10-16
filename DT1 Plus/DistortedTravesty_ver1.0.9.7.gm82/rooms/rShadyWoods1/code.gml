global.location="Shady Woods"
backFollow=instance_create(0,0,oBackgroundFollow)
backFollow.type=2
backFollow.backSet=backShadyWoods
backFollow.image_xscale=1.6
backFollow.image_yscale=1.6
backFollow.xMoveScale=0.75
backFollow.yMoveScale=0.75
backFollowFore=instance_create(0,0,oBackgroundFollow)
backFollowFore.type=2
backFollowFore.backSet=backShadyWoodsTrees
backFollowFore.image_xscale=1.13
backFollowFore.image_yscale=1.13
backFollowFore.xMoveScale=-0.2
backFollowFore.yMoveScale=-0.2
backFollowFore.depth=5

if global.showArea=true and global.gameProgress>=243
{
  areaDisplay=instance_create(0,0,oAreaDisplay)
  areaDisplay.areaString="Shady Woods"
}
if global.gameProgress<=242
  global.gameProgress=243
if global.gameProgress=243
  levelEvent=instance_create(0,0,oEvShadyWoodsW1)
if global.gameProgress>=244
  mapShroudSpawn(1)
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
