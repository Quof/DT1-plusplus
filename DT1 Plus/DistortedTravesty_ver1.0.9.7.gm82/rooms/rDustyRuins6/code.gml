if global.gameProgress<=78
  global.gameProgress=79
if global.gameProgress<=79
  levelEvent=instance_create(0,0,oEvDustyRuinsW1)

if global.gameProgress>=80
{
  newEnemy=instance_create(2720,128,oRuinSlug)
  newEnemy=instance_create(2816,128,oRuinSlug)
  newEnemy=instance_create(2912,128,oRuinSlug)
}
