/*
This script should be placed in the step event for the platform character.
It updates the keys used by the character, moves all of the solids, moves the
character, sets the sprite index, and sets the animation speed for the sprite.

60fps change: ported from DT3 60FPS. At 30fps (gDeltaTime=1) everything runs as before (pMoveToWrapOrig is the
original movement code). Above 30fps velocities and accelerations stay in 30fps units, counters count 30fps ticks
(-=gDeltaTime), and pMoveToWrapNew moves gDeltaTime of a tick each frame.
*/
//60fps change (added): above 30fps, set to 1 by code that sets xVel/yVel directly this frame (or gives a one-off push);
//pMoveToWrapNew then uses the original 30fps formula (velocity+acceleration)*friction for the frame
xVelSetTick=0
yVelSetTick=0

if player=1 //========================================
{
  if attackState!=SUMMON and global.gamePaused=false
  {
    //updates the keys
    //key left
    kLeftReleased=0
    if kLeft
    {
      //kLeft=keyboard_check(ord(global.ctrlLeft)) or keyboard_check(vk_left)
      kLeft=keyboard_check(ord(global.ctrlLeft)) or (keyboard_check(vk_left) or scrPadHeld(1)) //gamepad change: and the gamepad's Left (scrGamepadInit)
      //kLeftPushedSteps+=1
      kLeftPushedSteps+=gDeltaTime //60fps change: counts 30fps ticks
      kLeftPressed=0;
      if (kLeft=0)
        kLeftReleased=1;
    }
    else
    {
      //kLeft=keyboard_check(ord(global.ctrlLeft)) or keyboard_check(vk_left)
      kLeft=keyboard_check(ord(global.ctrlLeft)) or (keyboard_check(vk_left) or scrPadHeld(1)) //gamepad change: and the gamepad's Left (scrGamepadInit)
      if kLeft
        kLeftPressed=1
      kLeftPushedSteps=0
    }
    //key right
    kRightReleased=0
    if kRight
    {
      //kRight=keyboard_check(ord(global.ctrlRight)) or keyboard_check(vk_right)
      kRight=keyboard_check(ord(global.ctrlRight)) or (keyboard_check(vk_right) or scrPadHeld(2)) //gamepad change: and the gamepad's Right (scrGamepadInit)
      //kRightPushedSteps+=1
      kRightPushedSteps+=gDeltaTime //60fps change: counts 30fps ticks
      kRightPressed=0
      if kRight=0
        kRightReleased=1
    }
    else
    {
      //kRight=keyboard_check(ord(global.ctrlRight)) or keyboard_check(vk_right)
      kRight=keyboard_check(ord(global.ctrlRight)) or (keyboard_check(vk_right) or scrPadHeld(2)) //gamepad change: and the gamepad's Right (scrGamepadInit)
      if kRight
        kRightPressed=1
      kRightPushedSteps=0
    }
    //key up
    //kUp=keyboard_check(ord(global.ctrlUp)) or keyboard_check(vk_up)
    kUp=keyboard_check(ord(global.ctrlUp)) or (keyboard_check(vk_up) or scrPadHeld(3)) //gamepad change: and the gamepad's Up (scrGamepadInit)
    //key down
    //kDown=keyboard_check(ord(global.ctrlDown)) or keyboard_check(vk_down)
    kDown=keyboard_check(ord(global.ctrlDown)) or (keyboard_check(vk_down) or scrPadHeld(4)) //gamepad change: and the gamepad's Down (scrGamepadInit)
    //key "run"
    //if canRun
    //  kRun=keyboard_check(vk_shift)
    //else
    //  kRun=0
    //key "jump"
    if kJump
    {
      //kJump=keyboard_check(ord(global.ctrlJump))
      kJump=(keyboard_check(ord(global.ctrlJump)) or scrPadHeld(5)) //gamepad change: and the gamepad's Jump (scrGamepadInit)
      kJumpPressed=0
    }
    else
    {
      //kJump=keyboard_check(ord(global.ctrlJump))
      kJump=(keyboard_check(ord(global.ctrlJump)) or scrPadHeld(5)) //gamepad change: and the gamepad's Jump (scrGamepadInit)
      if kJump
        kJumpPressed=1
    }
    //key "attack"
    if kAttack
    {
      //kAttack=keyboard_check(ord(global.ctrlAttack))
      kAttack=(keyboard_check(ord(global.ctrlAttack)) or scrPadHeld(6)) //gamepad change: and the gamepad's Attack (scrGamepadInit)
      kAttackPressed=0
    }
    else
    {
      //kAttack=keyboard_check(ord(global.ctrlAttack))
      kAttack=(keyboard_check(ord(global.ctrlAttack)) or scrPadHeld(6)) //gamepad change: and the gamepad's Attack (scrGamepadInit)
      if kAttack
        kAttackPressed=1
    }
    //key "element swap forward"
    if kElementSwapForward
    {
      //kElementSwapForward=keyboard_check(ord(global.ctrlCycleForward))
      kElementSwapForward=(keyboard_check(ord(global.ctrlCycleForward)) or scrPadHeld(10)) //gamepad change: and the gamepad's Cycle Element Forward (scrGamepadInit)
      kElementSwapForwardPressed=0
    }
    else
    {
      //kElementSwapForward=keyboard_check(ord(global.ctrlCycleForward))
      kElementSwapForward=(keyboard_check(ord(global.ctrlCycleForward)) or scrPadHeld(10)) //gamepad change: and the gamepad's Cycle Element Forward (scrGamepadInit)
      if kElementSwapForward
        kElementSwapForwardPressed=1
    }
    //key "element swap back"
    if kElementSwapBack
    {
      //kElementSwapBack=keyboard_check(ord(global.ctrlCycleBack))
      kElementSwapBack=(keyboard_check(ord(global.ctrlCycleBack)) or scrPadHeld(9)) //gamepad change: and the gamepad's Cycle Element Back (scrGamepadInit)
      kElementSwapBackPressed=0
    }
    else
    {
      //kElementSwapBack=keyboard_check(ord(global.ctrlCycleBack))
      kElementSwapBack=(keyboard_check(ord(global.ctrlCycleBack)) or scrPadHeld(9)) //gamepad change: and the gamepad's Cycle Element Back (scrGamepadInit)
      if kElementSwapBack
        kElementSwapBackPressed=1
    }
    //key "ability swap forward"
    if kAbilitySwapForward
    {
      //kAbilitySwapForward=keyboard_check(ord(global.ctrlAbilityForward))
      kAbilitySwapForward=(keyboard_check(ord(global.ctrlAbilityForward)) or scrPadHeld(12)) //gamepad change: and the gamepad's Cycle Ability Forward (scrGamepadInit)
      kAbilitySwapForwardPressed=0
    }
    else
    {
      //kAbilitySwapForward=keyboard_check(ord(global.ctrlAbilityForward))
      kAbilitySwapForward=(keyboard_check(ord(global.ctrlAbilityForward)) or scrPadHeld(12)) //gamepad change: and the gamepad's Cycle Ability Forward (scrGamepadInit)
      if kAbilitySwapForward
        kAbilitySwapForwardPressed=1
    }
    //key "ability swap back"
    if kAbilitySwapBack
    {
      //kAbilitySwapBack=keyboard_check(ord(global.ctrlAbilityBack))
      kAbilitySwapBack=(keyboard_check(ord(global.ctrlAbilityBack)) or scrPadHeld(11)) //gamepad change: and the gamepad's Cycle Ability Back (scrGamepadInit)
      kAbilitySwapBackPressed=0
    }
    else
    {
      //kAbilitySwapBack=keyboard_check(ord(global.ctrlAbilityBack))
      kAbilitySwapBack=(keyboard_check(ord(global.ctrlAbilityBack)) or scrPadHeld(11)) //gamepad change: and the gamepad's Cycle Ability Back (scrGamepadInit)
      if kAbilitySwapBack
        kAbilitySwapBackPressed=1
    }
    //key "tech use"
    if kTechUse
    {
      //kTechUse=keyboard_check(ord(global.ctrlTech))
      kTechUse=(keyboard_check(ord(global.ctrlTech)) or scrPadHeld(7)) //gamepad change: and the gamepad's Use Tech (scrGamepadInit)
      kTechUsePressed=0
    }
    else
    {
      //kTechUse=keyboard_check(ord(global.ctrlTech))
      kTechUse=(keyboard_check(ord(global.ctrlTech)) or scrPadHeld(7)) //gamepad change: and the gamepad's Use Tech (scrGamepadInit)
      if kTechUse
        kTechUsePressed=1
    }
    //key "spell use"
    if kSpellUse
    {
      //kSpellUse=keyboard_check(ord(global.ctrlSpell))
      kSpellUse=(keyboard_check(ord(global.ctrlSpell)) or scrPadHeld(8)) //gamepad change: and the gamepad's Cast Spell (scrGamepadInit)
      kSpellUsePressed=0
    }
    else
    {
      //kSpellUse=keyboard_check(ord(global.ctrlSpell))
      kSpellUse=(keyboard_check(ord(global.ctrlSpell)) or scrPadHeld(8)) //gamepad change: and the gamepad's Cast Spell (scrGamepadInit)
      if kSpellUse
        kSpellUsePressed=1
    }
    //key "rave"
    if kRave
    {
      //kRave=keyboard_check(ord(global.ctrlRave))
      kRave=(keyboard_check(ord(global.ctrlRave)) or scrPadHeld(15)) //gamepad change: and the gamepad's Rave Mode (scrGamepadInit)
      kRavePressed=0
    }
    else
    {
      //kRave=keyboard_check(ord(global.ctrlRave))
      kRave=(keyboard_check(ord(global.ctrlRave)) or scrPadHeld(15)) //gamepad change: and the gamepad's Rave Mode (scrGamepadInit)
      if kRave
        kRavePressed=1
    }
    //key "Dash Left"
    if kDashLeft
    {
      //kDashLeft=keyboard_check(ord(global.ctrlDashLeft))
      kDashLeft=(keyboard_check(ord(global.ctrlDashLeft)) or scrPadHeld(13)) //gamepad change: and the gamepad's Dash Left (scrGamepadInit)
      kDashLeftPressed=0
    }
    else
    {
      //kDashLeft=keyboard_check(ord(global.ctrlDashLeft))
      kDashLeft=(keyboard_check(ord(global.ctrlDashLeft)) or scrPadHeld(13)) //gamepad change: and the gamepad's Dash Left (scrGamepadInit)
      if kDashLeft {kDashLeftPressed=1}
    }
    //key "Dash Right"
    if kDashRight
    {
      //kDashRight=keyboard_check(ord(global.ctrlDashRight))
      kDashRight=(keyboard_check(ord(global.ctrlDashRight)) or scrPadHeld(14)) //gamepad change: and the gamepad's Dash Right (scrGamepadInit)
      kDashRightPressed=0
    }
    else
    {
      //kDashRight=keyboard_check(ord(global.ctrlDashRight))
      kDashRight=(keyboard_check(ord(global.ctrlDashRight)) or scrPadHeld(14)) //gamepad change: and the gamepad's Dash Right (scrGamepadInit)
      if kDashRight {kDashRightPressed=1}
    }
  }
}

