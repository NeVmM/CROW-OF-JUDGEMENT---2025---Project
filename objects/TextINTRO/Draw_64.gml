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
"When Heaven and Hell clashed, the Overworld trembled. \nAngels and demons waged war above the mortal realm, \ntheir divine and infernal wrath tearing through cities, forests, and skies. \nIn the aftermath, balance shattered, chaos reigned, and life as it was known began to decay. \nCaught in the crossfire, a lone crow perished - a silent witness to divine carnage. \nFrom the ashes of the broken world, he breathed new purpose into the fallen bird. \nReborn from the ashes and shadow, the crow now serves a new master. \n\n\n\n  You are his blade. His will. His reckoning.";

// Draw white text with padding and spacing
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text_ext(bar_x + padding, bar_y + padding, display_text, line_spacing, max_line_width);
