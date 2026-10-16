/*
This script is called in the HUD pause menu.
It is used to display the map quote.
(This could just go in the execute code, but it takes too long to load all that.)
*/
//find quote
var mapQuote;
mapQuote=""
if room=rIEFtutorial or room=rDataCenter
  mapQuote="When the world says, Give up,#Hope whispers, Try it one more time.#~ Unknown"
if room=rIEF1
  mapQuote="What lies behind us and what lies before us are tiny matters compared to what lies within us.#~ Ralph Waldo Emerson"
else if room=rIEF2
  mapQuote="When it hurts to look back, and you're scared to look ahead, you can look beside you and your best friend will be there.#~ Anonymous"
else if room=rIEF3
  mapQuote="It is never too late to become what you might have become.#~ George Eliot"
else if room=rIEF4
  mapQuote="We make a living by what we get. We make a life by what we give.#~ Winston Churchill"
else if room=rIEF5 or room=rIEF6
  mapQuote="Live as if you were to die tomorrow. Learn as if you were to live forever.#~ Mohandas Gandhi"
else if room=rIEF7
  mapQuote="It is good to have an end to journey toward; but it is the journey that matters, in the end.#~ Ursula K. Le Guin"
else if room=rIEF8 or room=rIEF9
  mapQuote="And in the end, it's not the years in your life that count. It's the life in your years.#~ Abraham Lincoln"
else if room=rDonutPlains1 or room=rDonutPlains2 or room=rDonutPlains1Secret
  mapQuote="Friends are those rare people who ask how you are and then wait for the answer.#~ Unknown"
else if room=rToadTown or room=rToadTownShop or room=rToadTownMayor
  mapQuote="The difference between the impossible and the possible lies in a person's determination.#~ Tommy Lasorda"
else if room=rRumpyMountains1 or room=rRumpyMountains2 or room=rRumpyMountains1Secret or room=rRumpyMountains2Secret
  mapQuote="A friend is someone who knows all about you, and loves you just the same.#~ Proverb"
else if room=rOldCastle1 or room=rOldCastle2 or room=rOldCastle3 or room=rOldCastle4 or room=rOldCastle5 or room=rOldCastle2Secret
  mapQuote="If you love somebody, let them go, for if they return, they were always yours. And if they don't, they never were.#~ Kahlil Gibran"
else if room=rDarkDepths1 or room=rDarkDepths2 or room=rDarkDepths3 or room=rDarkDepths4 or room=rDarkDepths1Secret
  mapQuote="Only those who will risk going too far can possibly find out how far one can go.#~ T.S. Eliot"
else if room=rDilutedMansion1 or room=rDilutedMansion2 or room=rDilutedMansion3 or room=rDilutedMansion4 or room=rDilutedMansion5 or room=rDilutedMansion4Secret
  mapQuote="It is amazing how much you can accomplish when it doesn't matter who gets the credit."
else if room=rVegetableGarden1 or room=rVegetableGarden2 or room=rVegetableGarden3 or room=rVegetableGarden4 or room=rVegetableGarden3Secret
  mapQuote="Anyone can catch your eye, but it takes someone special to catch your heart.#~ Unknown"
else if room=rDistortionW1_1 or room=rDistortionW1_2 or room=rDistortionW1_3 or room=rDistortionW1_4 or room=rDistortionW1_5 or room=rDistortionW1_6 or room=rDistortionW1_7
  mapQuote="Walking with a friend in the dark is better than walking alone in the light.#~ Helen Killer"
else if room=rDustyRuins1 or room=rDustyRuins2 or room=rDustyRuins3 or room=rDustyRuins4 or room=rDustyRuins5 or room=rDustyRuins6
  mapQuote="A champion is someone who gets up, even when he can't.#~ Jack Dempsey"
else if room=rAbstracity or room=rAbstracityEast or room=rAbstracityApartment or room=rAbstracityAptTopRoom
  mapQuote="You were not born a winner, and you were not born a loser.#You are what you make yourself be.#~ Lou Holtz"
else if room=rFrightTrain1 or room=rFrightTrain2 or room=rFrightTrain3 or room=rFrightTrain4 or room=rFrightTrain5 or room=rFrightTrain6 or room=rFrightTrain7
  mapQuote="In any moment of decision, the best thing you can do is the right thing.#The worst thing you can do is nothing.#~ Theodore Roosevelt"
else if room=rCheeseGarden1 or room=rCheeseGarden2
  mapQuote="I've learned that my best friend and I can do anything or nothing and have the best time.#~ Unknown"
