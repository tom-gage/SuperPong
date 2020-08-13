extends Actor

var ball_position = Vector2.ZERO


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y = ball_position.y

func get_ball_position(balls_current_position: Vector2) -> void:
	ball_position = balls_current_position

func reset_position()->void:
	position = Vector2(1055, 360)
