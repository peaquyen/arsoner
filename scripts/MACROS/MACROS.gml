//converse at compile time
#macro FRAME_RATE 60
#macro TILE_SIZE 16
#macro CARDINAL_DIR round(direction/90)
#macro ROOM_START rTitle

#macro RESOLUTION_W 320
#macro RESOLUTION_H 180

#macro TRANSITION_SPEED 0.02 //speed of transition effect
#macro OUT 0
#macro IN 1

enum ENEMYSTATE
{
	IDLE,
	WANDER,
	CHASE,
	ATTACK,
	HURT,
	DIE,
	WAIT
}

enum ITEM //diff items in the games
{
	NONE,
	BOMB,
	BOW,
	HOOK,
	
	TYPE_COUNT
}

enum HOOKSTATUS //statemachine for hook
{
	EXTENDING,
	PULLTOPLAYER,
	PULLTOENTITY,
	MISSED
}