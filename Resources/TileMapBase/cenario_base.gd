extends Node2D

@export var pool_objeto_no_chao : Node
@export var spawn_point : Marker2D

var numeracao_fase : int

func _ready() -> void:
	_pegar_numeracao()
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

func _pegar_numeracao():
	var regex = RegEx.new()
	regex.compile("\\d+")
	var numero = regex.search(name)
	numeracao_fase = int(numero.get_string())
