// Dimensions and position
var bar_x = 495;
var bar_y = 265;
var bar_width = 700;
var bar_height = 300;
var padding = 10;
var line_spacing = 40; // You can adjust this for more/less space
var max_line_width = bar_width - padding * 2;

// Set font
draw_set_font(fnt_text2);


// Display text
var display_text = 
"BSIT (GD)";

// Draw white text with padding and spacing
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_ext(bar_x + padding, bar_y + padding, display_text, line_spacing, max_line_width +5);
