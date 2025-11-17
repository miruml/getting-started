package schemas

@miru(config_type="mobility")

// Mobility Configuration Schema
{
	max_linear_speed_mps: number & >=0.1 & <=5.0 | *1.2

	max_angular_speed_radps: number & >=0.1 & <=3.0 | *1.0

	obstacle_avoidance_enabled: bool | *true

	navigation_mode: "conservative" | "balanced" | "aggressive" | *"balanced"

	telemetry: {
		// Upload interval in seconds
		upload_interval_sec: int & >=10 & <=300 | *60

		// Heartbeat interval in seconds
		heartbeat_interval_sec: int & >=1 & <=60 | *10
	}
}
