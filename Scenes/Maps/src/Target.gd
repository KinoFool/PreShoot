extends Node2D

var timer = 0
var end = false

func level_cleared_animation():
	$Victory.play()
	self.visible = true

func _physics_process(delta):
	timer += delta
	if end == true:
		level_cleared_animation()
		if $Victory.get_playback_position() > 5:
			get_tree().change_scene("res://Scenes/Levels.tscn")

