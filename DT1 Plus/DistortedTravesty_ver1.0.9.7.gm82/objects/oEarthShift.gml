#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
viscidTop=1
makeActive()
setCollisionBounds(-15,-15,15,15)
image_alpha=0
global.recSpellsConnected+=1
bDestroy=false
if oPlayer1.image_xscale=1
  x+=32
else
  x-=32
y-=17
weight=50
lifeTime=450
maxVel=4
esTickX=x //earth shift landing change (added): its x when the current tick began (Step)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if global.gamePaused=false
if global.gamePaused=false and gDeltaDoTicks //60fps change: its logic runs once per 30fps tick (every frame at 30fps), on the tick's last frame: the platform engine (gameStepEvent) reads xVel/yVel once a tick and makes the tick's move over the frames, so here it's where it is at 30fps
{
  if bDestroy=false
  {
    if image_alpha<1
      image_alpha+=0.1
    if image_alpha>=1
    {
      if xVel>maxVel
        xVel=maxVel
      else if xVel<-maxVel
        xVel=-maxVel
      if xVel>0
        xVel-=0.05
      else if xVel<0
        xVel+=0.05
      var tFall,tD,tK,tX; //earth shift landing change (added): see below
      tFall=yVel //earth shift landing change (added): this tick's fall (the platform engine moved it by about that)
      yVel+=0.2
      //if isCollisionBottom(1)
      //  yVel=0
      if isCollisionBottom(1) //earth shift landing change: as before, with the two additions below
      {
        yVel=0
        //earth shift landing change (added): a fall that still ended inside the ground (it landed while being blown onto
        //a rise, or the ground moved) is taken back up to rest on top, by the platform engine (which carries the player
        //along). Wedged into a wall, it stays where it is: one wedged from the start never falls; one blown into a wall
        //this tick is clear of it where the tick began (esTickX), and one with no room within this tick's fall above it
        //isn't moved
        if tFall>0 and isCollisionSolid()
        {
          tX=x; x=esTickX; tD=isCollisionSolid(); x=tX //still inside at this height without the tick's sideways move?
          if tD
          {
            tD=0
            for(tK=1;tK<=ceil(tFall);tK+=1)
            {
              y-=1
              if !isCollisionSolid() {tD=tK; break}
            }
            y+=min(tK,ceil(tFall)) //back where it is: that was only a look
            if tD>0 {yVel=-tD}
          }
        }
      }
      else if yVel>0
      {
        //earth shift landing change (added): the platform engine moves it a whole tick's fall at once without looking
        //for the ground, so a fast fall (from high up) sank up to 6px into it at every frame rate, as in the original
        //game, and sunk in by a ledge or step, its side checks below made it bounce in place instead of being blown
        //along. When next tick's fall would reach the ground, it's cut to end resting on top
        for(tD=2;tD<=ceil(yVel);tD+=1) {if isCollisionBottom(tD) break}
        if tD<=ceil(yVel) {yVel=tD-1}
      }
      if isCollisionLeft(1)
        xVel*=-1
      if isCollisionRight(1)
        xVel*=-1
      if lifeTime<=0
      {
        bDestroy=true
        image_alpha=1
      }
      else
        lifeTime-=1
      if y>room_height+24
        instance_destroy()
    }
  }
  else
  {
    image_alpha-=0.1
    if image_alpha<=0
      instance_destroy()
  }
  esTickX=x //earth shift landing change (added): where the next tick begins (see above)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
