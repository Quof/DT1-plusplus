/*
This script is used when a character takes damage.
bPlayable is used to tell whether the character is your character or an enemy.
*/
if bCanTakeDamage=true
{
  var totalDamage,initialDamage;
  totalDamage=0
  if bPlayable=false
  {
    //show enemy health
    if parent="enemy" and global.optEnemyHP=true and bIsBoss=false
    {
      with oEnemyLifeDisplay
        instance_destroy()
      eLifeDisplay=instance_create(0,0,oEnemyLifeDisplay)
      eLifeDisplay.eID=id
    }
    //This is used to find weaknesses and resistances with enemies. ----------
    if other.damageType="PHYSICAL"
    {
      //effect_create_above(ef_ring,x,y,0,c_white)
      global.recPhysicalHitsConnected+=1
      var tempPDefense,beadPower;
      beadPower=0
      if global.invBracelet[0]>=2
        beadPower+=20
      if global.invBracelet[4]>=2
        beadPower+=10
      tempPDefense=physicalDefense //set base defense
      if statusCripple>0
        tempPDefense=tempPDefense-(round(tempPDefense/2.5)) //set base defense after cripple
      if oPlayer1.bRaveActive=false
        initialDamage=other.physicalPower+beadPower+oPlayer1.airDashDamage+round(oPlayer1.hitCombo/3)-tempPDefense //find initial damage
      else
        initialDamage=((other.physicalPower+beadPower+oPlayer1.airDashDamage+round(oPlayer1.hitCombo/3))*3.5)-tempPDefense //find initial damage
      totalDamage+=initialDamage
      var finisherDamage;
      totalDamage+=other.jumpSlashPower //apply jump power
      finisherDamage=0
      if oPlayer1.currentAttackCombo=3
      {
        finisherDamage=other.physicalPower*0.5
      }
      totalDamage+=finisherDamage //apply 3rd hit power
      if global.SkSharpen>0
      {
        var sharpenDamage;
        sharpenDamage=global.SkSharpen*3
        totalDamage*=(sharpenDamage/100)+1
      }
    }
    else if other.damageType="SPIRIT"
    {
      global.recSpellsConnected+=1
      var tempSDefense,beadPower;
      beadPower=0
      if global.invBracelet[2]>=2
        beadPower+=20
      if global.invBracelet[4]>=2
        beadPower+=10
      tempSDefense=spiritDefense //set base defense
      if statusCripple>0
        tempSDefense=tempSDefense-(round(tempSDefense/2.5)) //set base defense after cripple
      if oPlayer1.bRaveActive=false
        initialDamage=((other.spiritPower+beadPower)*1.2)+other.skillPower-tempSDefense //find initial damage
      else
        initialDamage=(((other.spiritPower+beadPower)*1.2)*3.5)+other.skillPower-tempSDefense //find initial damage
      totalDamage+=initialDamage
    }
    else if other.damageType="SKILL"
    {
      global.recTechsConnected+=1
      var tempPDefense,beadPower;
      beadPower=0
      if global.invBracelet[0]>=2
        beadPower+=20
      if global.invBracelet[4]>=2
        beadPower+=10
      tempPDefense=physicalDefense //set base defense
      if statusCripple>0
        tempPDefense=tempPDefense-(round(tempPDefense/2.5)) //set base defense after cripple
      if oPlayer1.bRaveActive=false
        initialDamage=((other.physicalPower+beadPower)*1.1)+other.skillPower-tempPDefense //find initial damage
      else
        initialDamage=(((other.physicalPower+beadPower)*1.1)*3.5)+other.skillPower-tempPDefense //find initial damage
      totalDamage=initialDamage
      if global.SkPrecision>0
      {
        var precisionDamage;
        precisionDamage=global.SkPrecision*3
        totalDamage*=(precisionDamage/100)+1
      }
      totalDamage*=(-skillResist/100)+1
    }
    if other.elementType!=0 //elemental damage
    {
      var elementDamage;
      elementDamage=0
      if other.elementType=1
        elementDamage-=FIREresist
      if other.elementType=2
        elementDamage-=WATERresist
      if other.elementType=3
        elementDamage-=WINDresist
      if other.elementType=4
        elementDamage-=EARTHresist
      totalDamage*=(elementDamage/100)+1
    }
  }
  else //---------- player takes damage ----------
  {
    //life bar drop
    oHUD.oldTrack=lifePercent*100
    oHUD.dropAngle=0
    oHUD.dropAlphaTime=25
    oHUD.dropAlpha=1
    oHUD.yDrop=0
    oHUD.yDropSpeed=-2
    oHUD.bShowLifeDrop=true
    global.killingSpree=0
    global.killSpreeSoundCheck=0
    if other.damageType="PHYSICAL"
    {
      var beadPower;
      beadPower=0
      if global.invBracelet[1]>=2
        beadPower+=20
      if global.invBracelet[4]>=2
        beadPower+=10
      initialDamage=other.physicalPower-(physicalDefense+beadPower) //find initial damage
      totalDamage+=initialDamage
      if global.SkIronBody>0
      {
        var ironBodyDmgReduction;
        ironBodyDmgReduction=global.SkIronBody*3
        totalDamage/=(ironBodyDmgReduction/100)+1
      }
      if instance_exists(oWaterBarrier)
        totalDamage/=1.1
      if oPlayer1.bInsideSoothingSpring=1
      {
        totalDamage/=1.1
      }
    }
    else if other.damageType="SPIRIT"
    {
      var beadPower;
      beadPower=0
      if global.invBracelet[3]>=2
        beadPower+=20
      if global.invBracelet[4]>=2
        beadPower+=10
      initialDamage=other.spiritPower-(spiritDefense+beadPower) //find initial damage
      totalDamage+=initialDamage
      if global.SkFreeSpirit>0
      {
        var ironBodyDmgReduction;
        ironBodyDmgReduction=global.SkFreeSpirit*3
        totalDamage/=(ironBodyDmgReduction/100)+1
      }
    }
    if other.elementType!=0 //elemental damage
    {
      var elementDamage,beadPower;
      elementDamage=0
      beadPower=0
      if other.elementType=1
      {
        if global.invBracelet[5]>=2
          beadPower+=20
        if global.invBracelet[9]>=2
          beadPower+=10
        elementDamage-=global.p1FIREresist+beadPower
        if global.p1CurrentElement=1
          elementDamage-=10
      }
      if other.elementType=2
      {
        if global.invBracelet[6]>=2
          beadPower+=20
        if global.invBracelet[9]>=2
          beadPower+=10
        elementDamage-=global.p1WATERresist+beadPower
        if global.p1CurrentElement=2
          elementDamage-=10
      }
      if other.elementType=3
      {
        if global.invBracelet[7]>=2
          beadPower+=20
        if global.invBracelet[9]>=2
          beadPower+=10
        elementDamage-=global.p1WINDresist+beadPower
        if global.p1CurrentElement=3
          elementDamage-=10
      }
      if other.elementType=4
      {
        if global.invBracelet[8]>=2
          beadPower+=20
        if global.invBracelet[9]>=2
          beadPower+=10
        elementDamage-=global.p1EARTHresist+beadPower
        if global.p1CurrentElement=4
          elementDamage-=10
      }
      totalDamage*=(elementDamage/100)+1
    }
    //set damage state
    bTakingDamage=true
    damageTime=flashTime
    bCanTakeHit=false
    tookHitAmount+=1
    idleTime=0
    if attackState!=ACT_MORPHBALL
      attackState=0 //set character's attack state to none
    //setCollisionBounds(-8,-44,8,-1)
    if other.bCauseKnockback=true //knockback
    {
      //stopPlayer()
      oPlayer1.xVel=0
      oPlayer1.yVel=0
      oPlayer1.kLeft=0
      oPlayer1.kRight=0
      oPlayer1.kUp=0
      oPlayer1.kDown=0
      if image_xscale=1
        xVel=-2
      else
        xVel=2
      y-=2
      yVel=-4
    }
    //damage sound
    playSound(global.snd_PlayerDamaged[0],0,1)
  }
  
  //set totalDamage to minimum if it goes below it ====================
  if bPlayable=false //damage enemy
  {
    if totalDamage<0 //ensures damage doesn't go below 0
      totalDamage=0
    //stun enemy
    if totalDamage>0 //vamp bead
    {
      if global.invBracelet[10]>=2 and totalDamage>=40
      {
        var tLifeGain;
        tLifeGain=floor(totalDamage/40)
        oPlayer1.life+=tLifeGain
      }
      if oPlayer1.currentAttackCombo=3
      {
        if global.invBracelet[17]>=2
        {
          newDamage=instance_create(x,y-sprite_height,oStatusAlert);
          newDamage.statusEffect="Poison"
          newDamage.statusColor=c_white
          statusPoison=300
        }
      }
      //set damage state and stun time
      bTakingDamage=true
      damageTime=flashTime
      image_blend=c_red
      var extraStunTime,beadStun;
      beadStun=0
      if global.invBracelet[16]>=2
        beadStun=2
      extraStunTime=totalDamage/maxLife
      if bIsBoss=false
      {
        if extraStunTime>0.8
          stunnedTime=12
        else if extraStunTime>=0.6 and extraStunTime<=0.79
          stunnedTime=11
        else if extraStunTime>=0.4 and extraStunTime<=0.59
          stunnedTime=10
        else if extraStunTime>=0.2 and extraStunTime<=0.39
          stunnedTime=9
        else if extraStunTime>=0.1 and extraStunTime<=0.19
          stunnedTime=8
        else
          stunnedTime=7
        stunnedTime+=beadStun
      }
      else
      {
        if extraStunTime>0.08
          stunnedTime=11
        else if extraStunTime>=0.06 and extraStunTime<=0.079
          stunnedTime=10
        else if extraStunTime>=0.04 and extraStunTime<=0.059
          stunnedTime=9
        else if extraStunTime>=0.02 and extraStunTime<=0.029
          stunnedTime=8
        else if extraStunTime>=0.01 and extraStunTime<=0.019
          stunnedTime=7
        else
          stunnedTime=6
        stunnedTime+=beadStun
      }
      if SS_IsHandleValid(hitSound)
        playSound(hitSound,0,1,oPlayer1.hitCombo*2)

      if parent="enemy"
      {
        if global.recWeakestHit>totalDamage and totalDamage!=0
          global.recWeakestHit=totalDamage
        if global.recWeakestHit=0
          global.recWeakestHit=totalDamage
        if oPlayer1.bRaveActive=false
        {
          if totalDamage>global.recStrongestHitNoRave and other.currentSpell!="FIELD BLAST" and other.currentSpell!="NPC"
            global.recStrongestHitNoRave=totalDamage
        }
        else
        {
          if totalDamage>global.recStrongestHitInRave and other.currentSpell!="FIELD BLAST" and other.currentSpell!="NPC"
            global.recStrongestHitInRave=totalDamage
        }
        //reinable air dash
        oPlayer1.canAirDash=1
        global.recDamageDealt+=totalDamage
        //add 1 to hit combo
        oPlayer1.hitCombo+=1
        oPlayer1.hitFontEffect=2
        if oPlayer1.dashPoints<oPlayer1.maxDashPoints //dash recovery
        {
          var dashCheck;
          if global.SkDashPower=0
            dashCheck=15
          if global.SkDashPower=1
            dashCheck=20
          oPlayer1.dashRecoveryTime+=1+(oPlayer1.airDashDamage/dashCheck)
        }
        if oPlayer1.hitCombo>global.recMaxHitCombo //check max combo
          global.recMaxHitCombo=oPlayer1.hitCombo
        var beadRave,beadSpirit;
        beadRave=0
        beadSpirit=0
        if global.invBracelet[14]>=2
          beadRave=15
        global.p1RaveEnergy+=(stunnedTime*2)+oPlayer1.hitCombo+beadRave
        oHUD.hitComboAlpha=1
        if global.SkExpertise=0
          oHUD.hitComboFadeTime=75
        else
          oHUD.hitComboFadeTime=85
        if global.invBracelet[11]>=2
          beadSpirit=2
        //recharge spirit/element energy
        if oPlayer1.spiritEnergy<oPlayer1.maxSpiritEnergy
          oPlayer1.spiritEnergy+=5*((global.SkFaith*0.75)+1)+beadSpirit
        if oPlayer1.fireEnergy<oPlayer1.maxFireEnergy
          oPlayer1.fireEnergy+=5*((global.SkFaith*0.5)+1)
        if oPlayer1.waterEnergy<oPlayer1.maxWaterEnergy
          oPlayer1.waterEnergy+=5*((global.SkFaith*0.5)+1)
        if oPlayer1.windEnergy<oPlayer1.maxWindEnergy
          oPlayer1.windEnergy+=5*((global.SkFaith*0.5)+1)
        if oPlayer1.earthEnergy<oPlayer1.maxEarthEnergy
          oPlayer1.earthEnergy+=5*(global.SkFaith+1)

        if other.damageType="PHYSICAL" //bounce
        {
          if global.p1CurrentElement=1
          {
            if FIREresist<0
            {
              if oPlayer1.fireEnergy<oPlayer1.maxFireEnergy
                oPlayer1.fireEnergy+=10
            }
            else if WATERresist<0
            {
              if oPlayer1.waterEnergy<oPlayer1.maxFireEnergy
                oPlayer1.waterEnergy+=10
            }
            else if WINDresist<0
            {
              if oPlayer1.windEnergy<oPlayer1.maxWindEnergy
                oPlayer1.windEnergy+=10
            }
            else if EARTHresist<0
            {
              if oPlayer1.earthEnergy<oPlayer1.maxEarthEnergy
                oPlayer1.earthEnergy+=10
            }
          }

          if other.attackType!=other.BUSTER and other.currentSpell!="NPC"
          {
            if oPlayer1.yVel>0
            {
              effect=instance_create(oPlayer1.x,oPlayer1.y,oEffect)
              effect.sprite_index=sSpellCast
              effect.image_xscale=0.75
              effect.image_yscale=0.75
              if other.attackType=other.PART_UP_SLASH
                oPlayer1.yVel=-3
              else
                oPlayer1.yVel=-3.1
              oPlayer1.yAcc=-3
            }
          }
        }
      }
    }
    else
    {
      bTakingDamage=true
      damageTime=flashTime
      if SS_IsHandleValid(hitSound)
        playSound(hitSound,0,1,22050)
    }
  }
  else
  {
    if global.invBracelet[15]>=2 //subtract damage from traps from trap bead
    {
      if other.parent="trap"
      {
        totalDamage-=round(totalDamage/4)
      }
    }
    if totalDamage<1 //ensures character takes minimum damage
    {
      totalDamage=1
    }
    global.recDamageTaken+=totalDamage
    global.recTakenDamageNumber+=1
    if global.invBracelet[13]>=2 and other.parent="enemy"
    {
      other.life-=totalDamage
      if other.life<1 {other.life=1}
      global.recDamageDealt+=totalDamage //add to total damage
      //show enemy health
      if global.optEnemyHP=true and other.bIsBoss=false
      {
        with oEnemyLifeDisplay {instance_destroy()}
        eLifeDisplay=instance_create(0,0,oEnemyLifeDisplay)
        eLifeDisplay.eID=other.id
      }
      if global.optShowDamage=true //show damage dealt on screen
      {
        if other.bShowDamage=true
        {
          newDamage=instance_create(other.x,other.y-(other.sprite_height/2+(other.sprite_height/4)),oDamageNotice);
          newDamage.damageValue=totalDamage
          if other.bPlayable=false
            newDamage.damageColor=c_white
          else
            newDamage.damageColor=c_red
        }
      }
    }
  }
  if global.optShowDamage=true //show damage dealt on screen
  {
    if bShowDamage=true
    {
      newDamage=instance_create(x,y-(sprite_height/2+(sprite_height/4)),oDamageNotice);
      newDamage.damageValue=totalDamage
      if bPlayable=false
        newDamage.damageColor=c_white
      else
        newDamage.damageColor=c_red
    }
  }
  life-=round(totalDamage) //deal damage

  //if the character has 0 health ====================
  if life<=0
  {
    if bPlayable=false
    {
      //recharge spirit/element energy
      if oPlayer1.spiritEnergy<oPlayer1.maxSpiritEnergy
        oPlayer1.spiritEnergy+=10
      if oPlayer1.fireEnergy<oPlayer1.maxFireEnergy
        oPlayer1.fireEnergy+=10
      if oPlayer1.waterEnergy<oPlayer1.maxWaterEnergy
        oPlayer1.waterEnergy+=10
      if oPlayer1.windEnergy<oPlayer1.maxWindEnergy
        oPlayer1.windEnergy+=10
      if oPlayer1.earthEnergy<oPlayer1.maxEarthEnergy
        oPlayer1.earthEnergy+=10

      var goodFortuneMod,itemChance;
      if expWorth>0 //item drop skill bonus
      {
        if global.SkGoodFortune>0
          goodFortuneMod=5*global.SkGoodFortune
        else
          goodFortuneMod=0
      }
      else
        goodFortuneMod=0
      itemChance=round(random(100)) //find item drop chance
      if itemChance>=(100-baseItemChance-goodFortuneMod)
      {
        if oPlayer1.lifePercent>=1
          dropInd=1
        else
        {
          if oPlayer1.lifePercent<=0.95
            dropInd-=round((1-oPlayer1.lifePercent)*25)
        }
        itemChance=round(random(100)+dropInd)
        if itemChance<=0
          heartDrop=instance_create(x,y-(sprite_height/2),oHealthPickup)
        else
          {
            //money drop calculator ====================
            var killSpreeMoneyBonus,moneyType,moneyIcon;
            killSpreeMoneyBonus=0
            if noMoneyBonus=false
              killSpreeMoneyBonus=oPlayer1.killChain*2.5
            itemChance=round(random(99)+moneyWorth+killSpreeMoneyBonus)
            if itemChance>400
            {
              moneyType=50
              moneyIcon=4
            }
            else if itemChance>=300 and itemChance<=399
            {
              moneyType=20
              moneyIcon=3
            }
            else if itemChance>=200 and itemChance<=299
            {
              moneyType=10
              moneyIcon=2
            }
            else if itemChance>=100 and itemChance<=199
            {
              moneyType=5
              moneyIcon=1
            }
            else
            {
              moneyType=1
              moneyIcon=0
            }
            moneyDrop=instance_create(x,y-(sprite_height/2),oMoneyPickup)
            moneyDrop.moneyType=moneyType
            moneyDrop.moneyIcon=moneyIcon
          }
      }
      if SS_IsHandleValid(dieSound) //enemy death sound
        playSound(dieSound,0,1)
      if dieEffect!=0 //enemy death effect
      {
        if dieEffect=100001
        {
          effect_create_above(ef_firework,x,y-(sprite_height/2),0,make_color_rgb(random(255),random(255),random(255)))
        }
        else
        {
          effect=instance_create(x,y-(sprite_height/2),oEffect)
          effect.sprite_index=dieEffect
          effect.image_speed=effectSpeed
          effect.image_xscale=effectXscale
          effect.image_yscale=effectYscale
        }
      }
      if parent="enemy"
      {
        //increment kill chain
        oPlayer1.killChain+=1
        if oPlayer1.killChain>global.recMaxKillChain
          global.recMaxKillChain=oPlayer1.killChain
        global.p1RaveEnergy+=15*oPlayer1.killChain
        if oPlayer1.killChain>=2
        {
          var awesomeAward;
          awesomeAward=round((oPlayer1.killChain+exp(1.7))+oPlayer1.killChain)
          awesomeA=instance_create(0,0,oAwesomeAward)
          awesomeA.awesomeValue=awesomeAward
        }
        if oPlayer1.killChain>=2 and oPlayer1.killChain<=10 and global.optKillChainSound=true
          playSound(global.snd_killChain[oPlayer1.killChain-2],0,1)
        oHUD.killChainAlpha=1
        oHUD.killChainFadeTime=105
        //check killing spree
        global.killingSpree+=1
        if global.killingSpree>global.recMaxKillingSpree
          global.recMaxKillingSpree=global.killingSpree
        if global.killingSpree>=5 and global.killSpreeSoundCheck=0
        {
          if global.optKillingSpreeSound=true
            playSound(global.snd_killingSpree[global.killSpreeSoundCheck],0,1)
          if global.optKillingSpreeScreen=true
          {
            oKillSpree=instance_create(0,0,oKillingSpreeAlert)
            oKillSpree.alertType=global.killSpreeSoundCheck
          }
          global.p1RaveEnergy+=25
          global.killSpreeSoundCheck+=1
        }
        else if global.killingSpree>=10 and global.killSpreeSoundCheck=1
        {
          if global.optKillingSpreeSound=true
            playSound(global.snd_killingSpree[global.killSpreeSoundCheck],0,1)
          if global.optKillingSpreeScreen=true
          {
            oKillSpree=instance_create(0,0,oKillingSpreeAlert)
            oKillSpree.alertType=global.killSpreeSoundCheck
          }
          global.p1RaveEnergy+=50
          global.killSpreeSoundCheck+=1
        }
        else if global.killingSpree>=20 and global.killSpreeSoundCheck=2
        {
          if global.optKillingSpreeSound=true
            playSound(global.snd_killingSpree[global.killSpreeSoundCheck],0,1)
          if global.optKillingSpreeScreen=true
          {
            oKillSpree=instance_create(0,0,oKillingSpreeAlert)
            oKillSpree.alertType=global.killSpreeSoundCheck
          }
          global.p1RaveEnergy+=75
          global.killSpreeSoundCheck+=1
        }
        else if global.killingSpree>=30 and global.killSpreeSoundCheck=3
        {
          if global.optKillingSpreeSound=true
            playSound(global.snd_killingSpree[global.killSpreeSoundCheck],0,1)
          if global.optKillingSpreeScreen=true
          {
            oKillSpree=instance_create(0,0,oKillingSpreeAlert)
            oKillSpree.alertType=global.killSpreeSoundCheck
          }
          global.p1RaveEnergy+=100
          global.killSpreeSoundCheck+=1
        }
        else if global.killingSpree>=40 and global.killSpreeSoundCheck=4
        {
          if global.optKillingSpreeSound=true
            playSound(global.snd_killingSpree[global.killSpreeSoundCheck],0,1)
          if global.optKillingSpreeScreen=true
          {
            oKillSpree=instance_create(0,0,oKillingSpreeAlert)
            oKillSpree.alertType=global.killSpreeSoundCheck
          }
          global.p1RaveEnergy+=150
          global.killSpreeSoundCheck+=1
        }
        else if global.killingSpree>=50 and global.killSpreeSoundCheck=5
        {
          if global.optKillingSpreeSound=true
            playSound(global.snd_killingSpree[global.killSpreeSoundCheck],0,1)
          if global.optKillingSpreeScreen=true
          {
            oKillSpree=instance_create(0,0,oKillingSpreeAlert)
            oKillSpree.alertType=global.killSpreeSoundCheck
          }
          global.p1RaveEnergy+=200
          global.killSpreeSoundCheck+=1
        }
        else if global.killingSpree>=65 and global.killSpreeSoundCheck=6
        {
          if global.optKillingSpreeSound=true
            playSound(global.snd_killingSpree[global.killSpreeSoundCheck],0,1)
          if global.optKillingSpreeScreen=true
          {
            oKillSpree=instance_create(0,0,oKillingSpreeAlert)
            oKillSpree.alertType=global.killSpreeSoundCheck
          }
          global.p1RaveEnergy+=350
          global.killSpreeSoundCheck+=1
        }
        else if global.killingSpree>=80 and global.killSpreeSoundCheck=7
        {
          if global.optKillingSpreeSound=true
            playSound(global.snd_killingSpree[global.killSpreeSoundCheck],0,1)
          if global.optKillingSpreeScreen=true
          {
            oKillSpree=instance_create(0,0,oKillingSpreeAlert)
            oKillSpree.alertType=global.killSpreeSoundCheck
          }
          global.p1RaveEnergy+=500
          global.killSpreeSoundCheck+=1
        }
        else if global.killingSpree>=100 and global.killSpreeSoundCheck=8
        {
          if global.optKillingSpreeSound=true
            playSound(global.snd_killingSpree[global.killSpreeSoundCheck],0,1)
          if global.optKillingSpreeScreen=true
          {
            oKillSpree=instance_create(0,0,oKillingSpreeAlert)
            oKillSpree.alertType=global.killSpreeSoundCheck
          }
          global.p1RaveEnergy+=750
          global.killSpreeSoundCheck+=1
        }
        else if global.killingSpree>=150 and global.killSpreeSoundCheck=9
        {
          if global.optKillingSpreeSound=true
            playSound(global.snd_killingSpree[global.killSpreeSoundCheck],0,1)
          if global.optKillingSpreeScreen=true
          {
            oKillSpree=instance_create(0,0,oKillingSpreeAlert)
            oKillSpree.alertType=global.killSpreeSoundCheck
          }
          global.p1RaveEnergy+=1000
          global.killSpreeSoundCheck+=1
        }
        global.p1KillCount+=1
      }
      if expWorth>0 //award exp
      {
        var awesomeBoost;
        awesomeBoost=oPlayer1.awesomePoints
        if awesomeBoost>100000
          awesomeBoost=100000
        expWorth*=1+(awesomeBoost/100000)
        if global.SkStatistician>0 //exp skill bonus
        {
          var expBoost;
          expBoost=round(expWorth*(global.SkStatistician*0.05)+1)
          expWorth+=expBoost
        }
        if current_weekday=1 or current_weekday=7
          expWorth*=1.01
        else if current_weekday=2
          expWorth*=0.99
        if current_hour=4 and current_minute=4
          expWorth=0
        oPlayer1.expTotal+=round(expWorth)
        oPlayer1.expCurrent+=round(expWorth)
        if global.optShowExpEarned=true
        {
          newAward=instance_create(x,y-(sprite_height/2),oKillAward)
          newAward.expValue=expWorth
        }
      }
      if questType>0
        enemyQuest(questType)
      bCanTakeDamage=false
      bCanDealDamage=false
      dieFade=1
      if parent="breakable"
      {
        global.recObjectsBroken+=1
        instance_destroy()
      }
    }
  }
}
