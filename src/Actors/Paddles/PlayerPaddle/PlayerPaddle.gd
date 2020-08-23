extends Paddle

func _ready() -> void:
	max_speed = Vector2(400, -400)


func _physics_process(delta: float) -> void:
	var direction = get_movement_direction()
	_velocity = calculate_velocity(max_speed, direction)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
	
	#keep paddle on-screen
	position.y = clamp(position.y, 0 + 79, 720 - 79)

#gets player input
func get_movement_direction() -> Vector2:
	return Vector2(
		0,
		Input.get_action_strength("paddle_up") - Input.get_action_strength("paddle_down")
	)


func reset_position()->void:
	position = Vector2(25, 360)
