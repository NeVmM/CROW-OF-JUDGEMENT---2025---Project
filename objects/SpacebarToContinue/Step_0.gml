// Check for spacebar input
if (roomSwitchEnabled && (keyboard_check_pressed(vk_space) || keyboard_check(vk_space)))
{
    roomSwitchEnabled = false;
	game_restart();
}
