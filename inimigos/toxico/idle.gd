extends State

@export var walk : State

func _on_area_observacao_body_entered(body):
	if body is JogadorCorpo2D:
		parent.state_machine.change_state(walk)
