/*
This script is called inside the character step event.
It is used when the player uses a technique.
argument0 is which action button was pressed
1: Physical Tech
2: Spell
*/
if argument0=1 and attackState=0
{
  if global.p1TechniqueEquip="MENTAL INSURRECTION" and spiritEnergy>=100
  {
    idleTime=0
    global.recTechsUsed+=1
    attackState=TECH_MENTAL_INSURRECTION
    playerAttack=instance_create(x,y-20,oTechClose)
    spiritEnergyCost=100
    if platformCharacterIs(IN_AIR)
    {
      yVel=-2
      yAcc=-2
      yVelSetExt=1 //60fps change (added): set speed + one-off push: a full 30fps tick's worth (see pMoveToWrapNew). Ext, not Tick: this runs after the frame's move and characterStepEvent clears the Tick flags before the next one, so the hop only got part of a tick (simulated: 3.05px high at 60fps, 2.24px at 120fps instead of 30fps's 3.95; now 3.78)
    }
    playSound(global.snd_JumpStrike,0,1)
    playSound(global.snd_BarrierDestroy,0,1)
  }
  else if global.p1TechniqueEquip="WAVE OF AWESOME" and spiritEnergy>=120
  {
    attackState=TECH_WAVE_OF_AWESOME
    playerAttack=instance_create(x,y,oTechFar)
    if kUp
    {
      playerAttack.eType=0
      playerAttack=instance_create(x,y,oTechFar)
      playerAttack.eType=1
    }
    spiritEnergyCost=120
    playerBattleCry()
  }
  else if global.p1TechniqueEquip="KUDEKU" and spiritEnergy>=140
  {
    idleTime=0
    global.recTechsUsed+=1
    attackState=TECH_KUDEKU
    playerAttack=instance_create(x,y-32,oTechClose)
    spiritEnergyCost=140
    playSound(global.snd_JumpStrike,0,1)
    playSound(global.snd_BarrierDestroy,0,1)
  }
  else if global.p1TechniqueEquip="GRAND SLAM" and spiritEnergy>=130
  {
    idleTime=0
    global.recTechsUsed+=1
    attackState=TECH_GRAND_SLAM
    jumpSlashPower=125
    spiritEnergyCost=130
    playSound(global.snd_JumpStrike,0,1)
  }
  /*
  else if global.p1TechniqueEquip="CONJURE" and spiritEnergy>=300 and !instance_exists(oSummonBlazing) and !instance_exists(oSummonMuuguru)
  {
    if global.p1CurrentElement=1 and fireEnergy>=maxFireEnergy/2
    {
      idleTime=0
      global.recTechsUsed+=1
      attackState=SUMMON
      playerAttack=instance_create(-100,-100,oSummonBlazing)
      spiritEnergyCost=300
      fireEnergy-=maxFireEnergy/2
    }
    else if global.p1CurrentElement=2 and waterEnergy>=maxWaterEnergy/2 and global.VDportals[3]>=3 and !instance_exists(oSummonBlazing) and !instance_exists(oSummonMuuguru)
    {
      idleTime=0
      global.recTechsUsed+=1
      attackState=SUMMON
      playerAttack=instance_create(-100,-100,oSummonMuuguru)
      spiritEnergyCost=300
      waterEnergy-=maxWaterEnergy/2
    }
    else
      playSound(global.snd_MenuCancel,0,1)
  }*/

  if spiritEnergyCost>0
  {
    if global.SkPerfection>0
    {
      tempCost=global.SkPerfection*5
      spiritEnergyCost/=(tempCost/100)+1
    }
    spiritEnergy-=spiritEnergyCost
    spiritEnergyCost=0
  }
}
else if argument0=2 and attackState=0
{
  spellCasting=global.p1SpellEquip
  // ============================== FIRE ==============================
  if global.p1SpellEquip="FIREBALL" and spiritEnergy>=110 and fireEnergy>=200
  {
    castingTimeTotal=1
    attackState=ACT_CASTING
    spiritEnergyCost=110
    elementEnergyCost=200
    global.castedSpell=1
  }
  else if global.p1SpellEquip="FLAME PILLAR" and spiritEnergy>=200 and fireEnergy>=230
  {
    castingTimeTotal=8
    attackState=ACT_CASTING
    spiritEnergyCost=200
    elementEnergyCost=230
    global.castedSpell=2
  }
  else if global.p1SpellEquip="BLAST OFF" and spiritEnergy>=120 and fireEnergy>=170 and blastOffRecoveryTime=0
  {
    castingTimeTotal=1
    attackState=ACT_CASTING
    spiritEnergyCost=120
    elementEnergyCost=170
    global.castedSpell=3
  }
  else if global.p1SpellEquip="INFERNO" and spiritEnergy>=220 and fireEnergy>=300
  {
    castingTimeTotal=6
    attackState=ACT_CASTING
    spiritEnergyCost=220
    elementEnergyCost=300
    global.castedSpell=4
  }
  else if global.p1SpellEquip="WILDFIRE" and spiritEnergy>=250 and fireEnergy>=320
  {
    castingTimeTotal=5
    attackState=ACT_CASTING
    spiritEnergyCost=250
    elementEnergyCost=320
    global.castedSpell=5
  }
  // ============================== WATER ==============================
  else if global.p1SpellEquip="WATER BLAST" and spiritEnergy>=110 and waterEnergy>=200
  {
    castingTimeTotal=3
    attackState=ACT_CASTING
    spiritEnergyCost=110
    elementEnergyCost=200
    global.castedSpell=11
  }
  else if global.p1SpellEquip="WATER BARRIER" and spiritEnergy>=240 and waterEnergy>=300 and !instance_exists(oWaterBarrier)
  {
    castingTimeTotal=3
    attackState=ACT_CASTING
    spiritEnergyCost=240
    elementEnergyCost=300
    global.castedSpell=12
  }
  else if global.p1SpellEquip="FLOOD" and spiritEnergy>=160 and waterEnergy>=230
  {
    castingTimeTotal=7
    attackState=ACT_CASTING
    spiritEnergyCost=160
    elementEnergyCost=230
    global.castedSpell=13
  }
  else if global.p1SpellEquip="SOOTHING SPRING" and spiritEnergy>=380 and waterEnergy>=380 and !instance_exists(oSoothingSpring)
  {
    castingTimeTotal=16
    attackState=ACT_CASTING
    spiritEnergyCost=380
    elementEnergyCost=380
    global.castedSpell=14
  }
  else if global.p1SpellEquip="PIERCING STREAM" and spiritEnergy>=300 and waterEnergy>=340
  {
    castingTimeTotal=8
    attackState=ACT_CASTING
    spiritEnergyCost=270
    elementEnergyCost=300
    global.castedSpell=15
  }
  // ============================== WIND ==============================
  else if global.p1SpellEquip="WIND BURST" and spiritEnergy>=110 and windEnergy>=200
  {
    castingTimeTotal=2
    attackState=ACT_CASTING
    spiritEnergyCost=110
    elementEnergyCost=200
    global.castedSpell=21
  }
  else if global.p1SpellEquip="ZEPHYR" and spiritEnergy>=100 and windEnergy>=100 and !instance_exists(oZephyr)
  {
    castingTimeTotal=12
    attackState=ACT_CASTING
    spiritEnergyCost=100
    elementEnergyCost=100
    global.castedSpell=22
  }
  else if global.p1SpellEquip="ZEPHYR" and instance_exists(oZephyr)
  {
    attackState=ACT_CASTED
    castRecovering=castRecoveryTime
    playSound(global.snd_MenuCancel,0,1)
    with oZephyr
      lifeTime=0
  }
  else if global.p1SpellEquip="CYCLONE" and spiritEnergy>=170 and windEnergy>=220
  {
    castingTimeTotal=9
    attackState=ACT_CASTING
    spiritEnergyCost=170
    elementEnergyCost=220
    global.castedSpell=23
  }
  else if global.p1SpellEquip="BLAST SHIELD" and spiritEnergy>=105 and windEnergy>=105
  {
    castingTimeTotal=1
    attackState=ACT_CASTING
    spiritEnergyCost=100
    elementEnergyCost=100
    global.castedSpell=24
  }
  else if global.p1SpellEquip="HURRICANE" and spiritEnergy>=160 and windEnergy>=190
  {
    castingTimeTotal=6
    attackState=ACT_CASTING
    spiritEnergyCost=160
    elementEnergyCost=190
    global.castedSpell=25
  }
  // ============================== EARTH ==============================
  else if global.p1SpellEquip="ROCK SMASH" and spiritEnergy>=110 and earthEnergy>=200
  {
    castingTimeTotal=3
    attackState=ACT_CASTING
    spiritEnergyCost=110
    elementEnergyCost=200
    global.castedSpell=31
  }
  else if global.p1SpellEquip="NATURE'S GIFT" and spiritEnergy>=490 and earthEnergy>=490
  {
    castingTimeTotal=20
    attackState=ACT_CASTING
    spiritEnergyCost=490
    elementEnergyCost=490
    global.castedSpell=32
  }
  else if global.p1SpellEquip="EARTH SHIFT" and spiritEnergy>=100 and earthEnergy>=100 and !instance_exists(oEarthShift)
  {
    castingTimeTotal=12
    attackState=ACT_CASTING
    spiritEnergyCost=90
    elementEnergyCost=100
    global.castedSpell=33
  }
  else if global.p1SpellEquip="EARTH SHIFT" and instance_exists(oEarthShift)
  {
    attackState=ACT_CASTED
    castRecovering=castRecoveryTime
    playSound(global.snd_MenuCancel,0,1)
    with oEarthShift
      lifeTime=0
  }
  else if global.p1SpellEquip="RUPTURE" and spiritEnergy>=280 and earthEnergy>=300
  {
    castingTimeTotal=10
    attackState=ACT_CASTING
    spiritEnergyCost=230
    elementEnergyCost=260
    global.castedSpell=34
  }
  else if global.p1SpellEquip="ROCK DRILL" and spiritEnergy>=50 and earthEnergy>=50
  {
    castingTimeTotal=1
    attackState=ACT_CASTING
    spiritEnergyCost=50
    elementEnergyCost=50
    global.castedSpell=35
  }

  if attackState=ACT_CASTING
    findCastingTime()
}
