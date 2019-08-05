extends Node2D

onready var musicPlayer = $MusicPlayer

func _ready():
	Global.reset_coins()
	$ColorRect/AnimationPlayer.play("comeco")
	$TimerComeco.start()
	$CanvasLayer/oqFazer/AnimationPlayer.play("entrando")
	$Player/AnimationPlayer.play("entrando")
	$coisinhas/AnimationPlayer.play("entrando")
	$ArvGrandes/AnimationPlayer.play("entrando")
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _input(event):
	if Input.is_action_pressed("ui_action"):
			$ColorRect/AnimationPlayer.play("end")
			$Player/AnimationPlayer.play("saindo")
			$coisinhas/AnimationPlayer.play("saindo")
			$ArvGrandes/AnimationPlayer.play("saindo")
			$TimerFim.start()
func _on_TimerComeco_timeout():
	musicPlayer.play()
	$TimerComeco.stop()


func _on_TimerFim_timeout():
	get_tree().change_scene("Ciclo2.tscn")


func _on_Timer_timeout():
	$CanvasLayer/Comandos/AnimationPlayer.play("comandinhos")
	$CanvasLayer/Comandos/Timer.stop()
	$CanvasLayer/Comandos/Timer2.start()

func _on_Timer2_timeout():
	$CanvasLayer/Comandos.queue_free()


func _on_TimerOqFazer_timeout():
	$CanvasLayer/oqFazer/TimerOqFazer.stop()
	$CanvasLayer/oqFazer/AnimationPlayer.play("saindo")
	$CanvasLayer/oqFazer/TimerFimOq.start()


func _on_TimerFimOq_timeout():
	$CanvasLayer/oqFazer.queue_free()
