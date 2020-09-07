extends Control


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
var player_score_panels
var enemy_score_panels

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
#	get_tree().call_group("player_score_panels", "").visible = false
#	player_score_panels = get_tree().get_nodes_in_group("player_score_panels")
#	enemy_score_panels = get_tree().get_nodes_in_group("enemy_score_panels")
	pass


func update_player_score_panels(score:int)->void:
	hide_all_player_score_panels()
	match score:
		1:
			$one.visible = true
		2:
			$two.visible = true
		3:
			$three.visible = true
		4:
			$four.visible = true
		5:
			$five.visible = true
		6:
			$six.visible = true
		7:
			$seven.visible = true
		8:
			$eight.visible = true
		9:
			$nine.visible = true
		10:
			$ten.visible = true
		11:
			$eleven.visible = true
		_:
			pass

func update_enemy_score_panels(score:int)->void:
	hide_all_enemy_score_panels()
	match score:
		1:
			$one2.visible = true
		2:
			$two2.visible = true
		3:
			$three2.visible = true
		4:
			$four2.visible = true
		5:
			$five2.visible = true
		6:
			$six2.visible = true
		7:
			$seven2.visible = true
		8:
			$eight2.visible = true
		9:
			$nine2.visible = true
		10:
			$ten2.visible = true
		11:
			$eleven2.visible = true
		_:
			pass

func hide_all_player_score_panels()->void:
	$one.visible = false
	$two.visible = false
	$three.visible = false
	$four.visible = false
	$five.visible = false
	$six.visible = false
	$seven.visible = false
	$eight.visible = false
	$nine.visible = false
	$ten.visible = false
	$eleven.visible = false

func hide_all_enemy_score_panels()->void:
	$one2.visible = false
	$two2.visible = false
	$three2.visible = false
	$four2.visible = false
	$five2.visible = false
	$six2.visible = false
	$seven2.visible = false
	$eight2.visible = false
	$nine2.visible = false
	$ten2.visible = false
	$eleven2.visible = false
