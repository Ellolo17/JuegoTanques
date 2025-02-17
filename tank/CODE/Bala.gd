extends CharacterBody2D

class_name Bala

@export var lifeTime : float = 5000
@export var speed : int = 400
@export var damage : int = 25
@export var max_collisions : int = 3

var collision_count = 0
var direction:Vector2
var timeToDie
var parent:CharacterBody2D


func start(_position, _direction):
	# set
	global_rotation = _direction
	position = _position
	
	#adjust rotation
	velocity = Vector2(speed, 0).rotated(rotation)
	timeToDie = Time.get_ticks_msec() + lifeTime



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Time.get_ticks_msec() > timeToDie):
		queue_free()
	
	var collision = move_and_collide(velocity * delta)
	
	#If it hit something, emit the signal from earlier
	if (collision and collision_count < max_collisions):
		var collider = collision.get_collider()
		if(collider == parent):
			return
			
		if(collider != parent):
			if collider is Tank:
				collider.hit(damage)
				queue_free()
			else:
				var normal = collision.get_normal()
				var remainder = collision.get_remainder()
				velocity = velocity.bounce(normal)
				remainder = remainder.bounce(normal)
				direction = velocity
				
				collision_count += 1
				if(collision_count > max_collisions): queue_free()
				collision = move_and_collide(remainder)
	pass
