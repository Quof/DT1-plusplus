/*
music credits change (added): where the music playing is from, as "Game [Title]" ("Game [Title] (Remixer)" for a
remix, "Artist [Title]" for an original piece), like DT3's scrMusicCredit. From the game's music credits
(MusicCredits_DT1.txt) and the pages it links (Newgrounds, OverClocked ReMix: the titles it doesn't give, and what a
remix arranges), with the games under their usual names. The pause menu shows it in the bottom right (oHUD, worked out
when the menu opens). "" while no music plays.
The tracks are the SuperSound sounds loaded at the start (global.msc_*, loadExtFiles); the one playing is the one
SuperSound says is playing or looping. A new track stops the others first (stopAllMusic), so it's one at a time; the
special ones (rave, events, bosses) are checked first in case one ever plays over another. Where no title could be
found (the track's page is gone, or the credits name only the game), it's just the game or the artist.
*/
var i,tH;
if !variable_global_exists("mcCount") //the table, made the first time (the music is loaded by then)
{
  i=0
  //rave, events
  global.mcSound[i]=global.msc_YouSpinMeRound; global.mcText[i]="Dead or Alive [You Spin Me Round (Like a Record)]"; i+=1
  global.mcSound[i]=global.msc_DireMoment; global.mcText[i]="DustDevil [The Land of the Forgotten]"; i+=1
  global.mcSound[i]=global.msc_DarkEntity; global.mcText[i]="XGM-Zeth [Redemption of the beast]"; i+=1
  global.mcSound[i]=global.msc_BRFintro; global.mcText[i]="Ninja Gaiden II [Fortress Intro] (DZX)"; i+=1
  global.mcSound[i]=global.msc_MMstageIntro; global.mcText[i]="Mega Man X3 [Stage Intro] (grumbleduke)"; i+=1
  global.mcSound[i]=global.msc_MMweaponGet; global.mcText[i]="Mega Man 5 [Weapon Get]"; i+=1
  global.mcSound[i]=global.msc_MMvictory; global.mcText[i]="Mega Man X [Victory]"; i+=1
  global.mcSound[i]=global.msc_MMxTheme; global.mcText[i]="Mega Man X [X Theme]"; i+=1
  global.mcSound[i]=global.msc_MMstageSelect; global.mcText[i]="Mega Man 3 [Stage Select]"; i+=1
  //bosses
  global.mcSound[i]=global.msc_BossBattle1; global.mcText[i]="Spiriax [Megaman X-style Boss Battle!]"; i+=1
  global.mcSound[i]=global.msc_BossBattle2; global.mcText[i]="NemesisTheory [Rose At Twilight]"; i+=1
  global.mcSound[i]=global.msc_DarknessBattle; global.mcText[i]="Final Fantasy XII [Esper Battle]"; i+=1
  global.mcSound[i]=global.msc_MMrobotMaster; global.mcText[i]="Mega Man 3 [Robot Master Battle]"; i+=1
  global.mcSound[i]=global.msc_MMfortBoss; global.mcText[i]="Mega Man 3 [Fortress Boss]"; i+=1
  global.mcSound[i]=global.msc_MMxBoss; global.mcText[i]="Mega Man X2 [X vs Zero]"; i+=1
  global.mcSound[i]=global.msc_TetrisB; global.mcText[i]="Tetris [Music B]"; i+=1
  global.mcSound[i]=global.msc_SpireBoss; global.mcText[i]="Bosa [Earthbones]"; i+=1
  global.mcSound[i]=global.msc_MitraBattle; global.mcText[i]="RCU1983 [Warzone of the Future]"; i+=1
  //title, world map, towns
  global.mcSound[i]=global.msc_TitleMenu; global.mcText[i]="Super Mario RPG [Title Theme]"; i+=1
  global.mcSound[i]=global.msc_WorldMap; global.mcText[i]="Kirby Super Star [Dyna Blade Map]"; i+=1
  global.mcSound[i]=global.msc_WorldMapDistorted; global.mcText[i]="Skragga [In Darkness We Fall]"; i+=1
  global.mcSound[i]=global.msc_ToadTown; global.mcText[i]="Zelda II: The Adventure of Link [Indoors, Overworld, Title] (AmIEviL)"; i+=1
  global.mcSound[i]=global.msc_Abstracity; global.mcText[i]="Krank"; i+=1 //its Newgrounds page (251469) is gone
  //levels
  global.mcSound[i]=global.msc_ElectricFactory; global.mcText[i]="midimachine [We Came To Finish You!]"; i+=1
  global.mcSound[i]=global.msc_MarioOverworld; global.mcText[i]="Super Mario World [Overworld] (djpretzel)"; i+=1
  global.mcSound[i]=global.msc_HopHopDonutLifts; global.mcText[i]="Yoshi's Island [Athletic]"; i+=1 //Hop! Hop! Donut Lifts is a level, with this music
  global.mcSound[i]=global.msc_MarioFortress; global.mcText[i]="Super Smash Bros. Brawl [Castle/Boss Fortress (Super Mario World/SMB3)]"; i+=1
  global.mcSound[i]=global.msc_DarkDepths; global.mcText[i]="Super Castlevania IV [Simon's Theme]"; i+=1
  global.mcSound[i]=global.msc_DilutedMansion; global.mcText[i]="Castlevania: Aria of Sorrow [Top Floor] (DJ-HappyFace)"; i+=1
  global.mcSound[i]=global.msc_VegetableGarden; global.mcText[i]="Kirby's Adventure"; i+=1 //the credits don't say which track
  global.mcSound[i]=global.msc_Distortion1; global.mcText[i]="Pokemon Platinum [Distortion World] (Cat333Pokemon)"; i+=1
  global.mcSound[i]=global.msc_DustyRuins; global.mcText[i]="Illusion of Gaia [Map] (Wintermute)"; i+=1
  global.mcSound[i]=global.msc_FrightTrain; global.mcText[i]="Reone662"; i+=1 //its Newgrounds page (120525) is gone
  global.mcSound[i]=global.msc_ElevatorMusic; global.mcText[i]="YunVeroz [Elevator Music]"; i+=1
  global.mcSound[i]=global.msc_WestSideJungle; global.mcText[i]="Suikoden II [Retrospection] (Drawoh)"; i+=1
  global.mcSound[i]=global.msc_Hideout; global.mcText[i]="Final Fantasy Mystic Quest [Mountain Range of Whirlwinds] (Beatdrop & mp)"; i+=1
  global.mcSound[i]=global.msc_MMintro; global.mcText[i]="Mega Man X2 [Intro Stage]"; i+=1
  global.mcSound[i]=global.msc_MMrooftop; global.mcText[i]="Mega Man 3 [Spark Man Stage]"; i+=1
  global.mcSound[i]=global.msc_MMnapalm; global.mcText[i]="Mega Man 5 [Napalm Man Stage]"; i+=1
  global.mcSound[i]=global.msc_MMgyro; global.mcText[i]="Mega Man 6 [Yamato Man Stage]"; i+=1
  global.mcSound[i]=global.msc_MMdive; global.mcText[i]="Mega Man 6 [Centaur Man Stage]"; i+=1
  global.mcSound[i]=global.msc_MMmystery; global.mcText[i]="Mega Man 4 [Bright Man Stage]"; i+=1
  global.mcSound[i]=global.msc_MMfort1; global.mcText[i]="Mega Man X2 [Fortress Stage 1]"; i+=1
  global.mcSound[i]=global.msc_MMfort2; global.mcText[i]="Mega Man 5 [Skull Castle]"; i+=1
  global.mcSound[i]=global.msc_BlackRockFortress; global.mcText[i]="Rosenkreuzstilette [Red Pollusion]"; i+=1
  global.mcSound[i]=global.msc_SoFS; global.mcText[i]="Nikujin"; i+=1 //the credits don't say which track
  global.mcSound[i]=global.msc_WindySlopes; global.mcText[i]="The Legend of the Mystical Ninja (punk7890)"; i+=1 //its Newgrounds page (117039) is gone
  global.mcSound[i]=global.msc_Distortion3_1; global.mcText[i]="Super Mario Land [World 1]"; i+=1
  global.mcSound[i]=global.msc_Distortion3_2; global.mcText[i]="Castlevania: The Adventure"; i+=1 //the credits don't say which track
  global.mcSound[i]=global.msc_VeiledDetritus; global.mcText[i]="Golden Sun [Jupiter Lighthouse] (CelestOrion)"; i+=1
  global.mcSound[i]=global.msc_VDlock1; global.mcText[i]="Zelda II: The Adventure of Link [Palace Theme]"; i+=1
  global.mcSound[i]=global.msc_VDlock2; global.mcText[i]="Zelda II: The Adventure of Link [Great Palace]"; i+=1
  global.mcSound[i]=global.msc_Distortion4; global.mcText[i]="Dungeecount [Distraught Subconscience]"; i+=1
  global.mcSound[i]=global.msc_ShadyWoods; global.mcText[i]="Super Mario RPG [Beware the Forest's Mushrooms]"; i+=1
  global.mcSound[i]=global.msc_ShadyCaves; global.mcText[i]="floccari [Crossing the Waterfall]"; i+=1
  global.mcSound[i]=global.msc_DataSegment1; global.mcText[i]="Winterwind-NS [Fears]"; i+=1
  global.mcSound[i]=global.msc_PrimaryMemory; global.mcText[i]="F-777 [Wander of Thought]"; i+=1
  global.mcSound[i]=global.msc_Escape; global.mcText[i]="Metroid: Zero Mission [Escape]"; i+=1
  global.mcCount=i
}
for(i=0;i<global.mcCount;i+=1)
{
  tH=global.mcSound[i]
  if SS_IsSoundPlaying(tH)=1 or SS_IsSoundLooping(tH)=1 {return global.mcText[i]}
}
return ""
