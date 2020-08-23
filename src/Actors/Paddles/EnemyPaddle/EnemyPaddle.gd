extends Paddle

var ball_position = Vector2.ZERO
var brain = AI.new()

func _ready() -> void:
	match Settings.difficulty_setting:
		1:
			brain = EasyAI.new()
		2:
			brain = MediumAI.new()
		3:
			brain = HardAI.new()
		_:
			brain = EasyAI.new()
	
	max_speed = brain.max_speed

func _physics_process(delta: float) -> void:
	direction = brain.get_movement_direction(ball_position, position)
	_velocity = calculate_velocity(max_speed, direction)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
	
	#keep paddle on-screen
	position.y = clamp(position.y, 0 + 79, 720 - 79)

#this is the brains of the thing
func get_movement_direction()->Vector2:
	match Settings.difficulty_setting:
		1:
			return medium_mode()
		2:
			return medium_mode()
		3:
			return medium_mode()
		_:
			#print("difficulty mode not recognised, selecting default")
			return medium_mode()

func medium_mode()->Vector2:
	var diff = get_difference_between(ball_position.y, position.y)
	
#	if ball is in line with centre of paddle, hold position
	if(diff <= 10):
		return Vector2(0, 0)
#	if ball is above paddle: go up, else: go down
	if(ball_position.y < position.y):
		return Vector2(0, 1)
	else:
		return Vector2(0, -1)

#resets position
func reset_position()->void:
	position = Vector2(1055, 360)

#maths helpers
func get_difference_between(a:int, b:int)->int:
	if(a > b):
		return a - b
	else:
		return b - a
