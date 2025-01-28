extends Area2D
class_name BulletGenerica

@export var atributos : BulletResource

var direction : Vector2

func _physics_process(delta: float) -> void:
	global_position += atributos.speed * direction


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
