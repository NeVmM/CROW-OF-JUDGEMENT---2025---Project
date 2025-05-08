// Step Event
if (!variable_instance_exists(id, "timerEnd")) 
{
    timerEnd = 600;
}
timerEnd -= 1;

if (timerEnd <= 0) {
    alarm[0] = 1;
}
