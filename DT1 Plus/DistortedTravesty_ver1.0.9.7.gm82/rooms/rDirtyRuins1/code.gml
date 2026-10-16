global.location="Dirty Ruins"
if global.showArea=true
{
  areaDisplay=instance_create(0,0,oAreaDisplay)
  areaDisplay.areaString="Dirty Ruins"
}
levelEvent=instance_create(0,0,oEvDustyRuinsW1)

boulder=instance_create(416,-48,oBigBoulder)
boulder=instance_create(2464,-48,oBigBoulder)
boulder=instance_create(3072,-48,oBigBoulder)
boulder=instance_create(3232,-48,oBigBoulder)
boulder=instance_create(3296,-48,oBigBoulder)
boulder=instance_create(3360,-48,oBigBoulder)
boulder=instance_create(3408,-48,oBigBoulder)
boulder=instance_create(3488,-48,oBigBoulder)

var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
