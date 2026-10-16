global.location="Black Rock Fortress"

if global.showArea=true and global.gameProgress>=152 and global.gameProgress!=182
{
  areaDisplay=instance_create(0,0,oAreaDisplay)
  areaDisplay.areaString="Black Rock Fortress"
}
if global.gameProgress<=151
{
  global.stockWeaponGem+=1
  global.stockArmor+=1
  global.stockRing+=2
  global.gameProgress=152
}
levelEvent=instance_create(0,0,oEvBRFW1)
stopAllMusic()
