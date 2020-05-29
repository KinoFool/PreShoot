extends AudioStreamPlayer

onready var lvl_music = get_parent().get_node("Level_music")

func _physics_process(delta):
	if self.get_playback_position() > 2.5 and self.is_playing() == true:
		self.stop()
		lvl_music.stream_paused = false
