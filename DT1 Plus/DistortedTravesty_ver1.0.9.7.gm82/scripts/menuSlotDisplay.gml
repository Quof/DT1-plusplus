/*
This script is called in the HUD pause menu.
It is used to display the slot descriptions.
(This could just go in the execute code, but it takes too long to load all that.)
*/
//menu info
  itemName=""
  itemType=""
  itemCapacity=0
  itemInfo=""
  if currentMenu=2 //Equipment
  {
    if cursorPosY=1
    {
      itemName="SKITTLES"
      itemType="Effect:"
      itemCapacity="+30% Life"
      itemInfo="Never leave home without a huge bag of these.#Though too many can cause minor headaches."
    }
    else if cursorPosY=2
    {
      itemName="TURBO SMOOTHIE"
      itemType="Effect:"
      itemCapacity="+100% Life"
      itemInfo="T-T-T-Turbo Smooth!"
    }
    else if cursorPosY=3
    {
      itemName="STARBURST"
      itemType="Effect:"
      itemCapacity="+100% Spirit"
      itemInfo="These are pretty much the greatest thing in existance.#Don't argue, they are."
    }
    else if cursorPosY=4
    {
      itemName="GUMMY BEARS"
      itemType="Effect:"
      if global.gameProgress>=183 and global.gameProgress<=323
      {
        itemCapacity="-Shroud Level"
        itemInfo="Causes the Shroud warn level#to decrease dramatically."
      }
      else if global.gameProgress<=182
      {
        itemCapacity="Unknown Effect"
        itemInfo="Unknown effect for now..."
      }
      else
      {
        itemCapacity="N/A"
        itemInfo="Unnecessary now."
      }
    }
    if cursorPosY=5
    {
      itemName=global.p1WeaponGem
      itemType="Gem Enhancement:"
      gemBonus=0
      for (i=0;i<11;i+=1)
      {
        if global.p1WeaponGem=global.invWeaponGems[i]
        {
          itemCapacity=100+gemBonus
          break;
        }
        gemBonus+=10
      }
      itemInfo="Gemstone attached to your hand that increases#the amount of power it can output."
    }
    else if cursorPosY=6
    {
      itemName=global.p1Armor
      itemType="Protection:"
      armorBonus=0
      for (i=0;i<10;i+=1)
      {
        if global.p1Armor=global.invArmor[i]
        {
          itemCapacity=10+armorBonus
          break;
        }
        armorBonus+=10
      }
      itemInfo="Provides protection from physical attacks."
    }
    else if cursorPosY=7
    {
      itemName=global.p1Ring
      itemType="Protection:"
      ringBonus=0
      for (i=0;i<12;i+=1)
      {
        if global.p1Ring=global.invRing[i]
        {
          itemCapacity=7+ringBonus
          break;
        }
        ringBonus+=7
      }
      itemInfo="Provides protection from spirit attacks."
    }
    else if cursorPosY=8
    {
      itemName="Friendship Bracelet"
      itemInfo="Gives various benefits to the wearer."
    }
  }
  else if currentMenu=3 //Techniques
  {
    if subCursorPos=1 //Physical
    {
      if cursorPosY=1
      {
        itemName="MENTAL INSURRECTION - PWR: 40"
        itemType="Spirit:"
        itemCapacity="100"
        itemInfo="Slam the ground, causing a mental outburst which#disrupts the nearby area."
      }
      else if cursorPosY=2 and global.techLv>=2
      {
        itemName="WAVE OF AWESOME - PWR: 10"
        itemType="Spirit:"
        itemCapacity="120"
        itemInfo="Various X attacks based on direction being held#while attack is started."
      }
      else if cursorPosY=3 and global.techLv>=3
      {
        itemName="KUDEKU - PWR: 200"
        itemType="Spirit:"
        itemCapacity="140"
        itemInfo="Blast your enemy with the positive energy#of Kudeku! KUDEKU!! - Fuses with Elements."
      }
      else if cursorPosY=4 and global.techLv>=4
      {
        itemName="GRAND SLAM - PWR: Jump Power"
        itemType="Spirit:"
        itemCapacity="130"
        itemInfo="Slam down to the ground, gaining power as#you rain down awesomely upon your foes."
      }
      /*
      else if cursorPosY=5 and global.techLv>=5
      {
        itemName="CONJURE - 0"
        itemType="Spirit:"
        itemCapacity="300"
        itemInfo="Summons up an ally to assist you. A different#ally is summoned depending on the active element."
      }*/
    }
    else if subCursorPos=2 //Fire
    {
      if cursorPosY=1
      {
        itemName="FIREBALL - PWR: 100"
        itemType="Spirit/Fire:"
        itemCapacity="110/200"
        itemInfo="Shoot a fireball straight."
      }
      else if cursorPosY=2 and global.fireLv>=2
      {
        itemName="FLAME PILLAR - PWR: 70"
        itemType="Spirit/Fire:"
        itemCapacity="200/230"
        itemInfo="Create a large pillar of flame around you."
      }
      else if cursorPosY=3 and global.fireLv>=3
      {
        itemName="BLAST OFF - PWR: 130"
        itemType="Spirit/Fire:"
        itemCapacity="120/170"
        itemInfo="Ignite a flame below you, blasting you straight up#and dealing damage to enemies below."
      }
      else if cursorPosY=4 and global.fireLv>=4
      {
        itemName="INFERNO - PWR: 150"
        itemType="Spirit/Fire:"
        itemCapacity="220/300"
        itemInfo="Summons down fiery hell from the sky.#Burn bitch BURN!!"
      }
      else if cursorPosY=5 and global.fireLv>=5
      {
        itemName="WILDFIRE - PWR: 50"
        itemType="Spirit/Fire:"
        itemCapacity="250/320"
        itemInfo="Embers spiral around you and then fire outward."
      }
    }
    else if subCursorPos=3 //Water
    {
      if cursorPosY=1
      {
        itemName="WATER BLAST - PWR: 100"
        itemType="Spirit/Water:"
        itemCapacity="110/200"
        itemInfo="Splash nearby enemies with a surge of water."
      }
      else if cursorPosY=2 and global.waterLv>=2
      {
        itemName="WATER BARRIER - PWR: N/A"
        itemType="Spirit/Water:"
        itemCapacity="240/300"
        itemInfo="Create a short lived barrier that will protect#against projectiles and decrease Physical damage by 10%."
      }
      else if cursorPosY=3 and global.waterLv>=3
      {
        itemName="FLOOD - PWR: 250"
        itemType="Spirit/Water:"
        itemCapacity="160/230"
        itemInfo="Creates a violent, yet awesome stream of water."
      }
      else if cursorPosY=4 and global.waterLv>=4
      {
        itemName="SOOTHING SPRING - PWR: N/A"
        itemType="Spirit/Water:"
        itemCapacity="380/380"
        itemInfo="Creates a soothing stream that slowly restores life energy#while within it's range and decreasing#damage received by 10%."
      }
      else if cursorPosY=5 and global.waterLv>=5
      {
        itemName="PIERCING STREAM - PWR: 110"
        itemType="Spirit/Water:"
        itemCapacity="270/300"
        itemInfo="Fires an awesome piercing stream of water."
      }
    }
    else if subCursorPos=4 //Wind
    {
      if cursorPosY=1
      {
        itemName="WIND BURST - PWR: 100"
        itemType="Spirit/Wind:"
        itemCapacity="110/200"
        itemInfo="Create a gust of wind that projects outward."
      }
      else if cursorPosY=2 and global.windLv>=2
      {
        itemName="ZEPHYR - PWR: N/A"
        itemType="Spirit/Wind:"
        itemCapacity="100/100"
        itemInfo="Create a strong wind which can obstruct aerial objects."
      }
      else if cursorPosY=3 and global.windLv>=3
      {
        itemName="CYCLONE - PWR: 120"
        itemType="Spirit/Wind:"
        itemCapacity="170/220"
        itemInfo="Create a large cyclone which can cause damage and#disorient objects thrown into it."
      }
      else if cursorPosY=4 and global.windLv>=4
      {
        itemName="BLAST SHIELD - PWR: N/A"
        itemType="Spirit/Wind:"
        itemCapacity="100/100"
        itemInfo="Creates a concentrated windy current that destroys#small projectiles."
      }
      else if cursorPosY=5 and global.windLv>=5
      {
        itemName="HURRICANE - PWR: N/A"
        itemType="Spirit/Wind:"
        itemCapacity="160/190"
        itemInfo="Create an extremely strong burst of wind to clear#away gravity based attacks."
      }
    }
    else if subCursorPos=5 //Earth
    {
      if cursorPosY=1
      {
        itemName="ROCK SMASH - PWR: 100"
        itemType="Spirit/Earth:"
        itemCapacity="110/200"
        itemInfo="Smash your enemies with a large rock."
      }
      else if cursorPosY=2
      {
        itemName="NATURE'S GIFT - PWR: N/A"
        itemType="Spirit/Earth:"
        itemCapacity="490/490"
        itemInfo="Restores a small amount of life energy. (10%)"
      }
      else if cursorPosY=3 and global.earthLv>=2
      {
        itemName="EARTH SHIFT - PWR: N/A"
        itemType="Spirit/Earth:"
        itemCapacity="90/100"
        itemInfo="Create a block of rock in front of you."
      }
      else if cursorPosY=4 and global.earthLv>=3
      {
        itemName="RUPTURE - PWR: 110"
        itemType="Spirit/Earth:"
        itemCapacity="230/260"
        itemInfo="Tremble the earth around you."
      }
      else if cursorPosY=5 and global.earthLv>=4
      {
        itemName="ROCK DRILL - PWR: 50"
        itemType="Spirit/Earth:"
        itemCapacity="50/50"
        itemInfo="Pierces and breaks through really tough rocks.#Only utilizes 70% of your Spirit Power."
      }
    }
  }
  else if currentMenu=4 //Skills
  {
    if subCursorPos=1 //Weapon
    {
      if cursorPosY=1
      {
        if cursorPosX=1
        {
          itemName="SHARPEN LV 1"
          itemType="SP Cost:"
          itemCapacity=1
          itemInfo="Increase damage dealt with your weapon by 3%."
        }
        else if cursorPosX=2
        {
          itemName="SHARPEN LV 2"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Increase damage dealt with your weapon by 3%."
        }
        else if cursorPosX=4
        {
          itemName="SMASH"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Gain power faster while using a downward jump attack."
        }
        else if cursorPosX=6
        {
          itemName="DASH POWER"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Gain power faster when Air Dashing."
        }
      }
      else if cursorPosY=2
      {
        if cursorPosX=1
        {
          itemName="COMBO MASTER"
          itemType="SP Cost:"
          itemCapacity=1
          itemInfo="Increase time alloted for combo chains."
        }
        else if cursorPosX=3
        {
          itemName="EXPERTISE"
          itemType="SP Cost:"
          itemCapacity=1
          itemInfo="Increase combo time."
        }
        else if cursorPosX=6
        {
          itemName="SHARPEN LV 3"
          itemType="SP Cost:"
          itemCapacity=3
          itemInfo="Increase damage dealt with your weapon by 3%."
        }
      }
      else if cursorPosY=3
      {
        if cursorPosX=4
        {
          itemName="STRATEGIST LV 1"
          itemType="SP Cost:"
          itemCapacity=1
          itemInfo="Increase cripple time by 5 seconds."
        }
        else if cursorPosX=5
        {
          itemName="STRATEGIST LV 2"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Increase cripple time by 5 seconds."
        }
      }
      else if cursorPosY=4
      {
        if cursorPosX=1
        {
          itemName="FIRE AFFINITY LV 1"
          itemType="SP Cost:"
          itemCapacity=1
          itemInfo="Decrease usage of Fire Energy when fusing."
        }
        else if cursorPosX=2
        {
          itemName="FIRE AFFINITY LV 2"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Decrease usage of Fire Energy when fusing."
        }
        else if cursorPosX=3
        {
          itemName="FIRE AFFINITY LV 3"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Decrease usage of Fire Energy when fusing."
        }
      }
      else if cursorPosY=5
      {
        if cursorPosX=1
        {
          itemName="WATER AFFINITY LV 1"
          itemType="SP Cost:"
          itemCapacity=1
          itemInfo="Decrease usage of Water Energy when fusing."
        }
        else if cursorPosX=2
        {
          itemName="WATER AFFINITY LV 2"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Decrease usage of Water Energy when fusing."
        }
        else if cursorPosX=3
        {
          itemName="WATER AFFINITY LV 3"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Decrease usage of Water Energy when fusing."
        }
      }
      else if cursorPosY=6
      {
        if cursorPosX=1
        {
          itemName="WIND AFFINITY LV 1"
          itemType="SP Cost:"
          itemCapacity=1
          itemInfo="Decrease usage of Wind Energy when fusing."
        }
        else if cursorPosX=2
        {
          itemName="WIND AFFINITY LV 2"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Decrease usage of Wind Energy when fusing."
        }
        else if cursorPosX=3
        {
          itemName="WIND AFFINITY LV 3"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Decrease usage of Wind Energy when fusing."
        }
      }
      else if cursorPosY=7
      {
        if cursorPosX=1
        {
          itemName="EARTH AFFINITY LV 1"
          itemType="SP Cost:"
          itemCapacity=1
          itemInfo="Decrease usage of Earth Energy when fusing."
        }
        else if cursorPosX=2
        {
          itemName="EARTH AFFINITY LV 2"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Decrease usage of Earth Energy when fusing."
        }
        else if cursorPosX=3
        {
          itemName="EARTH AFFINITY LV 3"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Decrease usage of Earth Energy when fusing."
        }
      }
    }
    else if subCursorPos=2 //Jerry
    {
      if cursorPosY=1
      {
        if cursorPosX=3
        {
          itemName="AGILITY"
          itemType="SP Cost:"
          itemCapacity=1
          itemInfo="Increase dash recovery time."
        }
        else if cursorPosX=7
        {
          itemName="FIRE RESIST LV 1"
          itemType="SP Cost:"
          itemCapacity=1
          itemInfo="Increase Fire Resist by 5%."
        }
        else if cursorPosX=8
        {
          itemName="FIRE RESIST LV 2"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Increase Fire Resist by 5%."
        }
        else if cursorPosX=9
        {
          itemName="FIRE RESIST LV 3"
          itemType="SP Cost:"
          itemCapacity=3
          itemInfo="Increase Fire Resist by 5%."
        }
      }
      else if cursorPosY=2
      {
        if cursorPosX=1
        {
          itemName="IRON BODY LV 1"
          itemType="SP Cost:"
          itemCapacity=1
          itemInfo="Decrease damage taken by Physical Attacks by 3%."
        }
        else if cursorPosX=2
        {
          itemName="IRON BODY LV 2"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Decrease damage taken by Physical Attacks by 3%."
        }
        else if cursorPosX=3
        {
          itemName="SWIFT FOOT"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Slightly boost invulnerability time when dashing."
        }
        else if cursorPosX=4
        {
          itemName="QUICK RECOVERY"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Slightly decrease flinch time after taking damage."
        }
        else if cursorPosX=7
        {
          itemName="WATER RESIST LV 1"
          itemType="SP Cost:"
          itemCapacity=1
          itemInfo="Increase Water Resist by 5%."
        }
        else if cursorPosX=8
        {
          itemName="WATER RESIST LV 2"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Increase Water Resist by 5%."
        }
        else if cursorPosX=9
        {
          itemName="WATER RESIST LV 3"
          itemType="SP Cost:"
          itemCapacity=3
          itemInfo="Increase Water Resist by 5%."
        }
      }
      else if cursorPosY=3
      {
        if cursorPosX=1
        {
          itemName="FREE SPIRIT LV 1"
          itemType="SP Cost:"
          itemCapacity=1
          itemInfo="Decrease damage taken by Spirit Attacks by 3%."
        }
        else if cursorPosX=2
        {
          itemName="FREE SPIRIT LV 2"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Decrease damage taken by Spirit Attacks by 3%."
        }
        else if cursorPosX=4
        {
          itemName="IRON BODY LV 3"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Decrease damage taken by Physical Attacks by 3%."
        }
        else if cursorPosX=5
        {
          itemName="FREE SPIRIT LV 3"
          itemType="SP Cost:"
          itemCapacity=3
          itemInfo="Decrease damage taken by Spirit Attacks by 3%."
        }
        else if cursorPosX=7
        {
          itemName="WIND RESIST LV 1"
          itemType="SP Cost:"
          itemCapacity=1
          itemInfo="Increase Wind Resist by 5%."
        }
        else if cursorPosX=8
        {
          itemName="WIND RESIST LV 2"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Increase Wind Resist by 5%."
        }
        else if cursorPosX=9
        {
          itemName="WIND RESIST LV 3"
          itemType="SP Cost:"
          itemCapacity=3
          itemInfo="Increase Wind Resist by 5%."
        }
      }
      else if cursorPosY=4
      {
        if cursorPosX=7
        {
          itemName="EARTH RESIST LV 1"
          itemType="SP Cost:"
          itemCapacity=1
          itemInfo="Increase Earth Resist by 5%."
        }
        else if cursorPosX=8
        {
          itemName="EARTH RESIST LV 2"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Increase Earth Resist by 5%."
        }
        else if cursorPosX=9
        {
          itemName="EARTH RESIST LV 3"
          itemType="SP Cost:"
          itemCapacity=3
          itemInfo="Increase Earth Resist by 5%."
        }
      }
      else if cursorPosY=5
      {
        if cursorPosX=4
        {
          itemName="PERFECTION LV 1"
          itemType="SP Cost:"
          itemCapacity=1
          itemInfo="Decrease Spirit consumption with Physical Techniques."
        }
        else if cursorPosX=5
        {
          itemName="PERFECTION LV 2"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Decrease Spirit consumption with Physical Techniques."
        }
      }
      else if cursorPosY=6
      {
        if cursorPosX=1
        {
          itemName="PRECISION LV 1"
          itemType="SP Cost:"
          itemCapacity=1
          itemInfo="Increase damage dealt with Techniques by 3%."
        }
        else if cursorPosX=2
        {
          itemName="PRECISION LV 2"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Increase damage dealt with Techniques by 3%."
        }
        else if cursorPosX=5
        {
          itemName="SPIRIT MASTER LV 1"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Increase Spirit recharge rate."
        }
        else if cursorPosX=6
        {
          itemName="SPIRIT MASTER LV 2"
          itemType="SP Cost:"
          itemCapacity=3
          itemInfo="Increase Spirit recharge rate."
        }
      }
      else if cursorPosY=7
      {
        if cursorPosX=4
        {
          itemName="VIRTUE LV 1"
          itemType="SP Cost:"
          itemCapacity=1
          itemInfo="Decrease Spirit consumption with Spirit Techniques."
        }
        else if cursorPosX=5
        {
          itemName="VIRTUE LV 2"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Decrease Spirit consumption with Spirit Techniques."
        }
      }
    }
    else if subCursorPos=3 //Spirit
    {
      if cursorPosY=1
      {
        if cursorPosX=1
        {
          itemName="FIRE MASTERY LV 1"
          itemType="SP Cost:"
          itemCapacity=1
          itemInfo="Increase Fire recharge rate."
        }
        else if cursorPosX=2
        {
          itemName="FIRE MASTERY LV 2"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Increase Fire recharge rate."
        }
        else if cursorPosX=4
        {
          itemName="FIRE CRAFT LV 1"
          itemType="SP Cost:"
          itemCapacity=1
          itemInfo="Decrease Fire usage when casting spells."
        }
        else if cursorPosX=5
        {
          itemName="FIRE CRAFT LV 2"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Decrease Fire usage when casting spells."
        }
        else if cursorPosX=7
        {
          itemName="PROTECTION LV 1"
          itemType="SP Cost:"
          itemCapacity=1
          itemInfo="Decrease effect time of Poison by 25%."
        }
        else if cursorPosX=8
        {
          itemName="PROTECTION LV 2"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Decrease effect time of Spirit Drain by 25%."
        }
      }
      else if cursorPosY=3
      {
        if cursorPosX=1
        {
          itemName="WATER MASTERY LV 1"
          itemType="SP Cost:"
          itemCapacity=1
          itemInfo="Increase Water recharge rate."
        }
        else if cursorPosX=2
        {
          itemName="WATER MASTERY LV 2"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Increase Water recharge rate."
        }
        else if cursorPosX=4
        {
          itemName="WATER CRAFT LV 1"
          itemType="SP Cost:"
          itemCapacity=1
          itemInfo="Decrease Water usage when casting spells."
        }
        else if cursorPosX=5
        {
          itemName="WATER CRAFT LV 2"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Decrease Water usage when casting spells."
        }
        else if cursorPosX=7
        {
          itemName="ELEMENTAL MASTER"
          itemType="SP Cost:"
          itemCapacity=4
          itemInfo="Decrease casting time by 25%."
        }
      }
      else if cursorPosY=5
      {
        if cursorPosX=1
        {
          itemName="WIND MASTERY LV 1"
          itemType="SP Cost:"
          itemCapacity=1
          itemInfo="Increase Wind recharge rate."
        }
        else if cursorPosX=2
        {
          itemName="WIND MASTERY LV 2"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Increase Wind recharge rate."
        }
        else if cursorPosX=4
        {
          itemName="WIND CRAFT LV 1"
          itemType="SP Cost:"
          itemCapacity=1
          itemInfo="Decrease Wind usage when casting spells."
        }
        else if cursorPosX=5
        {
          itemName="WIND CRAFT LV 2"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Decrease Wind usage when casting spells."
        }
        else if cursorPosX=7
        {
          itemName="GOOD FORTUNE LV 1"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Increase drop rate of items from enemies by 5%."
        }
        else if cursorPosX=8
        {
          itemName="GOOD FORTUNE LV 2"
          itemType="SP Cost:"
          itemCapacity=3
          itemInfo="Increase drop rate of items from enemies by 5%."
        }
      }
      else if cursorPosY=6
      {
        if cursorPosX=8
        {
          itemName="STATISTICIAN LV 1"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Boost Exp gained from enemies by 5%."
        }
        else if cursorPosX=9
        {
          itemName="STATISTICIAN LV 2"
          itemType="SP Cost:"
          itemCapacity=3
          itemInfo="Boost Exp gained from enemies by 5%."
        }
      }
      else if cursorPosY=7
      {
        if cursorPosX=1
        {
          itemName="EARTH MASTERY LV 1"
          itemType="SP Cost:"
          itemCapacity=1
          itemInfo="Increase Earth recharge rate."
        }
        else if cursorPosX=2
        {
          itemName="EARTH MASTERY LV 2"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Increase Earth recharge rate."
        }
        else if cursorPosX=4
        {
          itemName="EARTH CRAFT LV 1"
          itemType="SP Cost:"
          itemCapacity=1
          itemInfo="Decrease Earth usage when casting spells."
        }
        else if cursorPosX=5
        {
          itemName="EARTH CRAFT LV 2"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Decrease Earth usage when casting spells."
        }
        else if cursorPosX=7
        {
          itemName="FAITH"
          itemType="SP Cost:"
          itemCapacity=2
          itemInfo="Boost Spirit recovery in combat."
        }
      }
    }
  }
  else if currentMenu=5 //Options
  {
    if subCursorPos=1
    {
      if cursorPosY=1
      {
        itemName="DISPLAY LOW HEALTH WARN"
        itemInfo="Give an on-screen warning when low on life."
      }
      else if cursorPosY=2
      {
        itemName="SHOW EXP EARNED"
        itemInfo="Show exp earned when defeating enemies."
      }
      else if cursorPosY=3
      {
        itemName="SHOW DAMAGE DEALT"
        itemInfo="Show damage dealt to enemies."
      }
      else if cursorPosY=4
      {
        itemName="SHOW ENEMY STATUS AILMENTS"
        itemInfo="Show when afflicting an enemy with a status ailment."
      }
      else if cursorPosY=5
      {
        itemName="REMEMBER MENU POSITION"
        itemInfo="Remember the current submenu for next time the menu#is opened."
      }
      else if cursorPosY=6
      {
        itemName="MUSIC VOLUME"
        itemType="Volume:"
        itemCapacity=global.optMusic
        itemInfo="[A] & [D] to change sound volume."
      }
      else if cursorPosY=7
      {
        itemName="SOUND VOLUME"
        itemType="Volume:"
        itemCapacity=global.optSound
        itemInfo="[A] & [D] to change sound volume."
      }
      else if cursorPosY=8
      {
        itemName="SCANNER OPACITY"
        itemType="Opacity:"
        itemCapacity=global.optIdentifier
        itemInfo="[A] & [D] to change opacity."
      }
      else if cursorPosY=9
      {
        itemName="SHOW ELEMENTAL GLOW"
        itemInfo="Show a colorful glow around you, indicating#the active element."
      }
      else if cursorPosY=10
      {
        itemName="HIDDEN ITEM ALERT"
        itemInfo="Alert you to a hidden item upon entering a map...#with sound!"
      }
    }
    else if subCursorPos=2
    {
      if cursorPosY=1
      {
        itemName="KILL CHAIN SCREEN ALERT"
        itemInfo="Give an on-screen alert when a kill chain is performed."
      }
      else if cursorPosY=2
      {
        itemName="KILL CHAIN SOUND ALERT"
        itemInfo="Give a sound alert when a kill chain is performed."
      }
      else if cursorPosY=3
      {
        itemName="KILLING SPREE SCREEN ALERT"
        itemInfo="Give an on-screen alert when a killing spree is performed."
      }
      else if cursorPosY=4
      {
        itemName="KILLING SPREE SOUND ALERT"
        itemInfo="Give a sound alert when a killing spree is performed."
      }
      else if cursorPosY=5
      {
        itemName="COMBO ALERT"
        itemInfo="Give an on-screen alert when performing combos."
      }
      else if cursorPosY=6
      {
        itemName="SHOW AWESOME POINTS AWARDED"
        itemInfo="Show on-screen when awesome points are awarded."
      }
      else if cursorPosY=7
      {
        itemName="SHOW ENEMY HEALTH"
        itemInfo="Show Enemy Health on-screen when an enemy takes damage."
      }
      else if cursorPosY=8
      {
        itemName="GAME PRIORITY"
        itemType="Priority:"
        itemCapacity=global.gamePriority
        itemInfo="Sets the game priority, may help with lag.#Set to a higher value if the game lags."
      }
      else if cursorPosY=9
      {
        itemName="GAME DETAIL"
        itemType="Detail:"
        itemCapacity=global.optGameDetail
        itemInfo="Set this to Low if the game has trouble#displaying surfaces."
      }
    }
    else if subCursorPos=3
    {
      if cursorPosY=1
      {
        itemName="D-PAD DASH"
        itemInfo="Enable [Up] and [Down] to execute dashing."
      }
      else if cursorPosY=2
      {
        itemName="RIGHT IS FORWARD"
        itemInfo="[Dash Right] becomes [Dash Forward],#and [Dash Left] becomes [Dash Back]."
      }
      else if cursorPosY=3
      {
        itemName="SHOW HUD"
        itemInfo="Display the HUD."
      }
      else if cursorPosY=4
      {
        itemName="DASH WARN"
        itemInfo="Audio warning when low on dash points."
      }
    }
  }
  else if currentMenu=9 //System
  {
    if cursorPosY=1
    {
      itemName="FORCE GAME OVER"
      itemInfo="Gives you a quick and painless death.#That feels... so wrong."
    }
    else if cursorPosY=2
    {
      itemName="RETURN TO TITLE SCREEN"
      itemInfo="It uh... it does what it says."
    }
  }
  else if currentMenu>=100 //Bead Equip
  {
    if subCursorPos=2
    {
      itemType="Equip to Slot"
      itemCapacity=remCurPos
      if cursorPosY=1
      {
        if cursorPosX=1 and global.invBracelet[0]>=1
        {
          itemName="SWORD BEAD"
          itemInfo="Increase Physical Attack by 20."
        }
        else if cursorPosX=2 and global.invBracelet[1]>=1
        {
          itemName="SHIELD BEAD"
          itemInfo="Increase Physical Defense by 20."
        }
        else if cursorPosX=3 and global.invBracelet[2]>=1
        {
          itemName="MAGE BEAD"
          itemInfo="Increase Spirit Attack by 20."
        }
        else if cursorPosX=4 and global.invBracelet[3]>=1
        {
          itemName="MENTAL BEAD"
          itemInfo="Increase Spirit Defense by 20."
        }
        else if cursorPosX=5 and global.invBracelet[4]>=1
        {
          itemName="TRIFORCE BEAD"
          itemInfo="Increase all base stats by 10.#This is definitely not stolen from anything."
        }
      }
      else if cursorPosY=2
      {
        if cursorPosX=1 and global.invBracelet[5]>=1
        {
          itemName="FIRE BEAD"
          itemInfo="Increase Fire Resistance by 20%."
        }
        else if cursorPosX=2 and global.invBracelet[6]>=1
        {
          itemName="WATER BEAD"
          itemInfo="Increase Water Resistance by 20%."
        }
        else if cursorPosX=3 and global.invBracelet[7]>=1
        {
          itemName="WIND BEAD"
          itemInfo="Increase Wind Resistance by 20%."
        }
        else if cursorPosX=4 and global.invBracelet[8]>=1
        {
          itemName="EARTH BEAD"
          itemInfo="Increase Earth Resistance by 20%."
        }
        else if cursorPosX=5 and global.invBracelet[9]>=1
        {
          itemName="ELEMENTAL BEAD"
          itemInfo="Increase all Elemental Resistances by 10%.#Totally a creative name for this."
        }
      }
      else if cursorPosY=3
      {
        if cursorPosX=1 and global.invBracelet[10]>=1
        {
          itemName="VAMP BEAD"
          itemInfo="Regenerate 1 HP for every 40 damage you deal."
        }
        else if cursorPosX=2 and global.invBracelet[11]>=1
        {
          itemName="SPIRIT BEAD"
          itemInfo="Recharge more Spirit Energy after a successful attack."
        }
        else if cursorPosX=3 and global.invBracelet[12]>=1
        {
          itemName="RIBBON BEAD"
          itemInfo="Complete immunity to all status effects.#Definitely not a reference to any fantasy."
        }
        else if cursorPosX=4 and global.invBracelet[13]>=1
        {
          itemName="REVENGE BEAD"
          itemInfo="Return all damage dealt to you by direct attacks.#Non lethal."
        }
        else if cursorPosX=5 and global.invBracelet[14]>=1
        {
          itemName="RAVE BEAD"
          itemInfo="Increase amount of Rave Energy gained."
        }
      }
      else if cursorPosY=4
      {
        if cursorPosX=1 and global.invBracelet[15]>=1
        {
          itemName="TRAP BEAD"
          itemInfo="Decrease damage taken from traps by 25%."
        }
        else if cursorPosX=2 and global.invBracelet[16]>=1
        {
          itemName="STUN BEAD"
          itemInfo="Increase stun time on enemies."
        }
        else if cursorPosX=3 and global.invBracelet[17]>=1
        {
          itemName="POISON BEAD"
          itemInfo="Inflict Poison on an enemy with the last arm-combo strike."
        }
      }
    }
  }

  if itemName!=""
  {
    subMenuInfoX=menuMainX+16
    subMenuInfoY=menuMainY+154
    draw_set_alpha(0.9)
    draw_set_color(colorDarkPink)
    draw_rectangle(subMenuInfoX,subMenuInfoY,subMenuInfoX+288,subMenuInfoY+37,false)
    draw_set_alpha(1)
    draw_set_color(colorLightPink)
    draw_rectangle(subMenuInfoX,subMenuInfoY,subMenuInfoX+288,subMenuInfoY+37,true)
    draw_line(subMenuInfoX,subMenuInfoY+10,subMenuInfoX+288,subMenuInfoY+10)
    draw_set_halign(fa_left)
    draw_text(subMenuInfoX+3,subMenuInfoY-2,itemName)
    draw_set_color(colorDarkPurple)
    if itemType!=""
    {
      draw_text(subMenuInfoX+156,subMenuInfoY-2,itemType)
      xText=string_width(itemType)
      draw_text(subMenuInfoX+164+xText,subMenuInfoY-2,itemCapacity)
    }
    draw_text(subMenuInfoX+3,subMenuInfoY+9,itemInfo)
  }
