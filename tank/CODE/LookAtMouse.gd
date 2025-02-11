extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var camera = get_viewport().get_camera_2d()
	var mousePos = camera.get_global_mouse_position()
	
	look_at(mousePos)
	rotate(PI/2)
	
	pass
