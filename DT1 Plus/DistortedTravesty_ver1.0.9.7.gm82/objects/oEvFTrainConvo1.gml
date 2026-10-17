#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if (global.gameProgress=88 or global.gameProgress=89) and room=rFrightTrain1 //random dialogue
  {
    if sceneProgress=0
    {
      for (i=0;i<=0;i+=1)
      {
        charDialogue[i]=0
        convo[i]=0
      }
      sceneProgress+=1
    }
    if charDialogue[0]=0 and oPlayer1.x>=4992
    {
      msgCreate("Long trains are long.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
      charDialogue[0]+=1
    }
    else if charDialogue[0]=1
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=45
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    if charDialogue[0]=2
    {
      msgCreate("Those jokes aren't funny after the first time.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=75
      charDialogue[0]+=1
    }
    else if charDialogue[0]=3
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=60
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    if charDialogue[0]=4
    {
      msgCreate("Shut up " +string(global.mainCharacters[1]) +string(" I'm sure SOMEONE laughed or at least smiled."),0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=75
      charDialogue[0]+=1
    }
  }
  if global.gameProgress=90 and room=rFrightTrain2 //random dialogue
  {
    if sceneProgress=0
    {
      for (i=0;i<=1;i+=1)
      {
        charDialogue[i]=0
        convo[i]=0
      }
      sceneProgress+=1
    }
    if charDialogue[0]=0
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=155
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    if charDialogue[0]=1
    {
      msgCreate("Oh come on!!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
      charDialogue[0]+=1
    }
    else if charDialogue[0]=2
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=45
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    if charDialogue[0]=3
    {
      msgCreate("Unfair?",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=60
      charDialogue[0]+=1
    }
    else if charDialogue[0]=4
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=45
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    if charDialogue[0]=5
    {
      msgCreate("WAY unfair!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
      charDialogue[0]+=1
    }

    if charDialogue[1]=0 and oPlayer1.x>=2240
    {
      msgCreate("Long...",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=15
      charDialogue[1]+=1
    }
    else if charDialogue[1]=1
    {
      //convo[1]+=1
      convo[1]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[1]>=10
      {
        charDialogue[1]+=1
        convo[1]=0
      }
    }
    if charDialogue[1]=2
    {
      msgCreate("No! No more!",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=60
      charDialogue[1]+=1
    }
    else if charDialogue[1]=3
    {
      //convo[1]+=1
      convo[1]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[1]>=45
      {
        charDialogue[1]+=1
        convo[1]=0
      }
    }
    if charDialogue[1]=4
    {
      msgCreate("You're no fun.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
      charDialogue[1]+=1
    }
  }
  if global.gameProgress=92 and room=rFrightTrain3 //random dialogue
  {
    if sceneProgress=0
    {
      for(i=0;i<2;i+=1)
      {
        charDialogue[i]=0
        convo[i]=0
      }
      for(i=0;i<4;i+=1)
        enemySpawn[i]=0
      sceneProgress+=1
    }
    if charDialogue[0]=0 and oPlayer1.x>=592
    {
      msgCreate("I could've just done that myself you know.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
      charDialogue[0]+=1
    }

    if charDialogue[1]=0 and oPlayer1.x>=3808
    {
      msgCreate("Wow, now THAT was pointless!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=75
      charDialogue[1]+=1
    }
    else if charDialogue[1]=1
    {
      //convo[1]+=1
      convo[1]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[1]>=60
      {
        charDialogue[1]+=1
        convo[1]=0
      }
    }
    else if charDialogue[1]=2
    {
      msgCreate("Although somewhat humorous... at least from this perspective.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=75
      charDialogue[1]+=1
    }
    //==================================================
    if enemySpawn[0]=0 and oPlayer1.x>=2368
    {
      newEnemy=instance_create(2368,72,oScarfy)
      effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
      enemySpawn[0]=1
    }
    if enemySpawn[1]=0 and oPlayer1.x>=2448
    {
      newEnemy=instance_create(2448,72,oScarfy)
      effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
      enemySpawn[1]=1
    }
    if enemySpawn[2]=0 and oPlayer1.x>=2544
    {
      newEnemy=instance_create(2544,72,oScarfy)
      effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
      enemySpawn[2]=1
    }
    if enemySpawn[3]=0 and oPlayer1.x>=2672
    {
      newEnemy=instance_create(2672,72,oScarfy)
      effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
      enemySpawn[3]=1
    }
  }
  if global.gameProgress=93 and room=rFrightTrain4 //random dialogue
  {
    if sceneProgress=0
    {
      for (i=0;i<=0;i+=1)
        charDialogue[i]=0
      sceneProgress+=1
      convo[0]=0
    }
    else if charDialogue[0]=0 and oPlayer1.tookHitAmount>=6
    {
      msgCreate("You know you could do better.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=30
      charDialogue[0]+=1
    }
    else if charDialogue[0]=1
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=15
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=2
    {
      msgCreate("Don't want to hear it!#Shut it and why not hack and recover my health a little bit?!",0,oMessagePerson,global.mainCharacters[0],1,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    else if charDialogue[0]=3
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=90
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=4
    {
      msgCreate("Okay, here you go.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    else if charDialogue[0]=5
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      //if convo[0]=50
      if scrCountPass(convo[0],50) //60fps change: once, when the count reaches it
      {
        var totalHeal;
        totalHeal=oPlayer1.maxLife*0.2
        oPlayer1.life+=totalHeal
        playSound(global.snd_HealingPlant,0,1)
        newDamage=instance_create(x,y-(sprite_height/2+(sprite_height/4)),oDamageNotice);
        newDamage.damageValue=totalHeal
        newDamage.damageColor=make_color_rgb(78,192,34)
        effect=instance_create(oPlayer1.x,oPlayer1.y-(oPlayer1.sprite_height/2),oEffect)
        effect.sprite_index=sHeal
      }
      if convo[0]>=90
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=6
    {
      msgCreate("WHAT?!#You could do this THE WHOLE TIME?!",0,oMessagePerson,global.mainCharacters[0],1,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    else if charDialogue[0]=7
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=90
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=8
    {
      msgCreate("Nah, I just found a loop hole, but it seems to have been fixed already.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    else if charDialogue[0]=9
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=90
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=10
    {
      msgCreate("Deus ex machina much? Geez.",0,oMessagePerson,global.mainCharacters[0],1,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
  }
  if global.gameProgress=96 and room=rFrightTrain6 //random dialogue
  {
    if sceneProgress=0
    {
      for (i=0;i<=0;i+=1)
      {
        charDialogue[i]=0
        convo[i]=0
      }
      sceneProgress+=1
    }
    if charDialogue[0]=0 and oPlayer1.x>=416
    {
      msgCreate("Getting VERY close to this thing.#You know, you may have lucked out.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=90
      charDialogue[0]+=1
    }
    else if charDialogue[0]=1
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=75
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    if charDialogue[0]=2
    {
      msgCreate("How so?#These spikes don't seem lucky to me.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=90
      charDialogue[0]+=1
    }
    else if charDialogue[0]=3
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=75
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    if charDialogue[0]=4
    {
      msgCreate("Whine whine, I was just saying that I've managed to keep most#of the Quick Time Events away.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=90
      charDialogue[0]+=1
    }
    else if charDialogue[0]=5
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=75
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    if charDialogue[0]=6
    {
      msgCreate("I still had to suffer through a few badly made one's though.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=90
      charDialogue[0]+=1
    }
    else if charDialogue[0]=7
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=75
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    if charDialogue[0]=8
    {
      msgCreate("Might as well break out the emo music for you now.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=90
      charDialogue[0]+=1
    }
  }
}
