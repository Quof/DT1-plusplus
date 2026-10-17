#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-1,-1,1,1)

//Enemy base statistics
eName="Windows Cursor"
maxLife=1000
life=maxLife
expWorth=1
physicalDefense=200
spiritDefense=200
bCanDealDamage=false
bCanTakeDamage=false
maxSpeed=0
signalUsed=false
findObject=0
pickupDelay=0
pickupTime=600
timeAlter=1
clicked=false
combatText="It doesn't have any combat functions, it just moves stuff around. It can be stunned if it starts getting annoying and it can also be manipulated a bit too. Maybe be on the look out for things to lure it into doing something in your favor."
sideText="What is there to say about this that hasn't been said before..."
cripplePointText=">None"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  life=maxLife
  if stunnedTime=0
  {
    if findObject=0 //cursor movement
    {
      myDist=point_distance(x,y,oPlayer1.x,oPlayer1.y)
      myDist=round(myDist/32)
      if myDist>12
        myDist=12
      else if myDist<3
        myDist=3
      maxSpeed=myDist
      timeAlter=15-myDist

      //60fps change: _hspeed/_vspeed stand in for the built-in hspeed/vspeed (see correctHSpeedVSpeed at the end), and
      //it speeds up per 30fps tick (was: hspeed/vspeed, +-0.2)
      if x>oPlayer1.x
      {
        if _hspeed>-maxSpeed
          _hspeed-=0.2*gDeltaTime
        else
          _hspeed=-maxSpeed
      }
      else if x<oPlayer1.x
      {
        if _hspeed<maxSpeed
          _hspeed+=0.2*gDeltaTime
        else
          _hspeed=maxSpeed
      }
      if y>oPlayer1.y-26
      {
        if _vspeed>-maxSpeed
          _vspeed-=0.2*gDeltaTime
        else
          _vspeed=-maxSpeed
      }
      else if y<oPlayer1.y-26
      {
        if _vspeed<maxSpeed
          _vspeed+=0.2*gDeltaTime
        else
          _vspeed=maxSpeed
      }

      //pickupDelay+=timeAlter
      pickupDelay+=timeAlter*gDeltaTime //60fps change: per 30fps tick
      if pickupDelay>=pickupTime-130 and signalUsed=false
      {
        effect_create_above(ef_ring,x,y,0,c_green)
        signalUsed=true
      }
      if pickupDelay>=pickupTime
      {
        //hspeed=0
        //vspeed=0
        _hspeed=0 //60fps change: see above
        _vspeed=0 //60fps change: see above
        pickupDelay=0
        signalUsed=false
        sprite_index=sWinCursorBusy
        findObject=1
      }
    }
    else if findObject=1 //searching for object (visual purpose only, and for click time)
    {
      //pickupDelay+=1
      pickupDelay+=gDeltaTime //60fps change: counts 30fps ticks
      if pickupDelay>=60
      {
        sprite_index=sWinCursorDefault
        pickupDelay=0
        findObject=2
      }
      if mouse_check_button_pressed(mb_left) and clicked=false //can click to a preferred direction while searching
      {
        pointX=oIdentifier.x
        pointY=oIdentifier.y
        effect_create_above(ef_ring,pointX,pointY,0,c_blue)
        clicked=true
      }
    }
    else if findObject=2 //go to nearest platform object (only AppWin)
    {
      //speed=4
      checkSolid=instance_nearest(x,y,oAppWinSolid)
      //direction=point_direction(x,y,checkSolid.x,checkSolid.y)
      //60fps change: _hspeed/_vspeed stand in for the built-in motion (see correctHSpeedVSpeed at the end): speed 4 this way
      _direction=point_direction(x,y,checkSolid.x,checkSolid.y)
      _hspeed=lengthdir_x(4,_direction)
      _vspeed=lengthdir_y(4,_direction)
      myDist=point_distance(x,y,checkSolid.x,checkSolid.y)
      if myDist<5
      {
        x=checkSolid.x
        y=checkSolid.y
        checkSolid.image_alpha=0.5
        checkSolid.mask_index=sNull
        sprite_index=sWinCursorMove
        findObject=3
      }
    }
    else if findObject=3 //find direction
    {
      var tCurSpd; tCurSpd=point_distance(0,0,_hspeed,_vspeed) //60fps change (added): GM keeps the speed when the direction changes
      if clicked=false
        //direction=round(random(360))
        _direction=round(random(360)) //60fps change: see below
      else
        //direction=point_direction(x,y,pointX,pointY)
        _direction=point_direction(x,y,pointX,pointY) //60fps change: see below
      //60fps change (added): _hspeed/_vspeed stand in for the built-in motion (see correctHSpeedVSpeed); the same speed this way
      _hspeed=lengthdir_x(tCurSpd,_direction)
      _vspeed=lengthdir_y(tCurSpd,_direction)
      dragSpeed=random(1.25)+2.5
      findObject=4
    }
    else if findObject=4 //drag object
    {
      //speed=dragSpeed
      //60fps change: _hspeed/_vspeed stand in for the built-in motion (see correctHSpeedVSpeed at the end)
      _hspeed=lengthdir_x(dragSpeed,_direction)
      _vspeed=lengthdir_y(dragSpeed,_direction)
      checkSolid.x=x
      checkSolid.y=y
      if clicked=true //if object reaches the clicked position, stop dragging
      {
        myDist=point_distance(x,y,pointX,pointY)
        if myDist<5
          pickupDelay=30
      }
      //pickupDelay+=1
      pickupDelay+=gDeltaTime //60fps change: counts 30fps ticks
      if pickupDelay>=30
      {
        checkSolid.image_alpha=1
        checkSolid.mask_index=-1
        sprite_index=sWinCursorDefault
        clicked=false
        pickupDelay=0
        findObject=0
      }
    }
  }
  enemyStepEvent()
}
else
{
  //hspeed=0
  //vspeed=0
  //speed=0
  _hspeed=0 //60fps change: see above
  _vspeed=0 //60fps change: see above
}
correctHSpeedVSpeed(id) //60fps change (added): moves it by _hspeed/_vspeed, this frame's share of a 30fps tick
