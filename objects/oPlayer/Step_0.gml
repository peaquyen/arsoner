//Get Player Input
keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
keyUp = keyboard_check(vk_up) || keyboard_check(ord("W"));
keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"));
keyActivate = keyboard_check_pressed(vk_space);
keyAttack = keyboard_check_pressed(vk_shift);
keyItem = keyboard_check_pressed(vk_control);
keyItemSelectUp = keyboard_check_pressed(ord("E"));
keyItemSelectDown = keyboard_check_pressed(ord("Q"));

inputDirection = point_direction(0,0,keyRight-keyLeft,keyDown-keyUp);
inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp != 0); //Animate?


if (!global.gamePaused) 
{
	script_execute(state);
	invulnerable = max(invulnerable-1.0);
	flash = max(flash-0.05,0);
}

depth = -bbox_bottom;
/*old code
	x = global.targetX;
	y = global.targetY;
*/


if (global.targetX == -1||global.targetY == -1){ //game create
	global.targetX = x;
	global.targetY = y;
	activatePos = 0;
} else if (activatePos == 1 && (global.targetX != x||global.targetY != y)){
	x = global.targetX;
	y = global.targetY;
	activatePos = 0;
} else {
	global.targetX = x;
	global.targetY = y;
}