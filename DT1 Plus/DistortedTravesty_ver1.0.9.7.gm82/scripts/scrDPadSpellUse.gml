/*
dpad spells change (added): called by characterStepEvent instead of playerTechUse(argument0) (1: technique, 2: spell).
With DPad Spells on, the technique / spell on the box of the direction held (scrDPadSpellPick) is used instead of the
equipped one, which is put back right after: the cast keeps what it needs itself (attackState, global.castedSpell).
*/
var tOld,tPick;
if global.optDPadSpells=0 {playerTechUse(argument0); exit}
if argument0=1
{
  tPick=scrDPadSpellPick(0,kUp,kDown,kLeft,kRight)
  if tPick="" {playerTechUse(1); exit}
  tOld=global.p1TechniqueEquip
  global.p1TechniqueEquip=tPick
  playerTechUse(1)
  global.p1TechniqueEquip=tOld
}
else
{
  if global.p1CurrentElement=0 {playerTechUse(2); exit} //no element: no spell, as before
  tPick=scrDPadSpellPick(global.p1CurrentElement,kUp,kDown,kLeft,kRight)
  if tPick="" {playerTechUse(2); exit}
  tOld=global.p1SpellEquip
  global.p1SpellEquip=tPick
  playerTechUse(2)
  global.p1SpellEquip=tOld
}
