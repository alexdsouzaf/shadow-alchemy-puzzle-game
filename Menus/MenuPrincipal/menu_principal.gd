extends Node2D

@onready var button_continue: Button = $CanvasLayer/VBoxContainer/ButtonContinue


func _ready() -> void:
	#carregar o save game pra saber se devo mostrar o continue
	var saveSalas = GameSave.load_save_salas()
	button_continue.visible = saveSalas != null && saveSalas.numero_sala > 0

func _on_button_iniciar_pressed() -> void:
	# o new game vai resetar o save das salas antes de comecar
	gameSave.write_save_salas(SaveSalaModel.new())
	gameSave.write_save_personagem(SavePersonagemModel.new())
	get_tree().change_scene_to_file("res://level/main.tscn")


func _on_button_configs_pressed() -> void:
	get_tree().change_scene_to_file("res://Menus/TelaSettings/TelaSettings.tscn")

func _on_button_sair_pressed() -> void:
	get_tree().quit()


func _on_button_continue_pressed() -> void:
	#vai iniciar normalmente
	get_tree().change_scene_to_file("res://level/main.tscn")
