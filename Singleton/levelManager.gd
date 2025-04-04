extends Node
class_name LevelManager

var jogador_corpo2d : JogadorCorpo2D = null
var pool_objeto_no_chao : Node
var game_running : bool = false
var spawn_point : Marker2D
var fase_atual : Node2D
var main : Node2D
var textura_transicao : TextureRect

func _ready() -> void:
	pass

func seta_posicao_spawn():
	jogador_corpo2d.global_position = spawn_point.global_position


func trocar_fase_por_arquivo():
	var proxima = fase_atual.numeracao_fase + 1
	var resource_fase = load("res://Resources/level/level_" + str(proxima) + ".tscn")
	var instancia = resource_fase.instantiate()
	main.remove_child(fase_atual)
	main.add_child(instancia)

func reinicia_fase():
	var indice_shader : float = 1.0
	while indice_shader > 0.0:
		await get_tree().create_timer(0.05).timeout
		textura_transicao.material.set_shader_parameter("fade",indice_shader)
		indice_shader -= 0.2
	
	var resource_fase = load("res://Resources/level/level_" + str(fase_atual.numeracao_fase) + ".tscn")
	var instancia = resource_fase.instantiate()
	main.remove_child(fase_atual)
	main.add_child(instancia)
	
	await get_tree().create_timer(0.3).timeout
	
	indice_shader = 0.0
	while indice_shader < 1.0:
		await get_tree().create_timer(0.05).timeout
		indice_shader += 0.2
		textura_transicao.material.set_shader_parameter("fade",indice_shader)
