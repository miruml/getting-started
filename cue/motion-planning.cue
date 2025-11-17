package schemas

@miru(config_type="motion-planning")

// Motion Planning Configuration Schema
#MotionPlanning: {
	// Planning loop frequency in Hertz
	planning_frequency_hz: number & >=1.0 & <=100.0 | *20.0

	// Control loop frequency in Hertz
	control_frequency_hz: number & >=10.0 & <=200.0 | *50.0

	// Planning timeout in seconds
	planning_timeout_s: number & >=0.1 & <=5.0 | *1.0

	path_following: {
		// Look-ahead distance in meters
		lookahead_distance_m: number & >=0.1 & <=2.0 | *0.3

		// Look-ahead time in seconds
		lookahead_time_s: number & >=0.1 & <=2.0 | *0.5

		// Path following tolerance in meters
		path_tolerance_m: number & >=0.01 & <=0.5 | *0.05

		// Goal reaching tolerance in meters
		goal_tolerance_m: number & >=0.01 & <=0.5 | *0.1

		// Heading tolerance in radians
		heading_tolerance_rad: number & >=0.01 & <=0.5 | *0.05

		// Minimum look-ahead distance in meters
		min_lookahead_distance_m: number & >=0.05 & <=1.0 | *0.1

		// Maximum look-ahead distance in meters
		max_lookahead_distance_m: number & >=0.2 & <=5.0 | *0.5
	}

	trajectory: {
		// Maximum path velocity in meters per second
		max_path_velocity_mps: number & >=0.2 & <=5.0 | *1.5

		// Minimum path velocity in meters per second
		min_path_velocity_mps: number & >=0.05 & <=0.5 | *0.1

		// Path acceleration in meters per second squared
		path_acceleration_mps2: number & >=0.1 & <=3.0 | *1.0

		// Path deceleration in meters per second squared
		path_deceleration_mps2: number & >=0.1 & <=4.0 | *1.2

		// Maximum centripetal acceleration in meters per second squared
		max_centripetal_acceleration_mps2: number & >=0.1 & <=2.0 | *0.5

		// Path jerk in meters per second cubed
		path_jerk_mps3: number & >=0.1 & <=5.0 | *0.5
	}

	local_planner: {
		// Minimum number of samples
		min_samples: int & >=5 & <=100 | *10

		// Maximum number of samples
		max_samples: int & >=10 & <=500 | *50

		// Sampling time in seconds
		sampling_time_s: number & >=0.1 & <=2.0 | *0.8

		// Resolution in meters
		resolution_m: number & >=0.01 & <=0.5 | *0.05

		// Planning horizon in meters
		horizon_m: number & >=0.5 & <=10.0 | *2.0
	}

	global_planner: {
		// Grid resolution in meters
		grid_resolution_m: number & >=0.01 & <=0.5 | *0.1

		// Inflation radius in meters
		inflation_radius_m: number & >=0.1 & <=2.0 | *0.5

		// Cost scaling factor
		cost_scaling_factor: number & >=0.1 & <=10.0 | *2.0

		// Lethal cost value
		lethal_cost_value: int & >=100 & <=255 | *253

		// Neutral cost value
		neutral_cost_value: int & >=0 & <=100 | *50
	}

	obstacle_avoidance: {
		// Minimum obstacle distance in meters
		min_obstacle_distance_m: number & >=0.1 & <=1.0 | *0.5

		// Maximum obstacle distance in meters
		max_obstacle_distance_m: number & >=0.5 & <=5.0 | *2.0

		// Obstacle inflation in meters
		obstacle_inflation_m: number & >=0.05 & <=1.0 | *0.2

		// Dynamic obstacle velocity threshold in meters per second
		dynamic_obstacle_velocity_threshold_mps: number & >=0.05 & <=2.0 | *0.2
	}

	smoothing: {
		// Curve weight for smoothing
		curve_weight: number & >=0.0 & <=1.0 | *0.3

		// Smooth weight for smoothing
		smooth_weight: number & >=0.0 & <=1.0 | *0.3

		// Smoothing tolerance
		tolerance: number & >=0.0001 & <=0.1 | *0.01

		// Maximum smoothing iterations
		max_iterations: int & >=5 & <=1000 | *10
	}

	recovery: {
		// Enable backoff recovery behavior
		enable_backoff: bool | *true

		// Backoff distance in meters
		backoff_distance_m: number & >=0.1 & <=2.0 | *0.3

		// Enable rotation in place recovery
		enable_rotation_in_place: bool | *true

		// Maximum rotation angle in radians (2π ≈ 6.28318)
		max_rotation_angle_rad: number & >=0.1 & <=6.28318 | *1.57

		// Clear costmap before recovery attempt
		clear_costmap_before_recovery: bool | *true
	}
}
