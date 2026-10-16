//This script allows the player to jump

playSound(global.snd_PlayerJump[0],0,1)
global.recJumped+=1
//yAcc+=initialJumpAcc
if gDeltaTime==1
  yAcc+=initialJumpAcc
else
{
  //60fps change (added): above 30fps the jump starts as a speed, corrected (pJumpCorrection: simulated so the heights
  //match 30fps to the pixel for every length of holding the button), and the pixel dither starts from a set value so
  //the jump moves the same whole pixels every time (pMoveTo). Uses grav, not gravityIntensity, which is still last
  //step's value here
  pJumpCorrection(0)
  yVel+=max(initialJumpAcc,-yAccLimit)*jcBodge+grav*jcGravComp //at 30fps the jump goes into yAcc, which is capped at yAccLimit (-15.46 jumps at -10)
  ditherCounter=jcSeed
}
xAcc+=xVel/2
xVelSetTick=1 //60fps change (added): the push forward above is a one-off: a full 30fps tick's worth (see pMoveToWrapNew)
effect=instance_create(oPlayer1.x,oPlayer1.y+2,oEffect)
effect.sprite_index=sSpellCast
effect.image_xscale=0.6
effect.image_yscale=0.6

//the "state" gets changed to JUMPING later on in the code
state=FALLING
//"variable jumping" states
jumpButtonReleased=0
jumpTime=0
