/// @description Attack Picker
var ran = irandom_range(pickerMin, pickerMax);
if (ran < 50) {
	atk = HIGH;
	alarm_set(1, windupMax);
} else {
	atk = LOW;
	alarm_set(2, windupMax);
}