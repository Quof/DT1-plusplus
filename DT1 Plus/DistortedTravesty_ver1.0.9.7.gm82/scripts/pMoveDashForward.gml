//This script allows the player to dash forward

playSound(global.snd_PlayerJump[0],0,1)
effect=instance_create(oPlayer1.x,oPlayer1.y+2,oEffect)
effect.sprite_index=sSpellCast
effect.image_xscale=0.6
effect.image_yscale=0.6
dashInvulnerabilityTime+=dashInvulnerability
dashPoints-=1
yAcc+=initialJumpAcc/2
xAcc+=xVel
dashMomentumTime=22
//the "state" gets changed to JUMPING later on in the code
state=FALLING
if facing=RIGHT
{
  global.recDashedForward+=1
  xVel=dashVel
  effect=instance_create(oPlayer1.x,oPlayer1.y,oEffect)
  effect.sprite_index=sDashWave
}
else
{
  global.recDashedForward+=1
  xVel=-dashVel
  effect=instance_create(oPlayer1.x,oPlayer1.y,oEffect)
  effect.sprite_index=sDashWave
  effect.image_xscale=-1
}

//"variable jumping" states
jumpButtonReleased=0
jumpTime=0
