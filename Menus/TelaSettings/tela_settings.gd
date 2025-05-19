extends Node2D

@export var slider_master : VolumeSlider
@export var slider_music : VolumeSlider
@export var slider_sfx : VolumeSlider
@export var slider_ui : VolumeSlider

var _settings_model : SaveSettingsModel

func _ready() -> void:
	SignalManager.salvar_volume.connect(self._salvar_settings)
	_carregar_settings()
	
	if _settings_model != null:
		slider_master.setar_value_db_to_linear(_settings_model.volume_master) 
		slider_music.setar_value_db_to_linear(_settings_model.volume_music)
		slider_sfx.setar_value_db_to_linear(_settings_model.volume_sfx)
		slider_ui.setar_value_db_to_linear(_settings_model.volume_ui)

# carrega ou instancia o modelo
func _carregar_settings():
	_settings_model = gameSave.load_save_settings()
	
	if _settings_model == null:
		_settings_model = SaveSettingsModel.new()

func _salvar_settings(valorVolume:float, busValue:GlobalEnum.AudioBusEnum):
	print("salvando com: " + str(valorVolume) + " | " + str(busValue))
	match busValue:
		GlobalEnum.AudioBusEnum.Master:
			_settings_model.volume_master = valorVolume
		GlobalEnum.AudioBusEnum.Music:
			_settings_model.volume_music = valorVolume
		GlobalEnum.AudioBusEnum.sfx:
			_settings_model.volume_sfx = valorVolume
		GlobalEnum.AudioBusEnum.UI:
			_settings_model.volume_ui = valorVolume
	
	#nao salvou
	gameSave.write_save_settings(_settings_model)
