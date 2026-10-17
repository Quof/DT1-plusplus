#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//gamepad change (added): reads the gamepad for the whole game (persistent; made in rIntro's creation code). Ported
//from DT3's oKeyCodesHighFPS: scrGamepadInit explains the controls, scrGamepadPoll reads the pad
if instance_number(oGamepad)>1 {instance_destroy(); exit}
scrGamepadInit()
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//gamepad change (added): read the gamepad once per frame, before any Step event asks for it (scrPadHeld/scrPadPressed)
scrGamepadPoll()
