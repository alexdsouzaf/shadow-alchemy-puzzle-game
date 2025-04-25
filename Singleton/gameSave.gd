extends Node
class_name GameSave

#trackeia as salas
const save_salas = "user://savegame-salas.tres"

#trackeia o personagem
const save_personagem = "user://savegame-personagem.tres"

#armazena as configuracoes
const save_settings = "user://savegame-settings.tres"

func _ready() -> void:
	pass

func write_save_salas(pModeloParaSalvar:SaveSalaModel):
	ResourceSaver.save(pModeloParaSalvar, save_salas)

func write_save_settings(pModeloParaSalvar:SaveSettingsModel):
	ResourceSaver.save(pModeloParaSalvar, save_settings)

func write_save_personagem(pModeloParaSalvar:SavePersonagemModel):
	ResourceSaver.save(pModeloParaSalvar, save_personagem)


static func load_save_salas() -> SaveSalaModel:
	if ResourceLoader.exists(save_salas):
		return load(save_salas)
	return null

static func load_save_settings() -> SaveSettingsModel:
	if ResourceLoader.exists(save_settings):
		return load(save_settings)
	return null

static func load_save_personagem() -> SavePersonagemModel:
	if ResourceLoader.exists(save_personagem):
		return load(save_personagem)
	return null
