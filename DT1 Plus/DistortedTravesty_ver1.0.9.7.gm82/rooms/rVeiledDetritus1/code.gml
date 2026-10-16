global.dungeonMapData[0,0]=1
global.location="Veiled Detritus"
if global.showArea=true and global.gameProgress>=222
{
  areaDisplay=instance_create(0,0,oAreaDisplay)
  areaDisplay.areaString="Veiled Detritus"
}

if global.gameProgress<=221
{
  global.stockWeaponGem+=1
  global.stockArmor+=1
  global.stockRing+=1
  global.gameProgress=222
}
gameEvent=instance_create(0,0,oEvVeiledDetritusW1)
stopAllMusic()
