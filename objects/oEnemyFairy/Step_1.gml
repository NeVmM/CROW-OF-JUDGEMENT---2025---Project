if (hp <= 0 && !dead)
{
	dead = true;
	
	audio_play_sound(FairyDead, 10, false);
	audio_sound_gain(FairyDead, 1.5, 0); // Optional: Set volume
	
	with(instance_create_layer(x,y,layer,oEnemyFairyDead))
	{
		direction = other.hitfrom;
		xSpeed = lengthdir_x(3, direction);
		ySpeed = lengthdir_y(3, direction);
		
		oPoints.points += 15;
	}
	
	instance_destroy();
}