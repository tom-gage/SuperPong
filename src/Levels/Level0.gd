extends Node2D

onready var ball = get_node("Ball")
onready var enemyPaddle = get_node("EnemyPaddle")
onready var playerPaddle = get_node("PlayerPaddle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ball = get_node("Ball")
	enemyPaddle = get_node("EnemyPaddle")
	playerPaddle = get_node("PlayerPaddle")
	
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
	playerPaddle.position = Vector2(25, 360)
	enemyPaddle.position = Vector2(1055, 360)
	ball.position = Vector2(540, 360)


func draw_debug_lines(paddle_pos: Vector2, paddle_top: Vector2, ball_pos: Vector2) -> void:
	draw_line(paddle_pos, paddle_top, ColorN("white"), 10, false)
	draw_line(paddle_top, ball_pos, ColorN("white"), 10, false)
	draw_line(ball_pos, paddle_pos, ColorN("white"), 10, false)
	print("printed debug lines: ", paddle_pos, paddle_top, ball_pos)


func _on_EnemyScoreArea_area_entered(area: Area2D) -> void:
	ScoreData.enemy_score += 1
	print("enemy scored, current score is: ", ScoreData.player_score, " - ", ScoreData.enemy_score)
	reset_play()


func _on_PlayerScoreArea_area_entered(area: Area2D) -> void:
	ScoreData.player_score += 1
	print("player scored, current score is: ", ScoreData.player_score, " - ", ScoreData.enemy_score)
	reset_play()
