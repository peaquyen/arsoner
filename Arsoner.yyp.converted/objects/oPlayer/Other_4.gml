/// @description recreate position of player (derail Shaun)
if (global.targetX != -1)
{
	x = global.targetX;
	y = global.targetY;
	direction = global.targetDirection;
	collisionMap = layer_tilemap_get_id(layer_get_id("Col"));
}