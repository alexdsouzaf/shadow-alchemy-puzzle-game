extends Control

var pausado : bool = false

func _ready():
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause") && Engine.time_scale == 1:
		pauseMenu()

func pauseMenu() -> void:
	pausado = !pausado
	get_tree().paused = pausado
	
	if pausado:
		show()
	else:
		hide()


func _on_button_continuar_pressed():
	pauseMenu()

func _on_button_sair_pressed():
	get_tree().quit()

func _on_button_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Menus/MenuPrincipal/MenuPrincipal.tscn")
