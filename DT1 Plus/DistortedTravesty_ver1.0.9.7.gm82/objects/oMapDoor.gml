#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
arrowX=x+8
arrowY=y-24
pointTime=0
init=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if type=1
{
  if init=0
  {
    effectLimit=0
    init=1
  }
  if global.gamePaused=false
  {
    pDist=point_distance(x,y,oPlayer1.x,oPlayer1.y-22)
    if pDist<384
    {
      if effectLimit<=0
      {
        pX=x-2+random(20)
        pY=y-2+random(36)
        sizeRan=round(random(1))
        effect_create_above(ef_smoke,pX,pY,sizeRan,c_black)
        //effectLimit=3
        effectLimit=4-gDeltaTime //60fps change: counts 30fps ticks; the frame that resets it counts as a whole tick, as at 30fps (it doesn't count up), so the count starts that far back (the same at 30fps)
      }
      else
        //effectLimit-=1
        effectLimit-=gDeltaTime //60fps change: counts 30fps ticks
    }
  }
}
#define Collision_oPlayer1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*
Door script.
This will move the player to another part of the same room.
exitType is set in the creation code.
exitType relates to whether the player has to press up to activate the event.
0 = Player must press up. Use for doors.
1 = Player just needs to walk into the exit.
*/
if exitType=0
{
  //if keyboard_check_pressed(ord(global.ctrlUp)) or keyboard_check_pressed(vk_up) and global.gamePaused=false
  if keyboard_check_pressed(ord(global.ctrlUp)) or (keyboard_check_pressed(vk_up) or scrPadPressed(3)) and global.gamePaused=false //gamepad change: and the gamepad's Up (scrGamepadInit)
  {
    oPlayer1.x=newX
    oPlayer1.y=newY
    io_clear()
    scrGamepadSync() //gamepad change (added): and the gamepad's presses (io_clear only clears the keyboard's, so a pad press it was meant to use up still counted for the rest of the frame: A that closed dialogue also jumped, Up at a door went through the door it arrived at and back)
  }
}
else if exitType=1
{
  oPlayer1.x=newX
  oPlayer1.y=newY
}
else if exitType=2
{
  //if keyboard_check_pressed(ord(global.ctrlDown)) or keyboard_check_pressed(vk_down) and global.gamePaused=false
  if keyboard_check_pressed(ord(global.ctrlDown)) or (keyboard_check_pressed(vk_down) or scrPadPressed(4)) and global.gamePaused=false //gamepad change: and the gamepad's Down (scrGamepadInit)
  {
    with oCharacter
    {
      if platformCharacterIs(ON_GROUND)
      {
        x=other.newX
        y=other.newY
        io_clear()
        scrGamepadSync() //gamepad change (added): and the gamepad's presses (io_clear only clears the keyboard's, so a pad press it was meant to use up still counted for the rest of the frame: A that closed dialogue also jumped, Up at a door went through the door it arrived at and back)
      }
    }
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bShowArrow=true
{
  //pointTime+=1
  pointTime+=gDeltaTime //60fps change: counts 30fps ticks
  //if pointTime=20
  if scrCountPass(pointTime,20) //60fps change: once, when the count reaches it
    arrowY+=1
  //else if pointTime=40
  else if scrCountPass(pointTime,40) //60fps change: once, when the count reaches it
  {
    arrowY-=1
    pointTime=0
  }
  draw_sprite(sExitArrow,2,arrowX,arrowY)
}
