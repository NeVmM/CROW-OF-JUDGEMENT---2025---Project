if pause == true
{
	draw_set_alpha(0.6);
	draw_rectangle_color(0,0, 5000, 5000, c_black, c_black, c_black, c_black, 0);	
	draw_set_alpha(1);
	// Get GUI screen size
	var screenW = display_get_gui_width();
	var screenH = display_get_gui_height();

// Calculate center of the screen
	var centerX = screenW / 2 ;
	var centerY = screenH / 2 ;

	// Draw the sprite at screen center
	draw_sprite(sPaused, 0, centerX, centerY);

}
