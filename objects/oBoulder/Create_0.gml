// Inherit the parent event
event_inherited();

if (global.BoulderDestroyed == 1) //make a global variable in oGame then adjust this variable in the oExplode collision
{
	instance_destroy();
}