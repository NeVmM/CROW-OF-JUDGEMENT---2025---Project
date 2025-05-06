// Dimensions and position
var bar_x = 650;
var bar_y = 150;
var bar_width = 700;
var bar_height = 300;
var padding = 10;
var line_spacing = 30; // You can adjust this for more/less space
var max_line_width = bar_width - padding * 2;

// Set font
draw_set_font(fnt_text);

// Draw black rectangle (background)
draw_set_color(c_black);
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false);

// Display text
var display_text = 
"When the chaos faded, the crow remained. No longer just Death's servant \n but a fragment of him. A silent guardian between realms, watching where gods once warred. \n\n\n He is no hero. No king. \n\n He is balance - living, eternal, and unshaken. \n\n\n Where disorder rises, so will he. \n\n Not to rule, but to restore.";

// Draw white text with padding and spacing
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text_ext(bar_x + padding, bar_y + padding, display_text, line_spacing, max_line_width);