//deals with the ladderTimer ========================================
if state=CLIMBING
  ladderTimer=10
else
{
  if ladderTimer>0
    ladderTimer=max(0,ladderTimer-gDeltaTime) //60fps change: counts 30fps ticks (and stops at 0: it's checked for =0)
}
//allows the character to run left and right
//60fps change: not for the rest of a dash's first 30fps tick (dashTickTime, set by pMoveDashForward/pMoveDashBack/
//pMoveAirDash). At 30fps this code had already run for that tick before the dash took over; running it again on the
//next frames added run acceleration, and in the air the dash momentum formula below replaced the dash's speed
//if state!=DUCKING and state!=CLIMBING and attackState!=PART_JUMP_SLASH_1 and attackState!=ACT_CASTING and attackState!=ACT_CASTED and bTakingDamage=false
if state!=DUCKING and state!=CLIMBING and attackState!=PART_JUMP_SLASH_1 and attackState!=ACT_CASTING and attackState!=ACT_CASTED and bTakingDamage=false and dashTickTime<=0
{
  //if kLeftReleased and approximatelyZero(xVel) {xAcc-=0.5}
  //if kRightReleased and approximatelyZero(xVel) {xAcc+=0.5}
  if kLeftReleased and approximatelyZero(xVel) {xAcc-=0.5; xVelSetTick=1} //60fps change: one-off push: a full 30fps tick's worth (see pMoveToWrapNew)
  if kRightReleased and approximatelyZero(xVel) {xAcc+=0.5; xVelSetTick=1} //60fps change: see above

  //60fps change: dashMomentumTime counts down in fractions between 30fps ticks, and this code reads it before it's counted
  //down for the frame, so it uses the 30fps tick's value of it (ceil): <20 became ceil()<20, >=1 became >0, and the
  //momentum speed uses ceil() too
  if kLeft //----- Run left -----
  {
    if kLeftPushedSteps<3
    {
      if backDashRec>0
      {
        dashMomentumTime=0; backDashRec=0
      }
    }
    if facing=RIGHT
    {
      //if dashMomentumTime<20 {dashMomentumTime=0}
      if ceil(dashMomentumTime)<20 {dashMomentumTime=0} //60fps change: see above
    }
    //if (kLeftPushedSteps>1 or isCollisionMoveableSolidRight(1)) and (facing=LEFT or approximatelyZero(xVel))
    //60fps change: kLeftPushedSteps counts 30fps ticks in fractions; >1 is the same as >=2 at 30fps (the 3rd tick of
    //holding). See runStartSteps (characterCreateEvent)
    if (kLeftPushedSteps>=runStartSteps or isCollisionMoveableSolidRight(1)) and (facing=LEFT or approximatelyZero(xVel))
    {
      xAcc-=runAcc
      //if dashMomentumTime>=1
      if dashMomentumTime>0 //60fps change: see above
      {
        //if platformCharacterIs(IN_AIR)
        if platformCharacterIs(IN_AIR) or landTickHold>0 //60fps change: see the landing code
        {
          //xAcc-=(xVel/2.7+(dashMomentumTime/1.95))
          //xVel=-((dashVel-8)+(dashMomentumTime/5))
          xVel=-((dashVel-8)+(ceil(dashMomentumTime)/5)); xVelSetTick=1 //60fps change: see above; set every frame (see pMoveToWrapNew)
        }
        //if kLeftPushedSteps<=1 {dashMomentumTime=0} //3
        if kLeftPushedSteps<runStartSteps {dashMomentumTime=0} //3 //60fps change: the counterpart of the run start above
      }
    }
    facing=LEFT
  }
  if kRight //----- Run right -----
  {
    if kRightPushedSteps<3
    {
      if backDashRec>0
      {
        dashMomentumTime=0; backDashRec=0
      }
    }
    if facing=LEFT
    {
      //if dashMomentumTime<20 {dashMomentumTime=0}
      if ceil(dashMomentumTime)<20 {dashMomentumTime=0} //60fps change: see run left
    }
    //if (kRightPushedSteps>1 or isCollisionMoveableSolidLeft(1)) and (facing=RIGHT or approximatelyZero(xVel))
    if (kRightPushedSteps>=runStartSteps or isCollisionMoveableSolidLeft(1)) and (facing=RIGHT or approximatelyZero(xVel)) //60fps change: see run left
    {
      xAcc+=runAcc
      //if dashMomentumTime>=1
      if dashMomentumTime>0 //60fps change: see run left
      {
        //if platformCharacterIs(IN_AIR)
        if platformCharacterIs(IN_AIR) or landTickHold>0 //60fps change: see the landing code
        {
          //xAcc+=xVel/2.7+(dashMomentumTime/1.95)
          //xVel=(dashVel-8)+(dashMomentumTime/5)
          xVel=(dashVel-8)+(ceil(dashMomentumTime)/5); xVelSetTick=1 //60fps change: see run left
        }
        //if kRightPushedSteps<=1 {dashMomentumTime=0} //3
        if kRightPushedSteps<runStartSteps {dashMomentumTime=0} //3 //60fps change: see run left
      }
    }
    facing=RIGHT
  }
}
if state=CLIMBING and isCollisionLadder()=0
{
  state=FALLING
}
if state=CLIMBING and bTakingDamage=false
{
  if kLeft
  {
    xAcc-=climbAcc
    facing=LEFT
  }
  if kRight
  {
    xAcc+=climbAcc
    facing=RIGHT
  }
  if kUp
    yAcc-=climbAcc
  if kDown
    yAcc+=climbAcc
}
xAccInputWalk=xAcc //60fps change (added): the walking/climbing input's acceleration (pMoveToWrapNew's stopping bodge)
/*if floatTime>0
  floatTime-=1*/
