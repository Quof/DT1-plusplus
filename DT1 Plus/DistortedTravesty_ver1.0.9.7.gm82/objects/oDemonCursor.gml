#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-1,-1,1,1)
image_speed=0.16
sprite_index=sWinCursorDefault

//Enemy base statistics
eName="Demon Cursor"
maxLife=15500
life=maxLife
expWorth=40000
physicalDefense=80
spiritPower=270
spiritDefense=120
FIREresist=-10
WATERresist=-20
WINDresist=20
EARTHresist=10
bIsBoss=true
barAmount=2
questType=1
bCanDealDamage=false
bCanTakeDamage=false
activateBoss=0
currentMovement=1
chooseAttack=0
currentAttack=0
specialAttack=0
maxSpeed=0
if global.difficulty=1
{
  minSpd=1
  maxSpd=5
  waitTime=170
  holdTime=16
  spdMod=0
  copyChance=15
  appCreate=6
  textDecay=390
}
else if global.difficulty=2
{
  minSpd=1.5
  maxSpd=6
  waitTime=150
  holdTime=15
  spdMod=0.25
  copyChance=25
  appCreate=8
  textDecay=450
}
else if global.difficulty=3
{
  minSpd=2
  maxSpd=8
  waitTime=135
  holdTime=14
  spdMod=0.5
  copyChance=35
  appCreate=10
  textDecay=510
}
else if global.difficulty=4
{
  minSpd=2.2
  maxSpd=9
  waitTime=130
  holdTime=13
  spdMod=0.6
  copyChance=40
  appCreate=11
  textDecay=590
}
attackDelay=0
mouseDownTime=0
attackTime=0
attackType=0
attackProgress=0
bossProgress=0
difficultyAdjustments(global.difficulty)
cripplePointText=">Mental Insurrection while selecting"
alphaChange=0
armAlpha=0

xCenter=416
yGround=352
roomSpan=256
colorBlend=255
doubleAttack=0

menuPopup=false
mPosX=0
mPosY=0

