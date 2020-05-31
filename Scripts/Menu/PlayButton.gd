extends TextureButton

onready var select = get_parent().get_node("Node/Select")

func _on_PlayButton_pressed():
	select.play()
	print("CLICK")
	get_tree().change_scene("res://Scenes/Maps/Level 1.tscn")
