function PlayerStateHook(){
	hSpeed = 0;
	vSpeed = 0;
	
	//If just arriving in this state
	if (sprite_index != sPlayerHook)
	{
		hook = 0;
		hookX = 0; //kind of vector
		hookY = 0;
		hookStatus = HOOKSTATUS.EXTENDING; //statemachine within statemachine?
		hookedEntity = noone;
		
		//Update sprite
		sprite_index = sPlayerHook;
		image_index = CARDINAL_DIR;
		image_speed = 0;
	}
	
	//Extend/Retract hook:
	var _speedHookTemp = speedHook;
	if (hookStatus != HOOKSTATUS.EXTENDING) _speedHookTemp *= -1;
	
	hook += _speedHookTemp;
	switch (image_index)
	{
		case 0: hookX = hook; break;
		case 1: hookY = -hook; break;
		case 2: hookX = -hook; break;
		case 3: hookY = hook; break;
	}
	
	//Hookshot statemachine!
	switch (hookStatus)
	{
		case HOOKSTATUS.EXTENDING:
		{
			//Finish extending
			if (hook >= distanceHook) hookStatus = HOOKSTATUS.MISSED;
			
			//Check for hit
			var _hookHit = collision_circle(x+hookX, y+hookY, 4,pEntity,false,true);
			if ((_hookHit != noone) && (global.iLifted != _hookHit))
			{
				//Act depending on what is hit
				switch (_hookHit.entityHookable)
				{
					default: //not hookable
					{
						//... else potentially harm enemy
						if (object_is_ancestor(_hookHit.object_index,pEnemy))
						{
							HurtEnemy(_hookHit,1,id,5);
							hookStatus = HOOKSTATUS.MISSED;
						}
						else
						{
							if (_hookHit.entityHitScript != -1)
							{
								with (_hookHit) script_execute(entityHitScript)
								hookStatus = HOOKSTATUS.MISSED;
							}
						}
					}break;
					case 1:
					{
						hookStatus = HOOKSTATUS.PULLTOPLAYER;
						hookedEntity = _hookHit;					

					}break;					
					case 2:
					{
						hookStatus = HOOKSTATUS.PULLTOENTITY;
						hookedEntity = _hookHit;
					}break;
				}
			}
		}break;
		
		//Pull the entity towards the hooked player
		case HOOKSTATUS.PULLTOPLAYER:
		{
			with (hookedEntity)
			{
				x = other.x + other.hookX;
				y = other.y + other.hookY;
			}
		}break;
		
		case HOOKSTATUS.PULLTOENTITY:
		{
			//Track the image_index for how long is the hook
			switch (image_index)
			{
				case 0: x += speedHook; break;
				case 1: y -= speedHook; break;
				case 2: x -= speedHook; break;
				case 3: y += speedHook; break;
			}
		}break;
	}
	
	//Finish retract and end state
	if (hook <= 0)
	{
		hookedEntity = noone;
		state = PlayerStateFree;
	}
}