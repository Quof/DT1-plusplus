/*
pad hints change (added): draws a menu hint like draw_text (# starts a new line), lined up on x by argument3. While the
gamepad is what's being used (global.gpLastUsed: scrGamepadPoll), its [key] tokens are drawn as the icons (sKeyPressPad,
from DT3) of the gamepad buttons that do the same (scrHintIcon); otherwise the text is drawn as written. Sets halign to
argument3.
argument0: x
argument1: y
argument2: text
argument3: fa_left, fa_center or fa_right
argument4: 1 to draw the icons, 0 for a shadow's passes (the text only, with room left for the icons; scrDrawHintShadow)
*/
var tX,tY,s,tA,tIcons,L,i,ch,n,cur,line,tLH,k,r,name,p,q,tPart,j,ox,tAlpha,lineW,uT,uS,uW,uF,uL,uX;
tX=argument0
tY=argument1
s=argument2
tA=argument3
tIcons=argument4
draw_set_halign(tA)
if global.gpLastUsed!=1 or string_pos("[",s)=0 {draw_text(tX,tY,s); exit}

//---------- Pieces on their lines: text (0) or an icon (1) ----------
tLH=string_height("M")
n=0
cur=""
line=0
lineW[0]=0
i=1
L=string_length(s)
while i<=L
{
  ch=string_char_at(s,i)
  if ch="#"
  {
    if cur!="" {uT[n]=0; uS[n]=cur; uW[n]=string_width(cur); uL[n]=line; uX[n]=lineW[line]; lineW[line]+=uW[n]; n+=1; cur=""}
    line+=1
    lineW[line]=0
    i+=1
    continue
  }
  if ch="["
  {
    r=string_copy(s,i+1,L-i)
    k=string_pos("]",r)
    if k>0
    {
      name=string_copy(r,1,k-1)
      p=string_pos(" or ",name) //two keys ([U or I])
      if scrHintIcon(name)>=0 or (p>0 and scrHintIcon(string_copy(name,1,p-1))>=0 and scrHintIcon(string_copy(name,p+4,string_length(name)-p-3))>=0)
      {
        if cur!="" {uT[n]=0; uS[n]=cur; uW[n]=string_width(cur); uL[n]=line; uX[n]=lineW[line]; lineW[line]+=uW[n]; n+=1; cur=""}
        for(q=0;q<2;q+=1)
        {
          if p=0 {tPart=name}
          else if q=0 {tPart=string_copy(name,1,p-1)}
          else {tPart=string_copy(name,p+4,string_length(name)-p-3)}
          if q=1 {uT[n]=0; uS[n]=" or "; uW[n]=string_width(" or "); uL[n]=line; uX[n]=lineW[line]; lineW[line]+=uW[n]; n+=1}
          uT[n]=1; uF[n]=scrHintIcon(tPart); uW[n]=11; uL[n]=line; uX[n]=lineW[line]; lineW[line]+=11; n+=1 //9 wide, a pixel either side
          if p=0 {break}
        }
        i+=k+1
        continue
      }
    }
  }
  cur+=ch
  i+=1
}
if cur!="" {uT[n]=0; uS[n]=cur; uW[n]=string_width(cur); uL[n]=line; uX[n]=lineW[line]; lineW[line]+=uW[n]; n+=1}

//---------- Draw ----------
tAlpha=draw_get_alpha()
draw_set_halign(fa_left)
for(j=0;j<n;j+=1)
{
  if tA=fa_center {ox=floor(tX-lineW[uL[j]]/2)}
  else if tA=fa_right {ox=floor(tX-lineW[uL[j]])}
  else {ox=tX}
  if uT[j]=0 {draw_text(ox+uX[j],tY+uL[j]*tLH,uS[j])}
  else if tIcons {draw_sprite_ext(sKeyPressPad,uF[j],ox+uX[j]+5,tY+uL[j]*tLH+floor(tLH/2),1,1,0,c_white,tAlpha)}
}
draw_set_halign(tA)