xAtkStart=0
yAtkStart=0
bDragCreate=false
bUseCopy=false
dashWarning=0
taunt[0]="It is pointless to fight us Anomally! You cannot defeat us! We are everywhere! We are everything! Soon you will become part of us!"
taunt[1]="I actually think that background is really annoying as well Anomally. How are you supposed to take me serious when there's a background like that?"
taunt[2]="You will soon join us. We have already begun collecting your data sequence. Soon even you will not be able to stand up to us. You will fail."
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if activateBoss=1
  {
    oGlobalEvent.enemyCount=1
    oEvDistortionWindows2.bossBackShow=true
    background_index[1]=backDCursorFight
    background_visible[1]=true
    background_x[1]=160
    background_vtiled[1]=false
    background_htiled[1]=false
    sprite_index=sDemonCursorDefault
    oExit.visible=false
    oHealingPost.visible=false
    oSaveDoor.visible=false
    oBossBarrier.visible=false
    bActive=true
    bCanTakeDamage=true
    bShowHealthBar=true
    showBossHP=instance_create(0,0,oBossLifeDisplay)
    showBossHP.bossID=id
    combatText="A lot of care about where you are needs to be taken into consideration here. It's most notable attack is when it types out text which serves to make the playing field harder for you. The second is it's Window Toss or whatever, it lines up Windows or Apps or something and tosses them at you... kinda like that Cyborg from way back. The other is it's Create command which it will draw out a Window and toss it in 4 directions. It might follow this up with the Copy command which can cause problems. The one that probably catches your attention the most is the Danmaku. Well I really don't know what it's going to do so you'll just have to find out for yourself."
    sideText="The Windows Cursor being overtaken by The Darkness. I guess now we know it's true that it can possess anything. It's fueled by a furious desire to destroy you. The messages it types out to you seem to be taunts and various other forms of flavorful things it wants to say. I actually think the cursor had some evil in it to begin with. I mean come on, it IS from M$. Speaking of that, if you look on it's list, it has the M$ Spell Check option... I don't think it would ever use that."
    activateBoss=2
  }

  //alphaChange+=1
  alphaChange+=gDeltaTime //60fps change: counts 30fps ticks
  //if alphaChange mod 10=0
  if scrModPass(alphaChange,10) //60fps change: once each time the count reaches a multiple of it
    armAlpha=random(0.15)+0.05

  if bActive=true and dieFade=0
  {
    if currentMovement=1 and menuPopup=false //seek player
    {
      myDist=point_distance(x,y,oPlayer1.x,oPlayer1.y-24)
      myDist=round(myDist/32)
      if myDist>maxSpd
        myDist=maxSpd
      else if myDist<minSpd
        myDist=minSpd
      maxSpeed=myDist

      //60fps change: _hspeed/_vspeed stand in for the built-in hspeed/vspeed (see correctHSpeedVSpeed at the end), and it speeds up per 30fps tick (was: hspeed/vspeed, +-0.2)
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
    }
    //attackDelay+=1
    attackDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if attackDelay>=waitTime
    {
      if menuPopup=false and currentAttack=0 //choose attack
      {
        //hspeed=0
        //vspeed=0
        _hspeed=0 //60fps change: _hspeed/_vspeed stand in for the built-in hspeed/vspeed (see correctHSpeedVSpeed at the end)
        _vspeed=0 //60fps change: see above
        mPosX=x
        mPosY=y
        menuPopup=true
        attackTime=0
        attackType=0
        attackProgress=0

        if specialAttack!=1
        {
          if bUseCopy=true
            chooseAttack=2
          else
          {
            if !instance_exists(oTextAttack)
              chooseAttack=4
            else
            {
              if instance_exists(oDCApp)
                chooseAttack=choose(1,1,1,3,4,4)
              else
                chooseAttack=choose(1,3,4)
            }
          }
        }
        else
        {
          chooseAttack=5
          specialAttack+=1
        }
        if chooseAttack=1
          mouseDownTime=4
        else if chooseAttack=2
          mouseDownTime=9
        else if chooseAttack=3
          mouseDownTime=19
        else if chooseAttack=4
          mouseDownTime=24
        else if chooseAttack=5
          mouseDownTime=34
      }
      if currentAttack=0 //mouse over to attack choice
      {
        if chooseAttack>0
        {
          //mouseDownTime-=1
          mouseDownTime-=gDeltaTime //60fps change: counts 30fps ticks
          //if mouseDownTime<=0
          if mouseDownTime<1 //60fps change: the same 30fps ticks (it counts down in gDeltaTime steps; the same as <=0 in whole ticks), so it moves as far
          {
            if mouseDownTime<=-holdTime
            {
              currentAttack=chooseAttack
              menuPopup=false
              chooseAttack=0
            }
          }
          else
          {
            //x+=1.5
            x+=1.5*gDeltaTime //60fps change: per 30fps tick
            //y+=3
            y+=3*gDeltaTime //60fps change: per 30fps tick
          }
        }
      }
      else if currentAttack=1 //create new
      {
        if attackProgress=0
        {
          xAtkStart=x
          yAtkStart=y
          xDragSpd=random(3)+4+spdMod
          xDragTime=round(random(6))+20
          yDragSpd=random(2)+4+spdMod
          yDragTime=round(random(5))+18
          if bUseCopy=false
          {
            if x>xCenter
              xDragSpd*=-1
          }
          if y>yGround-128
            yDragSpd*=-1
          currentMovement=0
          attackProgress=1
          bDragCreate=true
        }
        if bDragCreate=true
        {
          //xDragTime-=1
          xDragTime-=gDeltaTime //60fps change: counts 30fps ticks
          //yDragTime-=1
          yDragTime-=gDeltaTime //60fps change: counts 30fps ticks
          //if xDragTime>0
          if xDragTime>=1 //60fps change: the same 30fps ticks (the same as >0 in whole ticks)
            //x+=xDragSpd
            x+=xDragSpd*gDeltaTime //60fps change: per 30fps tick
          //if yDragTime>0
          if yDragTime>=1 //60fps change: see above
            //y+=yDragSpd
            y+=yDragSpd*gDeltaTime //60fps change: per 30fps tick

          if xDragTime<=0 and yDragTime<=0
          {
            var xDrag,yDrag;
            xDrag=x-xAtkStart
            yDrag=y-yAtkStart
            if bUseCopy=false
            {
              if xDrag<0
              {
                xDrag*=-1
                xAtkStart=x
              }
            }
            if yDrag<0
            {
              yDrag*=-1
              yAtkStart=y
            }
            for(i=0;i<4;i+=1)
            {
              bigAppAttack=instance_create(xAtkStart,yAtkStart,oDCBigApp)
              bigAppAttack.spiritPower=spiritPower
              bigAppAttack.xDrag=xDrag
              bigAppAttack.yDrag=yDrag
              bigAppAttack.type=i
            }
            bDragCreate=false
            currentMovement=1
            currentAttack=0
            attackDelay=0
            if bUseCopy=false
            {
              if random(100)<copyChance
              {
                bUseCopy=true
                attackDelay=waitTime+50
              }
            }
            else
              bUseCopy=false
          }
        }
      }
      else if currentAttack=2 //copy
        currentAttack=1
      else if currentAttack=3 //toss icons
      {
        //attackTime+=1
        attackTime+=gDeltaTime //60fps change: counts 30fps ticks
        if attackProgress=0
        {
          xAtkStart=x
          yAtkStart=y
          i=0
          xOffset=0
          yOffset=0
          attackType=choose(0,1,2)
          attackProgress=1
        }
        //if attackTime mod 3=0 and attackTime<=appCreate*3
        if scrModPass(attackTime,3) and attackTime<=appCreate*3 //60fps change: once each time the count reaches a multiple of it
        {
          appAttack=instance_create(xAtkStart+xOffset,yAtkStart+yOffset,oDCApp)
          appAttack.spiritPower=spiritPower
          appAttack.throwDelay=(i*5)+30
          appAttack.type=0
          if attackType=0
            xOffset+=16
          else if attackType=1
            yOffset+=16
          else if attackType=2
          {
            xOffset+=16
            yOffset+=16
          }
          i+=1
        }
        if attackTime>=appCreate*3+1
        {
          currentAttack=0
          attackDelay=0
        }
      }
      else if currentAttack=4 //type a taunt
      {
        //attackTime+=1
        attackTime+=gDeltaTime //60fps change: counts 30fps ticks
        if attackProgress=0
        {
          textAttack=instance_create(x,y,oTextAttack)
          textAttack.spiritPower=spiritPower
          textAttack.decayTime=textDecay
          textAttack.image_angle=point_direction(x,y,oPlayer1.x,oPlayer1.y-24)
          var tauntPick;
          tauntPick=choose(0,1,2)
          textAttack.text_Full=taunt[tauntPick]
          attackProgress=1
        }
        if attackTime>=20
        {
          currentAttack=0
          attackDelay=0
        }
      }
      else if currentAttack=5 //danmaku
      {
        if attackProgress=0
        {
          with oTextAttack
            instance_destroy()
          currentMovement=0
          //hspeed=0
          //vspeed=0
          _hspeed=0 //60fps change: _hspeed/_vspeed stand in for the built-in hspeed/vspeed (see correctHSpeedVSpeed at the end)
          _vspeed=0 //60fps change: see above
          physicalDefense*=5
          spiritDefense*=5
          atkDir=0
          changeSpd=3
          attackProgress=1
        }
        else if attackProgress=1
        {
          if x>xCenter-16
            //x-=4
            x-=4*gDeltaTime //60fps change: per 30fps tick
          else
            //x+=4
            x+=4*gDeltaTime //60fps change: per 30fps tick
          if y>yGround-128
            //y-=4
            y-=4*gDeltaTime //60fps change: per 30fps tick
          else
            //y+=4
            y+=4*gDeltaTime //60fps change: per 30fps tick
          if point_distance(x,y,xCenter-16,yGround-128)<8
          {
            x=xCenter-16
            y=yGround-128
            attackProgress=2
          }
        }
        else if attackProgress=2
        {
          //attackTime+=1
          attackTime+=gDeltaTime //60fps change: counts 30fps ticks
          //if attackTime mod 2=0
          if scrModPass(attackTime,2) //60fps change: once each time the count reaches a multiple of it
          {
            for(i=0;i<4;i+=1)
            {
              appAttack=instance_create(x,y,oDCApp)
              appAttack.spiritPower=spiritPower
              appAttack.throwDelay=0
              appAttack.type=1
              //appAttack.direction=atkDir+(90*i)
              appAttack._direction=atkDir+(90*i) //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
            }
            atkDir+=changeSpd
          }

          //if attackTime=165
          if scrCountPass(attackTime,165) //60fps change: once, when the count reaches it
          {
            msgCreate("Watch out! Direction change!",0,oMessagePerson,global.mainCharacters[1],1,1)
            newMessage.fadingTime=50
          }
          //else if attackTime=195
          else if scrCountPass(attackTime,195) //60fps change: once, when the count reaches it
            changeSpd=-3
          //else if attackTime=390
          else if scrCountPass(attackTime,390) //60fps change: once, when the count reaches it
            changeSpd=-4
          //else if attackTime=555
          else if scrCountPass(attackTime,555) //60fps change: once, when the count reaches it
          {
            msgCreate("Watch out! Direction change!",0,oMessagePerson,global.mainCharacters[1],1,1)
            newMessage.fadingTime=50
          }
          //else if attackTime=585
          else if scrCountPass(attackTime,585) //60fps change: once, when the count reaches it
            changeSpd=4
          //else if attackTime=780
          else if scrCountPass(attackTime,780) //60fps change: once, when the count reaches it
          {
            physicalDefense/=5
            spiritDefense/=5
            currentMovement=1
            currentAttack=0
            attackDelay=0
          }
        }
      }
    }

    //scale difficulty
    if lifePercent<=0.9 and lifePercent>=0.81 and bossProgress=0
    {
      minSpd+=0.1
      maxSpd+=0.1
      waitTime-=10
      holdTime-=1
      spdMod+=0.25
      copyChance+=2
      textDecay+=20
      bossProgress+=1
    }
    else if lifePercent<=0.8 and lifePercent>=0.71 and bossProgress=1
    {
      minSpd+=0.1
      maxSpd+=0.1
      waitTime-=15
      holdTime-=1
      spdMod+=0.25
      copyChance+=3
      appCreate+=1
      textDecay+=20
      bossProgress+=1
    }
    else if lifePercent<=0.7 and lifePercent>=0.61 and bossProgress=2
    {
      if global.difficulty>=3
      {
        minSpd+=0.2
        maxSpd+=0.2
        textDecay+=30
      }
      else
      {
        minSpd+=0.1
        maxSpd+=0.1
        textDecay+=20
      }
      waitTime-=10
      holdTime-=1
      spdMod+=0.25
      copyChance+=3
      bossProgress+=1
    }
    else if lifePercent<=0.6 and lifePercent>=0.51 and bossProgress=3
    {
      if global.difficulty>=3
      {
        minSpd+=0.2
        maxSpd+=0.2
        textDecay+=30
      }
      else
      {
        minSpd+=0.1
        maxSpd+=0.1
        textDecay+=20
      }
      waitTime-=5
      holdTime-=1
      spdMod+=0.25
      copyChance+=4
      appCreate+=1
      bossProgress+=1
    }
    else if lifePercent<=0.5 and lifePercent>=0.41 and bossProgress=4
    {
      if global.difficulty>=3
      {
        waitTime-=10
        copyChance+=6
      }
      else
      {
        waitTime-=5
        copyChance+=3
      }
      minSpd+=0.1
      maxSpd+=0.1
      holdTime-=1
      spdMod+=0.25
      textDecay+=30
      specialAttack+=1
      bossProgress+=1
    }
    else if lifePercent<=0.4 and lifePercent>=0.31 and bossProgress=5
    {
      if global.difficulty>=3
        spdMod+=0.5
      else
        spdMod+=0.25
      minSpd+=0.2
      maxSpd+=0.2
      waitTime-=5
      holdTime-=1
      copyChance+=6
      appCreate+=1
      textDecay+=30
      bossProgress+=1
    }
    else if lifePercent<=0.3 and lifePercent>=0.21 and bossProgress=6
    {
      minSpd+=0.2
      maxSpd+=0.2
      waitTime-=10
      holdTime-=1
      spdMod+=0.3
      copyChance+=4
      textDecay+=30
      bossProgress+=1
    }
    else if lifePercent<=0.2 and lifePercent>=0.11 and bossProgress=7
    {
      if global.difficulty>=3
      {
        minSpd+=0.2
        maxSpd+=0.2
        holdTime-=2
        copyChance+=5
        appCreate+=2
      }
      else
      {
        minSpd+=0.1
        maxSpd+=0.1
        holdTime-=1
        copyChance+=3
        appCreate+=1
      }
      waitTime-=10
      spdMod+=0.4
      textDecay+=30
      bossProgress+=1
    }
    else if lifePercent<=0.1 and lifePercent>=0 and bossProgress=8
    {
      minSpd+=0.2
      maxSpd+=0.2
      waitTime-=5
      holdTime-=1
      spdMod+=0.15
      copyChance+=5
      appCreate+=1
      textDecay+=20
      bossProgress+=1
    }
  }
  enemyStepEvent()
}
else
{
  //hspeed=0
  //vspeed=0
  _hspeed=0 //60fps change: see above
  _vspeed=0 //60fps change: see above
}
correctHSpeedVSpeed(id) //60fps change (added): moves it by _hspeed/_vspeed, this frame's share of a 30fps tick
#define Collision_oTechClose
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if damageTime=flashTime and dieFade=0 and other.attackType=other.TECH_MENTAL_INSURRECTION and menuPopup=true
{
  inflictStatus(0)
}
#define Collision_oAttackBase
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if damageTime=flashTime and dieFade=0
{
  if attackDelay<waitTime
    attackDelay-=round((stunnedTime/2))
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if menuPopup=true
{
  draw_set_font(fnt_MSWorld)
  draw_set_halign(fa_left)
  draw_set_alpha(1)
  draw_sprite(sPopupMenu,-1,mPosX,mPosY)
  draw_set_color(c_black)
  if y>=mPosY+3 and y<=mPosY+19 and x>=mPosX+3 and x<=mPosX+121 //Create New -------------------------
  {
    draw_set_color(make_color_rgb(0,0,128))
    draw_rectangle(mPosX+3,mPosY+3,mPosX+121,mPosY+20,false)
    draw_set_color(c_white)
  }
  else
    draw_set_color(c_black)
  draw_text(mPosX+21,mPosY+5,"Create New")
  if y>=mPosY+20 and y<=mPosY+36 and x>=mPosX+3 and x<=mPosX+121 //Copy -------------------------
  {
    draw_set_color(make_color_rgb(0,0,128))
    draw_rectangle(mPosX+3,mPosY+20,mPosX+121,mPosY+37,false)
    draw_set_color(c_white)
  }
  else
    draw_set_color(c_black)
  draw_text(mPosX+21,mPosY+22,"Copy")
  if y>=mPosY+46 and y<=mPosY+62 and x>=mPosX+3 and x<=mPosX+121 //Toss Icons -------------------------
  {
    draw_set_color(make_color_rgb(0,0,128))
    draw_rectangle(mPosX+3,mPosY+46,mPosX+121,mPosY+63,false)
    draw_set_color(c_white)
  }
  else
    draw_set_color(c_black)
  draw_text(mPosX+21,mPosY+48,"Toss Icons")
  if y>=mPosY+63 and y<=mPosY+79 and x>=mPosX+3 and x<=mPosX+121 //Type a Taunt -------------------------
  {
    draw_set_color(make_color_rgb(0,0,128))
    draw_rectangle(mPosX+3,mPosY+63,mPosX+121,mPosY+80,false)
    draw_set_color(c_white)
  }
  else
    draw_set_color(c_black)
  draw_text(mPosX+21,mPosY+65,"Type a Taunt")
  if y>=mPosY+89 and y<=mPosY+105 and x>=mPosX+3 and x<=mPosX+121 //Danmaku -------------------------
  {
    draw_set_color(make_color_rgb(0,0,128))
    draw_rectangle(mPosX+3,mPosY+89,mPosX+121,mPosY+106,false)
    draw_set_color(c_white)
  }
  else
    draw_set_color(c_black)
  draw_text(mPosX+21,mPosY+91,"Danmaku")
  if y>=mPosY+115 and y<=mPosY+131 and x>=mPosX+3 and x<=mPosX+121 //M$ Spell Check -------------------------
  {
    draw_set_color(make_color_rgb(0,0,128))
    draw_rectangle(mPosX+3,mPosY+115,mPosX+121,mPosY+132,false)
    draw_set_color(c_white)
  }
  else
    draw_set_color(c_black)
  draw_text(mPosX+21,mPosY+117,"M$ Spell Check")
}

if bDragCreate=true
{
  draw_set_alpha(1)
  draw_set_color(c_black)
  draw_rectangle(xAtkStart,yAtkStart,x,y,true)
}
if currentAttack=5
{
  oPlayer1.dashRecoveryTime=0
  oPlayer1.dashPoints=0
  if dashWarning=0
  {
    warnScale=4
    dashWarning=1
  }
  draw_set_color(c_white)
  draw_set_font(fnt_GameOver)
  draw_set_halign(fa_center)
  draw_set_alpha(1)
  if warnScale>1
    //warnScale-=0.2
    warnScale-=0.2*gDeltaTime //60fps change: per 30fps tick
  draw_text_transformed(xCenter,yGround-256,"DASH DISABLED!!",warnScale,warnScale,0)
}

event_inherited()
if activateBoss=2
{
  draw_sprite_ext(sShroudLArm,image_index,x+36,y-48,1,1,0,c_white,armAlpha)
  draw_sprite_ext(sShroudLArm,image_index,x-36,y-48,-1,1,0,c_white,armAlpha)
}
