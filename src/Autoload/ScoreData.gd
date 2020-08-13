extends Node

signal player_score_updated
signal enemy_score_updated

var player_score: = 0 setget set_player_score
var enemy_score: = 0 setget set_enemy_score

func set_player_score(value: int)-> void:
	player_score = value
	emit_signal("player_score_updated", player_score)

func set_enemy_score(value: int)-> void:
	enemy_score = value 
	emit_signal("enemy_score_updated", enemy_score) 

func reset_scores()->void:
	player_score = 0
	enemy_score = 0
