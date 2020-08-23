extends Node
class_name AI

export var max_speed = Vector2.ZERO #setget set_max_speed, get_max_speed

func _ready() -> void:
	pass

func _init() -> void:
	pass

func get_movement_direction(ball_pos:Vector2, paddle_pos:Vector2)->Vector2:
	return Vector2.ZERO

func get_difference_between(a:int, b:int)->int:
	if(a > b):
		return a - b
	else:
		return b - a

##setters and getters
#func set_max_speed(value: Vector2)->void:
#	max_speed = value
#
#func get_max_speed()->Vector2:
#	return max_speed
