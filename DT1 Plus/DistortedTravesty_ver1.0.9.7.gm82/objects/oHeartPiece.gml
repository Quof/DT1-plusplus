#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0.16
itemCheck=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.heartPiece[objectNum]=1
  instance_destroy()
else
{
  if itemCheck=0
  {
    extraItemAlert()
    itemCheck=1
  }
}
#define Collision_oCharacter
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*
Heart Piece script.
objectNum relates to which global flag to write to.
0 = has not been obtained.
1 = has been obtained.
*/
global.p1HeartPieces+=1
if global.p1HeartPieces=4
{
  var heartCheck;
  heartCheck=0
  for (i=0;i<=global.maxHeartPiece;i+=1)
      if global.heartPiece[i]=1
        heartCheck+=1
  if heartCheck=27
    stringToShow="This is your lucky number 7th set!#Your Max Life increased by 150!"
  else if heartCheck=51
    stringToShow="This is your lucky number 13th set!#Your Max Life increased by 100!#Also, congrats on collecting all the Heart Pieces!"
  else
    stringToShow="Your Max Life increased by 50!"
  messageWidth=string_width(stringToShow)
  newMessage=instance_create(256-(messageWidth/2),48,oMessageSign)
  newMessage.message=stringToShow
  if heartCheck=27
  {
    newMessage.fadingTime=90
    oPlayer1.maxLife+=150
    oPlayer1.life+=150
  }
  else if heartCheck=51
  {
    newMessage.fadingTime=150
    oPlayer1.maxLife+=100
    oPlayer1.life+=100
  }
  else
  {
    newMessage.fadingTime=60
    oPlayer1.maxLife+=50
    oPlayer1.life+=50
  }
  global.p1HeartPieces=0
}
playSound(global.snd_HeartPiece,0,1)
global.heartPiece[objectNum]=1
