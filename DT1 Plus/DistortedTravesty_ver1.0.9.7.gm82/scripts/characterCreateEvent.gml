/*
This script should be placed in the "Create Event" of the character.
It sets the variables needed for character.

You can edit the "user variables" if you don't want to use the default values.  

This script sets the collision bounds using this code: setCollisionBounds(-5,-7,5,8)
You can modify the arguments to make a collsion bounds that fits your own sprites.
If you are just going to use the default sprites, there is no reason to edit
the arguments.
*/
gameControl=instance_create(0,0,oGame) //game control
identifier=instance_create(mouse_x,mouse_y,oIdentifier) //follow mouse target
HUD=instance_create(0,0,oHUD)
//constant states that the platform character may be (don't edit)
STANDING=10
RUNNING=11
DUCKING=12
LOOKING_UP=13
CLIMBING=14
JUMPING=15
FALLING=16
DYING=17
LEFT=18
RIGHT=19
ON_GROUND=20
IN_AIR=21
ON_LADDER=22

//constant attack states the character may be (don't edit)
attackState=0 //The attack type the character is performing

PART_H_SLASH=30
PART_V_SLASH=31
PART_STAB=32
PART_JUMP_SLASH_1=33
PART_JUMP_SLASH_2=34
PART_UP_SLASH=35
BUSTER_STAND=40
BUSTER_RUN=41
BUSTER_JUMP=42
//constant action states
ACT_CASTING=50
ACT_CASTED=51
ACT_MORPHBALL=52
//constant action states
TECH_MENTAL_INSURRECTION=60
TECH_WAVE_OF_AWESOME=61
TECH_KUDEKU=62
TECH_GRAND_SLAM=63
SUMMON=64

//the keys that the platform character will use (don't edit)
kLeft=0
kRight=0
kUp=0
kDown=0
kJump=0
kJumpPressed=0
kRun=0
kAttack=0
kAttackPressed=0
kElementSwapForward=0
kElementSwapForwardPressed=0
kElementSwapBack=0
kElementSwapBackPressed=0
kAbilitySwapForward=0
kAbilitySwapForwardPressed=0
kAbilitySwapBack=0
kAbilitySwapBackPressed=0
kTechUse=0
kTechUsePressed=0
kSpellUse=0
kSpellUsePressed=0
kRave=0
kRavePressed=0
kDashLeft=0
kDashLeftPressed=0
kDashRight=0
kDashRightPressed=0
//element wheel change (added): the Element Wheel (scrElemWheel, scrElemWheelDraw): its button held on the last frame, the
//wheel up (from the button's press to its release), the element picked on it (-1 none), the directions held on the last
//frame (1 up, 2 right, 4 down, 8 left), and the frame it last ran (global.gpFrames; -10: none yet, so a button held into
//the map has to be let go first)
ewHeld=0
ewOn=0
ewPick=-1
ewDirs=0
ewFrame=-10

