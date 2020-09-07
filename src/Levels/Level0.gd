extends Node2D

onready var ball = get_node("Ball")
onready var enemyPaddle = get_node("EnemyPaddle")
onready var playerPaddle = get_node("PlayerPaddle")
onready var gameover_panel = get_node("GameOverPanelMenu")
var score_to_win = 11

func _ready() -> void:
	ball.reset_position()
	yield(get_tree().create_timer(1.7), "timeout")
	ball.resume_play()

func _process(delta: float) -> void:
#	these update some values the children need to make decisions 
	enemyPaddle.ball_position = ball.position
	ball.nearest_paddle_position = get_nearest_paddle(playerPaddle, enemyPaddle, ball).position

func get_nearest_paddle(playerPaddle: Node, enemyPaddle: Node, ball: Node)-> Node:
	var plr_pad_distance = get_difference_between(playerPaddle.position.x, ball.position.x)
	var enm_pad_distance = get_difference_between(enemyPaddle.position.x, ball.position.x)
	
	if(plr_pad_distance < enm_pad_distance):
#		print("player nearest")
		return playerPaddle
	else:
#		print("enemy nearest")
		return enemyPaddle


func _on_EnemyScoreArea_area_entered(area: Area2D) -> void:
	ScoreData.enemy_score += 1
	#print("ENEMY SCORED, current score is: ", ScoreData.player_score, " - ", ScoreData.enemy_score)
	$ScoreDisplay.update_enemy_score_panels(ScoreData.enemy_score)
	reset_play()
	if(ScoreData.enemy_score >= score_to_win):
		game_over()


func _on_PlayerScoreArea_area_entered(area: Area2D) -> void:
	ScoreData.player_score += 1
	$ScoreDisplay.update_player_score_panels(ScoreData.player_score)
	#print("PLAYER SCORED, current score is: ", ScoreData.player_score, " - ", ScoreData.enemy_score)
	reset_play()
	if(ScoreData.player_score >= score_to_win):
		game_over()

func reset_play()->void:
	ball.reset_position()
	playerPaddle.reset_position()
	enemyPaddle.reset_position()
	
	yield(get_tree().create_timer(1.7), "timeout")
	ball.resume_play()

func game_over()->void:
	remove_child(ball)
	
	if(ScoreData.player_score > ScoreData.enemy_score):
		gameover_panel.player_wins()
	else:
		gameover_panel.enemy_wins()
	
	gameover_panel.visible = true
	
	ScoreData.reset_scores()

func get_difference_between(a:int, b:int)->int:
	if(a > b):
		return a - b
	else:
		return b - a
