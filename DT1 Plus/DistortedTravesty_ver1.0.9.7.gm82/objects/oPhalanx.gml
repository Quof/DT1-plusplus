#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=0

//Enemy base statistics
eName="Ultimate Phalanx"
maxLife=10000
life=maxLife
expWorth=140000
physicalPower=450
physicalDefense=150
spiritPower=490
spiritDefense=200
FIREresist=-50
WATERresist=50
EARTHresist=-50
bIsBoss=true
barAmount=1
questType=1
bCanDealDamage=false
activateBoss=0
if global.difficulty=1
{
  laserWait=430
}
else if global.difficulty=2
{
  laserWait=400
}
else if global.difficulty=3
{
  laserWait=380
}
else if global.difficulty=4
{
  laserWait=350
}
laserTime=50
laserDelay=0
bossProgress=0
bLifeRegen=0
difficultyAdjustments(global.difficulty)
if global.difficulty=1
{
  maxLife=9800
  physicalDefense=145
}
else if global.difficulty=3
{
  maxLife=10200
  physicalDefense=155
}
else if global.difficulty=4
{
  maxLife=10500
  physicalDefense=160
}
life=maxLife
cripplePointText=">Fireball#>Any Attack"

xCenter=928 //352
yGround=320
roomSpan=576
jeremyMessage=0
jMessageProg=0

