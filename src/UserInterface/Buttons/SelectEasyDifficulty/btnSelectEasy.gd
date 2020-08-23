extends Button

export(String, FILE) var next_scene_path: = ""

func _on_btnSelectEasy_button_up() -> void:
	Settings.set_difficulty(1)
	get_tree().change_scene(next_scene_path)

