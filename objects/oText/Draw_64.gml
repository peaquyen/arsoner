/// @description Draw Textbox
//draw_sprite_stretched(sTextBoxBg, background, x1, y1, x2 - x1, y2 - y1);
NineSliceBoxStretched(sTextBoxBg, x1, y1, x2, y2, background);
draw_set_font(fText);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_black);

var _print = string_copy(messages, 1, textProgress);

if (responses[0] != -1) && (textProgress >= string_length(messages))
{
	for (var i = 0; i < array_length(responses); i++)
	{
		_print += "\n";
		if (i == responseSelected) _print += "> ";
		_print += responses[i];
		if (i == responseSelected) _print += " <";
	}
}
//draw the text
draw_text_ext((x1+x2)/2, y1+8, _print, 15,(RESOLUTION_W-20));
draw_set_color(c_white);
draw_text_ext((x1+x2)/2, y1+7, _print, 15,(RESOLUTION_W-20));