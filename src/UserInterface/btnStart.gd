extends Button

export(String, FILE) var next_scene_path: = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




func _on_btnStart_button_up() -> void:
	get_tree().change_scene(next_scene_path)
