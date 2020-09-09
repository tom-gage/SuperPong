extends AI
class_name MediumAI


func _init() -> void:
	max_speed = Vector2(230, -230)

func get_movement_direction(ball_pos:Vector2, paddle_pos:Vector2)->Vector2:
	var diff = get_difference_between(ball_pos.y, paddle_pos.y)
	
#	if ball is in line with centre of paddle, hold position
	if(diff <= 30):
		return Vector2(0, 0)
#	if ball is above paddle: go up, else: go down
	if(ball_pos.y < paddle_pos.y):
		return Vector2(0, 1)
	else:
		return Vector2(0, -1)
