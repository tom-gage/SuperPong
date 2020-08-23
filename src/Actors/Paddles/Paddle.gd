extends Actor
class_name Paddle

var direction = Vector2.ZERO

#velocity goes in, velocity comes out
func calculate_velocity(max_speed: Vector2, direction: Vector2) -> Vector2:
		var target_velocity = max_speed * direction
		_velocity = lerp(_velocity, target_velocity, 0.2)
		return _velocity

#to be overriden
func get_movement_direction()->Vector2:
	return Vector2.ZERO
