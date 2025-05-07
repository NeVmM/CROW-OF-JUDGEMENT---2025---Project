with (other)
{
	hp--;
	health -= 0.3;
	
	with (oCamera)
	{
		shake_amount = 1.5; // How intense the shake is
		shake_timer = 10;
	}
}