extends AudioStreamPlayer

func _physics_process(delta):
	if self.get_playback_position() > 3:
		self.stop()
