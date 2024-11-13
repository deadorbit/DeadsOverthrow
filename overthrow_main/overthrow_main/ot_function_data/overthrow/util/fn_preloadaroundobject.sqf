params [["_target", objNull]];
if !(canSuspend) exitWith {};

private _cam = "camera" camCreate (_target selectionPosition "camera");

for "_i" from 0 to 359 do {
	_cam setDir _i;
	_cam camPrepareFov 0.25;
	_cam camPreload 0;
	waitUntil {camPreloaded _cam};
};
camDestroy _cam;