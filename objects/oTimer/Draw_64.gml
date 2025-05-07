var total_ms = (timer / room_speed) * 1000;

var minutes = floor(total_ms div 60000);
var seconds = floor((total_ms mod 60000) div 1000);
var milliseconds = floor((total_ms mod 1000) div 10); // 2-digit ms

var time_string = string_format(minutes, 2, 0) + ":" +
                  string_format(seconds, 2, 0) + ":" +
                  string_format(milliseconds, 2, 0);

draw_set_color(c_white);
draw_text(100, 50, "Time: " + time_string);
