	extends RichTextLabel

var dialog = ["Boa noite, caros moradores de Patris!", "Na verdade, uma INCRÍVEL noite!!!", "Uma MAGNÍFICA noite!",
"Fico satisfeito em saber que neste período turbulento todos vocês seguiram cumprindo com seu dever.", "Entretanto, certas coisas são inevitáveis...",
"Temo que ainda não consigamos fazer diversas coisas, mortais como somos.", "Voar", "Respirar debaixo d'água", "Derrubar um regime político com as próprias mãos",
"E reverter doenças apenas com remédios.", "...", "Uma boa noite a todos."]
var page = 0

func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)
	#dialog[5] = "Pela falta de " + str($"/root/Global".coins) + " moedas que deveriam ter sido pagas para o bem da vila,"



func _input(event):
	
	if Input.is_action_just_pressed("ui_all"):
		if page == 11:
			$TimerFim.start()
			
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size()-1:
				page += 1
				set_bbcode(dialog[page])
				set_visible_characters(0)
		else:
			if Input.is_action_just_pressed("ui_all"):
				set_visible_characters(get_total_character_count())
		if page == 4:
			$HappyPlayer.stop()
		if page == 5:
			if $TensoPlayer.play():
				pass
			else:
				$TensoPlayer.play()

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)


func _on_TimerBip_timeout():
	if get_visible_characters() < get_total_character_count():

		$BipPlayer.play()
		$TimerBip2.start()

func _on_TimerBip2_timeout():
	$BipPlayer.stop()
	$TimerBip2.stop()


func _on_TimerFim_timeout():
	get_tree().change_scene("FamiliaFinal.tscn")
