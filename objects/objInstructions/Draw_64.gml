/// @description Insert description here
// You can write your code in this editor


var _instructions = "Move: Arrow Keys / E-Brake: Spacebar";
draw_set_font(fntDisplay);

var _x = display_get_gui_width() - string_width(_instructions);

draw_text(_x, 0, _instructions);







