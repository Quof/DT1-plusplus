#define 30
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
newEnemy=instance_create(576,192,oTRider)
newEnemy.bActive=true
newEnemy.questType=1
newEnemy=instance_create(-64,208,oTRider)
newEnemy.bActive=true
newEnemy.questType=1
#define 185
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
newEnemy=instance_create(320,-32,oShellCrawler)
newEnemy.bActive=true
newEnemy.questType=1
#define 375
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
newEnemy=instance_create(144,176,oSpinningCrazedHead)
newEnemy.bActive=true
newEnemy.questType=1
effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
newEnemy=instance_create(368,176,oSpinningCrazedHead)
newEnemy.bActive=true
newEnemy.questType=1
effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
#define 565
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
newEnemy=instance_create(144,-8,oGreenParatroopa)
newEnemy.bActive=true
newEnemy.questType=1
newEnemy=instance_create(368,-8,oGreenParatroopa)
newEnemy.bActive=true
newEnemy.questType=1
#define 585
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
newEnemy=instance_create(144,-8,oGreenParatroopa)
newEnemy.bActive=true
newEnemy.questType=1
newEnemy=instance_create(368,-8,oGreenParatroopa)
newEnemy.bActive=true
newEnemy.questType=1
#define 605
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
newEnemy=instance_create(144,-8,oGreenParatroopa)
newEnemy.bActive=true
newEnemy.questType=1
newEnemy=instance_create(368,-8,oGreenParatroopa)
newEnemy.bActive=true
newEnemy.questType=1
#define 740
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var xPos, yPos;
xPos=544
yPos=288
for(i=0;i<4;i+=1)
{
  newEnemy=instance_create(xPos,yPos,oBulletBill)
  newEnemy.bActive=true
  newEnemy.questType=1
  yPos-=16
}
xPos=-16
yPos=288
for(i=0;i<4;i+=1)
{
  newEnemy=instance_create(xPos,yPos,oBulletBill)
  newEnemy.bActive=true
  newEnemy.questType=1
  yPos-=16
}
#define 1080
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
newEnemy=instance_create(144,-8,oSpearGuard)
newEnemy.bActive=true
newEnemy.questType=1
newEnemy=instance_create(368,-8,oSpearGuard)
newEnemy.bActive=true
newEnemy.questType=1
#define 1230
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var yPos;
yPos=176
newEnemy=instance_create(144,yPos,oScarfy)
newEnemy.bActive=true
newEnemy.questType=1
effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
newEnemy=instance_create(368,yPos,oScarfy)
newEnemy.bActive=true
newEnemy.questType=1
effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
#define 1250
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var yPos;
yPos=176
newEnemy=instance_create(176,yPos,oScarfy)
newEnemy.bActive=true
newEnemy.questType=1
effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
newEnemy=instance_create(336,yPos,oScarfy)
newEnemy.bActive=true
newEnemy.questType=1
effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
#define 1270
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var yPos;
yPos=176
newEnemy=instance_create(240,yPos,oScarfy)
newEnemy.bActive=true
newEnemy.questType=1
effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
newEnemy=instance_create(272,yPos,oScarfy)
newEnemy.bActive=true
newEnemy.questType=1
effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
#define 1540
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var yPos;
yPos=-8
newEnemy=instance_create(160,yPos,oBomber)
newEnemy.bActive=true
newEnemy.questType=1
#define 1550
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var yPos;
yPos=-8
newEnemy=instance_create(352,yPos,oBomber)
newEnemy.bActive=true
newEnemy.questType=1
#define 1590
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var yPos;
yPos=-8
newEnemy=instance_create(176,yPos,oBomber)
newEnemy.bActive=true
newEnemy.questType=1
#define 1600
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var yPos;
yPos=-8
newEnemy=instance_create(336,yPos,oBomber)
newEnemy.bActive=true
newEnemy.questType=1
#define 1740
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
newEnemy=instance_create(576,208,oTRider)
newEnemy.bActive=true
newEnemy.questType=1
#define 1780
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
newEnemy=instance_create(-64,208,oTRider)
newEnemy.bActive=true
newEnemy.questType=1
#define 1920
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
newEnemy=instance_create(576,208,oTRider)
newEnemy.bActive=true
newEnemy.questType=1
#define 1960
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
newEnemy=instance_create(-64,208,oTRider)
newEnemy.bActive=true
newEnemy.questType=1
#define 2110
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
newEnemy=instance_create(-16,288,oBulletBill)
newEnemy.bActive=true
newEnemy.questType=1
newEnemy=instance_create(544,240,oBulletBill)
newEnemy.bActive=true
newEnemy.questType=1
#define 2125
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
newEnemy=instance_create(-16,272,oBulletBill)
newEnemy.bActive=true
newEnemy.questType=1
newEnemy=instance_create(544,256,oBulletBill)
newEnemy.bActive=true
newEnemy.questType=1
#define 2140
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
newEnemy=instance_create(-16,256,oBulletBill)
newEnemy.bActive=true
newEnemy.questType=1
newEnemy=instance_create(544,272,oBulletBill)
newEnemy.bActive=true
newEnemy.questType=1
#define 2155
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
newEnemy=instance_create(-16,240,oBulletBill)
newEnemy.bActive=true
newEnemy.questType=1
newEnemy=instance_create(544,288,oBulletBill)
newEnemy.bActive=true
newEnemy.questType=1
#define 2220
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var yPos;
yPos=144
newEnemy=instance_create(176,yPos,oScarfy)
newEnemy.bActive=true
newEnemy.questType=1
effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
newEnemy=instance_create(256,yPos,oScarfy)
newEnemy.bActive=true
newEnemy.questType=1
effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
newEnemy=instance_create(336,yPos,oScarfy)
newEnemy.bActive=true
newEnemy.questType=1
effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
#define 2300
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
newEnemy=instance_create(256,32,oTSentinel)
newEnemy.bActive=true
newEnemy.questType=1
effect_create_above(ef_ring,newEnemy.x,newEnemy.y,1,c_black)
