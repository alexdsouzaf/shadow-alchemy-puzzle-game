extends HSlider

enum audioBusEnum {
	Master,
	Music,
	sfx,
	UI
}

@export var audioBus : audioBusEnum

var bus_index : int

func _ready() -> void:
	bus_index = AudioServer.get_bus_index(str(audioBusEnum))
	# TODO: CARREGAR DE VOLTA OS VOLUMES
	value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))

func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(bus_index,linear_to_db(value))

func _on_drag_ended(value_changed: bool) -> void:
	if value_changed:
		var modelo = GameSave.load_save_settings()
		match audioBus:
			audioBusEnum.Master:
				modelo.volume_master = value
			audioBusEnum.Music:
				modelo.volume_music = value
			audioBusEnum.sfx:
				modelo.volume_sfx = value
			audioBusEnum.UI:
				modelo.volume_ui = value
		gameSave.write_save_settings(modelo)
