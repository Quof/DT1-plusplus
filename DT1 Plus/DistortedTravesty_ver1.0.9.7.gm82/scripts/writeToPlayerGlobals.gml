/*
This script is called when the global variables for the player are updated.
*/
stopLoopingSounds()
global.p1Level=oPlayer1.level
global.p1MaxLife=oPlayer1.maxLife
global.p1Life=oPlayer1.life
global.p1TotalExp=oPlayer1.expTotal
global.p1CurrentExp=oPlayer1.expCurrent
global.p1ExpNext=oPlayer1.expNext
global.p1PhysicalPower=oPlayer1.physicalPower-oPlayer1.gemBonusP
global.p1PhysicalDefense=oPlayer1.physicalDefense-oPlayer1.armorBonus
global.p1SpiritPower=oPlayer1.spiritPower-oPlayer1.gemBonusS
global.p1SpiritDefense=oPlayer1.spiritDefense-oPlayer1.ringBonus
global.p1MoneyTotal=oPlayer1.moneyTotal
global.p1Awesome=oPlayer1.awesomePoints

global.p1MaxSpiritEnergy=oPlayer1.maxSpiritEnergy
global.p1MaxFireEnergy=oPlayer1.maxFireEnergy
global.p1MaxWaterEnergy=oPlayer1.maxWaterEnergy
global.p1MaxWindEnergy=oPlayer1.maxWindEnergy
global.p1MaxEarthEnergy=oPlayer1.maxEarthEnergy
global.p1SpiritEnergy=oPlayer1.spiritEnergy
global.p1FireEnergy=oPlayer1.fireEnergy
global.p1WaterEnergy=oPlayer1.waterEnergy
global.p1WindEnergy=oPlayer1.windEnergy
global.p1EarthEnergy=oPlayer1.earthEnergy

global.p1Skittles=oPlayer1.conSkittles
global.p1Smoothie=oPlayer1.conSmoothie
global.p1Starburst=oPlayer1.conStarburst
global.p1GummyBears=oPlayer1.conGummyBears

if oPlayer1.bRaveActive=true
  global.p1RaveEnergy=0
