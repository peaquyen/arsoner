function SaveGame(){
	//Create save map
	var _map = ds_map_create();
	_map[? "room"] = room;
	_map[? "playerHealth"] = global.playerHealth;
	_map[? "playerHealthMax"] = global.playerHealthMax;
	_map[? "playerMoney"] = global.playerMoney;
	_map[? "playerItemUnlocked"] = global.playerItemUnlocked; //array
	_map[? "playerAmmo"] = global.playerAmmo; //array
	_map[? "playerEquipped"] = global.playerEquipped;
	_map[? "playerHasAnyItem"] = global.playerHasAnyItems; //tag
	_map[? "targetX"] = global.targetX;
	_map[? "targetY"] = global.targetY;
	//ds_map_add(global.questStatus,) // you cant do this, cuz the questStatus itself is and ds_map, and it needed to save itself. Its kind of id and need to be pointed.
	
	var _questMap = ds_map_create();
	ds_map_copy(_questMap, global.questStatus);
	ds_map_add_map(_map, "questStatus", _questMap);
	 
	 //Save all of this into a string
	 var _string = json_encode(_map);
	 SaveStringToFile("save" + string(global.gameSaveSlot) + ".sav", _string);
	 show_debug_message(_string);
	 
	 //Nuke the data
	 ds_map_destroy(_map); //del everythings, also the nested one!
	 show_debug_message("Game saved!")
}

function SaveStringToFile(_filename, _string)
{
	var _buffer = buffer_create(string_byte_length(_string)+1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);
}