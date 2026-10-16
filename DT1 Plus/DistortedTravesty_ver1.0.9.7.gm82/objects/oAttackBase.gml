#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bCanDealDamage=true
currentSpell="NONE"
damageType="PHYSICAL"
skillPower=0
jumpSlashPower=0
elementType=0
attackType=0

maxAtkId=0
atkId=0
atkIdTime=0

PART_H_SLASH=30
PART_V_SLASH=31
PART_STAB=32
PART_JUMP_SLASH_1=33
PART_JUMP_SLASH_2=34
PART_UP_SLASH=35
BUSTER=36
HURRICANE_DASH=37

TECH_MENTAL_INSURRECTION=60
TECH_KUDEKU=62
TECH_GRAND_SLAM=63
BLAZING=70
MUUGURU=71

TECH_WAVE_OF_AWESOME_N=120
TECH_WAVE_OF_AWESOME_D=121
TECH_WAVE_OF_AWESOME_U=122
TECH_WAVE_OF_AWESOME_F=123
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  for(i=0;i<maxAtkId;i+=1)
  {
    if atkId[i]!=0
    {
      //atkIdTime[i]-=1
      atkIdTime[i]-=gDeltaTime //60fps change: the time before the same attack can hit that enemy again counts 30fps ticks (multi-hit attacks hit 2x/4x as often at 60/120fps)
      if atkIdTime[i]<=0
        atkId[i]=0
    }
  }
}
