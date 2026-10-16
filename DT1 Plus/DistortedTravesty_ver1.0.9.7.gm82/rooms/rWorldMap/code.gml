mapManager=instance_create(0,0,oWorldMap)
identifier=instance_create(mouse_x,mouse_y,oIdentifier)

global.p1Life=global.p1MaxLife
global.p1SpiritEnergy=global.p1MaxSpiritEnergy
global.p1FireEnergy=global.p1MaxFireEnergy
global.p1WaterEnergy=global.p1MaxWaterEnergy
global.p1WindEnergy=global.p1MaxWindEnergy
global.p1EarthEnergy=global.p1MaxEarthEnergy

global.rbSwitchBlueOn=false

if global.shroudThreat>=45
  global.shroudThreat=40
