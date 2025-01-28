extends Node2D

@export var pool_objeto_no_chao : Node

func _ready() -> void:
	levelManager.pool_objeto_no_chao = pool_objeto_no_chao


func _on_area_valida_mouse_entered() -> void:
	SignalManager.entrou_area_valida.emit()


func _on_area_valida_mouse_exited() -> void:
	SignalManager.saiu_area_valida.emit()
