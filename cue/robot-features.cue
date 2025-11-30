@miru(config_type="robot-features")
{
	enable_autonomy: bool | *true
	enable_remote_control: bool | *true
	max_payload_kg: number & >=0 & <=99 | *10.0
	preferred_speed_mode: "slow" | "normal" | "fast" | *"normal"
	emergency_stop_sensitivity: number & >=0.0 & <=1.0 | *0.8

	telemetry: {
		upload_interval_sec: int & >=10 & <=600 | *60
		heartbeat_interval_sec: int & >=1 & <=60 | *10
	}
}
