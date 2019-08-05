extends KinematicBody2D

const SPEED = 100

var motion = Vector2()
var cont = 1

func _physics_process(delta):
	_move(delta) 
	

func _move(delta):
	motion.x = 0
	motion.y = 0
	
	if Input.is_action_pressed("ui_up"):
		cont = 0
		motion.y = -SPEED
		$Sprite.play("WalkCosta")
	elif Input.is_action_pressed("ui_down"):
		cont = 1
		motion.y = SPEED
		$Sprite.play("Walk")
	elif Input.is_action_pressed("ui_left"):
		cont = 2
		motion.x = -SPEED
		$Sprite.play("WalkLadoEs")
	elif Input.is_action_pressed("ui_right"):
		cont = 3
		motion.x = SPEED
		$Sprite.play("Walking")
	else:
		if cont == 0:
			$Sprite.play("IdleCosta")
		elif cont == 1:
			$Sprite.play("Idle")
		elif cont == 2:
			$Sprite.play("IdleLadoEs")
		elif cont == 3:
			$Sprite.play("IdleLado")
			
	move_and_slide(motion)


