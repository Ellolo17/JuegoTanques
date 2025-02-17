extends Tank

func _ready() -> void:
	$SpriteCuerpo/SpriteTorre.parent = self

func do_Speed():
	var dir = Input.get_axis("ui_down", "ui_up") 
	
	# If button pressed, accelerate. Else, brake
	if(dir == 0 && speed != 0):
		# Nothing pressed, brake
		if(speed > 0):
			speed = speed - brakeSpeed
			if(speed < 0):speed = 0
		if(speed < 0):
			speed = speed + brakeSpeed
			if(speed > 0): speed = 0
	else:
		#something pressed, accelerate
		if(dir > 0):
			#add acceleration
			speed = speed + (accelerationForward * dir)
			#if its changing direction, add some brake
			if(speed < 0):
				speed = speed + brakeSpeed
		else:
			#add acceleration
			speed = speed + (accelerationBackward * dir)
			#if its changing direction, add some brake
			if(speed > 0):
				speed = speed - brakeSpeed
	
	# Limit max speed
	if(speed > maxSpeed): speed = maxSpeed
	if(speed < minSpeed): speed = minSpeed
	
	# set speed
	velocity = transform.y * speed * -1


func do_Rotation(delta):
	rotation_direction = Input.get_axis("ui_left", "ui_right")
	rotation += rotation_direction * rotation_speed * delta



func _physics_process(delta: float) -> void:
	if(life > 0):
		# Movement
		do_Speed()
		do_Rotation(delta)
		move_and_slide()
		# If collides with a wall slow down?
		#if(get_slide_collision_count() > 0):
			#speed = 0
		
		if(Input.is_action_pressed("ui_accept")):
			$SpriteCuerpo/SpriteTorre.shoot()
			
func hit(damage):
	life = life - damage