if platformCharacterIs(IN_AIR)
{
  yAcc+=gravityIntensity
  /*if floatTime=0
    yAcc+=gravityIntensity
  else
    yAcc+=gravityIntensity/2*/
}
if (isCollisionBottom(1) or isCollisionPlatformBottom(1) and isCollisionPlatform()=0) and platformCharacterIs(IN_AIR) and yVel>=0
{
  yVel=0
  yAcc=0
  //player has just landed
  state=RUNNING
  jumps=0
  canAirDash=1
  busterAnimStay=0
  airDashDamage=0
  blastOffRecoveryTime=0
  //60fps change (added): landing with dash momentum keeps the air friction and the in-air momentum speed for the rest of
  //this 30fps tick of the dash (dashMomentumTime is a whole number at the dash's tick boundaries). At 30fps a landing
  //only shows up at the start of the next tick, so the tick it touched down in still moved as in the air; above 30fps
  //it shows up within it, and the dash hop started slowing down early
  if gDeltaTime!=1 and dashMomentumTime>0 {landTickHold=frac(dashMomentumTime)}
}
//if the character has just walked off of the edge of a solid
if isCollisionBottom(1)=0 and (isCollisionPlatformBottom(1)=0 or isCollisionPlatform()) and platformCharacterIs(ON_GROUND)
{
  state=FALLING
  //yAcc+=grav
  yAcc+=grav; yVelSetTick=1 //60fps change: one-off push: a full 30fps tick's worth (see pMoveToWrapNew)
}
if isCollisionTop(1) and state=JUMPING
{
  yVel=abs(yVel*0.3)
}
//if (isCollisionLeft(1) and facing=LEFT) or (isCollisionRight(1) and facing=RIGHT)
//{
//  xVel=0
//}
//60fps change: above 30fps the wall stop works per 30fps tick, as at 30fps. It checks on each tick's first frame (where
//30fps checked, with the position the last tick left) and a hit stops the player for that whole tick: xVel is zeroed on
//each of its frames, with xVelSetTick so pMoveToWrapNew uses the 30fps formula and the tick's run acceleration still
//counts. Checked every frame, the next pixel of a slope counted as a wall on most frames (the player moves a few pixels
//at a time instead of a tick's 7-8), which zeroed the speed again and again: running up slopes was 3-7x slower than at
//30fps. Only ground at least as steep as 45 degrees (or a real wall) stops the player: it must also rise a pixel by the
//next column. A 1:2 slope steps up a pixel every other column, which 30fps's 8px strides mostly stepped over (simulated:
//45 degree slopes climb at 30fps's speed to within 0.1 tick over 256px, 1:2 slopes ~5% faster than 30fps, which now and
//then loses a stride there)
if gDeltaTime==1
{
  if (isCollisionLeft(1) and facing=LEFT) or (isCollisionRight(1) and facing=RIGHT)
  {
    xVel=0
  }
}
else
{
  if abs(gDeltaTick-gDeltaTime)<0.0001 //the tick's first frame
  {
    wallStopTick=0
    wallStopFacing=facing
    calculateCollisionBounds()
    if facing=LEFT and isCollisionLeft(1)
      wallStopTick=(collision_line(round(lb-2),round(tb),round(lb-2),round(bb-2),oSolid,1,1)>0) //the next column, a pixel higher
    else if facing=RIGHT and isCollisionRight(1)
      wallStopTick=(collision_line(round(rb+1),round(tb),round(rb+1),round(bb-2),oSolid,1,1)>0) //see above
  }
  else if facing!=wallStopFacing //turned away from it during the tick
    wallStopTick=0
  if wallStopTick
  {
    xVel=0
    xVelSetTick=1
  }
} //60fps change (added)
//player may jump
if bTakingDamage=false and attackState!=ACT_CASTING and attackState!=ACT_CASTED
{
  if platformCharacterIs(ON_GROUND)
  {
    if global.optRightIsForward=0 //Left and Right
    {
      if ((kDown and kJumpPressed and global.optDPadDash=1) or (kDashRightPressed and facing=LEFT) or (kDashLeftPressed and facing=RIGHT)) and dashPoints>0 //Dash back
      {
        pMoveDashBack()
      }
      else if ((kUp and kJumpPressed and global.optDPadDash=1) or (kDashLeftPressed and facing=LEFT) or (kDashRightPressed and facing=RIGHT)) and dashPoints>0 //Dash forward
      {
        pMoveDashForward()
      }
      else
      {
        if kJumpPressed
        {
          //give an initial HUGE jump if jump is pressed and flySpeed is big and canFlyJump and the character is running
          if flySpeed>=95 and jumps=0 and canFlyJump
          {
            playSound(global.snd_PlayerJump[0],0,1,1)
            jumps=1
            flyAccTimer=5
            flyDir=facing //either LEFT or RIGHT
            //yAcc+=initialJumpAcc*0.7
            yAcc+=initialJumpAcc*0.7; yVelSetTick=1 //60fps change: one-off push: a full 30fps tick's worth (see pMoveToWrapNew)
            if canFly
            {
              flyInitialHeight=y
              flyJumpsTimer=10
              flyJumpWasPressed=-1
            }
          }
          else //----- Normal jump -----
          {
            if global.hasWindBoots=1
            {
              pMoveJump()
            }
          }
        }
      }
    }
    else
    {
      if ((kDown and kJumpPressed and global.optDPadDash=1) or (kDashLeftPressed)) and dashPoints>0 //Dash back
      {
        pMoveDashBack()
      }
      else if ((kUp and kJumpPressed and global.optDPadDash=1) or (kDashRightPressed)) and dashPoints>0 //Dash forward
      {
        pMoveDashForward()
      }
      else
      {
        if kJumpPressed
        {
          //give an initial HUGE jump if jump is pressed and flySpeed is big and canFlyJump and the character is running
          if flySpeed>=95 and jumps=0 and canFlyJump
          {
            playSound(global.snd_PlayerJump[0],0,1,1)
            jumps=1
            flyAccTimer=5
            flyDir=facing //either LEFT or RIGHT
            //yAcc+=initialJumpAcc*0.7
            yAcc+=initialJumpAcc*0.7; yVelSetTick=1 //60fps change: see above
            if canFly
            {
              flyInitialHeight=y
              flyJumpsTimer=10
              flyJumpWasPressed=-1
            }
          }
          else //----- Normal jump -----
          {
            if global.hasWindBoots=1
            {
              pMoveJump()
            }
          }
        }
      }
    }
  }
  else if platformCharacterIs(IN_AIR) and dashPoints>0 and airDashRecovery=0 and canAirDash=1 and global.hasSuaveToken=true //Air dash
  {
    if (((kUp or kDown) and kJumpPressed and global.optDPadDash=1) or (kDashLeftPressed or kDashRightPressed))
    {
      pMoveAirDash()
    }
  }
}

//60fps change: the speeds below are set every frame, so they're flagged (xVelSetTick/yVelSetTick) and pMoveToWrapNew
//uses the 30fps formula for them, (speed+acceleration)*friction, moving this frame's share of it
if airDashRecovery>0
{
  //airDashRecovery-=1
  airDashRecovery=max(0,airDashRecovery-gDeltaTime) //60fps change: counts 30fps ticks (and stops at 0: it's checked for =0)
  //yVel=-3
  yVel=-3; yVelSetTick=1 //60fps change: see above
  //60fps change (added): above 30fps, pMoveAirDash's upward kick is added for the air dash's whole first 30fps tick, like
  //the 30fps yAcc kick that tick
  if airDashKickTime>0 {yVel+=airDashKick; airDashKickTime-=gDeltaTime}
  //60fps change (added): rest of the dash's first 30fps tick: the run code is skipped (see there), so keep the dash
  //frame's acceleration, which at 30fps went into that whole tick's speed
  if dashTickTime>0 {xAcc=dashTickXAcc}
  if facing=RIGHT
    {xVel=(dashVel); xVelSetTick=1} //60fps change: see above
  else if facing=LEFT
    {xVel=-(dashVel); xVelSetTick=1} //60fps change: see above
}
//hurricane dash
if hurricaneDash!=0
{
  if hurricaneDash>0
  {
    //hurricaneDash-=1
    hurricaneDash=max(0,hurricaneDash-gDeltaTime) //60fps change: counts 30fps ticks (and stops at 0)
    //xVel=16
    xVel=16; xVelSetTick=1 //60fps change: see above
  }
  else if hurricaneDash<0
  {
    //hurricaneDash+=1
    hurricaneDash=min(0,hurricaneDash+gDeltaTime) //60fps change: see above
    //xVel=-16
    xVel=-16; xVelSetTick=1 //60fps change: see above
  }
  //image_blend=make_color_rgb(irandom(255),irandom(255),irandom(255))
  if gDeltaDoTicks {image_blend=make_color_rgb(irandom(255),irandom(255),irandom(255))} //60fps change: a new color once per 30fps tick
  //if hurricaneDash=0
  if abs(hurricaneDash)<0.0001 //60fps change: (it counts in fractions)
  {
    hurricaneDash=0 //60fps change (added)
    image_blend=c_white
  }
}

if platformCharacterIs(ON_GROUND) //Check how long the player is in the air
{
  airTime=0
}
//else {airTime+=1}
else {airTime+=gDeltaTime} //60fps change: counts 30fps ticks

//60fps change: these count 30fps ticks (in fractions between them)
//if backDashRec>0 {backDashRec-=1}
//if dashMomentumTime>0 {dashMomentumTime-=1} //Dash momentum
if backDashRec>0 {backDashRec-=gDeltaTime}
if dashMomentumTime>0 {dashMomentumTime-=gDeltaTime} //Dash momentum
if dashTickTime>0 {dashTickTime-=gDeltaTime} //60fps change (added): the dash's first 30fps tick (see the run code)

