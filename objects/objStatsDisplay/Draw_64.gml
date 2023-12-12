/// @description Insert description here
// You can write your code in this editor

var _string = "";
for(var i = 0; i < array_length(stats); i++) {
	var _val = stats[i];
	_string += string("{0}: {1}\n", _val[0], string_format(_val[1], 5, 4));
}

draw_set_color(c_black);
draw_text(0, 0, _string);


//Clear the stats out for next frame
stats = [];