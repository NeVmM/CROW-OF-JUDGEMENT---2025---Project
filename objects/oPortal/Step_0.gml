//fade effect
if (is_fading)
{
	fade_alpha += fade_speed;
	
	if (fade_alpha >= 1)
	{
		room_goto(target_room); //variable set to "target_room"
		fade_alpha = 1;
		is_fading = false;
	}
}
else if (fade_alpha > 0)
{
	fade_alpha -= fade_speed; //decrements speed
	if (fade_alpha < 0) fade_alpha = 0;
}

image_alpha = 1; //sets oPortal Sprite Invisible