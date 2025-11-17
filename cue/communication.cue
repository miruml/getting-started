package schemas

@miru(config_type="communication")
{
	// Control loop frequency in Hertz
	control_loop_rate_hz: int & >=1 & <=1000 | *50

	// Watchdog timeout duration in milliseconds
	watchdog_timeout_ms: int & >=100 & <=5000 | *500

	network: {
		// Maximum acceptable network latency in milliseconds
		max_latency_ms: int & >=10 & <=1000 | *100

		// Connection timeout duration in milliseconds
		connection_timeout_ms: int & >=100 & <=10000 | *2000

		// Number of reconnection attempts
		reconnect_attempts: int & >=1 & <=10 | *3

		// Interval between reconnection attempts in milliseconds
		reconnect_interval_ms: int & >=100 & <=5000 | *1000

		// Interval between heartbeat messages in milliseconds
		heartbeat_interval_ms: int & >=50 & <=1000 | *250
	}

	logging: {
		// Enable or disable packet logging
		enable_packet_logging: bool | *true

		// Logging level
		log_level: "debug" | "info" | "warn" | "error" | *"info"

		// Maximum log file size in megabytes
		max_log_size_mb: int & >=1 & <=1024 | *100

		// Number of days to retain log files
		retain_logs_days: int & >=1 & <=90 | *30
	}

	error_handling: {
		// Maximum number of consecutive failures allowed
		max_consecutive_failures: int & >=1 & <=20 | *5

		// Timeout duration for failure handling in milliseconds
		failure_timeout_ms: int & >=100 & <=30000 | *5000

		// Enable or disable automatic recovery from failures
		enable_auto_recovery: bool | *true
	}
}
