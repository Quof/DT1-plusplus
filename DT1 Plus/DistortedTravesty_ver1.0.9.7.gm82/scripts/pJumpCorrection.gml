/*
60fps change (added): the start-speed correction above 30fps for a jump (argument0=0, pMoveJump) or a dash hop
(argument0=1, pMoveDashForward/pMoveDashBack). Sets jcBodge (multiplier on the jump), jcGravComp (multiplier on
grav added to it) and jcSeed (ditherCounter to start the pixel dither from).
Worked out by simulating the 30fps jumps (every length of holding the button) so the 60/120fps peaks match the
30fps ones (their average over oGame.time, which moves 30fps's pixels) to the pixel. The game's own jump setups
(grav, initialJumpAcc, jumpTimeTotal) get their own values; anything else uses jumpBodge/hopBodge etc.
(characterCreateEvent), worked out over all of them at once (within 1-2 pixels).
*/
var tFr,k;
if gDeltaTime<0.375 {tFr=1} else {tFr=0}
if argument0=0 {jcBodge=jumpBodge[tFr]; jcGravComp=jumpGravComp[tFr]; jcSeed=jumpSeed[tFr]}
else {jcBodge=hopBodge[tFr]; jcGravComp=hopGravComp[tFr]; jcSeed=hopSeed[tFr]}
k=argument0*2+tFr //0: jump 60fps, 1: jump 120fps, 2: hop 60fps, 3: hop 120fps
if grav=1.35 and initialJumpAcc=-7.15 and jumpTimeTotal=22 //the normal jump
{
  if k=0 {jcBodge=0.95625; jcGravComp=-0.17857; jcSeed=8}
  else if k=1 {jcBodge=0.96; jcGravComp=-0.3; jcSeed=10}
  else if k=2 {jcBodge=0.92667; jcGravComp=-0.15; jcSeed=11}
  else if k=3 {jcBodge=0.92667; jcGravComp=-0.1; jcSeed=21}
}
else if grav=1.35 and initialJumpAcc=-15.46 and jumpTimeTotal=44 //after the Metroid upgrade (oMetroidPickup, characterCreateEvent)
{
  if k=0 {jcBodge=1.025; jcGravComp=0.22143; jcSeed=5}
  else if k=1 {jcBodge=1.035; jcGravComp=0.35; jcSeed=13}
  else if k=2 {jcBodge=0.93333; jcGravComp=-0.35; jcSeed=24}
  else if k=3 {jcBodge=1.04; jcGravComp=0.25; jcSeed=20}
}
else if grav=1.35 and initialJumpAcc=-16 and jumpTimeTotal=50 //Boss Rush (rBR_Main)
{
  if k=0 {jcBodge=1.05; jcGravComp=0.39286; jcSeed=15}
  else if k=1 {jcBodge=0.925; jcGravComp=-0.5; jcSeed=16}
  else if k=2 {jcBodge=0.92; jcGravComp=-0.45; jcSeed=7}
  else if k=3 {jcBodge=0.94667; jcGravComp=-0.35; jcSeed=11}
}
else if grav=0.6 and initialJumpAcc=-8 and jumpTimeTotal=35 //the dive rooms (rDiveL1-4)
{
  if k=0 {jcBodge=0.9875; jcGravComp=-0.12143; jcSeed=1}
  else if k=1 {jcBodge=0.955; jcGravComp=-0.6; jcSeed=7}
  else if k=2 {jcBodge=0.92667; jcGravComp=-0.3; jcSeed=13}
  else if k=3 {jcBodge=0.93333; jcGravComp=-0.45; jcSeed=4}
}
else if grav=1.35 and initialJumpAcc=-9.4 and jumpTimeTotal=37 //the final boss (oMitra)
{
  if k=0 {jcBodge=0.95625; jcGravComp=-0.23571; jcSeed=9}
  else if k=1 {jcBodge=0.93; jcGravComp=-0.45; jcSeed=13}
  else if k=2 {jcBodge=1; jcGravComp=0.05; jcSeed=10}
  else if k=3 {jcBodge=0.90667; jcGravComp=-0.35; jcSeed=17}
}
else if grav=2.5 and initialJumpAcc=-6 and jumpTimeTotal=20 //the final boss's heavy phase (oMitra)
{
  if k=0 {jcBodge=0.95625; jcGravComp=-0.06429; jcSeed=6}
  else if k=1 {jcBodge=0.93; jcGravComp=-0.2; jcSeed=4}
  else if k=2 {jcBodge=0.94; jcGravComp=0; jcSeed=14}
  else if k=3 {jcBodge=0.90667; jcGravComp=-0.1; jcSeed=6}
}
