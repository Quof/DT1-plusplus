oPlayer1.x=96
oPlayer1.y=353
global.gamePaused=false
global.showHUD=true
bLoaded=false
if global.resetMusic=true
{
  var tempMplay;
  tempMplay=findMusic()
  playMusic(tempMplay,0)

  global.resetMusic=false
  set_program_priority(global.gamePriority)
  bLoaded=true
}
dataScatter=instance_create(0,0,oDataCenter)
if bLoaded=true
  dataScatter.init=1