if jumpTime<jumpTimeTotal
  //jumpTime+=1
  jumpTime+=gDeltaTime //60fps change: counts 30fps ticks
//let the character continue to jump
if kJump=0 and kDashLeft=0 and kDashRight=0
{
  //60fps change (added): letting go starts full gravity half a 30fps tick later above 30fps (a frame later at 120fps;
  //no wait at 60fps or 30fps), which is when 30fps's next tick's gravity would take effect; simulated, short hops at
  //120fps came out ~2px low without it
  if jumpButtonReleased=0 {jumpReleaseHold=0.5-gDeltaTime}
  jumpButtonReleased=1
}
if jumpButtonReleased
  //jumpTime=jumpTimeTotal
  {if jumpReleaseHold>0.0001 {jumpReleaseHold-=gDeltaTime} else {jumpTime=jumpTimeTotal}} //60fps change: see above
gravityIntensity=(jumpTime/jumpTimeTotal)*grav

if bTakingDamage=false and attackState!=PART_JUMP_SLASH_1 and attackState!=ACT_CASTING and attackState!=ACT_CASTED
{
  if kUp and xVel=0 and xAcc=0 and platformCharacterIs(ON_GROUND) and isCollisionLadder()=0
  {
    if kLeft=0 or kRight=0 {state=LOOKING_UP}
    canAirDash=1
    blastOffRecoveryTime=0
    busterAnimStay=0
    airDashDamage=0
  }
  if kUp=0 and state=LOOKING_UP
  {
    state=STANDING
    canAirDash=1
    blastOffRecoveryTime=0
    busterAnimStay=0
    airDashDamage=0
  }
  if kDown and platformCharacterIs(ON_GROUND) and isCollisionLadder()=0
  {
    canAirDash=1
    blastOffRecoveryTime=0
    busterAnimStay=0
    airDashDamage=0
    if isCollisionPlatformBottom(1)
    {
      if isCollisionBottom(1)=0
      {
        y+=1
        state=FALLING
        //yAcc+=grav
        yAcc+=grav; yVelSetTick=1 //60fps change: one-off push: a full 30fps tick's worth (see pMoveToWrapNew)
      }
      else
      {
        //the character can't move down because there is a solid in the way
        state=RUNNING
      }
    }
    else
    {
      //60fps change (added): crouch slide: on the step you crouch, the run code above has already added a full tick of
      //run acceleration, and friction is now the lighter crouch friction, so at 30fps (speed + runAcc) * crouch friction
      //gives a burst. Above 30fps that tick's acceleration would only partly apply, so this step uses the 30fps formula
      if state!=DUCKING {xVelSetTick=1}
      state=DUCKING
    }
  }
  if kDown and attackState=0 and global.gameProgress>=344 //change into morph ball
  {
    setCollisionBounds(-8,-13,8,-1)
    runAcc=10.3
    attackState=ACT_MORPHBALL
  }
  else if kUp and attackState=ACT_MORPHBALL and global.gameProgress>=344 //change out of morph ball
  {
    setCollisionBounds(-8,-44,8,-1)
    runAcc=7.05
    attackState=0
  }
  if kDown=0 and state=DUCKING
  {
    state=STANDING
    xVel=0
    xAcc=0
    canAirDash=1
    blastOffRecoveryTime=0
    busterAnimStay=0
    airDashDamage=0
  }
}
if xVel=0 and xAcc=0 and state=RUNNING
{
  state=STANDING
  canAirDash=1
  blastOffRecoveryTime=0
  busterAnimStay=0
  airDashDamage=0
}
if xAcc!=0 and (state=STANDING or state=LOOKING_UP)
{
  state=RUNNING
  canAirDash=1
  blastOffRecoveryTime=0
  busterAnimStay=0
  airDashDamage=0
}
if yVel<0 and platformCharacterIs(IN_AIR)
{
  state=JUMPING
}
if yVel>0 and platformCharacterIs(IN_AIR)
{
  state=FALLING
}
if (kUp or kDown) and isCollisionLadder() and ladderTimer=0 and bTakingDamage=false and attackState!=PART_JUMP_SLASH_1
{
  //nullifies the velocity
  xVel=0
  yVel=0
  //nullifies the acceleration
  xAcc=0
  yAcc=0
  state=CLIMBING
}
if isCollisionLadder() and state=CLIMBING and kJumpPressed and bTakingDamage=false
{
  if facing=LEFT
    xVel=-departLadderXVel
  else
    xVel=departLadderXVel
  yAcc+=departLadderYVel
  xVelSetTick=1; yVelSetTick=1 //60fps change (added): set speed + one-off push: a full 30fps tick's worth (see pMoveToWrapNew)
  state=JUMPING
  jumpButtonReleased=0
  jumpTime=0
}
//60fps change: flySpeed builds up and drains every frame while the input is held, so those amounts are per 30fps tick
//(*gDeltaTime), and its timers count 30fps ticks
if kRun and (kLeft or kRight) and bTakingDamage=false and attackState!=PART_JUMP_SLASH_1 and attackState!=ACT_CASTING and attackState!=ACT_CASTED
{
  //flySpeed+=2
  flySpeed+=2*gDeltaTime //60fps change: see above
  if state!=DUCKING and state!=LOOKING_UP and state!=CLIMBING and state!=FALLING
  {
    if kLeft
    {
      if flySpeed<70
        xAcc-=runAcc*flySpeed/70    //you can change the value here
      else
        xAcc-=runAcc    //you can change the value here
      facing=LEFT
    }
    if kRight
    {
      if flySpeed<70
        xAcc+=runAcc*flySpeed/70    //you can change the value here
      else
        xAcc+=runAcc    //you can change the value here
      facing=RIGHT
    }
  }
}
else
{
  //flySpeed-=3
  flySpeed-=3*gDeltaTime //60fps change: see above
}
if bTakingDamage=false and attackState!=PART_JUMP_SLASH_1 and attackState!=ACT_CASTING and attackState!=ACT_CASTED
{
  //if kJump {flySpeed-=1}
  if kJump {flySpeed-=1*gDeltaTime} //60fps change: see above
  if (kLeft and xVel>0) or (kRight and xVel<0)
  {
    //flySpeed-=10
    flySpeed-=10*gDeltaTime //60fps change: see above
    flySpeedTimer=0
  }
  //if the character hits a wall
  if (kLeft and isCollisionLeft(1)) or (kRight and isCollisionRight(1))
  {
    //flySpeed-=20
    flySpeed-=20*gDeltaTime //60fps change: see above
    flySpeedTimer=0
  }
}
//set flySpeed to 100 if the flySpeedTimer is still ticking
if flySpeedTimer>0
{
  //flySpeedTimer-=1
  flySpeedTimer-=gDeltaTime //60fps change: see above
  flySpeed=100
}
if flyJumpsTimer>0
{
  if flyJumpWasPressed=-1
    flyJumpWasPressed=0
  else if kJumpPressed
    flyJumpWasPressed=1
  flySpeed=100
  //flyJumpsTimer-=1
  flyJumpsTimer-=gDeltaTime //60fps change: see above
  if jumps>1
  {
    gravityIntensity=0.5
  }
}
else if canFly and isCollisionBottom(1)=0 and isCollisionPlatformBottom(1)=0 and isCollisionPlatform()=0 and jumps>0
{
  flySpeed=100
  if jumps>1
    gravityIntensity=0.5
  if (kJumpPressed or flyJumpWasPressed) and flySpeed>80 and jumps<flyMaxJumps
  {
    jumps+=1
    flyInitialHeight-=50
    flyJumpsTimer=15
    flyJumpWasPressed=-1
    flyAcc2Timer=2
  }
}
//stops everything if the character jumps on a ladder (and stops moving) or ducks
if state=CLIMBING or state=DUCKING
{
  flySpeed=0
  flySpeedTimer=0
  flyAccTimer=0
  flyAcc2Timer=0
}
//causes the actual HUGE jump
if flyAccTimer>0
{
  //flyAccTimer-=1
  flyAccTimer-=gDeltaTime //60fps change: see above
  yAcc-=1
}
if flyAcc2Timer>0
{
  //flyAcc2Timer-=1
  flyAcc2Timer-=gDeltaTime //60fps change: see above
  if yVel>0
    yVel=0
  if y<flyInitialHeight and y<flyInitialHeight+200 
    yAcc+=(0.014)*(flyInitialHeight-y)-5.014
  else if y>flyInitialHeight
    yAcc-=5
  if facing=LEFT
  {
    xAcc-=2
  }
  else
  {
    xAcc+=2
  }
}
//apply the limits of flySpeed
if flySpeed>100
{
  flySpeed=100
  flySpeedTimer=60
}
else if flySpeed<0
  flySpeed=0

