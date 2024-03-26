//Cycle through responses

//to change in oText:step with responseSelected = CycleThroughMenu(responses, responseSelected);

function CycleThroughMenu(array, index)

{

	keyUp = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));

	keyDown = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));

	return WrapArrayIndex(array, index + keyDown - keyUp);

}

function WrapArrayIndex(array, index)

{

	var _max = array_length(array) - 1;



	if (index > _max)

		index = 0;

	else if (index < 0)

		index = _max;

	

	return index;

}