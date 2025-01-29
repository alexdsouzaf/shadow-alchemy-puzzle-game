extends Node2D

@export var pool_objeto_no_chao : Node
@export var spawn_point : Marker2D
@export var criar_instancia_jogador : bool

func _ready() -> void:
	levelManager.pool_objeto_no_chao = pool_objeto_no_chao
	#levelManager.spawn_point = spawn_point
	#if criar_instancia_jogador:
		#levelManager.criar_instancia_jogador()
		#
	#levelManager.seta_posicao_spawn()

func _on_area_valida_mouse_entered() -> void:
	SignalManager.entrou_area_valida.emit()


func _on_area_valida_mouse_exited() -> void:
	SignalManager.saiu_area_valida.emit()
