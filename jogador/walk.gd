extends State

@export var idle: State
@export var particulas_andando : CPUParticles2D

func enter():
	particulas_andando.emitting = true
	super()

func exit():
	particulas_andando.emitting = false
	super()

func process_input(event: InputEvent) -> State:
	return null

func process_physics(delta: float) -> State:
	return movimentacao_normal(delta)

func movimentacao_normal(delta) -> State:
	var direction = Input.get_axis("esquerda", "direita") 
	var directionVert = Input.get_axis("cima","baixo")
	
	var movementX = direction * move_speed
	var movementY = directionVert * move_speed
	
	if movementX == 0 && movementY == 0:
		return idle
	
	if movementX != 0:
		parent.animated_sprite_2d.flip_h = movementX < 0
		particulas_andando.gravity.x = 200 if movementX < 0 else -200
	
	parent.velocity.x = movementX
	parent.velocity.y = movementY
	parent.move_and_slide()
	
	
	return null