//calculates the horizontal and vertical friction, depending on the state of the charater
if state=CLIMBING
{
  xFric=frictionClimbingX
  yFric=frictionClimbingY
}
else
{
  if state=DUCKING
  {
    if xVel<2 and xVel>-2
      xFric=0.2
    else
      xFric=frictionDuckingX
  }
  else
  {
    //decrease the friction when the character is "flying"
    if canFly and jumps>1
      xFric=frictionFlyingX
    else if flySpeed>50
      xFric=frictionRunningFastX
    //else if platformCharacterIs(IN_AIR) and kLeft=0 and kRight=0
    else if (platformCharacterIs(IN_AIR) or landTickHold>0) and kLeft=0 and kRight=0 //60fps change: see the landing code
      xFric=frictionAirX
    else //On ground
    {
      //if dashMomentumTime>8 {xFric=0.96}
      //60fps change: dashMomentumTime was just counted down for this frame, so between 30fps ticks it holds fractions:
      //compare against the next whole number (>=9 instead of >8) so the dash friction lasts as many 30fps ticks as at 30fps
      if dashMomentumTime>=9 {xFric=0.96}
      else {xFric=frictionRunningX}
    }
  }
  //if the character is underwater
  if isCollisionWaterTop(1)
  {
    if state=FALLING and yVel>0
      yFric=0.5
    else
      yFric=0.9
  }
  else
    yFric=1
}
//60fps change: the acceleration, friction and movement code moved into pMoveToWrapOrig (unchanged, used at 30fps) and
//pMoveToWrapNew (above 30fps)
if gDeltaTime==1
{ //60fps change (added)
  pMoveToWrapOrig()
  xVelSetExt=0; yVelSetExt=0 //60fps change (added): unused at 30fps (pMoveToWrapNew clears them once used), so one set at 30fps isn't left waiting for when the frame rate goes up
} //60fps change (added)
else
{
  pMoveToWrapNew()
  //move the character downhill if possible
  //we need to multiply maxDownSlope by the absolute value of xVel since the character normally runs at an xVel larger than 1
  //(above 30fps: not while moving up. A launch from the ground without a state change moves less than maxDownSlope per
  //frame and would be pulled straight back down; at 30fps it moves a whole tick and gets away)
  if isCollisionBottom(1)=0 and maxDownSlope>0 and xVelInteger!=0 and platformCharacterIs(ON_GROUND) and yVel>=0
  {
    //the character is floating just above the slope, so move the character down
    upYPrev=y
    for(y=y;y<=upYPrev+maxDownSlope;y+=1)
      if isCollisionBottom(1) //we hit a solid below
      {
        upYPrev=y //I know that this doesn't seem to make sense, because of the name of the variable, but it all works out correctly after we break out of this loop
        break
      }
    y=upYPrev
  }
}
if landTickHold>0 {landTickHold-=gDeltaTime} //60fps change (added): see the landing code
//the character is no longer taking damage when they hit the ground
//if bTakingDamage=true and (state=STANDING or state=RUNNING or state=DUCKING or state=LOOKING_UP) and damageTime<26
//60fps change: damageTime counts down in fractions between 30fps ticks and is read here before this frame's count, so
//<26 let the player recover half a tick early (at 25.5); <=25 is the same tick as at 30fps
if bTakingDamage=true and (state=STANDING or state=RUNNING or state=DUCKING or state=LOOKING_UP) and damageTime<=25
  bTakingDamage=false
if damageTime<=recoverTime
  bTakingDamage=false

//makes the character attack
if kAttack and bTakingDamage=false and kAttackPressed=1 and attackState!=PART_JUMP_SLASH_1 and attackState!=ACT_CASTING and attackState!=ACT_CASTED
{
  if bUseBusterShot=false
  {
    if (state=STANDING or state=RUNNING or state=JUMPING or state=FALLING or state=DUCKING or state=LOOKING_UP) and attackState=0 and reAttackTime=0
    {
      idleTime=0
      image_index=0
      currentAttackCombo+=1
      attackComboTimer=0
      jumpSlashPower=0
      
      if kRight or kLeft
        attackState=PART_STAB
      else
        attackState=PART_H_SLASH
      
      if kDown and state=DUCKING
        attackState=PART_V_SLASH
      else if kDown and jumpTime>1 and (state=FALLING or state=JUMPING) // and yVel>5.5
      {
        effect=instance_create(x,y,oEffect)
        effect.sprite_index=sSpellCast
        attackState=PART_JUMP_SLASH_1
        yAcc=-2.5
        yVel=-2.5
        yVelSetExt=1 //60fps change (added): set speed + one-off push: a full 30fps tick's worth (see pMoveToWrapNew). Ext, not Tick: this is after the move, and the Tick flags are cleared at the top of the next step before they're used (the jump slash's pop came out 4.9px at 60fps, 3.5px at 120fps instead of 6.9; now 6.7)
      }
      else if kUp
        attackState=PART_UP_SLASH

      if attackState!=PART_JUMP_SLASH_1
      {
        playerAttack=instance_create(x,y,oPartSlashes)
        if yVel>1
        {
          yVel-=2
          yAcc-=1
          yVelSetExt=1 //60fps change (added): see above
        }
      }
      playerBattleCry()
    }
  }
  else //use buster shot
  {
    if (state=STANDING or state=LOOKING_UP) and attackState=0 and busterNum<3
    {
      idleTime=0
      busterNum+=1
      attackComboTimer=0
      jumpSlashPower=0
      mmState=BUSTER_STAND
      busterAnimStay=15
      playerAttack=instance_create(x,y-32,oBusterShot)
      if facing=RIGHT
      {
        playerAttack.x+=12
        playerAttack.shootSpeed=12
      }
      else
      {
        playerAttack.x-=12
        playerAttack.shootSpeed=-12
      }
    }
    else if state=RUNNING and attackState=0 and busterNum<3
    {
      idleTime=0
      busterNum+=1
      attackComboTimer=0
      jumpSlashPower=0
      mmState=BUSTER_RUN
      busterAnimStay=15
      playerAttack=instance_create(x,y-26,oBusterShot)
      if facing=RIGHT
      {
        playerAttack.x+=22
        playerAttack.shootSpeed=12
      }
      else
      {
        playerAttack.x-=22
        playerAttack.shootSpeed=-12
      }
    }
    else if (state=JUMPING or state=FALLING) and attackState=0 and busterNum<3
    {
      idleTime=0
      busterNum+=1
      attackComboTimer=0
      jumpSlashPower=0
      mmState=BUSTER_JUMP
      busterAnimStay=15
      playerAttack=instance_create(x,y-33,oBusterShot)
      if facing=RIGHT
      {
        playerAttack.x+=13
        playerAttack.shootSpeed=12
      }
      else
      {
        playerAttack.x-=13
        playerAttack.shootSpeed=-12
      }
    }
  }
}

//extra power from jump slash
if attackState=PART_JUMP_SLASH_1
{
  if kLeft {xAcc-=5}
  else if kRight {xAcc+=5}
  
  if global.SkSmash>0 {smashMod=1.5}
  else {smashMod=0}

  //60fps change: builds up once per 30fps tick (each step rounds it, so it can't take a frame's share instead)
  if gDeltaDoTicks
  {
  if jumpSlashPower<50 {jumpSlashPower=round((jumpSlashPower+(abs(yVel/2))+(abs(xVel/2)))+smashMod)}
  else if jumpSlashPower>50 and jumpSlashPower<100 {jumpSlashPower=round((jumpSlashPower+(abs(yVel/1.5))+(abs(xVel/1.5)))+smashMod)}
  else if jumpSlashPower>200 and jumpSlashPower<500 {jumpSlashPower=round((jumpSlashPower+(abs(yVel/1.25))+(abs(xVel/1.25)))+smashMod)}
  else {jumpSlashPower=round((jumpSlashPower+(abs(yVel))+(abs(xVel)))+smashMod)}
  } //60fps change (added)
}
//check for jump slash to end
if (attackState=PART_JUMP_SLASH_1 and (state=STANDING or state=RUNNING or state=DUCKING or state=LOOKING_UP)) // or (attackState=PART_JUMP_SLASH_1 and jumpSlashPower>150 and yVel>-0.5 and yVel<0.5)
{
  attackState=PART_JUMP_SLASH_2
  playSound(global.snd_JumpStrike,0,1)
  if jumpSlashPower>=200
  {
    dashInvulnerabilityTime+=round(jumpSlashPower/15)
    if dashInvulnerabilityTime>150 {dashInvulnerabilityTime=150}
  }
  if jumpSlashPower>=300 {instance_create(0,0,oViewShaker)}
  if jumpSlashPower>global.recMostPowerfulJumpAttack {global.recMostPowerfulJumpAttack=jumpSlashPower}
  playerAttack=instance_create(x,y,oPartSlashes)
  jumpSlashPower=0
}

