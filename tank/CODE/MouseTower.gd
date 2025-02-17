extends Node2D

@export var BULLET_SPEED : float = 400
@export var msBetweenShots = 1000

var   msNextShoot = 0
const bullet = preload("res://SCENES/Bala.tscn")
const explosion = preload("res://SCENES/Explosion.tscn")

var parent

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

func shoot():
	if(Time.get_ticks_msec() > msNextShoot):
		msNextShoot = Time.get_ticks_msec() + msBetweenShots
		shootBullet()

func shootBullet():
	var b = bullet.instantiate()
	b.start($ShootSpawnPoint.global_position, (rotation - (PI/2)))
	b.parent = self.parent # to prevent collision with parent
	get_tree().root.add_child(b)
	
