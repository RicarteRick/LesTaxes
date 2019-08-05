extends Polygon2D


func _ready():
	$RichTextLabel/HappyPlayer.play()

func _on_TimerSeta_timeout():
	if InputEventMouseButton or InputEventKey:
		$TimerSeta.stop()
	else:
		$TimerSeta/TimerSetinha.start()
