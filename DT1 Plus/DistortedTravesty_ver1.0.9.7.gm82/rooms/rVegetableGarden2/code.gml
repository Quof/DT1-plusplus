parasolSpawner=instance_create(0,0,oParasolSpawner)
parasolSpawner.reSpawnSpeed=100

twizEnemy=instance_create(1456,96,oTwizzy)
twizEnemy.questType=1
twizEnemy=instance_create(1552,64,oTwizzy)
twizEnemy.questType=1
twizEnemy=instance_create(1616,48,oTwizzy)
twizEnemy.questType=1
twizEnemy=instance_create(1776,96,oTwizzy)
twizEnemy.questType=1
twizEnemy=instance_create(1824,48,oTwizzy)
twizEnemy.questType=1
twizEnemy=instance_create(1888,80,oTwizzy)
twizEnemy.questType=1
twizEnemy=instance_create(1648,176,oTwizzy)
twizEnemy.questType=1
twizEnemy=instance_create(1792,208,oTwizzy)
twizEnemy.questType=1
twizEnemy=instance_create(1536,304,oTwizzy)
twizEnemy.questType=1
twizEnemy=instance_create(1712,240,oTwizzy)
twizEnemy.questType=1
twizEnemy=instance_create(1712,320,oTwizzy)
twizEnemy.questType=1

if global.gameProgress<=52
  global.gameProgress=53

if global.gameProgress=53
  convoEvent=instance_create(0,0,oEvDreamlandConvo1)
else
  convoEvent=instance_create(0,0,oGlobalEvent)
mapShroudSpawn(1)
