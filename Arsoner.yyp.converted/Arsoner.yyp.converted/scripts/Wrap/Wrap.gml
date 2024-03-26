function Wrap(_value, _max, _min = 0) {

	if (_value > _max) {

		return _min;

	} else if (_value < _min) {

		return _max;

	} else { 

		return _value;

	}

}
