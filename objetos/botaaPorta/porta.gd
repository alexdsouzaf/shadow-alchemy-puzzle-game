extends CharacterBody2D

@export var ultima_fase : bool = false

@export_category("debug")
@export var aberta : bool = false


func _ready():
	if aberta:
		_on_botao_porta_abrir_porta()
	
	SignalManager.abrir_porta.connect(self._on_botao_porta_abrir_porta)


func _on_botao_porta_abrir_porta():
	%CollisionShape2D.set_deferred("disabled",true)
	%AnimatedSprite2D.play("aberto")

func jogador_entrou():
	
	if ultima_fase:
		SignalManager.chamar_fim_de_jogo.emit()
		return
	
	levelManager.trocar_fase_por_arquivo()


func _on_area_abertura_body_entered(body: Node2D) -> void:
	if body is JogadorCorpo2D:
		jogador_entrou()
