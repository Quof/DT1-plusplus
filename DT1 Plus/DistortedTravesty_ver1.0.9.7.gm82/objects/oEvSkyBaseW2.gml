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
if global.gameProgress=279 //intro to Windy Mountains
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay=1
      global.gamePaused=true
    else if sceneDelay>=10 and sceneDelay<=29
      bossFinishFadeAlpha-=0.1
    else if sceneDelay>=30
    {
      bossFinishFadeAlpha=0
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("I don't want to do this again.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("I got this, no worries.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3
  {
    global.gameProgress=280
    sceneProgress=0
    global.gamePaused=false
  }
}
if global.gameProgress>=280 //enemy pattern
{
  if sceneProgress=0 and global.gamePaused=false
  {
    sceneDelay+=1
    if sceneDelay>=10 and sceneDelay<=19
      bossFinishFadeAlpha-=0.1
    else if sceneDelay=20
    {
      bossFinishFadeAlpha=0
      areaDisplay=instance_create(0,0,oAreaDisplay)
      areaDisplay.areaString="Data Segment Entry"
    }
    else if sceneDelay>=90
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and global.gamePaused=false
  {
    sceneDelay+=1
    if sceneDelay=1 //########## ENEMY WAVE 1 :: RIGHT ##########
    {
      var xPos;
      xPos=240
      for(i=0;i<2;i+=1)
      {
        enemy[i]=instance_create(xPos,-40,oEnemyShip1B)
        enemy[i].moveSpeed=6
        enemy[i].direction=270
        enemy[i].moveOutDir=90
        enemy[i].moveInTime=20
        enemy[i].reverseTime=120
        xPos+=30
      }
    }
    else if sceneDelay=140 //########## ENEMY WAVE 2 :: LEFT ##########
    {
      var xPos;
      xPos=96
      for(i=0;i<2;i+=1)
      {
        enemy[i]=instance_create(xPos,-40,oEnemyShip1B)
        enemy[i].moveSpeed=6
        enemy[i].direction=270
        enemy[i].moveOutDir=90
        enemy[i].moveInTime=20
        enemy[i].reverseTime=120
        xPos-=30
      }
    }
    else if sceneDelay=280 //########## ENEMY WAVE 3 :: MID ##########
    {
      var xPos;
      xPos=112
      for(i=0;i<6;i+=1)
      {
        enemy[i]=instance_create(xPos,-40,oEnemyShip1B)
        enemy[i].moveSpeed=6
        enemy[i].direction=270
        enemy[i].moveOutDir=90
        enemy[i].moveInTime=20
        enemy[i].reverseTime=135
        xPos+=30
      }
    }
    else if sceneDelay=480 //########## ENEMY WAVE 4 :: MID BIG ##########
    {
      enemy[0]=instance_create(shooterFieldMid,-32,oEnemyShip2C)
      enemy[0].moveSpeed=2
      enemy[0].direction=270
      enemy[0].moveOutDir=90
      enemy[0].moveInTime=40
      enemy[0].reverseTime=200
    }
    else if sceneDelay=680 //########## ENEMY WAVE 5 :: RIGHT ##########
    {
      var xPos;
      xPos=view_shooter_x+12
      for(i=0;i<5;i+=1)
      {
        enemy[i]=instance_create(xPos,96,oEnemyShip1C)
        enemy[i].moveSpeed=4
        enemy[i].direction=180
        enemy[i].moveInTime=30+(i*5)
        xPos+=30
      }
    }
    else if sceneDelay=840 //########## ENEMY WAVE 6 :: LEFT ##########
    {
      var xPos;
      xPos=-12
      for(i=0;i<5;i+=1)
      {
        enemy[i]=instance_create(xPos,96,oEnemyShip1C)
        enemy[i].moveSpeed=4
        enemy[i].direction=0
        enemy[i].moveInTime=30+(i*5)
        xPos-=30
      }
    }
    else if sceneDelay=1000 //########## ENEMY WAVE 7 :: BOTH ##########
    {
      var xPos;
      xPos=view_shooter_x+12
      for(i=0;i<5;i+=1)
      {
        enemy[i]=instance_create(xPos,96,oEnemyShip1C)
        enemy[i].moveSpeed=2
        enemy[i].direction=180
        enemy[i].moveInTime=30+(i*5)
        xPos+=30
      }
      var xPos;
      xPos=-12
      for(i=0;i<5;i+=1)
      {
        enemy[i]=instance_create(xPos,96,oEnemyShip1C)
        enemy[i].moveSpeed=2
        enemy[i].direction=0
        enemy[i].moveInTime=30+(i*5)
        xPos-=30
      }
    }
    else if sceneDelay=1250 //########## ENEMY WAVE 8 :: TOP SIDES BIG ##########
    {
      enemy[0]=instance_create(shooterFieldMid-96,-32,oEnemyShip2C)
      enemy[0].moveSpeed=2
      enemy[0].direction=270
      enemy[0].moveOutDir=90
      enemy[0].moveInTime=40
      enemy[0].reverseTime=180
      enemy[1]=instance_create(shooterFieldMid+96,-32,oEnemyShip2C)
      enemy[1].moveSpeed=2
      enemy[1].direction=270
      enemy[1].moveOutDir=90
      enemy[1].moveInTime=40
      enemy[1].reverseTime=180
    }
    else if sceneDelay=1480 //########## ENEMY WAVE 9 :: RIGHT BIG + HELP ##########
    {
      var xPos;
      xPos=96
      for(i=0;i<3;i+=1)
      {
        enemy[i]=instance_create(xPos,-40,oEnemyShip1B)
        enemy[i].moveSpeed=6
        enemy[i].direction=270
        enemy[i].moveOutDir=90
        enemy[i].moveInTime=20
        enemy[i].reverseTime=120
        xPos+=30
      }
      enemy[0]=instance_create(shooterFieldMid+96,-32,oEnemyShip2C)
      enemy[0].moveSpeed=2
      enemy[0].direction=270
      enemy[0].moveOutDir=90
      enemy[0].moveInTime=40
      enemy[0].reverseTime=200
    }
    else if sceneDelay=1710 //########## ENEMY WAVE 10 :: LEFT BIG + HELP ##########
    {
      var xPos;
      xPos=240
      for(i=0;i<3;i+=1)
      {
        enemy[i]=instance_create(xPos,-40,oEnemyShip1B)
        enemy[i].moveSpeed=6
        enemy[i].direction=270
        enemy[i].moveOutDir=90
        enemy[i].moveInTime=20
        enemy[i].reverseTime=120
        xPos-=30
      }
      enemy[0]=instance_create(shooterFieldMid-96,-32,oEnemyShip2C)
      enemy[0].moveSpeed=2
      enemy[0].direction=270
      enemy[0].moveOutDir=90
      enemy[0].moveInTime=40
      enemy[0].reverseTime=200
    }
    else if sceneDelay=1940 //########## ENEMY WAVE 11 :: MID BIG + HELP x2 ##########
    {
      var xPos;
      xPos=96
      for(i=0;i<2;i+=1)
      {
        enemy[i]=instance_create(xPos,-40,oEnemyShip1B)
        enemy[i].moveSpeed=6
        enemy[i].direction=270
        enemy[i].moveOutDir=90
        enemy[i].moveInTime=20
        enemy[i].reverseTime=120
        xPos+=30
      }
      var xPos;
      xPos=240
      for(i=0;i<2;i+=1)
      {
        enemy[i]=instance_create(xPos,-40,oEnemyShip1B)
        enemy[i].moveSpeed=6
        enemy[i].direction=270
        enemy[i].moveOutDir=90
        enemy[i].moveInTime=20
        enemy[i].reverseTime=120
        xPos-=30
      }
      enemy[0]=instance_create(shooterFieldMid,-32,oEnemyShip2C)
      enemy[0].moveSpeed=2
      enemy[0].direction=270
      enemy[0].moveOutDir=90
      enemy[0].moveInTime=40
      enemy[0].reverseTime=200
    }
    else if sceneDelay=2170 //########## ENEMY WAVE 12 :: MID BIG + HELP x2 ##########
    {
      var xPos;
      xPos=view_shooter_x+12
      for(i=0;i<5;i+=1)
      {
        enemy[i]=instance_create(xPos,96,oEnemyShip1C)
        enemy[i].moveSpeed=2
        enemy[i].direction=180
        enemy[i].moveInTime=30+(i*5)
        xPos+=30
      }
      var xPos;
      xPos=-12
      for(i=0;i<5;i+=1)
      {
        enemy[i]=instance_create(xPos,96,oEnemyShip1C)
        enemy[i].moveSpeed=2
        enemy[i].direction=0
        enemy[i].moveInTime=30+(i*5)
        xPos-=30
      }
      enemy[0]=instance_create(shooterFieldMid,-32,oEnemyShip2C)
      enemy[0].moveSpeed=2
      enemy[0].direction=270
      enemy[0].moveOutDir=90
      enemy[0].moveInTime=40
      enemy[0].reverseTime=200
    }
    else if sceneDelay=2400 //########## ENEMY WAVE 13 :: BOTH x2 ##########
    {
      var xPos;
      xPos=96
      for(i=0;i<3;i+=1)
      {
        enemy[i]=instance_create(xPos,-40,oEnemyShip1B)
        enemy[i].moveSpeed=6
        enemy[i].direction=270
        enemy[i].moveOutDir=90
        enemy[i].moveInTime=20
        enemy[i].reverseTime=120
        xPos+=30
      }
      var xPos;
      xPos=240
      for(i=0;i<3;i+=1)
      {
        enemy[i]=instance_create(xPos,-40,oEnemyShip1B)
        enemy[i].moveSpeed=6
        enemy[i].direction=270
        enemy[i].moveOutDir=90
        enemy[i].moveInTime=20
        enemy[i].reverseTime=120
        xPos-=30
      }
      var xPos;
      xPos=view_shooter_x+12
      for(i=0;i<5;i+=1)
      {
        enemy[i]=instance_create(xPos,96,oEnemyShip1C)
        enemy[i].moveSpeed=2
        enemy[i].direction=180
        enemy[i].moveInTime=30+(i*5)
        xPos+=30
      }
      var xPos;
      xPos=-12
      for(i=0;i<5;i+=1)
      {
        enemy[i]=instance_create(xPos,96,oEnemyShip1C)
        enemy[i].moveSpeed=2
        enemy[i].direction=0
        enemy[i].moveInTime=30+(i*5)
        xPos-=30
      }
    }
    else if sceneDelay=2630 //########## ENEMY WAVE 14 :: FULL TOP BIG ##########
    {
      enemy[0]=instance_create(shooterFieldMid,-32,oEnemyShip2C)
      enemy[0].moveSpeed=2
      enemy[0].direction=270
      enemy[0].moveOutDir=90
      enemy[0].moveInTime=40
      enemy[0].reverseTime=240
      enemy[1]=instance_create(shooterFieldMid-96,-32,oEnemyShip2C)
      enemy[1].moveSpeed=2
      enemy[1].direction=270
      enemy[1].moveOutDir=90
      enemy[1].moveInTime=40
      enemy[1].reverseTime=240
      enemy[2]=instance_create(shooterFieldMid+96,-32,oEnemyShip2C)
      enemy[2].moveSpeed=2
      enemy[2].direction=270
      enemy[2].moveOutDir=90
      enemy[2].moveInTime=40
      enemy[2].reverseTime=240
    }
    else if sceneDelay=3030 //########## END WAVE ##########
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=2 and global.gamePaused=false
  {
    sceneDelay+=1
    if sceneDelay=60 //########## BOSS ##########
    {
      with oShipEnemyProjBase
      {
        effect_create_above(ef_ring,x,y,0,c_yellow)
        instance_destroy()
      }
      boss=instance_create(168,-32,oBossShip2)
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=3 and global.gamePaused=false //########## WIN CONDITION ##########
  {
    if !instance_exists(oBossShip2)
      sceneProgress+=1
  }
  else if sceneProgress=4
  {
    sceneDelay+=1
    if sceneDelay>=90
    {
      if global.skillCapsules[94]=0 //award skill point
      {
        if global.difficulty=1
          targetScore=3000000
        else if global.difficulty=2
          targetScore=3500000
        else if global.difficulty=3
          targetScore=4150000
        else if global.difficulty=4
          targetScore=4600000
        if oPlayerShip.shooterCurrentScore>=targetScore
        {
          global.p1SkillPoints+=1
          playSound(global.snd_SkillCapsule,0,1)
          global.skillCapsules[94]=1
          msgCreate("Target Score Achieved!#Skill Capsule Awarded!",0,oMessagePerson,"",0,shooterFieldMid,256)
          newMessage.fadingTime=60
        }
      }
      global.gamePaused=true
      sceneDelay=0
      if global.gameProgress>=281
        sceneProgress=10
      else
        sceneProgress+=1
    }
  }
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Wow, that was pretty awesome!#You kicked ass back there!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("It's what I do.#Ready for your part?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Yeah, time to do this.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8
  {
    sceneDelay+=1
    if sceneDelay>=15
    {
      if bossFinishFadeAlpha<1
        bossFinishFadeAlpha+=0.05
      else if bossFinishFadeAlpha>=1
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=9
  {
    sceneDelay+=1
    if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=10
  {
    global.gamePaused=false
    global.newMapX=192
    global.newMapY=208
    transition_steps=30
    transition_kind=20
    if global.gameProgress<=280
    {
      global.gameProgress=281
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