//user variables (you can edit these)
player=1                   //player number (player 2 uses different keyboard keys than player 1)
state=FALLING              //the character state, must be one of the following: STANDING, RUNNING, DUCKING, LOOKING_UP, CLIMBING, JUMPING, or FALLING
facing=RIGHT               //which direction the character is facing, must be either LEFT or RIGHT
runAcc=7.05                //the running acceleration
grav=1.35                  //the gravity
if global.gameProgress>=346
{
  initialJumpAcc=-15.46
  jumpTimeTotal=44
}
else
{
  initialJumpAcc=-7.15       //relates to how high the character will jump
  jumpTimeTotal=22           //how long the user must hold the jump button to get the maximum jump height
}
climbAcc=0.8               //how fast the character will climb
runAnimSpeed=0.045         //relates to how fast the running animation should go
climbAnimSpeed=0.1         //relates to how fast the climbing animation should go
departLadderXVel=4         //how fast character should be moving horizontally when he leaves the ladder
departLadderYVel=-4        //how fast the character should be moving vertically when he leaves the ladder
maxSlope=4                 //approximately how many pixels the character can climb UPWARDS per step (a value of 5 means the character can climb up a slope of 5)
maxDownSlope=8             //approximately how many pixels the character can climb DOWNWARDS per step (a value of 5 means the character can climb down a slope of 5)
canRun=1                   //when the user presses the shift button, should the character be allowed to run?
canFly=0                   //whether the character can do a fly jump when running at full speed
canFlyJump=0               //whether the character can do continuous fly jumps (mid-air)
flyMaxJumps=5              //the maximum number of jumps the character can perform while flying
frictionAirX=0.82          //friction obtained while in the air while no keys are pressed
frictionRunningX=0.5       //friction obtained while running
frictionRunningFastX=0.98  //friction obtained while holding the shift button for some time while running
frictionClimbingX=0.5      //friction obtained while climbing
frictionClimbingY=0.8      //friction obtained while climbing
frictionDuckingX=0.85      //friction obtained while ducking
frictionFlyingX=0.98       //friction obtained while "flying"
xVelLimit=16               //limits the xVel
yVelLimit=16               //limits the yVel
xAccLimit=10               //limits the xAcc
yAccLimit=10               //limits the yAcc
attackAnimSpeed=0.5        //relates to how fast the attack animations should be
attackSpeed=1              //how fast the character can attack again
attackFinishSpeed=2        //how fast the character can attack again after finishing a combo
dashVel=14                 //the initial dash velocity
lowHealthThreshold=0.2     //relates to the health percent the character must be at before the low health warning will sound
if global.SkSwiftFoot=0
  dashInvulnerability=8    //how long character is invulnerable after dashing
else if global.SkSwiftFoot=1
  dashInvulnerability=9
idleAnimSpeed=0.1          //relates to how fast the idle animations should be
castRecoveryTime=2         //how long till the player recovers after casting a spell
baseSpiritRecharge=0.25    //base spirit recharge
baseElementRecharge=0.65   //base element recharge
if global.SkAgility=0
  dashRecovery=35          //how long it takes to recover 1 dash point
else if global.SkAgility=1
  dashRecovery=30
raveTimeTotal=660          //how long to stay in Rave Mode
canAirDash=1               //whether the character can dash in the air
dashWarnSound=0            //if the dash warn sound can play
airTime=0                  //how long the player is in the air

//sets the collision bounds to fit the default sprites (you can edit the arguments of the script)
setCollisionBounds(-8,-44,8,-1)

//hidden variables (don't edit)
statePrev=state
statePrevPrev=statePrev
attackStatePrev=attackState
attackStatePrevPrev=attackStatePrev
gravityIntensity=grav      //this variable describes the current force due to gravity (this variable is altered for variable jumping)
jumpTime=jumpTimeTotal     //current time of the jump (0=start of jump, jumpTimeTotal=end of jump)
jumpButtonReleased=0       //whether the jump button was released. (Stops the user from pressing the jump button many times to get extra jumps)
ladderTimer=0              //relates to whether the character can climb a ladder
jumps=0
flySpeed=0                 //ranges between 0 and 100. When the flySpeed is approximately 100, the character can "fly."
flySpeedTimer=0
flyAccTimer=0
flyAcc2Timer=0
flyJumpsTimer=0
flyJumpWasPressed=0
dashInvulnerabilityTime=0  //current time till character is no longer invulnerable from dashing
bInsideSoothingSpring=0    //if the player is inside Soothing Spring

//variables pertaining to attacking
currentAttackCombo=0       //current attack in combo string
maxAttackCombo=3           //max attacks in a combo string
attackComboTimer=0         //current time till combo string ends
if global.SkComboMaster=0
  nextAttackTime=13        //max time to continue combo string
else if global.SkComboMaster=1
  nextAttackTime=15
if global.SkQuickRecovery=0
  recoverTime=19           //time till character recovers from damage
else if global.SkQuickRecovery=1
  recoverTime=24
