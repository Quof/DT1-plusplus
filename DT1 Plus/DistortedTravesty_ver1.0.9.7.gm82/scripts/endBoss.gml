/*
This is called after a boss fight.
It is used to clear any effects still on screen
and to set the player back to the normal state.
*/
with oEnemyBase
  instance_destroy()
with oEProjectileBase
  instance_destroy()
with oBossBarrier
  instance_destroy()
with oAttackBase
  instance_destroy()
with oSoothingSpring
  instance_destroy()
with oEarthShift
  instance_destroy()
with oKreAfterImage
  instance_destroy()
with oEnemyAfterImage
  instance_destroy()
stopPlayer()
oPlayer1.image_alpha=1
oPlayer1.sprite_index=sPlayerIdle
oPlayer1.hitCombo=0
