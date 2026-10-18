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
    //60fps change (added): below, tStep replaces runAcc (its move per 30fps tick), in the moves and in the wall checks
    //ahead of them
    //60fps change: it follows the walls as at 30fps: the moves and wall checks below run once per 30fps tick, on the
    //tick's first frame, from where 30fps has it then and with the whole runAcc, and that tick's move is made over the
    //tick's frames (after them). tStep was runAcc*gDeltaTime every frame: its checks then looked only half (a quarter)
    //as far ahead as 30fps's, so where 30fps found the wall it didn't, turned early and left the block's outline
    var tStep,tTick;
    //tStep=runAcc*gDeltaTime
    tStep=runAcc //60fps change: see above
    tTick=(gDeltaTime==1 or abs(gDeltaTick-gDeltaTime)<0.0001) //60fps change (added): this frame starts a 30fps tick (as in gameStepEvent)
    if tTick //60fps change (added)
    { //60fps change (added)
    if variable_local_exists("pfEndX") {x=pfEndX; y=pfEndY} //60fps change (added): where the last tick's move ends (the same unless it stopped partway: paused, or out of range)
    pfStartX=x //60fps change (added)
    pfStartY=y //60fps change (added)
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
    pfMoveX=x-pfStartX //60fps change (added): this tick's move, made over its frames below
    pfMoveY=y-pfStartY //60fps change (added)
    pfEndX=x //60fps change (added)
    pfEndY=y //60fps change (added)
    x=pfStartX //60fps change (added)
    y=pfStartY //60fps change (added)
    } //60fps change (added): if tTick
    if variable_local_exists("pfMoveX") {x+=pfMoveX*gDeltaTime; y+=pfMoveY*gDeltaTime} //60fps change (added): this frame's share of the tick's move (all of it at 30fps)
  }
}