else if room=rWestSideJungle1 or room=rWestSideJungle2 or room=rWestSideJungle3 or room=rWestSideJungle4 or room=rWestSideJungle5 or room=rWestSideJungle4Secret
  mapQuote="Many people will walk in and out of your life, but only true friends will leave footprints in your heart.#~ Anonymous"
else if room=rDirtyRuins1 or room=rDirtyRuins2
  mapQuote="When the odds are one in a million, be that one.#~ Anonymous"
else if room=rTheHideout1 or room=rTheHideout2 or room=rTheHideout3 or room=rTheHideout4 or room=rTheHideout5 or room=rTheHideout6 or room=rTheHideout7 or room=rTheHideout8 or room=rTheHideout9 or room=rTheHideout10
  mapQuote="Let us be grateful to people who make us happy; they are the#charming gardeners who make our souls blossom.#~ Anonymous"
else if room=rDistortionW2_1 or room=rDistortionW2_2 or room=rDistortionW2_3 or room=rDistortionW2_4 or room=rDistortionW2_5 or room=rDistortionW2_6
  mapQuote="Feeling gratitude and not expressing it is like wrapping a present and not giving it.#~ William Ward"
else if room=rMetropolisM1 or room=rMetropolisM2 or room=rMetropolisM3 or room=rMetropolisM4 or room=rMetropolisStageSelect
  mapQuote="Give thanks for a little and you will find a lot.#~ Hausa of Nigeria"
else if room=rNapalmL1 or room=rNapalmL2 or room=rNapalmL3 or room=rNapalmL4 or room=rNapalmL5
  mapQuote="Believe you can and you're half way there.#~ Theodore Roosevelt"
else if room=rGyroL1 or room=rGyroL2 or room=rGyroL3 or room=rGyroL4 or room=rGyroL5
  mapQuote="We come to love not by finding a perfect person,#but by learning to see an imperfect person perfectly.#~ Sam Keen"
else if room=rDiveL1 or room=rDiveL2 or room=rDiveL3 or room=rDiveL4
  mapQuote="When you feel like giving up, remember why you#held on for so long in the first place.#~ Unknown"
else if room=rMysteryL1 or room=rMysteryL2 or room=rMysteryL3 or room=rMysteryL4
  mapQuote="Instead of giving myself reasons why I can't,#I give myself reasons why I can.#~ Unknown"
else if room=rFortL1_1 or room=rFortL1_2 or room=rFortL1_3 or room=rFortL1_4 or room=rFortL1_5 or room=rFortL1_6 or room=rFortL2_1 or room=rFortL2_2 or room=rFortL2_3 or room=rFortL2_4
  mapQuote="If you think you can, you can.#And if you think you can't, you're right.#~ Mary Kay Ash"
else if room=rBRF_Entrance or room=rBRFort1  or room=rBRFort2  or room=rBRFort3  or room=rBRFort4 or room=rBRFort5 or room=rBRFort6 or room=rBRFort7 or room=rBRFort8 or room=rBRFort9 or room=rBRFort10 or room=rBRFort11 or room=rBRFort12 or room=rBRFort13 or room=rBRFort14 or room=rBRFort15 or room=rBRFort16 or room=rBRFort17
  mapQuote="Success consists of going from failure to failure#without loss of enthusiasm.#~ Winston Churchill"
else if room=rMaverickFactory1 or room=rMaverickFactory2 or room=rMaverickFactory3
  mapQuote="It is wise to keep in mind that neither success#nor failure is ever final.#~ Roger Babson"
else if room=rWindySlopes1 or room=rWindySlopes2 or room=rWindySlopes3 or room=rWindySlopes4 or room=rWindySlopes5 or room=rWindySlopes6 or room=rWindySlopes3Secret
  mapQuote="The road to success is always under construction.#~ Unknown"
else if room=rWindyCaves1 or room=rWindyCaves2 or room=rWindyCaves3 or room=rWindyCaves4
  mapQuote="Problems are only opportunities with thorns on them.#~ Hugh Miller"
else if room=rDistortionW3_1 or room=rDistortionW3_2 or room=rDistortionW3_3 or room=rDistortionW3_4 or room=rDistortionW3_5 or room=rDistortionW3_6 or room=rDistortionW3_7 or room=rDistortionW3_8 or room=rDistortionW3_9 or room=rDistortionW3_9Secret or room=rDistortionW3_10
  mapQuote="One has to remember that every failure can be a#stepping stone to something better.#~ Col. Harland Sanders"
