extends Node
class_name LevelManager


var pre_carregamento_jogador = preload("res://jogador/lildoc.tscn")
var jogador_corpo2d : JogadorCorpo2D = null
var pool_objeto_no_chao : Node
var game_running : bool = false
var spawn_point : Marker2D

func _ready() -> void:
	pass
	#_criar_instancia_jogador()

func criar_instancia_jogador():
	jogador_corpo2d = pre_carregamento_jogador.instantiate()
	add_child(jogador_corpo2d)

func seta_posicao_spawn():
	jogador_corpo2d.global_position = spawn_point.global_position