//effect and extra power for Grand Slam Tech
if attackState=TECH_GRAND_SLAM
{
  xVel=0
  yVel=14
  xVelSetExt=1; yVelSetExt=1 //60fps change (added): set every frame (see pMoveToWrapNew). Ext, not Tick: this is after the move (see the jump slash above); the dive was 7% slow
  //jumpSlashPower+=15
  jumpSlashPower+=15*gDeltaTime //60fps change: per 30fps tick
}
//check for Grand Slam Tech
if attackState=TECH_GRAND_SLAM and (state=STANDING or state=RUNNING or state=DUCKING or state=LOOKING_UP)
{
  techAttack=instance_create(x,y,oTechClose)
  if jumpSlashPower>=200
  {
    dashInvulnerabilityTime+=round(jumpSlashPower/15)
    if dashInvulnerabilityTime>150 {dashInvulnerabilityTime=150}
  }
  yVel=0
  attackState=0
  jumpSlashPower=0
}

//attack combo time
if currentAttackCombo>0
{
  //attackComboTimer+=1
  attackComboTimer+=gDeltaTime //60fps change: counts 30fps ticks
  if attackComboTimer>=nextAttackTime
  {
    attackComboTimer=0
    currentAttackCombo=0
  }
}

//time for attack speed
if reAttackTime>0
  //reAttackTime-=1
  reAttackTime=max(0,reAttackTime-gDeltaTime) //60fps change: counts 30fps ticks (and stops at 0: it's checked for =0)

//element swap
if kElementSwapForward and kElementSwapForwardPressed=1
{
  playSound(global.snd_MenuCancel,0,1)
  if global.p1CurrentElement=4
    global.p1CurrentElement=0
  else
    global.p1CurrentElement+=1
  
  if global.p1CurrentElement=0
    global.p1SpellEquip=""
  else if global.p1CurrentElement=1
    global.p1SpellEquip=global.p1FireEquip
  else if global.p1CurrentElement=2
    global.p1SpellEquip=global.p1WaterEquip
  else if global.p1CurrentElement=3
    global.p1SpellEquip=global.p1WindEquip
  else if global.p1CurrentElement=4
    global.p1SpellEquip=global.p1EarthEquip
}
if kElementSwapBack and kElementSwapBackPressed=1
{
  playSound(global.snd_MenuCancel,0,1)
  if global.p1CurrentElement=0
    global.p1CurrentElement=4
  else
    global.p1CurrentElement-=1
  
  if global.p1CurrentElement=0
    global.p1SpellEquip=""
  else if global.p1CurrentElement=1
    global.p1SpellEquip=global.p1FireEquip
  else if global.p1CurrentElement=2
    global.p1SpellEquip=global.p1WaterEquip
  else if global.p1CurrentElement=3
    global.p1SpellEquip=global.p1WindEquip
  else if global.p1CurrentElement=4
    global.p1SpellEquip=global.p1EarthEquip
}

//ability swap
if attackState!=ACT_CASTING
{
  if kAbilitySwapForward and kAbilitySwapForwardPressed=1
  {
    playSound(global.snd_MenuCancel,0,1)
    if global.p1CurrentElement=0
    {
      if global.techLv>=1
      {
        if global.p1TechniqueEquip="MENTAL INSURRECTION" and global.techLv>=2
          global.p1TechniqueEquip="WAVE OF AWESOME"
        else if global.p1TechniqueEquip="WAVE OF AWESOME" and global.techLv>=3
          global.p1TechniqueEquip="KUDEKU"
        else if global.p1TechniqueEquip="KUDEKU" and global.techLv>=4
          global.p1TechniqueEquip="GRAND SLAM"
        else
          global.p1TechniqueEquip="MENTAL INSURRECTION"
      }
    }
    else if global.p1CurrentElement=1
    {
      if global.p1FireEquip="FIREBALL" and global.fireLv>=2
        global.p1FireEquip="FLAME PILLAR"
      else if global.p1FireEquip="FLAME PILLAR" and global.fireLv>=3
        global.p1FireEquip="BLAST OFF"
      else if global.p1FireEquip="BLAST OFF" and global.fireLv>=4
        global.p1FireEquip="INFERNO"
      else if global.p1FireEquip="INFERNO" and global.fireLv>=5
        global.p1FireEquip="WILDFIRE"
      else
        global.p1FireEquip="FIREBALL"
      global.p1SpellEquip=global.p1FireEquip
    }
    else if global.p1CurrentElement=2
    {
      if global.p1WaterEquip="WATER BLAST" and global.waterLv>=2
        global.p1WaterEquip="WATER BARRIER"
      else if global.p1WaterEquip="WATER BARRIER" and global.waterLv>=3
        global.p1WaterEquip="FLOOD"
      else if global.p1WaterEquip="FLOOD" and global.waterLv>=4
        global.p1WaterEquip="SOOTHING SPRING"
      else if global.p1WaterEquip="SOOTHING SPRING" and global.waterLv>=5
        global.p1WaterEquip="PIERCING STREAM"
      else
        global.p1WaterEquip="WATER BLAST"
      global.p1SpellEquip=global.p1WaterEquip
    }
    else if global.p1CurrentElement=3
    {
      if global.p1WindEquip="WIND BURST" and global.windLv>=2
        global.p1WindEquip="ZEPHYR"
      else if global.p1WindEquip="ZEPHYR" and global.windLv>=3
        global.p1WindEquip="CYCLONE"
      else if global.p1WindEquip="CYCLONE" and global.windLv>=4
        global.p1WindEquip="BLAST SHIELD"
      else if global.p1WindEquip="BLAST SHIELD" and global.windLv>=5
        global.p1WindEquip="HURRICANE"
      else
        global.p1WindEquip="WIND BURST"
      global.p1SpellEquip=global.p1WindEquip
    }
    else if global.p1CurrentElement=4
    {
      if global.p1EarthEquip="ROCK SMASH"
        global.p1EarthEquip="NATURE'S GIFT"
      else if global.p1EarthEquip="NATURE'S GIFT" and global.earthLv>=2
        global.p1EarthEquip="EARTH SHIFT"
      else if global.p1EarthEquip="EARTH SHIFT" and global.earthLv>=3
        global.p1EarthEquip="RUPTURE"
      else if global.p1EarthEquip="RUPTURE" and global.earthLv>=4
        global.p1EarthEquip="ROCK DRILL"
      else
        global.p1EarthEquip="ROCK SMASH"
      global.p1SpellEquip=global.p1EarthEquip
    }
  }
  if kAbilitySwapBack and kAbilitySwapBackPressed=1
  {
    playSound(global.snd_MenuCancel,0,1)
    if global.p1CurrentElement=0
    {
      if global.techLv>=1
      {
        if global.p1TechniqueEquip="GRAND SLAM"
          global.p1TechniqueEquip="KUDEKU"
        else if global.p1TechniqueEquip="KUDEKU"
          global.p1TechniqueEquip="WAVE OF AWESOME"
        else if global.p1TechniqueEquip="WAVE OF AWESOME"
          global.p1TechniqueEquip="MENTAL INSURRECTION"
        else if global.p1TechniqueEquip="MENTAL INSURRECTION"
        {
          if global.techLv=2
            global.p1TechniqueEquip="WAVE OF AWESOME"
          else if global.techLv=3
            global.p1TechniqueEquip="KUDEKU"
          else if global.techLv=4 or global.techLv=5
            global.p1TechniqueEquip="GRAND SLAM"
        }
      }
    }
    else if global.p1CurrentElement=1
    {
      if global.p1FireEquip="WILDFIRE"
        global.p1FireEquip="INFERNO"
      else if global.p1FireEquip="INFERNO"
        global.p1FireEquip="BLAST OFF"
      else if global.p1FireEquip="BLAST OFF"
        global.p1FireEquip="FLAME PILLAR"
      else if global.p1FireEquip="FLAME PILLAR"
        global.p1FireEquip="FIREBALL"
      else if global.p1FireEquip="FIREBALL"
      {
        if global.fireLv=2
          global.p1FireEquip="FLAME PILLAR"
        else if global.fireLv=3
          global.p1FireEquip="BLAST OFF"
        else if global.fireLv=4
          global.p1FireEquip="INFERNO"
        else if global.fireLv=5
          global.p1FireEquip="WILDFIRE"
      }
      global.p1SpellEquip=global.p1FireEquip
    }
    else if global.p1CurrentElement=2
    {
      if global.p1WaterEquip="PIERCING STREAM"
        global.p1WaterEquip="SOOTHING SPRING"
      else if global.p1WaterEquip="SOOTHING SPRING"
        global.p1WaterEquip="FLOOD"
      else if global.p1WaterEquip="FLOOD"
        global.p1WaterEquip="WATER BARRIER"
      else if global.p1WaterEquip="WATER BARRIER"
        global.p1WaterEquip="WATER BLAST"
      else if global.p1WaterEquip="WATER BLAST"
      {
        if global.waterLv=2
          global.p1WaterEquip="WATER BARRIER"
        else if global.waterLv=3
          global.p1WaterEquip="FLOOD"
        else if global.waterLv=4
          global.p1WaterEquip="SOOTHING SPRING"
        else if global.waterLv=5
          global.p1WaterEquip="PIERCING STREAM"
      }
      global.p1SpellEquip=global.p1WaterEquip
    }
    else if global.p1CurrentElement=3
    {
      if global.p1WindEquip="HURRICANE"
        global.p1WindEquip="BLAST SHIELD"
      else if global.p1WindEquip="BLAST SHIELD"
        global.p1WindEquip="CYCLONE"
      else if global.p1WindEquip="CYCLONE"
        global.p1WindEquip="ZEPHYR"
      else if global.p1WindEquip="ZEPHYR"
        global.p1WindEquip="WIND BURST"
      else if global.p1WindEquip="WIND BURST"
      {
        if global.windLv=2
          global.p1WindEquip="ZEPHYR"
        else if global.windLv=3
          global.p1WindEquip="CYCLONE"
        else if global.windLv=4
          global.p1WindEquip="BLAST SHIELD"
        else if global.windLv=5
          global.p1WindEquip="HURRICANE"
      }
      global.p1SpellEquip=global.p1WindEquip
    }
    else if global.p1CurrentElement=4
    {
      if global.p1EarthEquip="ROCK DRILL"
        global.p1EarthEquip="RUPTURE"
      else if global.p1EarthEquip="RUPTURE"
        global.p1EarthEquip="EARTH SHIFT"
      else if global.p1EarthEquip="EARTH SHIFT"
        global.p1EarthEquip="NATURE'S GIFT"
      else if global.p1EarthEquip="NATURE'S GIFT"
        global.p1EarthEquip="ROCK SMASH"
      else if global.p1EarthEquip="ROCK SMASH"
      {
        if global.earthLv=1
          global.p1EarthEquip="NATURE'S GIFT"
        else if global.earthLv=2
          global.p1EarthEquip="EARTH SHIFT"
        else if global.earthLv=3
          global.p1EarthEquip="RUPTURE"
        else if global.earthLv=4
          global.p1EarthEquip="ROCK DRILL"
      }
      global.p1SpellEquip=global.p1EarthEquip
    }
  }
}