phalBody=instance_create(x,y,oPhalanxBody)
phalUarm=instance_create(x+34,y-18,oPhalUarms)
phalLarm=instance_create(x+40,y+3,oPhalLarms)
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
    bActive=true
    bShowHealthBar=true
    showBossHP=instance_create(0,0,oBossLifeDisplay)
    showBossHP.bossID=id
    combatText="If you played to the end of Demon's Crest, then you know how rough this guy is. Of course The Darkness had to tamper with things. It can bring up it's hands to block it's one weak spot and can block almost every attack. The attack the lower hands have is an energy ball the follows you around. The only way to get rid of it is to get it to fly into one of the platforms. It's sorta pointless though, it will quickly summon another one. It's upper hands will periodically fire a lot of energy waves. They are fired at you, so use that to your advantage when setting up how you're going to dodge. When he opens his mouth, he will fire a very powerful laser. Make it a priority not to be hit by this."
    if room=rShadyWoods4
      sideText="Hmm, something is weird here. It seems as if there is some force keeping him alive. I hate to say it, but as of right now, he is unbeatable. As soon as you take his life down to a certain point, he will just quickly regenerate it all. The thing is, The Darkness already revealed to us that Abstracity is in danger. Do we have any reason to fight this? Think about it for a second."
    else
      sideText="This is better, this time he's going down. Without the Muffin to keep him alive, you've got him. Get rid of this guy quick, I want to see what exactly is happening out there. He's been blocking your teleport function."
    oPhalanxBody.activateBoss=1
    oPhalUarms.activateBoss=1
    oPhalLarms.activateBoss=1
    activateBoss=2
  }
  if bActive=true and dieFade=0
  {
    //movement **************************************************

    //attacks **************************************************
    laserTime+=1
    if laserDelay=0
    {
      if laserTime>=laserWait
      {
        laserDelay=laserWait
        laserTime=laserWait
      }
    }
    if laserTime>=laserDelay and laserDelay!=0
    {
      if laserTime=laserDelay
      {
        sprite_index=sPhalanxMouthOpen
        oPhalUarms.sprite_index=sPhalUarmsIdle
        oPhalUarms.guardTime=0
        oPhalLarms.sprite_index=sPhalLarmsIdle
        oPhalLarms.guardTime=0
      }
      else if laserTime=laserDelay+30
      {
        energyLaser=instance_create(x-10,y+16,oPhalLaser)
        energyLaser.damageType="SPIRIT"
        energyLaser.spiritPower=round(spiritPower*1.25)
      }
    }

    if room!=rBR_UltimatePhalanx
    {
      if room=rShadyWoods4 //Shady Woods event
      {
        if bLifeRegen=0
        {
          if lifePercent<=0.85
          {
            jeremyMessage=1
            jMessageProg+=1
            bLifeRegen=1
          }
        }
        else
        {
          life+=20
          if lifePercent>=1
          {
            life=maxLife
            bLifeRegen=0
          }
        }

        if jeremyMessage>0
          jeremyMessage+=1

        if jMessageProg=1
        {
          if jeremyMessage=2
          {
            msgCreate("It just gets it's life back when you damage it enough.",0,oMessagePerson,global.mainCharacters[1],0,1)
            newMessage.fadingTime=120
          }
          else if jeremyMessage=122
          {
            msgCreate("What am I supposed to do then?",0,oMessagePerson,global.mainCharacters[0],0,1)
            newMessage.fadingTime=120
          }
          else if jeremyMessage=242
          {
            msgCreate("I was thinking about that.#The Darkness already told us about Abstracity...",0,oMessagePerson,global.mainCharacters[1],0,1)
            newMessage.fadingTime=140
          }
          else if jeremyMessage=382
          {
            msgCreate("What are you suggesting?",0,oMessagePerson,global.mainCharacters[0],0,1)
            newMessage.fadingTime=110
          }
          else if jeremyMessage=492
          {
            msgCreate("Do you really NEED to beat this now?#Think about it.",0,oMessagePerson,global.mainCharacters[1],0,1)
            newMessage.fadingTime=130
          }
          else if jeremyMessage=622
          {
            msgCreate("No way...",0,oMessagePerson,global.mainCharacters[0],0,1)
            newMessage.fadingTime=80
          }
        }
        else if jMessageProg=2
        {
          if jeremyMessage=2
          {
            msgCreate("Despite what I said, you're still fighting him.",0,oMessagePerson,global.mainCharacters[1],0,1)
            newMessage.fadingTime=120
          }
          else if jeremyMessage=122
          {
            msgCreate("Do I really have to use an exploit?",0,oMessagePerson,global.mainCharacters[0],0,1)
            newMessage.fadingTime=120
          }
          else if jeremyMessage=242
          {
            msgCreate("What's stopping you?",0,oMessagePerson,global.mainCharacters[1],0,1)
            newMessage.fadingTime=90
          }
          else if jeremyMessage=332
          {
            msgCreate("What a valid point.",0,oMessagePerson,global.mainCharacters[0],0,1)
            newMessage.fadingTime=100
          }
        }
        else if jMessageProg>=3
        {
          if jeremyMessage=2
          {
            msgCreate(". . .",0,oMessagePerson,global.mainCharacters[1],0,1)
            newMessage.fadingTime=80
          }
          else if jeremyMessage=82
          {
            msgCreate("I just want to see how long I can go.",0,oMessagePerson,global.mainCharacters[0],0,1)
            newMessage.fadingTime=120
          }
          else if jeremyMessage=202
          {
            msgCreate("This would make it " +string(jMessageProg) +string(" times you've done this now."),0,oMessagePerson,global.mainCharacters[1],0,1)
            newMessage.fadingTime=120
          }
        }
      }
      else
      {
        if lifePercent<=0.85 and global.gameProgress<274
        {
          life=maxLife
          msgCreate("I told you, it's unbeatable.#Get that Muffin first.",0,oMessagePerson,global.mainCharacters[1],0,1)
          newMessage.fadingTime=130
        }
      }
    }

    //scale difficulty
    if lifePercent<=0.9 and lifePercent>=0.81 and bossProgress=0
    {
      laserWait-=global.difficulty
      oPhalUarms.energyWaveWait-=global.difficulty
      oPhalUarms.eWaveLength+=global.difficulty
      oPhalLarms.energyBallWait-=1
      bossProgress+=1
    }
    else if lifePercent<=0.8 and lifePercent>=0.71 and bossProgress=1
    {
      laserWait-=global.difficulty
      oPhalUarms.energyWaveWait-=1
      oPhalUarms.eWaveLength+=1
      oPhalLarms.energyBallWait-=1
      bossProgress+=1
    }
    else if lifePercent<=0.7 and lifePercent>=0.61 and bossProgress=2
    {
      laserWait-=global.difficulty
      oPhalUarms.energyWaveWait-=global.difficulty
      oPhalUarms.eWaveLength+=1
      oPhalLarms.energyBallWait-=1
      bossProgress+=1
    }
    else if lifePercent<=0.6 and lifePercent>=0.51 and bossProgress=3
    {
      laserWait-=global.difficulty
      oPhalUarms.energyWaveWait-=1
      oPhalUarms.eWaveLength+=1
      oPhalLarms.energyBallWait-=1
      bossProgress+=1
    }
    else if lifePercent<=0.5 and lifePercent>=0.41 and bossProgress=4
    {
      laserWait-=global.difficulty
      oPhalUarms.energyWaveWait-=global.difficulty
      oPhalUarms.eWaveLength+=global.difficulty
      oPhalLarms.energyBallWait-=global.difficulty
      bossProgress+=1
    }
    else if lifePercent<=0.4 and lifePercent>=0.31 and bossProgress=5
    {
      laserWait-=global.difficulty
      oPhalUarms.energyWaveWait-=2
      oPhalUarms.eWaveLength+=1
      oPhalLarms.energyBallWait-=1
      bossProgress+=1
    }
    else if lifePercent<=0.3 and lifePercent>=0.21 and bossProgress=6
    {
      laserWait-=global.difficulty
      oPhalUarms.energyWaveWait-=global.difficulty
      oPhalUarms.eWaveLength+=global.difficulty
      oPhalLarms.energyBallWait-=1
      bossProgress+=1
    }
    else if lifePercent<=0.2 and lifePercent>=0.11 and bossProgress=7
    {
      laserWait-=global.difficulty
      oPhalUarms.energyWaveWait-=global.difficulty
      oPhalUarms.eWaveLength+=1
      oPhalLarms.energyBallWait-=global.difficulty
      bossProgress+=1
    }
    else if lifePercent<=0.1 and lifePercent>=0 and bossProgress=8
    {
      laserWait-=global.difficulty
      oPhalUarms.energyWaveWait-=global.difficulty
      oPhalUarms.eWaveLength+=1
      oPhalLarms.energyBallWait-=1
      bossProgress+=1
    }
  }
  enemyStepEvent()
}
#define Collision_oAttackBase
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if cripplePointProgress=0
{
  event_inherited()
  if damageTime=flashTime and dieFade=0 and other.currentSpell="FIREBALL"
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
}
else if cripplePointProgress=1
{
  if damageTime=flashTime and dieFade=0
    inflictStatus(0)
}
