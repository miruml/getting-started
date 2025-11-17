package schemas

@miru(config_type="safety")

safety: {
	// Emergency stop deceleration in meters per second squared
	emergency_stop_deceleration_mps2: number & >=0.1 & <=10.0 | *3.0

	// Minimum obstacle distance in meters
	min_obstacle_distance_m: number & >=0.1 & <=1.0 | *0.5

	// Safety timeout in milliseconds
	timeout_ms: int & >=100 & <=10000 | *1000

	speed_limits: {
		// Maximum normal speed in meters per second
		max_speed_normal_mps: number & >=0.1 & <=10.0 | *2.0

		// Maximum reduced speed in meters per second
		max_speed_reduced_mps: number & >=0.1 & <=10.0 | *0.5

		// Maximum manual speed in meters per second
		max_speed_manual_mps: number & >=0.1 & <=10.0 | *1.0
	}

	angular_motion_limits: {
		// Maximum angular velocity in radians per second
		max_angular_velocity_radps: number & >=0.1 & <=10.0 | *1.57

		// Maximum angular acceleration in radians per second squared
		max_angular_acceleration_radps2: number & >=0.1 & <=10.0 | *2.0
	}

	safety_zones: {
		// Critical safety zone distance in meters
		critical_zone_m: number & >=0.1 & <=1.0 | *0.3

		// Warning safety zone distance in meters
		warning_zone_m: number & >=0.1 & <=1.0 | *1.0

		// Scanning safety zone distance in meters
		scanning_zone_m: number & >=0.1 & <=1.0 | *2.0
	}

	system_checks: {
		// Minimum voltage threshold in volts
		voltage_min_v: number & >=0.1 & <=10.0 | *22.0

		// Critical voltage threshold in volts
		voltage_critical_v: number & >=0.1 & <=10.0 | *20.0

		// Maximum temperature threshold in Celsius
		temperature_max_c: number & >=0.1 & <=10.0 | *60.0

		// Watchdog timeout in milliseconds
		watchdog_timeout_ms: int & >=100 & <=10000 | *200
	}

	recovery: {
		// Maximum number of retry attempts
		max_retry_attempts: int & >=1 & <=10 | *3

		// Delay between retry attempts in milliseconds
		retry_delay_ms: int & >=100 & <=10000 | *1000

		// Backoff distance in meters
		backoff_distance_m: number & >=0.1 & <=1.0 | *0.5
	}
}
