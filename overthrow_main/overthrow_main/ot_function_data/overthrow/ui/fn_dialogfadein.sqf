params [["_display",-1]];
if (_display isEqualTo -1) exitWith{("Tried to call a HUD function on a non-indexable display") call BIS_fnc_log;};

{
  _x ctrlSetFade 1;
  _x ctrlCommit 0;
}forEach (allControls _display);

{
  _x ctrlSetFade 0;
  _x ctrlCommit 0.25;
}forEach (allControls _display);
