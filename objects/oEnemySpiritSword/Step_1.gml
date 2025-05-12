if (hp <= 0 && !dead)
{
	dead = true;
	
	audio_play_sound(SpiritSwordDead, 10, false);
	audio_sound_gain(SpiritSwordDead, 1.5, 0); // Optional: Set volume
	
	
	with(instance_create_layer(x,y,layer,oEnemySpiritSwordDead))
	{
		direction = other.hitfrom;
		xSpeed = lengthdir_x(3, direction);
		ySpeed = lengthdir_y(3, direction);
		
		oPoints.points += 100;
	}
	
	instance_destroy();
}