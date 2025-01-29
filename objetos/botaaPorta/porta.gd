extends CharacterBody2D

@export var proxima_fase : PackedScene

func _ready():
	SignalManager.abrir_porta.connect(self._on_botao_porta_abrir_porta)


func _on_botao_porta_abrir_porta():
	%CollisionShape2D.set_deferred("disabled",true)
	%AnimatedSprite2D.play("aberto")

#deve carregar a proxima cena
func jogador_entrou():
	get_tree().change_scene_to_packed(proxima_fase)


func _on_area_abertura_body_entered(body: Node2D) -> void:
	if body is JogadorCorpo2D:
		jogador_entrou()
