extends Node2D


func _on_button_iniciar_pressed() -> void:
	get_tree().change_scene_to_file("res://level/main.tscn")


func _on_button_configs_pressed() -> void:
	get_tree().change_scene_to_file("res://Menus/TelaSettings/TelaSettings.tscn")

func _on_button_sair_pressed() -> void:
	get_tree().quit()
