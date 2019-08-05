extends Node2D

onready var musicPlayer = $MusicPlayer

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	musicPlayer.play()
	$boneco.flip_h = true
	$boneco.play("Walk")
	$AnimatedSprite2.play("gira")
	$AnimatedSprite3.play("gira")
	$AnimatedSprite4.play("gira")
	$AnimatedSprite5.play("gira")


func _on_Timer_timeout():
	get_tree().change_scene("Fase1.tscn")


func _on_Button_pressed():
	$ColorRect/AnimationPlayer.play("end")
	$Button/AnimationPlayer.play("tchaubotao")
	$Button3/AnimationPlayer.play("tchaubotao")
	$Timer.start()


func _on_Button3_pressed():
	get_tree().quit()
