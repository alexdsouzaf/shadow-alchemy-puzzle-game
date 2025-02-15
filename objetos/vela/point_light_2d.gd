extends PointLight2D

@export var escala : float = 0.002

func _physics_process(delta: float) -> void:
	texture_scale += escala


func _on_timer_escala_timeout() -> void:
	escala *= -1
