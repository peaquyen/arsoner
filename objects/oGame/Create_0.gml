/// @desc Initialise & Globals
randomize();

global.gameSaveSlot = 0;

global.gamePaused = false;
global.textSpeed = 0.75;

global.targetX = -1
global.targetY = -1;
global.targetDirection = 0;
global.playerHealthMax = 3;
global.playerHealth = global.playerHealthMax;
global.playerMoney = 1000;

//Items
global.playerHasAnyItems = false;
global.playerEquipped = ITEM.BOMB; //just change to ITEM.BOW
global.playerAmmo = array_create(ITEM.TYPE_COUNT, -1); //can change array, later test it pls
global.playerItemUnlocked = array_create(ITEM.TYPE_COUNT, false);
global.playerAmmo[ITEM.BOMB] = 0;
global.playerAmmo[ITEM.BOW] = 0;

//Item Unlocks for testing
/*
global.playerItemUnlocked[ITEM.BOMB] = true;
global.playerItemUnlocked[ITEM.BOW] = true; 
global.playerItemUnlocked[ITEM.HOOK] = true; 
global.playerHasAnyItems = true;
global.playerAmmo[ITEM.BOMB] = 100;
global.playerAmmo[ITEM.BOW] = 100;
*/

global.BoulderDestroyed = -1;
global.questStatus = ds_map_create();
global.questStatus[? "TheHatQuest"] = 0;

global.iLifted = noone;
global.iCamera = instance_create_layer(0,0,layer,oCamera);
global.iUI = instance_create_layer(0,0,layer,oUI);


surface_resize(application_surface,	RESOLUTION_W, RESOLUTION_H); 

room_goto(ROOM_START);
