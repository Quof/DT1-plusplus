#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
enemyCount=-1
bossFinishFadeAlpha=1
fadeColor=c_black
sceneProgress=0
sceneDelay=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gameProgress=219 //intro to Windy Mountains
{
  if sceneProgress=0
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
      global.gamePaused=true
    //else if sceneDelay>=10 and sceneDelay<=29
    else if sceneDelay>9 and sceneDelay<=29 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
      //bossFinishFadeAlpha-=0.1
      bossFinishFadeAlpha-=0.1*gDeltaTime //60fps change: per 30fps tick
    else if sceneDelay>=30
    {
      bossFinishFadeAlpha=0
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("I don't like this at all.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Don't worry man, I got this.#Just sit back and watch me kick ass for once.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3
  {
    global.gameProgress=220
    sceneProgress=0
    global.gamePaused=false
  }
}
if global.gameProgress>=220 //enemy pattern
{
  if sceneProgress=0 and global.gamePaused=false
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay>=10 and sceneDelay<=19
    if sceneDelay>9 and sceneDelay<=19 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
      //bossFinishFadeAlpha-=0.1
      bossFinishFadeAlpha-=0.1*gDeltaTime //60fps change: per 30fps tick
    //else if sceneDelay=20
    else if scrCountPass(sceneDelay,20) //60fps change: once, when the count reaches it
    {
      bossFinishFadeAlpha=0
      areaDisplay=instance_create(0,0,oAreaDisplay)
      areaDisplay.areaString="Windy Mountains"
    }
    else if sceneDelay>=90
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and global.gamePaused=false
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1 //########## ENEMY WAVE 1 :: LEFT ##########
    if scrCountPass(sceneDelay,1) //########## ENEMY WAVE 1 :: LEFT ########## //60fps change: once, when the count reaches it
    {
      var xPos;
      xPos=-12
      for(i=0;i<5;i+=1)
      {
        enemy[i]=instance_create(xPos,96,oEnemyShip1A)
        enemy[i].moveSpeed=3.5
        enemy[i].bArc=1
        enemy[i].arcTime=55+(i*5)
        enemy[i].arcChange=2
        xPos-=30
      }
    }
    //else if sceneDelay=125 //########## ENEMY WAVE 2 :: RIGHT ##########
    else if scrCountPass(sceneDelay,125) //########## ENEMY WAVE 2 :: RIGHT ########## //60fps change: once, when the count reaches it
    {
      var xPos;
      xPos=view_shooter_x+12
      for(i=0;i<5;i+=1)
      {
        enemy[i]=instance_create(xPos,96,oEnemyShip1A)
        enemy[i].moveSpeed=3.5
        //enemy[i].direction=180
        enemy[i]._direction=180 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        enemy[i].bArc=1
        enemy[i].arcTime=55+(i*5)
        enemy[i].arcChange=-2
        xPos+=30
      }
    }
    //else if sceneDelay=240 //########## ENEMY WAVE 3 :: BOTH ##########
    else if scrCountPass(sceneDelay,240) //########## ENEMY WAVE 3 :: BOTH ########## //60fps change: once, when the count reaches it
    {
      var xPos;
      xPos=-12
      for(i=0;i<5;i+=1)
      {
        enemy[i]=instance_create(xPos,96,oEnemyShip1A)
        enemy[i].moveSpeed=3.5
        enemy[i].bArc=1
        enemy[i].arcTime=55+(i*5)
        enemy[i].arcChange=2
        xPos-=30
      }

      var xPos;
      xPos=view_shooter_x+12
      for(i=0;i<5;i+=1)
      {
        enemy[i]=instance_create(xPos,96,oEnemyShip1A)
        enemy[i].moveSpeed=3.5
        //enemy[i].direction=180
        enemy[i]._direction=180 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        enemy[i].bArc=1
        enemy[i].arcTime=55+(i*5)
        enemy[i].arcChange=-2
        xPos+=30
      }
    }
    //else if sceneDelay=360 //########## ENEMY WAVE 4 :: TOP ##########
    else if scrCountPass(sceneDelay,360) //########## ENEMY WAVE 4 :: TOP ########## //60fps change: once, when the count reaches it
    {
      var xPos;
      xPos=96
      for(i=0;i<2;i+=1)
      {
        enemy[i]=instance_create(xPos,-32,oEnemyShip2A)
        enemy[i].moveSpeed=5
        //enemy[i].direction=270
        enemy[i]._direction=270 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        enemy[i].moveOutDir=90
        enemy[i].moveInTime=20
        enemy[i].reverseTime=210
        xPos=240
      }
    }
    //else if sceneDelay=500 //########## ENEMY WAVE 5 :: BOTH TOPS ##########
    else if scrCountPass(sceneDelay,500) //########## ENEMY WAVE 5 :: BOTH TOPS ########## //60fps change: once, when the count reaches it
    {
      var yPos;
      yPos=-12
      for(i=0;i<10;i+=1)
      {
        enemy[i]=instance_create(80,yPos,oEnemyShip1A)
        enemy[i].moveSpeed=3.5
        //enemy[i].direction=270
        enemy[i]._direction=270 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        enemy[i].bArc=0
        enemy[i].arcTime=55+(i*5)

        enemy[i]=instance_create(256,yPos,oEnemyShip1A)
        enemy[i].moveSpeed=3.5
        //enemy[i].direction=270
        enemy[i]._direction=270 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        enemy[i].bArc=0
        enemy[i].arcTime=55+(i*5)
        yPos-=30
      }
    }
    //else if sceneDelay=600 //########## ENEMY WAVE 6 :: TOP ##########
    else if scrCountPass(sceneDelay,600) //########## ENEMY WAVE 6 :: TOP ########## //60fps change: once, when the count reaches it
    {
      var i;
      i=0
      enemy[i]=instance_create(168,-32,oEnemyShip2A)
      enemy[i].moveSpeed=5
      //enemy[i].direction=270
      enemy[i]._direction=270 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      enemy[i].moveOutDir=90
      enemy[i].moveInTime=20
      enemy[i].reverseTime=210
    }
    //else if sceneDelay=680 //########## ENEMY WAVE 7 :: RIGHT CORNER ##########
    else if scrCountPass(sceneDelay,680) //########## ENEMY WAVE 7 :: RIGHT CORNER ########## //60fps change: once, when the count reaches it
    {
      var xPos,yPos;
      xPos=view_shooter_x+12
      yPos=-12
      for(i=0;i<5;i+=1)
      {
        enemy[i]=instance_create(xPos,yPos,oEnemyShip1A)
        enemy[i].moveSpeed=3.5
        //enemy[i].direction=225
        enemy[i]._direction=225 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        enemy[i].bArc=1
        enemy[i].arcTime=35+(i*5)
        enemy[i].arcChange=-1
        xPos+=30
        yPos-=30
      }
    }
    //else if sceneDelay=790 //########## ENEMY WAVE 8 :: LEFT CORNER ##########
    else if scrCountPass(sceneDelay,790) //########## ENEMY WAVE 8 :: LEFT CORNER ########## //60fps change: once, when the count reaches it
    {
      var xPos,yPos;
      xPos=-12
      yPos=-12
      for(i=0;i<5;i+=1)
      {
        enemy[i]=instance_create(xPos,yPos,oEnemyShip1A)
        enemy[i].moveSpeed=3.5
        //enemy[i].direction=315
        enemy[i]._direction=315 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        enemy[i].bArc=1
        enemy[i].arcTime=35+(i*5)
        enemy[i].arcChange=1
        xPos-=30
        yPos-=30
      }
    }
    //else if sceneDelay=860 //########## ENEMY WAVE 9 :: TOP ##########
    else if scrCountPass(sceneDelay,860) //########## ENEMY WAVE 9 :: TOP ########## //60fps change: once, when the count reaches it
    {
      var i;
      i=0
      enemy[i]=instance_create(168,-32,oEnemyShip2B)
      enemy[i].moveSpeed=5
      //enemy[i].direction=270
      enemy[i]._direction=270 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      enemy[i].moveOutDir=90
      enemy[i].moveInTime=20
      enemy[i].reverseTime=210
    }
    //else if sceneDelay=980 //########## ENEMY WAVE 10 :: BOTH ##########
    else if scrCountPass(sceneDelay,980) //########## ENEMY WAVE 10 :: BOTH ########## //60fps change: once, when the count reaches it
    {
      var xPos;
      xPos=-12
      for(i=0;i<5;i+=1)
      {
        enemy[i]=instance_create(xPos,112,oEnemyShip1A)
        enemy[i].moveSpeed=2.25
        enemy[i].bArc=0
        enemy[i].arcTime=55+(i*5)
        enemy[i].arcChange=2
        xPos-=30
      }
      var xPos;
      xPos=view_shooter_x+12
      for(i=0;i<5;i+=1)
      {
        enemy[i]=instance_create(xPos,144,oEnemyShip1A)
        enemy[i].moveSpeed=2.25
        //enemy[i].direction=180
        enemy[i]._direction=180 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        enemy[i].bArc=0
        enemy[i].arcTime=55+(i*5)
        enemy[i].arcChange=-2
        xPos+=30
      }
    }
    //else if sceneDelay=1120 //########## ENEMY WAVE 11 :: TOP ##########
    else if scrCountPass(sceneDelay,1120) //########## ENEMY WAVE 11 :: TOP ########## //60fps change: once, when the count reaches it
    {
      var xPos;
      xPos=96
      for(i=0;i<2;i+=1)
      {
        enemy[i]=instance_create(xPos,-32,oEnemyShip2B)
        enemy[i].moveSpeed=5
        //enemy[i].direction=270
        enemy[i]._direction=270 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        enemy[i].moveOutDir=90
        enemy[i].moveInTime=20
        enemy[i].reverseTime=210
        xPos=240
      }
    }
    //else if sceneDelay=1270 //########## ENEMY WAVE 12 :: BOTH TOPS ##########
    else if scrCountPass(sceneDelay,1270) //########## ENEMY WAVE 12 :: BOTH TOPS ########## //60fps change: once, when the count reaches it
    {
      var yPos;
      yPos=-12
      for(i=0;i<7;i+=1)
      {
        enemy[i]=instance_create(112,yPos,oEnemyShip1A)
        enemy[i].moveSpeed=3.5
        //enemy[i].direction=270
        enemy[i]._direction=270 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        enemy[i].bArc=0
        enemy[i].arcTime=55+(i*5)

        enemy[i]=instance_create(224,yPos,oEnemyShip1A)
        enemy[i].moveSpeed=3.5
        //enemy[i].direction=270
        enemy[i]._direction=270 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        enemy[i].bArc=0
        enemy[i].arcTime=55+(i*5)
        yPos-=30
      }
    }
    //else if sceneDelay=1380 //########## ENEMY WAVE 13 :: 4 TOP ##########
    else if scrCountPass(sceneDelay,1380) //########## ENEMY WAVE 13 :: 4 TOP ########## //60fps change: once, when the count reaches it
    {
      var xPos;
      xPos=128
      for(i=0;i<2;i+=1)
      {
        enemy[i]=instance_create(xPos,-32,oEnemyShip2A)
        enemy[i].moveSpeed=5
        //enemy[i].direction=270
        enemy[i]._direction=270 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        enemy[i].moveOutDir=90
        enemy[i].moveInTime=20
        enemy[i].reverseTime=210
        xPos=208
      }
      var xPos;
      xPos=96
      for(i=0;i<2;i+=1)
      {
        enemy[i]=instance_create(xPos,-32,oEnemyShip2B)
        enemy[i].moveSpeed=5
        //enemy[i].direction=270
        enemy[i]._direction=270 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        enemy[i].moveOutDir=90
        enemy[i].moveInTime=20
        enemy[i].reverseTime=210
        xPos=240
      }
    }
    //else if sceneDelay=1570 //########## ENEMY WAVE 14 :: BOTH ##########
    else if scrCountPass(sceneDelay,1570) //########## ENEMY WAVE 14 :: BOTH ########## //60fps change: once, when the count reaches it
    {
      var xPos;
      xPos=-12
      for(i=0;i<5;i+=1)
      {
        enemy[i]=instance_create(xPos,144,oEnemyShip1A)
        enemy[i].moveSpeed=2.25
        enemy[i].bArc=0
        enemy[i].arcTime=55+(i*5)
        enemy[i].arcChange=2
        xPos-=30
      }
      var xPos;
      xPos=view_shooter_x+12
      for(i=0;i<5;i+=1)
      {
        enemy[i]=instance_create(xPos,112,oEnemyShip1A)
        enemy[i].moveSpeed=2.25
        //enemy[i].direction=180
        enemy[i]._direction=180 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        enemy[i].bArc=0
        enemy[i].arcTime=55+(i*5)
        enemy[i].arcChange=-2
        xPos+=30
      }
    }
    //else if sceneDelay=1680 //########## ENEMY WAVE 15 :: 3 TOPS ##########
    else if scrCountPass(sceneDelay,1680) //########## ENEMY WAVE 15 :: 3 TOPS ########## //60fps change: once, when the count reaches it
    {
      var yPos;
      yPos=-12
      for(i=0;i<7;i+=1)
      {
        enemy[i]=instance_create(112,yPos,oEnemyShip1A)
        enemy[i].moveSpeed=3.5
        //enemy[i].direction=270
        enemy[i]._direction=270 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        enemy[i].bArc=0
        enemy[i].arcTime=55+(i*5)

        enemy[i]=instance_create(224,yPos,oEnemyShip1A)
        enemy[i].moveSpeed=3.5
        //enemy[i].direction=270
        enemy[i]._direction=270 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        enemy[i].bArc=0
        enemy[i].arcTime=55+(i*5)
        yPos-=30
      }
      var i;
      i=0
      enemy[i]=instance_create(168,-32,oEnemyShip2B)
      enemy[i].moveSpeed=5
      //enemy[i].direction=270
      enemy[i]._direction=270 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      enemy[i].moveOutDir=90
      enemy[i].moveInTime=20
      enemy[i].reverseTime=210
    }
    //else if sceneDelay=1920 //########## ENEMY WAVE 16 :: BOTH ##########
    else if scrCountPass(sceneDelay,1920) //########## ENEMY WAVE 16 :: BOTH ########## //60fps change: once, when the count reaches it
    {
      var xPos;
      xPos=-12
      for(i=0;i<5;i+=1)
      {
        enemy[i]=instance_create(xPos,96,oEnemyShip1A)
        enemy[i].moveSpeed=3.5
        enemy[i].bArc=1
        enemy[i].arcTime=55+(i*5)
        enemy[i].arcChange=2
        xPos-=30
      }

      var xPos;
      xPos=view_shooter_x+12
      for(i=0;i<5;i+=1)
      {
        enemy[i]=instance_create(xPos,96,oEnemyShip1A)
        enemy[i].moveSpeed=3.5
        //enemy[i].direction=180
        enemy[i]._direction=180 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        enemy[i].bArc=1
        enemy[i].arcTime=55+(i*5)
        enemy[i].arcChange=-2
        xPos+=30
      }
    }
    //else if sceneDelay=2020 //########## ENEMY WAVE 17 :: TOP ##########
    else if scrCountPass(sceneDelay,2020) //########## ENEMY WAVE 17 :: TOP ########## //60fps change: once, when the count reaches it
    {
      var xPos;
      xPos=96
      for(i=0;i<2;i+=1)
      {
        enemy[i]=instance_create(xPos,-32,oEnemyShip2B)
        enemy[i].moveSpeed=5
        //enemy[i].direction=270
        enemy[i]._direction=270 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        enemy[i].moveOutDir=90
        enemy[i].moveInTime=20
        enemy[i].reverseTime=210
        xPos=240
      }
    }
    //else if sceneDelay=2130 //########## ENEMY WAVE 18 :: BOTH CORNER ##########
    else if scrCountPass(sceneDelay,2130) //########## ENEMY WAVE 18 :: BOTH CORNER ########## //60fps change: once, when the count reaches it
    {
      var xPos,yPos;
      xPos=view_shooter_x+12
      yPos=-12
      for(i=0;i<5;i+=1)
      {
        enemy[i]=instance_create(xPos,yPos,oEnemyShip1A)
        enemy[i].moveSpeed=3.5
        //enemy[i].direction=225
        enemy[i]._direction=225 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        enemy[i].bArc=1
        enemy[i].arcTime=35+(i*5)
        enemy[i].arcChange=-1
        xPos+=30
        yPos-=30
      }
      var xPos,yPos;
      xPos=-12
      yPos=-12
      for(i=0;i<5;i+=1)
      {
        enemy[i]=instance_create(xPos,yPos,oEnemyShip1A)
        enemy[i].moveSpeed=3.5
        //enemy[i].direction=315
        enemy[i]._direction=315 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        enemy[i].bArc=1
        enemy[i].arcTime=35+(i*5)
        enemy[i].arcChange=1
        xPos-=30
        yPos-=30
      }
    }
    //else if sceneDelay=2210 //########## ENEMY WAVE 19 :: TOP ##########
    else if scrCountPass(sceneDelay,2210) //########## ENEMY WAVE 19 :: TOP ########## //60fps change: once, when the count reaches it
    {
      var xPos;
      xPos=96
      for(i=0;i<2;i+=1)
      {
        enemy[i]=instance_create(xPos,-32,oEnemyShip2A)
        enemy[i].moveSpeed=5
        //enemy[i].direction=270
        enemy[i]._direction=270 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        enemy[i].moveOutDir=90
        enemy[i].moveInTime=20
        enemy[i].reverseTime=210
        xPos=240
      }
    }
    //else if sceneDelay=2300 //########## ENEMY WAVE 20 :: TOP ##########
    else if scrCountPass(sceneDelay,2300) //########## ENEMY WAVE 20 :: TOP ########## //60fps change: once, when the count reaches it
    {
      var xPos;
      xPos=64
      for(i=0;i<2;i+=1)
      {
        enemy[i]=instance_create(xPos,-32,oEnemyShip2A)
        enemy[i].moveSpeed=5
        //enemy[i].direction=270
        enemy[i]._direction=270 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        enemy[i].moveOutDir=90
        enemy[i].moveInTime=20
        enemy[i].reverseTime=210
        xPos=272
      }
    }
    //else if sceneDelay=2520 //########## END WAVE ##########
    else if scrCountPass(sceneDelay,2520) //########## END WAVE ########## //60fps change: once, when the count reaches it
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=2 and global.gamePaused=false
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=60 //########## BOSS ##########
    if scrCountPass(sceneDelay,60) //########## BOSS ########## //60fps change: once, when the count reaches it
    {
      with oShipEnemyProjBase
      {
        effect_create_above(ef_ring,x,y,0,c_yellow)
        instance_destroy()
      }
      boss=instance_create(168,-32,oBossShip1)
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=3 and global.gamePaused=false //########## WIN CONDITION ##########
  {
    if !instance_exists(oBossShip1)
      sceneProgress+=1
  }
  else if sceneProgress=4
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=90
    {
      if global.skillCapsules[73]=0 //award skill point
      {
        if global.difficulty=1
          targetScore=1200000
        else if global.difficulty=2
          targetScore=1500000
        else if global.difficulty=3
          targetScore=1650000
        else if global.difficulty=4
          targetScore=2000000
        if oPlayerShip.shooterCurrentScore>=targetScore
        {
          global.p1SkillPoints+=1
          playSound(global.snd_SkillCapsule,0,1)
          global.skillCapsules[73]=1
          msgCreate("Target Score Achieved!#Skill Capsule Awarded!",0,oMessagePerson,"",0,shooterFieldMid,256)
          newMessage.fadingTime=60
        }
      }
      global.gamePaused=true
      sceneDelay=0
      if global.gameProgress>=221
        sceneProgress=12
      else
        sceneProgress+=1
    }
  }
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("More trouble than it's worth.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("I liked it.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Well awesome.#Are we over the mountains yet? I don't like this.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Yeah, I'll land it.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=9
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay>=15
    if sceneDelay>14 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    {
      if bossFinishFadeAlpha<1
        //bossFinishFadeAlpha+=0.05
        bossFinishFadeAlpha+=0.05*gDeltaTime //60fps change: per 30fps tick
      else if bossFinishFadeAlpha>=1
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=10
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("You can now redo this flight path anytime from the world map.",1,oMessageCutscene,"")
  else if sceneProgress=12
  {
    global.gamePaused=false
    global.newMapX=240
    global.newMapY=272
    //transition_steps=30
    transition_steps=30 //60fps change: the original steps: GM plays a room transition at the new room's own speed (30; oGame sets room_speed only once the room runs), so steps/gDeltaTime made it 2x/4x as long at 60/120fps
    transition_kind=20
    if global.gameProgress<=220
    {
      global.gameProgress=221
      room_goto(rWorldMap)
    }
    else
      room_goto(rShipInterface)
  }
}

keyWaitForInput()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bossFinishFadeAlpha>0
{
  draw_set_alpha(bossFinishFadeAlpha)
  draw_set_color(fadeColor)
  draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false)
}
