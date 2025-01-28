extends State

@export var walk : State


func enter() -> void:
	super()
	parent.velocity.x = 0


func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("esquerda") || Input.is_action_just_pressed("direita") || Input.is_action_just_pressed("cima") || Input.is_action_just_pressed("baixo"):
		return walk
		
	return null
