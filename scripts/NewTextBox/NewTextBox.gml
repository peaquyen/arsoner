//Shaun's

/// @arg Message
/// @arg Background
/// @arg [Responses]

function NewTextBox(){
	var _obj;
	if (instance_exists(oText)) _obj = oTextQueued; else _obj = oText;
	with (instance_create_layer(0, 0, "Instances", _obj)) //!
	{
		messages = argument[0];
		if (instance_exists(other)) originInstance = other.id else originInstance = noone;
		if (argument_count > 1) background = argument[1]; else background = 1;
		if (argument_count > 2) 
		{
			//trim markers from responses
			_responses = argument[2];
			
			//spisode 11, fix from l2909C8D9_1. while loop
			responses = array_create(array_length(_responses),"");
			_arrayIndex = 0;
			while(_arrayIndex < array_length(_responses))
			{
				responses[_arrayIndex] = string_copy(_responses[_arrayIndex], 1, string_length(_responses[_arrayIndex]));
				_arrayIndex++;
			}
			for (var i = 0; i < array_length(responses); i++)
			{
				var _markerPosition = string_pos(":", responses[i]);
				responseScripts[i] = string_copy(responses[i], 1, _markerPosition - 1);
				responseScripts[i] = real(responseScripts[i]);
				responses[i] = string_delete(responses[i],1,_markerPosition);
			}
		}
		else
		{
			responses = [-1];
			responseScripts = [-1];
		}
	}
	with (oPlayer)
	{
		if (state != PlayerStateLocked)
		{
			lastState = state;
			state = PlayerStateLocked;
		}
	}
}


/* l2909C8D9_2, episode 11

function scr_New_Text_Box(_message, _background, _responses) {
    /// @arg message
    /// @arg background
    /// @arg [responses]

    if (!obj_Player.textBoxDelay) { // Naud van Dalen test - worked!
        var _obj;

        if (instance_exists(obj_Text)) {
            _obj = obj_Text_Queued;
        } else {
            _obj = obj_Text;
        }

        with (instance_create_layer(0, 0, "Instances", _obj)) {
            message = _message;

            if (instance_exists(other)) {
                originInstance = other.id;
            } else {
                originInstance = noone;
            }

            if is_undefined(_background) {
                background = 1;
            } else {
                background = _background;
            }

            if is_undefined(_responses) {
                responses = [-1];
                responseScripts = [-1];
            } else {
                // trim markers from responses
                var _array = _responses; // Bean Stinson test - Worked!
                for (var i = 0; i < array_length(_array); i++) {
                    responses[i] = _array[i];  // Bean Stinson test - Worked!
                    var _markerPosition = string_pos(":", responses[i]);
                    responseScripts[i] = string_copy(responses[i], 1, _markerPosition - 1);
                    responseScripts[i] = real(responseScripts[i]);
                    responses[i] = string_delete(responses[i], 1, _markerPosition);
                    // breakpoint = 10;
                }
            }
        }

        with (obj_Player) {
            if (state != scr_Player_State_Locked) {
                lastState = state;
                state = scr_Player_State_Locked;
            }
        }
    }
}

*/

/**/