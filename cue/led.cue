package schemas

@miru(config_type="led",instance_filepath="instances/led.json")
{
	// GPIO pin number for LED output
	output_gpio: int & >=0 & <=40 | *12

	// Control pin number for LED
	control_pin: int & >=0 & <=40 | *25

	// PWM frequency in Hertz
	frequency_hz: int & >=1 & <=100000 | *500

	// LED brightness percentage
	brightness_percent: int & >=0 & <=100 | *75
}