reAttackTime=0             //current time till character can attack again
jumpSlashPower=0           //extra damage from jump attack
spiritEnergyCost=0         //spirit energy current skill uses
elementEnergyCost=0        //element energy current skill uses
castingTimeTotal=1         //total time to cast a spell
castingTime=0              //current time till spell is cast
castRecovering=0           //current time till character recovers
hitCombo=0                 //current hits in combo
killChain=0                //current kills in chain
maxDashPoints=5            //maximum consecutive dashes allowed
dashPoints=maxDashPoints   //current dashes available
dashRecoveryTime=0         //current time till 1 dash point is recovered
tookHitAmount=0            //times character took damage in current room
raveTime=0                 //current time in Rave Mode
raveMax=7000               //Rave points needed to enter Rave Mode
airDashRecovery=0          //movement input delay after air dash
idleTime=0                 //how long the character has not moved
hitFontEffect=0            //hit combo font effect time
blastOffRecoveryTime=0     //time till Blast Off can be used again
mmState=0                  //shot state
bUseBusterShot=0           //if the player uses the buster shot
busterAnimStay=0           //how long to stay in the buster anim
busterNum=0                //amount of buster shots allowed
floatTime=0                //time till gravity doesn't take effect
airDashDamage=0            //power built from air dashing
hurricaneDash=0            //how long the character is in the hurricane dash
dashMomentumTime=0         //holds the dash momentum for a bit
backDashRec=0              //used for controlling when the player can stop back dash momentum

//60fps change (added): variables for running above 30fps (see characterStepEvent and pMoveToWrapNew)
ditherCounter=0            //counts frames; pMoveTo uses it to spread the leftover part of a pixel over the frames
xSubPx=0                   //stutter fix (added): the part of a pixel pMoveTo's x move carries over to the next frame
xVelSetTick=0              //code set xVel/yVel directly this frame (or gave a one-off push): pMoveToWrapNew uses the 30fps formula
yVelSetTick=0
xVelSetExt=0               //the same, but set by other objects (knockback, jumpers, Blast Off); cleared once pMoveToWrapNew used it
yVelSetExt=0
xVelHold=0                 //how long a velocity set just once is kept unchanged (pMoveToWrapNew)
yVelHold=0
xVelSetPrev=0              //whether the last move had a set velocity (pMoveToWrapNew)
yVelSetPrev=0
xVelSetRun=0               //how long (in 30fps ticks) the velocity has been set every frame (pMoveToWrapNew)
yVelSetRun=0
xAccInputWalk=0            //the walking/climbing input's acceleration this frame (pMoveToWrapNew's stopping bodge)
effectiveMaxSlope=maxSlope //maxSlope for this frame's share of a tick (pMoveToWrapNew)
speedmod=1                 //slowdown on upward slopes (pMoveToWrapNew; kept at 1 in DT1)
wallStopTick=0             //the wall stop holds for the rest of this 30fps tick (characterStepEvent)
wallStopFacing=0           //the facing the wall stop was checked with
landTickHold=0            //rest of the 30fps tick a dash-momentum landing still counts as in the air (characterStepEvent)
dashTickTime=0             //rest of a dash's first 30fps tick (pMoveDashForward/pMoveDashBack/pMoveAirDash, characterStepEvent)
dashTickXAcc=0             //the dash frame's xAcc, kept for the rest of that tick
airDashKick=0              //the air dash's upward kick, added over its first 30fps tick (pMoveAirDash)
airDashKickTime=0
jumpReleaseHold=0          //letting go of jump starts full gravity this much later (characterStepEvent)
runStartSteps=1.5          //ticks left/right must be held before running starts (>1 at 30fps, same as >=1.5 there)
//jump corrections above 30fps (pJumpCorrection, for pMoveJump and pMoveDashForward/pMoveDashBack), worked out by
//simulating the 30fps jumps: [0] at 60fps, [1] at 120fps. These are for jump setups other than the game's own (which
//pJumpCorrection has exact values for): fitted over all of those at once, they match within 1-2 pixels
jumpBodge[0]=1             //multiplier on initialJumpAcc
jumpBodge[1]=0.99
jumpGravComp[0]=0.05       //multiplier on grav added at jump time
jumpGravComp[1]=-0.05
jumpSeed[0]=1              //ditherCounter at jump time (pMoveTo's pixel dither starts from here)
jumpSeed[1]=4
hopBodge[0]=1.01           //the same for the dash hops (initialJumpAcc/2)
hopBodge[1]=1
hopGravComp[0]=0.08
hopGravComp[1]=0
hopSeed[0]=7
hopSeed[1]=6
jcBodge=1; jcGravComp=0; jcSeed=0 //what pJumpCorrection picked for the current jump

//makes the object "active" (don't edit)
makeActive()
