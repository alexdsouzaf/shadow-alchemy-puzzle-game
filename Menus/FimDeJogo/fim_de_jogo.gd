extends Control

# TODO: fazer a ultima sala chamar isso

func _on_button_play_again_pressed() -> void:
	# o new game vai resetar o save das salas antes de comecar
	gameSave.write_save_salas(SaveSalaModel.new())
	gameSave.write_save_personagem(SavePersonagemModel.new())
	get_tree().change_scene_to_file("res://level/main.tscn")



func _on_button_quit_pressed() -> void:
	get_tree().quit()
