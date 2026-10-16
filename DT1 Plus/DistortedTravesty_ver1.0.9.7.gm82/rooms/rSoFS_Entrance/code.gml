global.location="Spire of Forgotten Souls"

oPlayer1.life=oPlayer1.maxLife
oPlayer1.spiritEnergy=oPlayer1.maxSpiritEnergy
oPlayer1.fireEnergy=oPlayer1.maxFireEnergy
oPlayer1.waterEnergy=oPlayer1.maxWaterEnergy
oPlayer1.windEnergy=oPlayer1.maxWindEnergy
oPlayer1.earthEnergy=oPlayer1.maxEarthEnergy
background_hspeed[0]=1
background_vspeed[0]=0.25
global.rbSwitchBlueOn=false
if global.showArea=true
{
  areaDisplay=instance_create(0,0,oAreaDisplay)
  areaDisplay.areaString="Spire of Forgotten Souls"
}
stopAllMusic()
