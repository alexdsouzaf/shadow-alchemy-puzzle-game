extends CharacterBody2D

func _ready():
	SignalManager.abrir_porta.connect(self._on_botao_porta_abrir_porta)


func _on_botao_porta_abrir_porta():
	%CollisionShape2D.set_deferred("disabled",true)
	%AnimatedSprite2D.play("aberto")
