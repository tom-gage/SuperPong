extends Button


export(String, FILE) var next_scene_path: = ""


func _on_btnSelectMedium_button_up() -> void:
	Settings.set_difficulty(2)
	get_tree().change_scene(next_scene_path)
