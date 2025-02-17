extends Node

@export var lifeTime = 1000
var finalTime


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#finalTime = Time.get_ticks_msec() + lifeTime
	var tween = create_tween()
	tween.tween_property(self, "modulate.a", 1, 1)
	#tween.tween_callback(self.queue_free)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Time.get_ticks_msec() > finalTime):
		queue_free()
	pass
