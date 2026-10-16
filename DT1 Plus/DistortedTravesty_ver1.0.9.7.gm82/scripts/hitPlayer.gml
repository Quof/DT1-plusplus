/*
This script is used when the player takes damage.
*/
if bCanTakeHit=true and bCanTakeDamage=true and dashInvulnerabilityTime=0 and jumpSlashPower<=199
{
  var tCheckWaterBarrier;
  tCheckWaterBarrier=0
  if instance_exists(oWaterBarrier) and other.parent="projectile" and other.size=1 {tCheckWaterBarrier=1}

  if tCheckWaterBarrier=0
  {
    if bRaveActive=false
    {
      if other.bInflictPoison=true
        inflictStatus(1)
      if other.bInflictSpiritDrain=true
        inflictStatus(2)
      if other.bInflictSkillLock=true
        inflictStatus(3)
      takeDamage()
    }
    else
    {
      if other.parent!="enemy" and other.parent!="projectile"
        takeDamage()
    }
  }
}
