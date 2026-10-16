/*
This script is called in the enemy ship create event.
It is used to alter enemy point value on the different difficulty settings.
argument0: difficulty setting
*/
var adjustCurve,tempAdjust;
if argument0=1 //Beginner
{
  adjustCurve=0.1
  tempAdjust=pointValue*adjustCurve
  pointValue-=round(tempAdjust)
}
else if argument0=3 //Hardcore
{
  adjustCurve=0.1
  tempAdjust=pointValue*adjustCurve
  pointValue+=round(tempAdjust)
}
else if argument0=4 //Distorted
{
  adjustCurve=0.2
  tempAdjust=pointValue*adjustCurve
  pointValue+=round(tempAdjust)
}
