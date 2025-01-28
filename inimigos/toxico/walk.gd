extends State

@export var idle : State

func process_physics(delta: float) -> State:
	var _direction: Vector2 = parent.global_position.direction_to(levelManager.jogador_corpo2d.global_position)
	parent.velocity = _direction * move_speed
	parent.move_and_slide()

	return null


func _on_area_observacao_body_exited(body):
	if body is JogadorCorpo2D:
		parent.state_machine.change_state(idle)
