global.location="Toad Town"
if global.showArea=true and global.gameProgress>=17
{
  areaDisplay=instance_create(0,0,oAreaDisplay)
  areaDisplay.areaString="Toad Town"
}
if global.gameProgress<=16
{
  global.stockWeaponGem+=1
  global.stockArmor+=1
  global.stockRing+=1
  global.gameProgress=17
}
if global.gameProgress=17
  levelEvent=instance_create(0,0,oEvMarioW1)

var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
