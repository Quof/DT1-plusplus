global.location="Cheese Garden"
if global.showArea=true
{
  areaDisplay=instance_create(0,0,oAreaDisplay)
  areaDisplay.areaString="Extra - Cheese Garden"
}
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
