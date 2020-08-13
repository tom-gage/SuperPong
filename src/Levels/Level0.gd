extends Node2D

onready var ball = get_node("Ball")
onready var enemyPaddle = get_node("EnemyPaddle")
onready var playerPaddle = get_node("PlayerPaddle")
onready var gameover_panel = get_node("GameOverPanelMenu")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
#	ball = get_node("Ball")
#	enemyPaddle = get_node("EnemyPaddle")
#	playerPaddle = get_node("PlayerPaddle")
	
	enemyPaddle.get_ball_position(ball.position)
	
	var nearest_paddle = get_nearest_paddle(playerPaddle, enemyPaddle, ball)
	
	#print(nearest_paddle.position)
	ball.get_nearest_paddle_position(nearest_paddle.position)
	

func get_nearest_paddle(playerPaddle: Node, enemyPaddle: Node, ball: Node)-> Node:
	var plr_pad_distance = playerPaddle.position.x - ball.position.x
	var enm_pad_distance = ball.position.x - enemyPaddle.position.x
	
	if(plr_pad_distance > enm_pad_distance):
		#print("player nearest")
		return playerPaddle
	else:
		#print("enemy nearest")
		return enemyPaddle

func reset_play()->void:
	ball.reset_position()
	playerPaddle.reset_position()
	enemyPaddle.reset_position()
	
	yield(get_tree().create_timer(2.0), "timeout")
	ball.resume_play()

func game_over()->void:
	remove_child(ball)
	ScoreData.reset_scores()
	gameover_panel.visible = true

func _on_EnemyScoreArea_area_entered(area: Area2D) -> void:
	ScoreData.enemy_score += 1
	print("ENEMY SCORED, current score is: ", ScoreData.player_score, " - ", ScoreData.enemy_score)
	reset_play()
	if(ScoreData.enemy_score >= 2):
		game_over()


func _on_PlayerScoreArea_area_entered(area: Area2D) -> void:
	ScoreData.player_score += 1
	print("PLAYER SCORED, current score is: ", ScoreData.player_score, " - ", ScoreData.enemy_score)
	reset_play()
	if(ScoreData.player_score >= 2):
		game_over()
