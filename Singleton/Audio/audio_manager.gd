extends AudioStreamPlayer
class_name GlobalAudioManager

const music = preload("res://Audios/HaroldParanormalInstigatorTheme.wav")

func _play_music(music: AudioStream, volume : float = 0.0):
	if music == stream:
		return
	stream = music
	volume_db = volume
	bus = GlobalEnum.AudioBusEnumDescription[GlobalEnums.AudioBusEnum.Music]
	play()
	
func play_music():
	_play_music(music)
