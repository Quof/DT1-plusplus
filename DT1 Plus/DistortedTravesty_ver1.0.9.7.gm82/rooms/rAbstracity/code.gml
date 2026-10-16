global.location="Abstracity"
var xPos,yPos;
xPos=128
yPos=112
background_index[0]=backAbstracityCity
background_visible[0]=true
background_y[0]=159
background_htiled[0]=false
background_vtiled[0]=false
background_index[1]=backAbstracityRoad
background_visible[1]=true
background_y[1]=306
background_vtiled[1]=false
for (i=2;i<5;i+=1)
{
  background_index[i]=backAbstracityClouds
  background_alpha[i]=0.4
  background_visible[i]=true
  background_x[i]=xPos
  background_y[i]=yPos
  background_vtiled[i]=false
  xPos-=29
  yPos-=20
}
background_hspeed[2]=-1
background_hspeed[3]=-0.8
background_hspeed[4]=-0.6

if global.showArea=true and global.gameProgress>=82
{
  areaDisplay=instance_create(0,0,oAreaDisplay)
  areaDisplay.areaString="Abstracity"
}
if global.gameProgress<=81
{
  global.stockWeaponGem+=1
  global.stockArmor+=1
  global.stockRing+=1
  global.gameProgress=82
}
levelEvent=instance_create(0,0,oEvAbstracity1)

if global.gameProgress>=275
{
  if global.gameProgress=275
    global.gameProgress=276
  redMapTint=instance_create(0,0,oWorldMapRedTint)
}
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
