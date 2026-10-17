#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
tileAlpha=1
tileFadeTime=0
if room=rDilutedMansion2
{
  fadingTiles[0]=tile_add(tileDilutedMansion,16,0,32,48,352,272,1000000)
  fadingTiles[1]=tile_add(tileDilutedMansion,16,16,32,32,352,320,1000000)
  fadingTiles[2]=tile_add(tileDilutedMansion,16,16,32,32,352,352,1000000)

  fadingTiles[3]=tile_add(tileDilutedMansion,16,16,32,32,544,352,1000000)
  fadingTiles[4]=tile_add(tileDilutedMansion,16,16,32,32,544,320,1000000)
  fadingTiles[5]=tile_add(tileDilutedMansion,16,16,32,32,544,288,1000000)
  fadingTiles[6]=tile_add(tileDilutedMansion,208,16,16,32,544,256,1000000)
  fadingTiles[7]=tile_add(tileDilutedMansion,208,16,16,32,560,240,1000000)
  fadingTiles[24]=tile_add(tileDilutedMansion,16,16,16,16,560,272,1000000)

  fadingTiles[8]=tile_add(tileDilutedMansion,16,0,32,48,704,240,1000000)
  fadingTiles[9]=tile_add(tileDilutedMansion,16,16,32,32,704,288,1000000)
  fadingTiles[10]=tile_add(tileDilutedMansion,16,16,32,32,704,320,1000000)
  fadingTiles[11]=tile_add(tileDilutedMansion,16,16,32,32,704,352,1000000)

  fadingTiles[12]=tile_add(tileDilutedMansion,16,0,32,48,736,240,1000000)
  fadingTiles[13]=tile_add(tileDilutedMansion,16,16,32,32,736,288,1000000)
  fadingTiles[14]=tile_add(tileDilutedMansion,16,16,32,32,736,320,1000000)
  fadingTiles[15]=tile_add(tileDilutedMansion,16,16,32,32,736,352,1000000)

  fadingTiles[16]=tile_add(tileDilutedMansion,0,16,48,32,992,176,1000000)
  fadingTiles[17]=tile_add(tileDilutedMansion,0,16,48,32,992,208,1000000)
  fadingTiles[18]=tile_add(tileDilutedMansion,16,16,32,32,1040,176,1000000)
  fadingTiles[19]=tile_add(tileDilutedMansion,16,16,32,32,1040,208,1000000)
  fadingTiles[20]=tile_add(tileDilutedMansion,16,16,48,32,1072,176,1000000)
  fadingTiles[21]=tile_add(tileDilutedMansion,16,16,48,32,1072,208,1000000)
  fadingTiles[22]=tile_add(tileDilutedMansion,80,16,16,16,992,240,1000000)
  fadingTiles[23]=tile_add(tileDilutedMansion,64,16,16,16,1104,240,1000000)

  fadingTiles[25]=tile_add(tileDilutedMansion,16,0,32,48,1472,272,1000000)
  fadingTiles[26]=tile_add(tileDilutedMansion,16,16,32,32,1472,320,1000000)
  fadingTiles[27]=tile_add(tileDilutedMansion,16,16,32,32,1472,352,1000000)

  fadingTiles[28]=tile_add(tileDilutedMansion,16,0,32,48,1568,272,1000000)
  fadingTiles[29]=tile_add(tileDilutedMansion,16,16,32,32,1568,320,1000000)
  fadingTiles[30]=tile_add(tileDilutedMansion,16,16,32,32,1568,352,1000000)

  fadingTiles[31]=tile_add(tileDilutedMansion,16,0,32,48,1632,272,1000000)
  fadingTiles[32]=tile_add(tileDilutedMansion,16,16,32,32,1632,320,1000000)
  fadingTiles[33]=tile_add(tileDilutedMansion,16,16,32,32,1632,352,1000000)

  fadingTiles[34]=tile_add(tileDilutedMansion,16,0,32,48,1696,272,1000000)
  fadingTiles[35]=tile_add(tileDilutedMansion,16,16,32,32,1696,320,1000000)
  fadingTiles[36]=tile_add(tileDilutedMansion,16,16,32,32,1696,352,1000000)

  fadingTiles[37]=tile_add(tileDilutedMansion,16,0,32,48,1824,272,1000000)
  fadingTiles[38]=tile_add(tileDilutedMansion,16,16,32,32,1824,320,1000000)
  fadingTiles[39]=tile_add(tileDilutedMansion,16,16,32,32,1824,352,1000000)
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if room=rDilutedMansion2
  {
    //tileFadeTime+=1
    tileFadeTime+=gDeltaTime //60fps change: counts 30fps ticks
    //if tileFadeTime>=11 and tileFadeTime<=30
    if tileFadeTime>10 and tileFadeTime<=30 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
      //tileAlpha-=0.05
      tileAlpha-=0.05*gDeltaTime //60fps change: per 30fps tick
    //else if tileFadeTime>=31 and tileFadeTime<=50
    else if tileFadeTime>30 and tileFadeTime<=50 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
      //tileAlpha+=0.05
      tileAlpha+=0.05*gDeltaTime //60fps change: per 30fps tick
    else if tileFadeTime>=131
      tileFadeTime=0
    for (i=0;i<=39;i+=1)
      tile_set_alpha(fadingTiles[i],tileAlpha)
  }
}
