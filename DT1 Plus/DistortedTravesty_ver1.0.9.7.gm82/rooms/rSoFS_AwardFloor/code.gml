background_hspeed[0]=1
background_vspeed[0]=0.25
gameEvent=instance_create(0,0,oEvSoFSW1)
gameEvent.currentFloor=0

//---------- check floor for reward ----------
if global.sofsCurrent=1
{
  if global.sofsMax=0
    expWorth=10000
  else
    expWorth=1000
  newAward=instance_create(336,224,oSkillCapsule)
  newAward.objectNum=74
}
else if global.sofsCurrent=2
{
  if global.sofsMax=1
    expWorth=25000
  else
    expWorth=2500
  newAward=instance_create(328,208,oHeartPiece)
  newAward.objectNum=35
}
else if global.sofsCurrent=3
{
  if global.sofsMax=2
    expWorth=50000
  else
    expWorth=5000
  newAward=instance_create(336,224,oSkillCapsule)
  newAward.objectNum=105
}
else if global.sofsCurrent=4
{
  if global.sofsMax=3
    expWorth=100000
  else
    expWorth=10000
  newAward=instance_create(328,208,oHeartPiece)
  newAward.objectNum=47
}
else if global.sofsCurrent=5
{
  if global.sofsMax=4
    expWorth=150000
  else
    expWorth=15000
  newAward=instance_create(336,224,oSkillCapsule)
  newAward.objectNum=106
}
else if global.sofsCurrent=6
{
  if global.sofsMax=5
    expWorth=200000
  else
    expWorth=20000
  newAward=instance_create(328,208,oSpiritAura)
  newAward.objectNum=18
}
else if global.sofsCurrent=7
{
  if global.sofsMax=6
    expWorth=250000
  else
    expWorth=25000
  newAward=instance_create(336,224,oSkillCapsule)
  newAward.objectNum=107
}
else if global.sofsCurrent=8
{
  if global.sofsMax=7
    expWorth=300000
  else
    expWorth=30000
  newAward=instance_create(328,208,oHeartPiece)
  newAward.objectNum=48
}

//---------- award Exp ----------
if global.difficulty=1
  expWorth-=round(expWorth*0.1)
else if global.difficulty=3
  expWorth+=round(expWorth*0.1)
else if global.difficulty=4
  expWorth+=round(expWorth*0.11)
oPlayer1.expTotal+=round(expWorth)
oPlayer1.expCurrent+=round(expWorth)
if global.optShowExpEarned=true
{
  newAward=instance_create(oPlayer1.x,oPlayer1.y-26,oKillAward)
  newAward.expValue=expWorth
}

//---------- check for highest floor ----------
if global.sofsCurrent=1 and global.sofsMax=0 //floor 5
  global.sofsMax=1
else if global.sofsCurrent=2 and global.sofsMax=1 //floor 10
  global.sofsMax=2
else if global.sofsCurrent=3 and global.sofsMax=2 //floor 15
  global.sofsMax=3
else if global.sofsCurrent=4 and global.sofsMax=3 //floor 20
  global.sofsMax=4
else if global.sofsCurrent=5 and global.sofsMax=4 //floor 25
  global.sofsMax=5
else if global.sofsCurrent=6 and global.sofsMax=5 //floor 30
  global.sofsMax=6
else if global.sofsCurrent=7 and global.sofsMax=6 //floor 35
  global.sofsMax=7
else if global.sofsCurrent=8 and global.sofsMax=7 //floor 40
  global.sofsMax=8
