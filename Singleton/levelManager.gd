extends Node
class_name LevelManager

var jogador_corpo2d : JogadorCorpo2D = null
var pool_objeto_no_chao : Node
var game_running : bool = false
var spawn_point : Marker2D
var fase_atual : Node2D
var main : Main
var textura_transicao : TextureRect

func _ready() -> void:
	pass

func seta_posicao_spawn() -> void:
	jogador_corpo2d.global_position = spawn_point.global_position


func trocar_fase_por_arquivo() -> void:
	salvar_personagem()
	var proxima = fase_atual.numeracao_fase + 1
	salvar_entrada(proxima)
	carregar_fase_numero(proxima)

func carregar_fase_numero(pNumeroFase:int) -> void:
	var resource_fase = load("res://Resources/level/level_" + str(pNumeroFase) + ".tscn")
	var instancia = resource_fase.instantiate()
	
	if main.mundo.get_child_count() > 0:
		main.mundo.remove_child(fase_atual)
	
	main.mundo.add_child(instancia)


func reinicia_fase() -> void:
	var indice_shader : float = 1.0
	while indice_shader > 0.0:
		await get_tree().create_timer(0.05).timeout
		textura_transicao.material.set_shader_parameter("fade",indice_shader)
		indice_shader -= 0.2
	
	var resource_fase = load("res://Resources/level/level_" + str(fase_atual.numeracao_fase) + ".tscn")
	var instancia = resource_fase.instantiate()
	main.mundo.remove_child(fase_atual)
	main.mundo.add_child(instancia)
	
	await get_tree().create_timer(0.3).timeout
	
	indice_shader = 0.0
	while indice_shader < 1.0:
		await get_tree().create_timer(0.05).timeout
		indice_shader += 0.2
		textura_transicao.material.set_shader_parameter("fade",indice_shader)

#region [chamadas para salvar e carregar o jogo]
func salvar_personagem():
	var modelo = SavePersonagemModel.new()
	modelo.vida = levelManager.jogador_corpo2d.componente_vida.vida_atual
	if levelManager.jogador_corpo2d.objeto_atual != null:
		modelo.type_objeto = levelManager.jogador_corpo2d.objeto_atual.scene_file_path
	gameSave.write_save_personagem(modelo)

func salvar_entrada(pSalaNumero:int):
	var saveModel = SaveSalaModel.new()
	saveModel.numero_sala = pSalaNumero
	gameSave.write_save_salas(saveModel)


func carregar_ultima_sala():
	var ultima_sala = GameSave.load_save_salas()
	if ultima_sala != null && ultima_sala.numero_sala > 0:
		levelManager.carregar_fase_numero(ultima_sala.numero_sala)
	else:
		levelManager.carregar_fase_numero(1)
		

func carregar_personagem():
	var personagem = GameSave.load_save_personagem()
	if personagem != null:
		levelManager.jogador_corpo2d.componente_vida.setar_vida_diretamente(personagem.vida)
		if personagem.type_objeto != null && personagem.type_objeto != "":
			var objeto = load(personagem.type_objeto)
			var instancia = objeto.instantiate()
			levelManager.jogador_corpo2d.adicionar_item_diretamente_na_mao(instancia)
#endregion
