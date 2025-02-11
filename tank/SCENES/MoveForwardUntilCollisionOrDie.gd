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

signal hit_something

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timeToDie = Time.get_ticks_msec() + lifeTime
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Time.get_ticks_msec() > timeToDie):
		queue_free()
	
	velocity = speed * direction
	var collision = move_and_collide(velocity * delta)
	
	#If it hit something, emit the signal from earlier
	while (collision and collision_count < max_collisions):
		var collider = collision.get_collider()
		
		if(collider != parent):
			if collider is Tanque:
				collider.hit(damage)
				queue_free()
				break
			else:
				var normal = collision.get_normal()
				var remainder = collision.get_remainder()
				velocity = velocity.bounce(normal)
				remainder = remainder.bounce(normal)
				direction = velocity
				
				collision_count += 1
				collision = move_and_collide(remainder)
	pass
