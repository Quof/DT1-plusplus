//This script allows the player to air dash

playSound(global.snd_PlayerJump[0],0,1)
canAirDash=0
if global.SkDashPower=0
  airDashDamage+=15
else if global.SkDashPower=1
  airDashDamage+=20
global.recAirDashed+=1
if facing=RIGHT
{
  effect=instance_create(oPlayer1.x,oPlayer1.y,oEffect)
  effect.sprite_index=sAirDashWave
}
else
{
  effect=instance_create(oPlayer1.x,oPlayer1.y,oEffect)
  effect.sprite_index=sAirDashWave
  effect.image_xscale=-1
}
//jumpSound=round(random(1)) //player jump sound
dashMomentumTime=17
playSound(global.snd_PlayerJump[0],0,1)
dashInvulnerabilityTime+=dashInvulnerability
dashPoints-=1
yAcc+=initialJumpAcc/2
//xAcc+=xVel
//xVel=dashVel
if airDashRecovery<7
  airDashRecovery=6
