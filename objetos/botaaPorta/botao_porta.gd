extends Area2D

@export var show_label : bool = false
@export var label : Label
@export var animated_sprite : AnimatedSprite2D

func _ready():
	label.visible = show_label

func _on_body_entered(body):
	animated_sprite.play("down")
	SignalManager.abrir_porta.emit()


func _on_body_exited(body):
	animated_sprite.play("up")
