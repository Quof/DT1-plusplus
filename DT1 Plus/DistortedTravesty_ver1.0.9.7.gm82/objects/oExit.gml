#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
arrowX=x+8
arrowY=y-24
pointTime=0
arrowColor=0
init=0
if variable_local_exists("newArrowPosX")
  arrowX+=newArrowPosX
if variable_local_exists("newArrowPosY")
  arrowY+=newArrowPosY
if sprite_index=sMidLevelDoor
{
  image_speed=0.27
  arrowX-=8
  arrowY-=4
}
#define Collision_oPlayer1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*
Exit script.
This will move the player to another room.
exitType is set in the creation code.
exitType relates to whether the player has to press up to activate the event.
0 = Player must press up. Use for doors.
1 = Player just needs to walk into the exit.
*/
if exitType=0
{
  if (keyboard_check_pressed(ord(global.ctrlUp)) or keyboard_check_pressed(vk_up)) and global.gamePaused=false
  {
    global.recUsedAreaExit+=1
    global.newMapX=0
    global.newMapY=0
    if newMapX!=0 and newMapY!=0 and newMapX<1000000 and newMapY<1000000
    {
      global.newMapX=newMapX
      global.newMapY=newMapY
    }
    else if newMapX>1000000 and newMapY>1000000
    {
      newMapX-=1000000
      newMapY-=1000000
      global.worldMapX=newMapX
      global.worldMapY=newMapY
    }
    writeToPlayerGlobals()
    if toRoom!=rWorldMap
    {
      transition_steps=15
      transition_kind=5
      if variable_local_exists("newStep")
        transition_steps=newStep
      if variable_local_exists("newTrans")
        transition_kind=newTrans
    }
    else
    {
      transition_steps=30
      transition_kind=20
    }
    room_goto(toRoom)
  }
}
else if exitType=1
{
  global.recUsedAreaExit+=1
  //--------------------------------------------------
  if global.gameProgress=15 and room=rDonutPlains2 and oPlayer1.x>1024
    global.gameProgress=16
  else if global.gameProgress=22 and room=rRumpyMountains2 and oPlayer1.x>1024
    global.gameProgress=23
  else if global.gameProgress=49 and room=rDilutedMansion5 and oPlayer1.x>384
    global.gameProgress=50
  else if global.gameProgress=80 and room=rDustyRuins6 and oPlayer1.x>2800
    global.gameProgress=81
  else if global.gameProgress=107 and room=rWestSideJungle5 and oPlayer1.x>672
    global.gameProgress=108
  //--------------------------------------------------
  global.newMapX=0
  global.newMapY=0
  if newMapX!=0 and newMapY!=0 and newMapX<1000000 and newMapY<1000000
  {
    global.newMapX=newMapX
    global.newMapY=newMapY
  }
  else if newMapX>1000000 and newMapY>1000000
  {
    newMapX-=1000000
    newMapY-=1000000
    global.worldMapX=newMapX
    global.worldMapY=newMapY
  }
  writeToPlayerGlobals()
  if toRoom!=rWorldMap
  {
    transition_steps=15
    if x<64
      transition_kind=14
    else
      transition_kind=15
    if variable_local_exists("newStep")
      transition_steps=newStep
    if variable_local_exists("newTrans")
      transition_kind=newTrans
  }
  else
  {
    transition_steps=30
    transition_kind=20
  }
  room_goto(toRoom)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bShowArrow=true
{
  pointTime+=1
  if pointTime=20
    arrowY+=1
  else if pointTime=40
  {
    arrowY-=1
    pointTime=0
  }
  if newMapX>1000000
    arrowColor=1
  else
    arrowColor=0
  draw_sprite(sExitArrow,arrowColor,arrowX,arrowY)
}

if sprite_index=sKirbyDoorway
{
  depth=100
  draw_sprite(sprite_index,-1,x,y)
  if init=0
  {
    starFrame=0
    starTime=0
    for (i=0;i<=3;i+=1)
      starY[i]=(y-12)+(i*12)
    init=1
  }
  starTime+=1
  if starTime=5
    starFrame=1
  else if starTime=10
    starFrame=2
  else if starTime=15
    starFrame=3
  else if starTime=20
  {
    starFrame=0
    starTime=0
  }
  for (i=0;i<=3;i+=1)
  {
    draw_sprite(sKirbyDoorStarSmall,starFrame,x+20,starY[i])
    draw_sprite(sKirbyDoorStarSmall,starFrame,x-4,starY[i])
    starY[i]+=2
    if starY[i]>=y+34
      starY[i]=y-12
  }
  draw_sprite(sKirbyDoorStarBig,starFrame,x+8,y-12)
}
else if sprite_index=sMapDoor
{
  depth=100
  draw_set_alpha(1)
  draw_set_color(c_black)
  draw_rectangle(x,y,x+sprite_width,y+sprite_height,false)
}
else if sprite_index=sMidLevelDoor or sprite_index=sSoFSDoor or sprite_index=sMineDoor or sprite_index=sDungeonPortal
{
  depth=100
  draw_sprite(sprite_index,-1,x,y)
}
else if sprite_index=sEnergyRip1 or sprite_index=sDataPortal
{
  depth=100
  image_speed=0.7
  draw_set_blend_mode(bm_add)
  draw_sprite_ext(sprite_index,-1,x+8,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
  draw_set_blend_mode(bm_normal)
}