else if room=rVeiledDetritus1 or room=rVeiledDetritus1Secret or room=rVeiledDetritus2 or room=rVeiledDetritus3 or room=rVeiledDetritus4 or room=rVeiledDetritus5 or room=rVeiledDetritus6 or room=rVeiledDetritus7 or room=rVeiledDetritus8 or room=rVeiledDetritus9 or room=rVeiledDetritus10 or room=rVeiledDetritus11 or room=rVeiledDetritus12 or room=rVeiledDetritus13 or room=rVeiledDetritus14 or room=rVeiledDetritus15 or room=rVeiledDetritus16 or room=rVeiledDetritus17 or room=rVeiledDetritus18 or room=rVeiledDetritus19 or room=rVeiledDetritus20 or room=rVeiledDetritus21 or room=rVeiledDetritus22
  mapQuote="Live as if you were to die tomorrow.#Learn as if you were to live forever.#~ Mohandas Gandhi"
else if room=rVDlock1_1 or room=rVDlock1_2 or room=rVDlock2_1 or room=rVDlock2_2 or room=rVDlock3_1 or room=rVDlock3_2 or room=rVDlock4_1 or room=rVDlock4_2 or room=rVDlock5_1 or room=rVDlock5_2 or room=rVDlock5_3
  mapQuote="Hope sees the invisible, feels the intangible and achieves the impossible.#~ Unknown"
else if room=rShadyWoods1 or room=rShadyWoods2 or room=rShadyWoods3 or room=rShadyWoods4
  mapQuote="The greatest oak was once a little nut who held its ground.#~ Unknown"
else if room=rDistortionW4_1 or room=rDistortionW4_2 or room=rDistortionW4_3 or room=rDistortionW4_4 or room=rDistortionW4_5 or room=rDistortionW4_6 or room=rDistortionW4_7 or room=rDistortionW4_8
  mapQuote="When you come to the end of your rope,#tie a knot and hang on.#~ Franklin D. Roosevelt"
else if room=rShadyCaves1 or room=rShadyCaves2 or room=rShadyCaves3 or room=rShadyCaves4 or room=rShadyCaves5
  mapQuote="Forget about all the reasons why something may not work.#You only need to find one good reason why it will.#~ Dr. Robert Anthony"
else if room=rStalagmiteRuins1 or room=rStalagmiteRuins2
  mapQuote="A pessimist is one who makes difficulties of his opportunities#and an optimist is one who makes opportunities of his difficulties.#~ Harry Truman"
else if room=rDataSegment1 or room=rDataSegment2 or room=rDataSegment3 or room=rDataSegment4 or room=rDataSegment5 or room=rDataSegment6 or room=rDataSegment7 or room=rDataSegment8 or room=rDataSegment9 or room=rDataSegment10 or room=rDataSegment11 or room=rDataSegment12 or room=rDataSegment13 or room=rDataSegment14 or room=rDataSegment15 or room=rDataSegment16 or room=rDataSegment17 or room=rDataSegment18 or room=rDataSegment19 or room=rDataSegment20
  mapQuote="Only those who dare to fail greatly can ever achieve greatly.#~ Robert F. Kennedy"
else if room=rDS_1_1 or room=rDS_1_2 or room=rDS_1_3 or room=rDS_2_1 or room=rDS_2_2 or room=rDS_2_3 or room=rDS_3_1 or room=rDS_3_2 or room=rDS_3_3
  mapQuote="It does not matter how slowly you go so long as you do not stop.#~ Confucius"
else if room=rPrimaryMemory1 or room=rPrimaryMemory2
  mapQuote="Things turn out best for the people who make the best of the#way things turn out.#~ Art Linkletter"
//display quote
quoteMenuX=menuMainX
quoteMenuY=menuMainY+234
draw_set_font(fnt_SubMenu)
draw_set_alpha(1)
draw_set_color(colorDarkPink)
draw_rectangle(quoteMenuX,quoteMenuY,quoteMenuX+320,quoteMenuY+50,false)
draw_set_color(colorLightPink)
draw_rectangle(quoteMenuX,quoteMenuY,quoteMenuX+320,quoteMenuY+50,true)
draw_line(quoteMenuX,quoteMenuY+10,quoteMenuX+320,quoteMenuY+10)
draw_set_halign(fa_center)
draw_text(quoteMenuX+160,quoteMenuY-2,"MAP QUOTE")
draw_set_color(colorDarkPurple)
draw_set_halign(fa_left)
draw_text_ext(quoteMenuX+3,quoteMenuY+9,mapQuote,10,314)
