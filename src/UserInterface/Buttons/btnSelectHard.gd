extends Button

export(String, FILE) var next_scene_path: = ""


func _on_btnSelectHard_button_up() -> void:
	Settings.set_difficulty(3)
	get_tree().change_scene(next_scene_path)
