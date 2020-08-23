extends Node


var difficulty_setting = 0 setget set_difficulty, get_difficulty

func set_difficulty(value:int)->void:
	difficulty_setting = value

func get_difficulty()->int:
	return difficulty_setting
