extends TextureButton

func _on_PlayButton_pressed():
	print("CLICK")
	get_tree().change_scene("res://Scenes/Maps/Level 1.tscn")
