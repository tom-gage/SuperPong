extends Sprite


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
#	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.x = rand_range(0, 1080)
	global_position.y = rand_range(0, 720)
