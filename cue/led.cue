@miru(config_type="led",instance_filepath="instances/led.json")
{
	output_gpio: int & >=0 & <=40 | *12
	control_pin: int & >=0 & <=40 | *25
	frequency_hz: int & >=1 & <=100000 | *500
	brightness_percent: int & >=0 & <=100 | *75
}
