extends Polygon2D

onready var musicPlayer = $RichTextLabel/TensoPlayer

func _ready():
	$ColorRect/AnimationPlayer.play("comeco")
	$TimerComeco.start()

func _on_TimerSeta_timeout():
	if InputEventMouseButton or InputEventKey:
		$TimerSeta.stop()
	else:
		$TimerSeta/TimerSetinha.start()


func _on_TimerComeco_timeout():
	musicPlayer.play()
	$TimerComeco.stop()
