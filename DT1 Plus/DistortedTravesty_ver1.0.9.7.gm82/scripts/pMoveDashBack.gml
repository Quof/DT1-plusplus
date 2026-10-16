//This script allows the player to dash back

playSound(global.snd_PlayerJump[0],0,1)
effect=instance_create(oPlayer1.x,oPlayer1.y+2,oEffect)
effect.sprite_index=sSpellCast
effect.image_xscale=0.6
effect.image_yscale=0.6
dashInvulnerabilityTime+=dashInvulnerability
dashPoints-=1
//yAcc+=initialJumpAcc/2
if gDeltaTime==1
  yAcc+=initialJumpAcc/2
else
{
  //60fps change (added): see pMoveDashForward
  pJumpCorrection(1)
  yVel+=max(initialJumpAcc/2,-yAccLimit)*jcBodge+grav*jcGravComp
  ditherCounter=jcSeed
}
xAcc+=xVel
xVelSetTick=1 //60fps change (added): see pMoveDashForward
dashMomentumTime=22
backDashRec=8
//the "state" gets changed to JUMPING later on in the code
state=FALLING
if facing=RIGHT
{
  global.recDashedBackward+=1
  xVel=-dashVel
  effect=instance_create(oPlayer1.x,oPlayer1.y,oEffect)
  effect.sprite_index=sDashWave
  effect.image_xscale=-1
}
else
{
  global.recDashedBackward+=1
  xVel=dashVel
  effect=instance_create(oPlayer1.x,oPlayer1.y,oEffect)
  effect.sprite_index=sDashWave
}

//"variable jumping" states
jumpButtonReleased=0
jumpTime=0

//60fps change (added): see pMoveDashForward
dashTickTime=1; dashTickXAcc=xAcc
