@miru(config_type="safety")

safety: {
	emergency_stop_deceleration_mps2: number & >=0.1 & <=10.0 | *3.0
	min_obstacle_distance_m: number & >=0.1 & <=1.0 | *0.5
	timeout_ms: int & >=100 & <=10000 | *1000

	speed_limits: {
		max_speed_normal_mps: number & >=0.1 & <=10.0 | *2.0
		max_speed_reduced_mps: number & >=0.1 & <=10.0 | *0.5
		max_speed_manual_mps: number & >=0.1 & <=10.0 | *1.0
	}

	angular_motion_limits: {
		max_angular_velocity_radps: number & >=0.1 & <=10.0 | *1.57
		max_angular_acceleration_radps2: number & >=0.1 & <=10.0 | *2.0
	}

	safety_zones: {
		critical_zone_m: number & >=0.1 & <=1.0 | *0.3
		warning_zone_m: number & >=0.1 & <=1.0 | *1.0
		scanning_zone_m: number & >=0.1 & <=1.0 | *2.0
	}

	system_checks: {
		voltage_min_v: number & >=0.1 & <=10.0 | *22.0
		voltage_critical_v: number & >=0.1 & <=10.0 | *20.0
		temperature_max_c: number & >=0.1 & <=10.0 | *60.0
		watchdog_timeout_ms: int & >=100 & <=10000 | *200
	}

	recovery: {
		max_retry_attempts: int & >=1 & <=10 | *3
		retry_delay_ms: int & >=100 & <=10000 | *1000
		backoff_distance_m: number & >=0.1 & <=1.0 | *0.5
	}
}
