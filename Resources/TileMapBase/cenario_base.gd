extends Node2D

@export var pool_objeto_no_chao : Node
@export var spawn_point : Marker2D
func _ready() -> void:
	_preenche_level_manager()

func _on_area_valida_mouse_entered() -> void:
	SignalManager.entrou_area_valida.emit()


func _on_area_valida_mouse_exited() -> void:
	SignalManager.saiu_area_valida.emit()

func _preenche_level_manager():
	levelManager.pool_objeto_no_chao = pool_objeto_no_chao
	levelManager.spawn_point = spawn_point
	levelManager.seta_posicao_spawn()
	levelManager.fase_atual = self