if bTakingDamage=false and attackState!=PART_JUMP_SLASH_1 and attackState!=ACT_CASTING and attackState!=ACT_CASTED
{
  //tech/spell use
  if kTechUse and kTechUsePressed=1 and (state=STANDING or state=RUNNING or state=JUMPING or state=FALLING or state=DUCKING or state=LOOKING_UP)
    //playerTechUse(1)
    scrDPadSpellUse(1) //dpad spells change: playerTechUse(1), with the technique for the direction held while DPad Spells is on
  if kSpellUse and kSpellUsePressed=1 and (state=STANDING or state=RUNNING or state=JUMPING or state=FALLING or state=DUCKING or state=LOOKING_UP)
    //playerTechUse(2)
    scrDPadSpellUse(2) //dpad spells change: playerTechUse(2), with the spell for the direction held while DPad Spells is on

  //start rave
  if kRave and bRaveActive=false and kRavePressed=1 and global.currentBoss="" and global.p1RaveEnergy>=raveMax and (state=STANDING or state=RUNNING or state=JUMPING or state=FALLING or state=DUCKING or state=LOOKING_UP)
  {
    idleTime=0
    global.recUsedRaveMode+=1
    if global.optMusic>0
    {
      stopAllMusic()
      var tempMplay;
      tempMplay=global.msc_YouSpinMeRound
      playMusic(tempMplay,0,1)
    }
    leftRaveBall=instance_create(96,0,oRaveBall)
    rightRaveBall=instance_create(416,0,oRaveBall)
    if random(10)>=6
    {
      if random(10)>6
      {
        global.recSeenMichaelJackson+=1
        ravePartner1=instance_create(x+16,y,oRavePartner)
        ravePartner1.sprite_index=sMJDance
        ravePartner1.image_speed=0.33
      }
      else
      {
        global.recSeenKirby+=1
        ravePartner1=instance_create(x-64,y,oRavePartner)
        ravePartner1.image_speed=0.8
        ravePartner2=instance_create(x+64,y,oRavePartner)
        ravePartner2.image_speed=0.8
      }
    }
    raveTime=raveTimeTotal
    global.p1RaveEnergy=0
    bRaveActive=true
  }
  else if kRave and bRaveActive=false and kRavePressed=1 and global.currentBoss="Mitra" and global.p1RaveEnergy>=raveMax and (state=STANDING or state=RUNNING or state=JUMPING or state=FALLING or state=DUCKING or state=LOOKING_UP) //Final boss exclusive
  {
    idleTime=0
    global.recUsedRaveMode+=1
    if global.optMusic>0
    {
      stopAllMusic()
      var tempMplay;
      tempMplay=global.msc_YouSpinMeRound
      playMusic(tempMplay,0,1)
    }
    leftRaveBall=instance_create(96,0,oRaveBall)
    rightRaveBall=instance_create(416,0,oRaveBall)
    global.recSeenKirby+=1
    var kirbyAppearX;
    kirbyAppearX=x-64
    for(i=0;i<5;i+=1)
    {
      ravePartner[i]=instance_create(kirbyAppearX,y,oRavePartner)
      ravePartner[i].image_speed=0.8
      kirbyAppearX+=32
    }
    raveTime=raveTimeTotal
    oMitra.setPDefense=150
    global.p1RaveEnergy=0
    bRaveActive=true
  }
}

//flash time after taking damage
if bCanTakeHit=false
{
  //damageTime-=1
  damageTime-=gDeltaTime //60fps change: counts 30fps ticks
  //if sprite_index!=sPlayerDamaged
  if sprite_index!=sPlayerDamaged and gDeltaDoTicks //60fps change: flickers once per 30fps tick
  {
    if image_alpha=0.75
      image_alpha=0.25
    else
      image_alpha=0.75
  }
  //if damageTime=0
  if damageTime<=0 //60fps change: (it counts in fractions; the same at 30fps)
  {
    image_alpha=1
    bCanTakeHit=true
    bTakingDamage=false
  }
}

