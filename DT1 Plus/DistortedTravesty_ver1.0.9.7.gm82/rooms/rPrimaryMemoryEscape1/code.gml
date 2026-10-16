global.location="Primary Memory Escape"
background_visible[1]=1
background_alpha[1]=0.4

backFollow1=instance_create(0,0,oBackgroundFollow)
backFollow1.type=4
backFollow1.backSet=backPrimaryMemory2
backFollow1.xMoveScale=0.8
backFollow1.yMoveScale=0.8
backFollow1.shakeTime=0

gameEvent=instance_create(0,0,oEvPrimaryMemoryW1)
levelEvent=instance_create(0,0,oEvPrimaryMemoryConvo1)

if global.gameProgress>=342
  escapeEvent=instance_create(0,0,oEvEscapeEffects)
if global.gameProgress=342
{
  oPlayer1.life=oPlayer1.maxLife
  oPlayer1.spiritEnergy=oPlayer1.maxSpiritEnergy
  oPlayer1.fireEnergy=oPlayer1.maxFireEnergy
  oPlayer1.waterEnergy=oPlayer1.maxWaterEnergy
  oPlayer1.windEnergy=oPlayer1.maxWindEnergy
  oPlayer1.earthEnergy=oPlayer1.maxEarthEnergy

  if global.difficulty<=2
  {
    if global.p1Skittles<3
    {
      global.p1Skittles=3
      oPlayer1.conSkittles=3
    }
    if global.p1Smoothie<1
    {
      global.p1Smoothie=1
      conSmoothie=1
    }
  }
  else if global.difficulty>=3
  {
    if global.p1Skittles<1
    {
      global.p1Skittles=1
      oPlayer1.conSkittles=1
    }
    if global.p1Smoothie<1
    {
      global.p1Smoothie=1
      conSmoothie=1
    }
  }
  global.cTimerMinute=4
  global.cTimerSecond=5
  global.cTimerHundred=0
  var tempMplay;
  tempMplay=findMusic()
  playMusic(tempMplay,0)
}
else if global.gameProgress<=341
  stopAllMusic()
