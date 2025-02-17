extends Tank

#######################################################
# This tank remains static in position and only shoots
# Has no rotation, has no speed
#######################################################

var enemyInRange

func _ready() -> void:
	$SpriteCuerpo/SpriteTorre.parent = self


func _physics_process(delta: float) -> void:
	if(life > 0):
		if(Input.is_action_pressed("ui_accept")):
			$SpriteCuerpo/SpriteTorre.shoot()
			
func hit(damage):
	life = life - damage
