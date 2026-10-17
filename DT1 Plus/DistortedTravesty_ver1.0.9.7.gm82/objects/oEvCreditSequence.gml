#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
enemyCount=-1
screenFadeColor=c_black
screenFadeAlpha=1
sceneProgress=0
sceneDelay=0
cSideAlpha=1
cSpd=0.5
cSpacing=24
viewX=224

showRank=0
global.finalRankCheck=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gameProgress=352
{
  //---------------------------------------- Credits ----------------------------------------
  if sceneProgress=0
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
      stopAllMusic()
    //else if sceneDelay>=60
    else if sceneDelay>59 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    {
      //screenFadeAlpha-=0.02
      screenFadeAlpha-=0.02*gDeltaTime //60fps change: per 30fps tick
      if screenFadeAlpha<=0
      {
        msc_Credits=SS_LoadSound("Music\DT_Credits.ogg",0)
        var tempMplay;
        tempMplay=msc_Credits
        playMusic(tempMplay,0,1)
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=1
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=60
    if scrCountPass(sceneDelay,60) //60fps change: once, when the count reaches it
    {
      createCredit("~ Game Design ~",cSpd,fnt_CreditTitle,fa_center,0)
      createCredit("Game Design#Story & Storyboards#Events & Scenario#Script#Level Design##AI Scripts#Boss Design##HUD & GUI Design#Physics & Control",cSpd,fnt_CreditName,fa_left,cSpacing)
      createCredit("ZephyrBurst#ZephyrBurst#ZephyrBurst#ZephyrBurst#slaix223#ZephyrBurst#ZephyrBurst#slaix223#ZephyrBurst#ZephyrBurst#Martin Piecyk#ZephyrBurst",cSpd,fnt_CreditName,fa_right,cSpacing)
    }
    //else if sceneDelay=670
    else if scrCountPass(sceneDelay,670) //60fps change: once, when the count reaches it
    {
      createCredit("~ Tools ~",cSpd,fnt_CreditTitle,fa_center,0)
      createCredit("Game Maker Toolset#Platform Engine",cSpd,fnt_CreditName,fa_left,cSpacing)
      createCredit("Mark Overmars#Martin Piecyk",cSpd,fnt_CreditName,fa_right,cSpacing)
    }
    //else if sceneDelay=910
    else if scrCountPass(sceneDelay,910) //60fps change: once, when the count reaches it
    {
      createCredit("~ Sprites & Tiles ~",cSpd,fnt_CreditTitle,fa_center,0)
      createCredit("Original sprites by",cSpd,fnt_CreditName,fa_left,cSpacing)
      createCredit("Capcom#Konami#Nintendo#Sega",cSpd,fnt_CreditName,fa_right,cSpacing*2)

      createCredit("Jerry sprite ripped by",cSpd,fnt_CreditName,fa_left,cSpacing*6)
      createCredit("Dazz & Fret from Spriters Resource",cSpd,fnt_CreditName,fa_right,cSpacing*7)

      createCredit("Original sprites by",cSpd,fnt_CreditName,fa_left,cSpacing*9)
      createCredit("OkageSK",cSpd,fnt_CreditName,fa_right,cSpacing*10)

      createCredit("Rips from Spriters Resource",cSpd,fnt_CreditName,fa_left,cSpacing*11)
      createCredit("A.J. Nitro#Alodo#Aquatics64#Apocalypse#Bacon#Badbatman3#Barubary#Bean#Biggoron#Boo#BruceJuice#ChaosMiles07#CrimsonPenguin#Dandelion#Dark Angel#Deathbringer#DennisVonMario#DinnerSonic#EdTheHorse#Freedom Fighter#Fret#Jack#Kung Fu Man#KyDogan#Kyla B.K.A.#Lord Zymeth#Maxim#Megaleo#Meta Warp#Mitchcom#Mystic#Nai255#Nemu#Neo-Glitch#Nightmare#Nitratez#Random Talking Bush#Ridureyu#Ryan914#SMITHYGCN#Sonikku#Supersamus/Ridleymaster#Teeks#Tom Guycott#Tonberry2k#Vanarus#Xitus",cSpd,fnt_CreditName,fa_right,cSpacing*12)

      createCredit("Rips from Sprite Database",cSpd,fnt_CreditName,fa_left,cSpacing*47)
      createCredit("Grim",cSpd,fnt_CreditName,fa_right,cSpacing*48)
    }
    //else if sceneDelay=3290
    else if scrCountPass(sceneDelay,3290) //60fps change: once, when the count reaches it
    {
      createCredit("~ Backgrounds ~",cSpd,fnt_CreditTitle,fa_center,0)
      createCredit("Rips from Spriters Resource",cSpd,fnt_CreditName,fa_left,cSpacing)
      createCredit("DeathBringer#Illmatic#Soldjermon",cSpd,fnt_CreditName,fa_right,cSpacing*2)
    }
    //else if sceneDelay=3590
    else if scrCountPass(sceneDelay,3590) //60fps change: once, when the count reaches it
    {
      createCredit("~ Music & Sound ~",cSpd,fnt_CreditTitle,fa_center,0)
      createCredit("From Newgrounds Audio Portal",cSpd,fnt_CreditName,fa_left,cSpacing)
      createCredit("Bjra#Bosa#Cat333Pokemon#DJ-HappyFace#Drawoh#Dungeecount#DustDevil#DZX#floccari#grumbleduke#Jesse Valentine (F-777)#midimachine#NemesisTheory#Reone662#Skragga#Selcuk Bor (MaestroRage)#sidar talei (sidar-talei)#Spiriax",cSpd,fnt_CreditName,fa_right,cSpacing*2)

      createCredit("From VG Music",cSpd,fnt_CreditName,fa_left,cSpacing*17)
      createCredit("Blac-Dragoon#Jarel Jones#Lutarez#Octal Livershite#Rize#Sivak Drac#Sword-Bolt#Teck",cSpd,fnt_CreditName,fa_right,cSpacing*18)

      createCredit("From Overclocked Remix",cSpd,fnt_CreditName,fa_left,cSpacing*25)
      createCredit("djpretzel#Wintermute",cSpd,fnt_CreditName,fa_right,cSpacing*26)

      createCredit("Sounds used from & by",cSpd,fnt_CreditName,fa_left,cSpacing*28)
      createCredit("Flash Kit#The Mushroom Kingdom#BlackManny23",cSpd,fnt_CreditName,fa_right,cSpacing*29)
    }
    //else if sceneDelay=5230
    else if scrCountPass(sceneDelay,5230) //60fps change: once, when the count reaches it
    {
      createCredit("~ Special Thanks ~",cSpd,fnt_CreditTitle,fa_center,0)
      createCredit("Callista#Darkstorm091#Dave#Ereth (HarleyQuinn)#Harryb412#Jaffe#Jeremy#Jerry#Nick#OkageSK#Queue#Quostin#Rast#venjuliene_corpuz",cSpd,fnt_CreditName,fa_right,cSpacing)
      createCredit("And a Super Special Thanks to",cSpd,fnt_CreditName,fa_left,cSpacing*12)
      createCredit("slaix223",cSpd,fnt_CreditName,fa_right,cSpacing*13)
    }
    //else if sceneDelay=5980
    else if scrCountPass(sceneDelay,5980) //60fps change: once, when the count reaches it
      createCredit("Another thanks to our sponsors",cSpd,fnt_CreditName,fa_center,0)
    //else if sceneDelay=6050
    else if scrCountPass(sceneDelay,6050) //60fps change: once, when the count reaches it
    {
      creditImage=instance_create(0,view_yview[0]+424,oEvCreditImage)
      creditImage.sprite_index=sPepsiLogo
      creditImage.scrollSpeed=0.5
    }
    //else if sceneDelay=6350
    else if scrCountPass(sceneDelay,6350) //60fps change: once, when the count reaches it
    {
      creditsPresented=instance_create(0,0,oEvCreditText)
      creditsPresented.creditString="~ Presented by ~#ZephyrBurst"
      creditsPresented.scrollSpeed=cSpd
      creditsPresented.creditFont=fnt_CreditTitle
      creditsPresented.creditAlign=fa_center
      creditsPresented.yAdjust=0
    }
    //else if sceneDelay=6351
    else if scrCountPass(sceneDelay,6351) //60fps change: once, when the count reaches it
      creditsPresented.x=room_width/2
    else if sceneDelay>=6352
    {
      if creditsPresented.y<=room_height/2-32
      {
        creditsPresented.scrollSpeed=0
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=2
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay>=230
    if sceneDelay>229 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    {
      //creditsPresented.image_alpha-=0.02
      creditsPresented.image_alpha-=0.02*gDeltaTime //60fps change: per 30fps tick
      if creditsPresented.image_alpha<=0
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=3
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=60
    if scrCountPass(sceneDelay,60) //60fps change: once, when the count reaches it
    {
      theEnd=instance_create(0,0,oEvCreditText)
      theEnd.creditString="~ THE END ~"
      theEnd.scrollSpeed=0
      theEnd.creditFont=fnt_CreditTitle
      theEnd.creditAlign=fa_center
      theEnd.yAdjust=0
    }
    //else if sceneDelay=61
    else if scrCountPass(sceneDelay,61) //60fps change: once, when the count reaches it
    {
      theEnd.image_alpha=0
      theEnd.x=room_width/2
      theEnd.y=room_height/2-32
    }
    //else if sceneDelay>=70 and sceneDelay<=140
    else if sceneDelay>69 and sceneDelay<=140 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    {
      //theEnd.image_alpha+=0.02
      theEnd.image_alpha+=0.02*gDeltaTime //60fps change: per 30fps tick
      if theEnd.image_alpha>=1
        sceneDelay=150
    }
    //else if sceneDelay>=210
    else if sceneDelay>209 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    {
      //theEnd.image_alpha-=0.02
      theEnd.image_alpha-=0.02*gDeltaTime //60fps change: per 30fps tick
      if theEnd.image_alpha<=0
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=4
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1 //initialize/calculate score variables
    if scrCountPass(sceneDelay,1) //initialize/calculate score variables //60fps change: once, when the count reaches it
    {
      totalPoints=0
      var capsuleCheck,chestCheck,heartCheck,spiritCheck,totalChest,techCheck,beadCheck,itemPercect,itemCurrent,itemTotal;
      chestCheck=0
      heartCheck=0
      capsuleCheck=0
      spiritCheck=0
      techCheck=0
      beadCheck=0
      totalChest=global.maxMoneyChest+global.maxItemChest
      for (i=0;i<=global.maxSkillCapsules;i+=1)
        if global.skillCapsules[i]=1
          capsuleCheck+=1
      for (i=0;i<=global.maxMoneyChest;i+=1)
        if global.moneyChest[i]=1
          chestCheck+=1
      for (i=0;i<=global.maxItemChest;i+=1)
        if global.itemChest[i]=1
          chestCheck+=1
      for (i=0;i<=global.maxHeartPiece;i+=1)
        if global.heartPiece[i]=1
          heartCheck+=1
      for (i=0;i<=global.maxSpiritAuras;i+=1)
        if global.spiritAuras[i]=1
          spiritCheck+=1
      for (i=0;i<=global.maxTechCapsules;i+=1)
        if global.techCapsule[i]=1
          techCheck+=1
      for(i=0;i<18;i+=1)
        if global.invBracelet[i]>=1
          beadCheck+=1
      itemCurrent=capsuleCheck+chestCheck+heartCheck+spiritCheck+techCheck+beadCheck
      itemTotal=global.maxSkillCapsules+global.maxHeartPiece+global.maxSpiritAuras+global.maxTechCapsules+totalChest+18+6
      itemPercect=(itemCurrent/itemTotal)*100

      //---------- Score: Awesome ----------
      if global.p1Awesome>=75000
      {
        rankAwesome="A"; totalPoints+=5
      }
      else if global.p1Awesome>=68000
      {
        rankAwesome="B"; totalPoints+=4
      }
      else if global.p1Awesome>=60000
      {
        rankAwesome="C"; totalPoints+=3
      }
      else if global.p1Awesome>=50000
      {
        rankAwesome="D"; totalPoints+=2
      }
      else
      {
        rankAwesome="E"; totalPoints+=1
      }
      //---------- Score: Kills ----------
      if global.p1KillCount>=3500
      {
        rankKills="A"; totalPoints+=5
      }
      else if global.p1KillCount>=3000
      {
        rankKills="B"; totalPoints+=4
      }
      else if global.p1KillCount>=2500
      {
        rankKills="C"; totalPoints+=3
      }
      else if global.p1KillCount>=2000
      {
        rankKills="D"; totalPoints+=2
      }
      else
      {
        rankKills="E"; totalPoints+=1
      }
      //---------- Score: Item % ----------
      if itemPercect>=100
      {
        rankItems="A"; totalPoints+=5
      }
      else if itemPercect>=95
      {
        rankItems="B"; totalPoints+=4
      }
      else if itemPercect>=90
      {
        rankItems="C"; totalPoints+=3
      }
      else if itemPercect>=80
      {
        rankItems="D"; totalPoints+=2
      }
      else
      {
        rankItems="E"; totalPoints+=1
      }
      //---------- Score: Damage Dealt ----------
      if global.recDamageDealt>=3000000
      {
        rankDamageDealt="A"; totalPoints+=5
      }
      else if global.recDamageDealt>=2500000
      {
        rankDamageDealt="B"; totalPoints+=4
      }
      else if global.recDamageDealt>=2000000
      {
        rankDamageDealt="C"; totalPoints+=3
      }
      else if global.recDamageDealt>=1500000
      {
        rankDamageDealt="D"; totalPoints+=2
      }
      else
      {
        rankDamageDealt="E"; totalPoints+=1
      }
      //---------- Score: Hit Combo ----------
      if global.recMaxHitCombo>=200
      {
        rankCombo="A"; totalPoints+=5
      }
      else if global.recMaxHitCombo>=150
      {
        rankCombo="B"; totalPoints+=4
      }
      else if global.recMaxHitCombo>=100
      {
        rankCombo="C"; totalPoints+=3
      }
      else if global.recMaxHitCombo>=50
      {
        rankCombo="D"; totalPoints+=2
      }
      else
      {
        rankCombo="E"; totalPoints+=1
      }
      //---------- Score: Kill Chain ----------
      if global.recMaxKillChain>=50
      {
        rankChain="A"; totalPoints+=5
      }
      else if global.recMaxKillChain>=45
      {
        rankChain="B"; totalPoints+=4
      }
      else if global.recMaxKillChain>=40
      {
        rankChain="C"; totalPoints+=3
      }
      else if global.recMaxKillChain>=30
      {
        rankChain="D"; totalPoints+=2
      }
      else
      {
        rankChain="E"; totalPoints+=1
      }
      //---------- Score: Killing Spree ----------
      if global.recMaxKillingSpree>=100
      {
        rankSpree="A"; totalPoints+=5
      }
      else if global.recMaxKillingSpree>=75
      {
        rankSpree="B"; totalPoints+=4
      }
      else if global.recMaxKillingSpree>=50
      {
        rankSpree="C"; totalPoints+=3
      }
      else if global.recMaxKillingSpree>=25
      {
        rankSpree="D"; totalPoints+=2
      }
      else
      {
        rankSpree="E"; totalPoints+=1
      }
      //---------- Score: Play Time ----------
      if global.playTimeHour>30
      {
        rankTime="E"; totalPoints+=1
      }
      else if global.playTimeHour>25
      {
        rankTime="D"; totalPoints+=2
      }
      else if global.playTimeHour>20
      {
        rankTime="C"; totalPoints+=3
      }
      else if global.playTimeHour>15
      {
        rankTime="B"; totalPoints+=4
      }
      else
      {
        rankTime="A"; totalPoints+=5
      }
      //---------- Score: Deaths ----------
      if global.deathCount>600
      {
        rankDeaths="E"; totalPoints+=1
      }
      else if global.deathCount>300
      {
        rankDeaths="D"; totalPoints+=2
      }
      else if global.deathCount>100
      {
        rankDeaths="C"; totalPoints+=3
      }
      else if global.deathCount>10
      {
        rankDeaths="B"; totalPoints+=4
      }
      else
      {
        rankDeaths="A"; totalPoints+=5
      }
      //---------- Score: Damage Taken ----------
      if global.recDamageTaken>600000
      {
        rankDamageTaken="E"; totalPoints+=1
      }
      else if global.recDamageTaken>400000
      {
        rankDamageTaken="D"; totalPoints+=2
      }
      else if global.recDamageTaken>240000
      {
        rankDamageTaken="C"; totalPoints+=3
      }
      else if global.recDamageTaken>100000
      {
        rankDamageTaken="B"; totalPoints+=4
      }
      else
      {
        rankDamageTaken="A"; totalPoints+=5
      }
      //---------- Score: Taken Damage ----------
      if global.recTakenDamageNumber>3000
      {
        rankTakenDamage="E"; totalPoints+=1
      }
      else if global.recTakenDamageNumber>2000
      {
        rankTakenDamage="D"; totalPoints+=2
      }
      else if global.recTakenDamageNumber>1200
      {
        rankTakenDamage="C"; totalPoints+=3
      }
      else if global.recTakenDamageNumber>500
      {
        rankTakenDamage="B"; totalPoints+=4
      }
      else
      {
        rankTakenDamage="A"; totalPoints+=5
      }
      //---------- Score: Items Used ----------
      if global.recItemsUsed>100
      {
        rankUsed="E"; totalPoints+=1
      }
      else if global.recItemsUsed>75
      {
        rankUsed="D"; totalPoints+=2
      }
      else if global.recItemsUsed>50
      {
        rankUsed="C"; totalPoints+=3
      }
      else if global.recItemsUsed>25
      {
        rankUsed="B"; totalPoints+=4
      }
      else
      {
        rankUsed="A"; totalPoints+=5
      }
      //---------- Score: Rave Used ----------
      if global.recUsedRaveMode>80
      {
        rankRave="E"; totalPoints+=1
      }
      else if global.recUsedRaveMode>60
      {
        rankRave="D"; totalPoints+=2
      }
      else if global.recUsedRaveMode>40
      {
        rankRave="C"; totalPoints+=3
      }
      else if global.recUsedRaveMode>20
      {
        rankRave="B"; totalPoints+=4
      }
      else
      {
        rankRave="A"; totalPoints+=5
      }

      //---------- Difficulty Favored ----------
      if global.difficulty=4
      {
        rankMultiplier=1.2
        rankFavored="Distorted Mode"
      }
      else
      {
        var findMax,findSecond;
        findMax=max(global.recEasyTime,global.recNormalTime,global.recHardTime)

        if findMax=global.recEasyTime
        {
          rankMultiplier=0.9
          rankFavored="Beginner Mode"

          if global.recNormalTime!=0 or global.recHardTime!=0
          {
            findSecond=max(global.recNormalTime,global.recHardTime)
            if findSecond=global.recNormalTime
              rankMultiplier+=0.01
            else if findSecond=global.recHardTime
              rankMultiplier+=0.02
          }
        }
        else if findMax=global.recNormalTime
        {
          rankMultiplier=1
          rankFavored="Normal Mode"

          if global.recEasyTime!=0 or global.recHardTime!=0
          {
            findSecond=max(global.recEasyTime,global.recHardTime)
            if findSecond=global.recEasyTime
              rankMultiplier-=0.01
            else if findSecond=global.recHardTime
              rankMultiplier+=0.01
          }
        }
        else if findMax=global.recHardTime
        {
          rankMultiplier=1.1
          rankFavored="Hardcore Mode"

          if global.recNormalTime!=0 or global.recNormalTime!=0
          {
            findSecond=max(global.recEasyTime,global.recNormalTime)
            if findSecond=global.recEasyTime
              rankMultiplier-=0.02
            else if findSecond=global.recNormalTime
              rankMultiplier-=0.01
          }
        }
      }

      totalPoints*=rankMultiplier
      totalPoints=round(totalPoints)
      //---------- Score: Final Rank ----------
      if totalPoints>=78
      {
        global.finalRankCheck=6
        finalRank="S"
      }
      else if totalPoints>=60
      {
        global.finalRankCheck=5
        finalRank="A"
      }
      else if totalPoints>=48
      {
        global.finalRankCheck=4
        finalRank="B"
      }
      else if totalPoints>=34
      {
        global.finalRankCheck=3
        finalRank="C"
      }
      else if totalPoints>=22
      {
        global.finalRankCheck=2
        finalRank="D"
      }
      else
      {
        global.finalRankCheck=1
        finalRank="E"
      }

    }
    //if sceneDelay>=60 and sceneDelay<1000 //show scores
    if sceneDelay>=60 and sceneDelay<=999 //show scores //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    {
      if showRank<14
      {
        //if sceneDelay mod 30=0
        if scrModPass(sceneDelay,30) //60fps change: once each time the count reaches a multiple of it
          showRank+=1
      }
      else
        sceneDelay=1000
    }
    //else if sceneDelay=1060 //15
    else if scrCountPass(sceneDelay,1060) //15 //60fps change: once, when the count reaches it
      showRank+=1
    //else if sceneDelay=1150 //16
    else if scrCountPass(sceneDelay,1150) //16 //60fps change: once, when the count reaches it
      showRank+=1
    //else if sceneDelay=1210 //17
    else if scrCountPass(sceneDelay,1210) //17 //60fps change: once, when the count reaches it
      showRank+=1
    //else if sceneDelay=1270
    else if scrCountPass(sceneDelay,1270) //60fps change: once, when the count reaches it
      showRank+=1
    else if sceneDelay>=1271
    {
      //if keyboard_check_pressed(ord("J"))
      if (keyboard_check_pressed(ord("J")) or scrPadPressed(17)) //gamepad change: and the gamepad's Menu Confirm (scrGamepadInit)
      {
        global.gameProgress=353
        sceneProgress=0
        stopAllMusic()
        SS_FreeSound(msc_Credits)
        room_goto(rAfterCredits)
      }
    }
  }
  //---------------------------------------- Actions ----------------------------------------
  if sceneProgress=1
  {
    //if sceneDelay=200
    if scrCountPass(sceneDelay,200) //60fps change: once, when the count reaches it
    {
      for(i=0;i<9;i+=1)
      {
        yoshiGroup1[i]=instance_create(-24-(i*36),320,oEvCreditCharacter)
        if i mod 2=0
          yoshiGroup1[i].sprite_index=sYoshiGreenWalk
        else
          yoshiGroup1[i].sprite_index=sYoshiRedWalk
        yoshiGroup1[i].image_speed=0.23
        //yoshiGroup1[i].hspeed=1
        yoshiGroup1[i]._hspeed=1 //60fps change: _hspeed (see correctHSpeedVSpeed in oEvCreditCharacter)
      }
    }
    //else if sceneDelay=300
    else if scrCountPass(sceneDelay,300) //60fps change: once, when the count reaches it
    {
      msgCreate("Credits are boring.",0,oMessagePerson,global.mainCharacters[1],0,8,16)
      newMessage.fadingTime=80
    }
    //else if sceneDelay=390
    else if scrCountPass(sceneDelay,390) //60fps change: once, when the count reaches it
    {
      msgCreate("You're boring.",0,oMessagePerson,global.mainCharacters[0],0,8,16)
      newMessage.fadingTime=80
    }
    //else if sceneDelay=470
    else if scrCountPass(sceneDelay,470) //60fps change: once, when the count reaches it
    {
      createCrdObject("goonieGroup1",-32,96,sGoonie,0.33,1.5,-0.2)
      createCrdObject("goonieGroup1",-64,128,sGoonie,0.34,1.3,0.15)
      createCrdObject("goonieGroup1",-128,64,sGoonie,0.34,1.75,0.175)
    }
    //else if sceneDelay=480
    else if scrCountPass(sceneDelay,480) //60fps change: once, when the count reaches it
    {
      msgCreate("Rude much?",0,oMessagePerson,global.mainCharacters[1],0,4,8)
      newMessage.fadingTime=80
    }
    //else if sceneDelay=680
    else if scrCountPass(sceneDelay,680) //60fps change: once, when the count reaches it
    {
      yoshiGroup1[8].sprite_index=sYoshiGreenStand
      yoshiGroup1[8].image_speed=0
      yoshiGroup1[8].image_index=0
      //yoshiGroup1[8].hspeed=0
      yoshiGroup1[8]._hspeed=0 //60fps change: _hspeed (see correctHSpeedVSpeed in oEvCreditCharacter)
    }
    //else if sceneDelay=770
    else if scrCountPass(sceneDelay,770) //60fps change: once, when the count reaches it
      yoshiGroup1[8].sprite_index=sYoshiGreenLookBack
    //else if sceneDelay=775
    else if scrCountPass(sceneDelay,775) //60fps change: once, when the count reaches it
      yoshiGroup1[8].image_index=1
    //else if sceneDelay=780
    else if scrCountPass(sceneDelay,780) //60fps change: once, when the count reaches it
      yoshiGroup1[8].image_index=2
    //else if sceneDelay=820
    else if scrCountPass(sceneDelay,820) //60fps change: once, when the count reaches it
    {
      createCrdObject("goonieGroup1",-32,64,sGoonie,0.33,1.6,-0.25)
      createCrdObject("goonieGroup1",-96,112,sGoonie,0.34,1.2,0.1)
    }
    //else if sceneDelay=800
    else if scrCountPass(sceneDelay,800) //60fps change: once, when the count reaches it
    {
      msgCreate("Birds and yoshis, we get it.",0,oMessagePerson,global.mainCharacters[1],0,8,16)
      newMessage.fadingTime=90
    }
    //else if sceneDelay=900
    else if scrCountPass(sceneDelay,900) //60fps change: once, when the count reaches it
    {
      msgCreate("It's not THAT bad.",0,oMessagePerson,global.mainCharacters[0],0,8,16)
      newMessage.fadingTime=90
    }
    //else if sceneDelay=910
    else if scrCountPass(sceneDelay,910) //60fps change: once, when the count reaches it
      yoshiGroup1[8].image_index=1
    //else if sceneDelay=914
    else if scrCountPass(sceneDelay,914) //60fps change: once, when the count reaches it
      yoshiGroup1[8].image_index=0
    //else if sceneDelay=918
    else if scrCountPass(sceneDelay,918) //60fps change: once, when the count reaches it
      yoshiGroup1[8].sprite_index=sYoshiGreenHide
    //else if sceneDelay=980
    else if scrCountPass(sceneDelay,980) //60fps change: once, when the count reaches it
      createCrdObject("goombaWalk",-32,320,sGoomba,0.3,1,0)
    //else if sceneDelay=1140
    else if scrCountPass(sceneDelay,1140) //60fps change: once, when the count reaches it
    {
      createCrdObject("goonieGroup1",-32,80,sGoonie,0.33,1.2,-0.25)
      createCrdObject("goonieGroup1",-96,160,sGoonie,0.34,1.5,0.1)
    }
    //else if sceneDelay=1240
    else if scrCountPass(sceneDelay,1240) //60fps change: once, when the count reaches it
      yoshiGroup1[8].sprite_index=sYoshiGreenStand
    //else if sceneDelay=1260
    else if scrCountPass(sceneDelay,1260) //60fps change: once, when the count reaches it
    {
      yoshiGroup1[8].sprite_index=sYoshiGreenWalk
      yoshiGroup1[8].image_speed=0.23
      //yoshiGroup1[8].hspeed=1
      yoshiGroup1[8]._hspeed=1 //60fps change: _hspeed (see correctHSpeedVSpeed in oEvCreditCharacter)
    }
    //else if sceneDelay=1306
    else if scrCountPass(sceneDelay,1306) //60fps change: once, when the count reaches it
    {
      yoshiGroup1[8].sprite_index=sYoshiGreenStand
      yoshiGroup1[8].image_speed=0
      yoshiGroup1[8].image_index=0
      //yoshiGroup1[8].hspeed=0
      yoshiGroup1[8]._hspeed=0 //60fps change: _hspeed (see correctHSpeedVSpeed in oEvCreditCharacter)
    }
    //else if sceneDelay=1360
    else if scrCountPass(sceneDelay,1360) //60fps change: once, when the count reaches it
      yoshiGroup1[8].sprite_index=sYoshiGreenEat
    //else if sceneDelay=1370
    else if scrCountPass(sceneDelay,1370) //60fps change: once, when the count reaches it
      yoshiGroup1[8].sprite_index=sYoshiGreenStand
    //else if sceneDelay=1410
    else if scrCountPass(sceneDelay,1410) //60fps change: once, when the count reaches it
    {
      yoshiGroup1[8].sprite_index=sYoshiGreenStomp
      yoshiGroup1[8].image_speed=0.23
    }
    //else if sceneDelay=1520
    else if scrCountPass(sceneDelay,1520) //60fps change: once, when the count reaches it
    {
      yoshiGroup1[8].sprite_index=sYoshiGreenWalk
      yoshiGroup1[8].image_speed=0.23
      //yoshiGroup1[8].hspeed=1
      yoshiGroup1[8]._hspeed=1 //60fps change: _hspeed (see correctHSpeedVSpeed in oEvCreditCharacter)
    }
    //else if sceneDelay=1810
    else if scrCountPass(sceneDelay,1810) //60fps change: once, when the count reaches it
      createCrdObject("omegaMetroidWalk",-64,320,sOmegaMetroidWalk,0.2,1.5,0)
    //else if sceneDelay=1850
    else if scrCountPass(sceneDelay,1850) //60fps change: once, when the count reaches it
    {
      msgCreate("Rawr, I'm a big creature#walking through boring credits.",0,oMessagePerson,global.mainCharacters[1],0,8,16)
      newMessage.fadingTime=120
    }
    //else if sceneDelay=1980
    else if scrCountPass(sceneDelay,1980) //60fps change: once, when the count reaches it
    {
      msgCreate("I can tell you're having a great time.",0,oMessagePerson,global.mainCharacters[0],0,8,16)
      newMessage.fadingTime=100
    }
    //else if sceneDelay=2300
    else if scrCountPass(sceneDelay,2300) //60fps change: once, when the count reaches it
    {
      yoshiLeft=instance_create(-32,320,oEvCreditCharacter)
      yoshiLeft.sprite_index=sYoshiRedWalk
      yoshiLeft.image_speed=0.23
      //yoshiLeft.hspeed=1
      yoshiLeft._hspeed=1 //60fps change: _hspeed (see correctHSpeedVSpeed in oEvCreditCharacter)

      yoshiRight=instance_create(viewX+32,320,oEvCreditCharacter)
      yoshiRight.sprite_index=sYoshiGreenWalk
      yoshiRight.image_speed=0.23
      //yoshiRight.hspeed=-1
      yoshiRight._hspeed=-1 //60fps change: _hspeed (see correctHSpeedVSpeed in oEvCreditCharacter)
      yoshiRight.image_xscale=-1
    }
    //else if sceneDelay=2410
    else if scrCountPass(sceneDelay,2410) //60fps change: once, when the count reaches it
    {
      yoshiLeft.sprite_index=sYoshiRedStand
      yoshiLeft.image_speed=0
      //yoshiLeft.hspeed=0
      yoshiLeft._hspeed=0 //60fps change: _hspeed (see correctHSpeedVSpeed in oEvCreditCharacter)
      yoshiRight.sprite_index=sYoshiGreenStand
      yoshiRight.image_speed=0
      //yoshiRight.hspeed=0
      yoshiRight._hspeed=0 //60fps change: _hspeed (see correctHSpeedVSpeed in oEvCreditCharacter)
    }
    //else if sceneDelay=2500
    else if scrCountPass(sceneDelay,2500) //60fps change: once, when the count reaches it
    {
      msgCreate("And it's a stand off,#which one will get bored first?",0,oMessagePerson,global.mainCharacters[1],0,8,16)
      newMessage.fadingTime=120
    }
    //else if sceneDelay=2600
    else if scrCountPass(sceneDelay,2600) //60fps change: once, when the count reaches it
    {
      createCrdObject("balboaMove",-64,320,sBalboa,0.3,3,0)
      balboaMove=instance_create(viewX+64,320,oEvCreditCharacter)
      balboaMove.sprite_index=sBalboa
      balboaMove.image_speed=0.3
      //balboaMove.hspeed=-3
      balboaMove._hspeed=-3 //60fps change: _hspeed (see correctHSpeedVSpeed in oEvCreditCharacter)
      balboaMove.image_xscale=-1
    }
    //else if sceneDelay=2700
    else if scrCountPass(sceneDelay,2700) //60fps change: once, when the count reaches it
    {
      balboaMove=instance_create(viewX+64,320,oEvCreditCharacter)
      balboaMove.sprite_index=sBalboa
      balboaMove.image_speed=0.3
      //balboaMove.hspeed=-3
      balboaMove._hspeed=-3 //60fps change: _hspeed (see correctHSpeedVSpeed in oEvCreditCharacter)
      balboaMove.image_xscale=-1
      createCrdObject("balboaMove",-64,320,sBalboa,0.3,3,0)
    }
    //else if sceneDelay=2800
    else if scrCountPass(sceneDelay,2800) //60fps change: once, when the count reaches it
    {
      createCrdObject("balboaMove",-64,320,sBalboa,0.3,3,0)
      balboaMove=instance_create(viewX+64,320,oEvCreditCharacter)
      balboaMove.sprite_index=sBalboa
      balboaMove.image_speed=0.3
      //balboaMove.hspeed=-3
      balboaMove._hspeed=-3 //60fps change: _hspeed (see correctHSpeedVSpeed in oEvCreditCharacter)
      balboaMove.image_xscale=-1
    }
    //else if sceneDelay=2810
    else if scrCountPass(sceneDelay,2810) //60fps change: once, when the count reaches it
    {
      msgCreate("Is anything else going to happen?",0,oMessagePerson,global.mainCharacters[1],0,8,16)
      newMessage.fadingTime=100
    }
    //else if sceneDelay=2900
    else if scrCountPass(sceneDelay,2900) //60fps change: once, when the count reaches it
    {
      balboaMove=instance_create(viewX+64,320,oEvCreditCharacter)
      balboaMove.sprite_index=sBalboa
      balboaMove.image_speed=0.3
      //balboaMove.hspeed=-3
      balboaMove._hspeed=-3 //60fps change: _hspeed (see correctHSpeedVSpeed in oEvCreditCharacter)
      balboaMove.image_xscale=-1
      createCrdObject("balboaMove",-64,320,sBalboa,0.3,3,0)
    }
    //else if sceneDelay=2920
    else if scrCountPass(sceneDelay,2920) //60fps change: once, when the count reaches it
    {
      msgCreate("You just like to complain.",0,oMessagePerson,global.mainCharacters[0],0,8,16)
      newMessage.fadingTime=90
    }
    //else if sceneDelay=3000
    else if scrCountPass(sceneDelay,3000) //60fps change: once, when the count reaches it
    {
      createCrdObject("balboaMove",-64,320,sBalboa,0.3,3,0)
      balboaMove=instance_create(viewX+64,320,oEvCreditCharacter)
      balboaMove.sprite_index=sBalboa
      balboaMove.image_speed=0.3
      //balboaMove.hspeed=-3
      balboaMove._hspeed=-3 //60fps change: _hspeed (see correctHSpeedVSpeed in oEvCreditCharacter)
      balboaMove.image_xscale=-1
    }
    //else if sceneDelay=3020
    else if scrCountPass(sceneDelay,3020) //60fps change: once, when the count reaches it
    {
      msgCreate("Yeah, and I'm bored.",0,oMessagePerson,global.mainCharacters[1],0,8,16)
      newMessage.fadingTime=90
    }
    //else if sceneDelay=3140
    else if scrCountPass(sceneDelay,3140) //60fps change: once, when the count reaches it
    {
      yoshiLeft.sprite_index=sYoshiRedWalk
      yoshiLeft.image_speed=0.23
      //yoshiLeft.hspeed=1
      yoshiLeft._hspeed=1 //60fps change: _hspeed (see correctHSpeedVSpeed in oEvCreditCharacter)
      yoshiRight.sprite_index=sYoshiGreenWalk
      yoshiRight.image_speed=0.23
      //yoshiRight.hspeed=-1
      yoshiRight._hspeed=-1 //60fps change: _hspeed (see correctHSpeedVSpeed in oEvCreditCharacter)
    }
    //else if sceneDelay=3180
    else if scrCountPass(sceneDelay,3180) //60fps change: once, when the count reaches it
    {
      yoshiRight.sprite_index=sYoshiGreenStand
      yoshiRight.image_speed=0
      //yoshiRight.hspeed=0
      yoshiRight._hspeed=0 //60fps change: _hspeed (see correctHSpeedVSpeed in oEvCreditCharacter)
    }
    //else if sceneDelay=3200
    else if scrCountPass(sceneDelay,3200) //60fps change: once, when the count reaches it
    {
      msgCreate("Oh look, it stopped!",0,oMessagePerson,global.mainCharacters[1],0,8,16)
      newMessage.fadingTime=80
    }
    //else if sceneDelay=3210
    else if scrCountPass(sceneDelay,3210) //60fps change: once, when the count reaches it
      yoshiRight.sprite_index=sYoshiGreenLookBack
    //else if sceneDelay=3214
    else if scrCountPass(sceneDelay,3214) //60fps change: once, when the count reaches it
      yoshiRight.image_index=1
    //else if sceneDelay=3218
    else if scrCountPass(sceneDelay,3218) //60fps change: once, when the count reaches it
      yoshiRight.image_index=2
    //else if sceneDelay=3280
    else if scrCountPass(sceneDelay,3280) //60fps change: once, when the count reaches it
    {
      yoshiRight.sprite_index=sYoshiGreenWalk
      yoshiRight.image_speed=0.23
      yoshiRight.image_xscale=1
      //yoshiRight.hspeed=1
      yoshiRight._hspeed=1 //60fps change: _hspeed (see correctHSpeedVSpeed in oEvCreditCharacter)
    }
    //else if sceneDelay=3390
    else if scrCountPass(sceneDelay,3390) //60fps change: once, when the count reaches it
    {
      yoshiRight.sprite_index=sYoshiGreenStand
      yoshiRight.image_speed=0
      yoshiRight.image_index=0
      //yoshiRight.hspeed=0
      yoshiRight._hspeed=0 //60fps change: _hspeed (see correctHSpeedVSpeed in oEvCreditCharacter)
    }
    //else if sceneDelay=3440
    else if scrCountPass(sceneDelay,3440) //60fps change: once, when the count reaches it
      yoshiRight.sprite_index=sYoshiGreenEat
    //else if sceneDelay=3450
    else if scrCountPass(sceneDelay,3450) //60fps change: once, when the count reaches it
      yoshiRight.sprite_index=sYoshiGreenStand
    //else if sceneDelay=3500
    else if scrCountPass(sceneDelay,3500) //60fps change: once, when the count reaches it
    {
      msgCreate("Did... did he just eat#that other yoshi?",0,oMessagePerson,global.mainCharacters[1],0,8,16)
      newMessage.fadingTime=120
    }
    //else if sceneDelay=3550
    else if scrCountPass(sceneDelay,3550) //60fps change: once, when the count reaches it
    {
      yoshiRight.sprite_index=sYoshiGreenWalk
      yoshiRight.image_speed=0.23
      //yoshiRight.hspeed=1
      yoshiRight._hspeed=1 //60fps change: _hspeed (see correctHSpeedVSpeed in oEvCreditCharacter)
    }
    //else if sceneDelay=3650
    else if scrCountPass(sceneDelay,3650) //60fps change: once, when the count reaches it
    {
      with yoshiRight
        instance_destroy()
    }
    //else if sceneDelay>=3700 and sceneDelay<=3799
    else if sceneDelay>3699 and sceneDelay<=3799 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
      //screenFadeAlpha+=0.01
      screenFadeAlpha+=0.01*gDeltaTime //60fps change: per 30fps tick
    //else if sceneDelay=3900
    else if scrCountPass(sceneDelay,3900) //60fps change: once, when the count reaches it
    {
      cSideAlpha=0
      kkSlider=instance_create(256,320,oEvCreditCharacter)
      kkSlider.sprite_index=sKKSlider
      kkSlider.image_speed=0.24
      kkSlider.image_xscale=0.6
      kkSlider.image_yscale=0.6
      michealJ=instance_create(192,320,oEvCreditCharacter)
      michealJ.sprite_index=sMJDance
      michealJ.image_speed=0.2
      kirbyDance=instance_create(320,320,oEvCreditCharacter)
      kirbyDance.sprite_index=sKirbyDance
      kirbyDance.image_speed=0.45
      joeHeroLeft=instance_create(128,320,oEvCreditCharacter)
      joeHeroLeft.sprite_index=sJoeHeroDance
      joeHeroLeft.image_speed=0.27
      joeHeroLeft.image_xscale=-1
      joeHeroRight=instance_create(384,320,oEvCreditCharacter)
      joeHeroRight.sprite_index=sJoeHeroDance
      joeHeroRight.image_speed=0.27
    }
    //else if sceneDelay>=4000 and sceneDelay<=4099
    else if sceneDelay>3999 and sceneDelay<=4099 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
      //screenFadeAlpha-=0.01
      screenFadeAlpha-=0.01*gDeltaTime //60fps change: per 30fps tick
    //else if sceneDelay=4120
    else if scrCountPass(sceneDelay,4120) //60fps change: once, when the count reaches it
    {
      msgCreate("There you go, STUFF!",0,oMessagePerson,global.mainCharacters[0],0,8,16)
      newMessage.fadingTime=80
    }
    //else if sceneDelay=4220
    else if scrCountPass(sceneDelay,4220) //60fps change: once, when the count reaches it
    {
      msgCreate("Meh...",0,oMessagePerson,global.mainCharacters[1],0,8,16)
      newMessage.fadingTime=70
    }
    //else if sceneDelay=4300
    else if scrCountPass(sceneDelay,4300) //60fps change: once, when the count reaches it
    {
      msgCreate("...I guess you're right...#aside from the dog.",0,oMessagePerson,global.mainCharacters[0],0,8,16)
      newMessage.fadingTime=100
    }
    //else if sceneDelay=4410
    else if scrCountPass(sceneDelay,4410) //60fps change: once, when the count reaches it
    {
      msgCreate("Hold up, 'the dog'?#He's not just some dog!#He's THE...",0,oMessagePerson,global.mainCharacters[1],0,8,16)
      newMessage.fadingTime=90
    }
    //else if sceneDelay=4500
    else if scrCountPass(sceneDelay,4500) //60fps change: once, when the count reaches it
    {
      msgCreate("Yep, I get it.",0,oMessagePerson,global.mainCharacters[0],0,8,16)
      newMessage.fadingTime=90
    }
    //else if sceneDelay=5300
    else if scrCountPass(sceneDelay,5300) //60fps change: once, when the count reaches it
    {
      msgCreate("Siiiiiiiiiiiiiigh.#They're still playing out.",0,oMessagePerson,global.mainCharacters[1],0,8,16)
      newMessage.fadingTime=100
    }
    //else if sceneDelay=5400
    else if scrCountPass(sceneDelay,5400) //60fps change: once, when the count reaches it
    {
      msgCreate("When is this going to end?",0,oMessagePerson,global.mainCharacters[1],0,8,16)
      newMessage.fadingTime=80
    }
    //else if sceneDelay=5490
    else if scrCountPass(sceneDelay,5490) //60fps change: once, when the count reaches it
    {
      msgCreate("Shhh.",0,oMessagePerson,global.mainCharacters[0],0,8,16)
      newMessage.fadingTime=50
    }
    //else if sceneDelay>=6550 and sceneDelay<=6649
    else if sceneDelay>6549 and sceneDelay<=6649 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
      //screenFadeAlpha+=0.01
      screenFadeAlpha+=0.01*gDeltaTime //60fps change: per 30fps tick
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//credits back
draw_set_alpha(cSideAlpha)
draw_set_color(c_black)
draw_rectangle(view_xview[0]+224,0,view_xview[0]+224+view_wview[0],384,0)

if screenFadeAlpha>0 //screen fade
{
  draw_set_alpha(screenFadeAlpha)
  draw_set_color(screenFadeColor)
  draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false)
}

draw_set_alpha(1)
draw_set_color(c_white)
draw_set_font(fnt_EnemyScan)
draw_set_halign(fa_center)
if showRank>=1
  draw_text(256,24,"Game Ranking")
draw_set_halign(fa_left)
if showRank>=2
{
  draw_text(112,48,"Awesome Points")
  draw_text(304,48,rankAwesome)
}
if showRank>=3
{
  draw_text(112,64,"Kills")
  draw_text(304,64,rankKills)
}
if showRank>=4
{
  draw_text(112,80,"Item %")
  draw_text(304,80,rankItems)
}
if showRank>=5
{
  draw_text(112,96,"Total Damage Dealt")
  draw_text(304,96,rankDamageDealt)
}
if showRank>=6
{
  draw_text(112,112,"Best Hit Combo")
  draw_text(304,112,rankCombo)
}
if showRank>=7
{
  draw_text(112,128,"Best Kill Chain")
  draw_text(304,128,rankChain)
}
if showRank>=8
{
  draw_text(112,144,"Best Killing Spree")
  draw_text(304,144,rankSpree)
}
if showRank>=9
{
  draw_text(112,160,"Game Time")
  draw_text(304,160,rankTime)
}
if showRank>=10
{
  draw_text(112,176,"Deaths")
  draw_text(304,176,rankDeaths)
}
if showRank>=11
{
  draw_text(112,192,"Total Damage Taken")
  draw_text(304,192,rankDamageTaken)
}
if showRank>=12
{
  draw_text(112,208,"Took Damage")
  draw_text(304,208,rankTakenDamage)
}
if showRank>=13
{
  draw_text(112,224,"Items Used")
  draw_text(304,224,rankUsed)
}
if showRank>=14
{
  draw_text(112,240,"Rave Mode Used")
  draw_text(304,240,rankRave)
}
if showRank>=15
{
  draw_text(112,288,"You favored")
  draw_text(304,288,rankFavored)
}
draw_set_halign(fa_center)
if showRank>=16
  draw_text(256,304,"Your overall game ranking")
if showRank>=17
  draw_text(256,320,finalRank)
if showRank>=18
  //draw_text(256,352,"Press [J] to continue.")
  scrDrawHint(256,352,"Press [J] to continue.",fa_center,1) //pad hints change: the gamepad's button while it's in use
