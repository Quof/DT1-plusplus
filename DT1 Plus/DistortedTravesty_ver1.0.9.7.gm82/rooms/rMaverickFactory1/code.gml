global.location="Maverick Factory"
oPlayer1.bUseBusterShot=1
if global.showArea=true
{
  areaDisplay=instance_create(0,0,oAreaDisplay)
  areaDisplay.areaString="Maverick Factory"
}
light=instance_create(0,0,oWattLight)

var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
