//This script allows the player to jump

playSound(global.snd_PlayerJump[0],0,1)
global.recJumped+=1
yAcc+=initialJumpAcc
xAcc+=xVel/2
effect=instance_create(oPlayer1.x,oPlayer1.y+2,oEffect)
effect.sprite_index=sSpellCast
effect.image_xscale=0.6
effect.image_yscale=0.6

//the "state" gets changed to JUMPING later on in the code
state=FALLING
//"variable jumping" states
jumpButtonReleased=0
jumpTime=0