//casting time
if attackState=ACT_CASTING
{
  if castingTime<=0
  {
    idleTime=0
    global.recSpellsCast+=1
    attackState=ACT_CASTED
    castRecovering=castRecoveryTime
    if global.castedSpell=1
    {
      playSound(global.snd_SpellFireball,0,1)
      playerAttack=instance_create(x,y,oSpell)
    }
    else if global.castedSpell=2
    {
      playSound(global.snd_SpellFireball,0,1)
      playerAttack=instance_create(x,y,oSpell)
    }
    else if global.castedSpell=3
    {
      playSound(global.snd_SpellFireball,0,1)
      blastOffRecoveryTime=50
      playerAttack=instance_create(x,y,oBlastOff)
    }
    else if global.castedSpell=4
    {
      playSound(global.snd_SpellFireball,0,1)
      playerAttack=instance_create(x,view_yview[0],oSpell)
      playerAttack=instance_create(x-96,view_yview[0],oSpell)
      playerAttack=instance_create(x+96,view_yview[0],oSpell)
    }
    else if global.castedSpell=5
    {
      playSound(global.snd_SpellFireball,0,1)
      var wfDir;
      wfDir=0
      for(i=0;i<12;i+=1)
      {
        playerAttack=instance_create(x,y,oWildfire)
        playerAttack.flyDir=wfDir
        wfDir+=360/12
      }
    }
    else if global.castedSpell=11
    {
      playSound(global.snd_SpellWaterBlast,0,1)
      playerAttack=instance_create(x,y,oSpell)
    }
    else if global.castedSpell=12
    {
      playSound(global.snd_SpellWaterBlast,0,1)
      playerAttack=instance_create(x,y-22,oWaterBarrier)
    }
    else if global.castedSpell=13
    {
      playSound(global.snd_SpellWaterBlast,0,1)
      playerAttack=instance_create(x,y,oSpell)
    }
    else if global.castedSpell=14
    {
      playSound(global.snd_SpellWaterBlast,0,1)
      playerAttack=instance_create(x,y,oSoothingSpring)
    }
    else if global.castedSpell=15
    {
      playSound(global.snd_SpellWaterBlast,0,1)
      playerAttack=instance_create(x,y-22,oSpell)
    }
    else if global.castedSpell=21
    {
      playSound(global.snd_SpellWindStorm,0,1)
      playerAttack=instance_create(x+10,y,oSpell)
      playerAttack.xVel=7.5
      playerAttack=instance_create(x-10,y,oSpell)
      playerAttack.xVel=-7.5
    }
    else if global.castedSpell=22
    {
      playSound(global.snd_SpellWindStorm,0,1)
      playerAttack=instance_create(x,y,oZephyr)
    }
    else if global.castedSpell=23
    {
      playSound(global.snd_SpellWindStorm,0,1)
      playerAttack=instance_create(x,y,oSpell)
    }
    else if global.castedSpell=24
    {
      playSound(global.snd_SpellWindStorm,0,1)
      playerAttack=instance_create(x,y,oBlastShield)
    }
    else if global.castedSpell=25
    {
      playSound(global.snd_SpellWindStorm,0,0.9)
      playSound(global.snd_WindGust,0,0.8)
      playerAttack=instance_create(x+16,y+32,oHurricane)
      playerAttack.xVel=4
      playerAttack=instance_create(x-16,y+32,oHurricane)
      playerAttack.xVel=-4
    }
    else if global.castedSpell=31
    {
      playSound(global.snd_PlayerAtk[2],0,1)
      playerAttack=instance_create(x,y,oSpell)
    }
    else if global.castedSpell=32
    {
      playSound(global.snd_HealingPlant,0,1)
      totalHeal=maxLife*0.1
      if global.optShowDamage=true
      {
        newDamage=instance_create(x,y-(sprite_height/2+(sprite_height/4)),oDamageNotice);
        newDamage.damageValue=totalHeal
        newDamage.damageColor=make_color_rgb(78,192,34)
      }
      life+=round(totalHeal)
      effect=instance_create(oPlayer1.x,oPlayer1.y-(oPlayer1.sprite_height/2),oEffect)
      effect.sprite_index=sHeal
    }
    else if global.castedSpell=33
    {
      playSound(global.snd_PlayerAtk[2],0,1)
      playerAttack=instance_create(x,y,oEarthShift)
    }
    else if global.castedSpell=34
    {
      playSound(global.snd_BoulderHit,0,1)
      playerAttack=instance_create(x,y,oRupture)
      playerAttack.type=0
      playerAttack.baseLifeTime=12
      playerAttack.rocksLeft=5
      playerAttack.initYinc=2.5
      playerAttack.scaling=0.9
      playerAttack.curY=y
      playerAttack=instance_create(x,y,oRupture)
      playerAttack.type=1
      playerAttack.baseLifeTime=12
      playerAttack.rocksLeft=5
      playerAttack.initYinc=2.5
      playerAttack.scaling=0.9
      playerAttack.curY=y
    }
    else if global.castedSpell=35
    {
      playSound(global.snd_PlayerAtk[2],0,1)
      playerAttack=instance_create(x,y-25,oRockDrill)
    }
    
    if elementEnergyCost>0
    {
      if global.castedSpell>=1 and global.castedSpell<=9
      {
        if global.SkFireCraft>0
        {
          CostMod=global.SkFireCraft*12
          elementEnergyCost/=(CostMod/100)+1
        }
        fireEnergy-=elementEnergyCost
      }
      if global.castedSpell>=11 and global.castedSpell<=19
      {
        if global.SkWaterCraft>0
        {
          CostMod=global.SkWaterCraft*12
          elementEnergyCost/=(CostMod/100)+1
        }
        waterEnergy-=elementEnergyCost
      }
      if global.castedSpell>=21 and global.castedSpell<=29
      {
        if global.SkWindCraft>0
        {
          CostMod=global.SkWindCraft*12
          elementEnergyCost/=(CostMod/100)+1
        }
        windEnergy-=elementEnergyCost
      }
      if global.castedSpell>=31 and global.castedSpell<=39
      {
        if global.SkEarthCraft>0
        {
          CostMod=global.SkEarthCraft*12
          elementEnergyCost/=(CostMod/100)+1
        }
        earthEnergy-=elementEnergyCost
      }
      elementEnergyCost=0
    }
    if spiritEnergyCost>0
    {
      if global.SkVirtue>0
      {
        tempCost=global.SkVirtue*8
        spiritEnergyCost/=(tempCost/100)+1
      }
      spiritEnergy-=spiritEnergyCost
      spiritEnergyCost=0
    }
  }
  else
    //castingTime-=1
    castingTime-=gDeltaTime //60fps change: counts 30fps ticks
}
else if attackState=ACT_CASTED
{
  if castRecovering<=0
    attackState=0
  else
    //castRecovering-=1
    castRecovering-=gDeltaTime //60fps change: counts 30fps ticks
}

//figures out what sprite index the character should be
if attackState=0 and bTakingDamage=false
{
  if state=STANDING
    sprite_index=sPlayerIdle
  else if state=RUNNING
    sprite_index=sPlayerWalk
  else if state=DUCKING
    sprite_index=sPlayerDuck
  else if state=LOOKING_UP
    sprite_index=sPlayerLookUp
  else if state=CLIMBING
    sprite_index=sPlayerIdle
  else if state=JUMPING
  {
    if airDashRecovery=0
    {
      if facing=RIGHT
      {
        if xVel>10
          sprite_index=sPlayerJumpForward
        else if xVel<-7.5
          sprite_index=sPlayerJumpBack
        else
          sprite_index=sPlayerJump
      }
      else
      {
        if xVel>7.5
          sprite_index=sPlayerJumpBack
        else if xVel<-10
          sprite_index=sPlayerJumpForward
        else
          sprite_index=sPlayerJump
      }
    }
    else
      sprite_index=sPlayerAirDash
  }
  else if state=FALLING and statePrev=FALLING and statePrevPrev=FALLING
  {
    if airDashRecovery=0
      sprite_index=sPlayerJump
    else
      sprite_index=sPlayerAirDash
  }
  else if flySpeed>90 and jumps>0 and jumps<flyMaxJumps and platformCharacterIs(IN_AIR)
    sprite_index=sPlayerJumpForward
}
//figures out what attack sprite index the character should be
//attack state animations override action states
if busterAnimStay>0
  //busterAnimStay-=1
  busterAnimStay-=gDeltaTime //60fps change: counts 30fps ticks
if bTakingDamage=false
{
  if attackState=PART_H_SLASH
    sprite_index=sPlayerHSlash
  else if attackState=PART_V_SLASH
    sprite_index=sPlayerVSlash
  else if attackState=PART_STAB
    sprite_index=sPlayerStab
  else if attackState=PART_JUMP_SLASH_1
    sprite_index=sPlayerJumpSlash1
  else if attackState=PART_JUMP_SLASH_2
    sprite_index=sPlayerJumpSlash2
  else if attackState=PART_UP_SLASH
    sprite_index=sPlayerUpSlash
  if busterAnimStay>0
  {
    if mmState=BUSTER_STAND
      sprite_index=sPlayerBusterStand
    else if mmState=BUSTER_RUN
      sprite_index=sPlayerBusterRun
    else if mmState=BUSTER_JUMP
      sprite_index=sPlayerBusterJump
  }
  if attackState=TECH_MENTAL_INSURRECTION
    sprite_index=sPlayerMental
  else if attackState=TECH_WAVE_OF_AWESOME
    sprite_index=sPlayerCasted
  else if attackState=TECH_KUDEKU
    sprite_index=sPlayerKudeku
  else if attackState=TECH_GRAND_SLAM
    sprite_index=sPlayerMental
  else if attackState=SUMMON
    sprite_index=sPlayerCasted
  
  if attackState=ACT_CASTING
    sprite_index=sPlayerCasting
  else if attackState=ACT_CASTED
    sprite_index=sPlayerCasted
  else if instance_exists(oBlastOff)
    sprite_index=sPlayerLookUp
  else if attackState=ACT_MORPHBALL
    sprite_index=sPlayerMorphBall
}
else
{
  if attackState!=ACT_MORPHBALL
    sprite_index=sPlayerDamaged
  else
    sprite_index=sPlayerMorphBall
}

//figures out which direction the sprite should be facing
if facing=LEFT
  image_xscale=-1
else if facing=RIGHT
  image_xscale=1

//sets the previous state and the previously previous state
//60fps change: once per 30fps tick, so the falling sprite above still waits for 3 ticks of falling
if gDeltaDoTicks
{
statePrevPrev=statePrev
statePrev=state
attackStatePrevPrev=attackStatePrev
attackStatePrev=attackState
} //60fps change (added)
//calculates the image_speed based on the character's velocity
if state=RUNNING
  image_speed=abs(xVel)*runAnimSpeed+0.1
else if state=CLIMBING
  image_speed=sqrt(sqr(abs(xVel))+sqr(abs(yVel)))*climbAnimSpeed
else if state=STANDING or state=DUCKING or state=LOOKING_UP or attackState=ACT_CASTING
  image_speed=idleAnimSpeed
if attackState!=0
  image_speed=attackAnimSpeed
if sprite_index=sPlayerDamaged
  image_speed=0.75
if sprite_index=sPlayerJumpForward
  image_speed=0.5

//limit the image_speed at 1 so the animation always looks good
if image_speed>1
  image_speed=1
