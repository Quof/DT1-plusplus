#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
//makeActive()
//setCollisionBounds(-15,-15,15,15)

//Enemy base statistics
physicalPower=500
bCanTakeDamage=false
bShowHealthBar=false
detectDistY=288
runAcc=2 //should always be a power of 2
UP=0
DOWN=1
LEFT=2
RIGHT=3
bClockWise=false
currentDir=LEFT
difficultyAdjustments(global.difficulty)
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if variable_local_exists("newSpd")
  runAcc=newSpd
if variable_local_exists("newDir")
  currentDir=newDir
if variable_local_exists("bClock")
  bClockWise=true
if variable_local_exists("startAct")
  bActive=true

if global.location="Distortion Reckoning"
  image_blend=c_black
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  makeEnemyActive()
  if bActive=true
  {
    //60fps change (added): below, tStep (this frame's share of runAcc, its move per 30fps tick) replaces runAcc,
    //in the moves and in the wall checks ahead of them
    var tStep;
    tStep=runAcc*gDeltaTime
    if bClockWise=false //******************** COUNTER-CLOCK-WISE ********************
    {
      if currentDir=UP
      {
        if !place_meeting(x,y-tStep,oSolid) //check up first
        {
          if place_meeting(x-tStep,y,oSolid) //check left
            y-=tStep //continue up
          else
          {
            currentDir=LEFT
            x-=tStep //move left once
          }
        }
        else
        {
          currentDir=RIGHT
          x+=tStep
        }
      }
      else if currentDir=DOWN
      {
        if !place_meeting(x,y+tStep,oSolid) //check down first
        {
          if place_meeting(x+tStep,y,oSolid) //check right
            y+=tStep //continue down
          else
          {
            currentDir=RIGHT
            x+=tStep //move right once
          }
        }
        else
        {
          currentDir=LEFT
          x-=tStep
        }
      }
      else if currentDir=LEFT
      {
        if !place_meeting(x-tStep,y,oSolid) //check left first
        {
          if place_meeting(x,y+tStep,oSolid) //check down
            x-=tStep //continue left
          else
          {
            currentDir=DOWN
            y+=tStep //move down once
          }
        }
        else
        {
          currentDir=UP
          y-=tStep
        }
      }
      else if currentDir=RIGHT
      {
        if !place_meeting(x+tStep,y,oSolid) //check right first
        {
          if place_meeting(x,y-tStep,oSolid) //check up
            x+=tStep //continue right
          else
          {
            currentDir=UP
            y-=tStep //move up once
          }
        }
        else
        {
          currentDir=DOWN
          y+=tStep
        }
      }
    }
    else //******************** CLOCK-WISE ********************
    {
      if currentDir=UP
      {
        if !place_meeting(x,y-tStep,oSolid) //check up first
        {
          if place_meeting(x+tStep,y,oSolid) //check right
            y-=tStep //continue up
          else
          {
            currentDir=RIGHT
            x+=tStep //move right once
          }
        }
        else
        {
          currentDir=LEFT
          x-=tStep
        }
      }
      else if currentDir=DOWN
      {
        if !place_meeting(x,y+tStep,oSolid) //check down first
        {
          if place_meeting(x-tStep,y,oSolid) //check left
            y+=tStep //continue down
          else
          {
            currentDir=LEFT
            x-=tStep //move left once
          }
        }
        else
        {
          currentDir=RIGHT
          x+=tStep
        }
      }
      else if currentDir=LEFT
      {
        if !place_meeting(x-tStep,y,oSolid) //check left first
        {
          if place_meeting(x,y-tStep,oSolid) //check up
            x-=tStep //continue left
          else
          {
            currentDir=UP
            y-=tStep //move up once
          }
        }
        else
        {
          currentDir=DOWN
          y+=tStep
        }
      }
      else if currentDir=RIGHT
      {
        if !place_meeting(x+tStep,y,oSolid) //check right first
        {
          if place_meeting(x,y+tStep,oSolid) //check down
            x+=tStep //continue right
          else
          {
            currentDir=DOWN
            y+=tStep //move down once
          }
        }
        else
        {
          currentDir=UP
          y-=tStep
        }
      }
    }
  }
}
