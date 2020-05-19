extends Label

onready var lives = get_parent().get_parent().get_node("Dog/Lives")
onready var camera = get_parent().get_parent().get_node("Camera2D")

onready var timer = 0
var minus_one = false

func _ready():
	pass
	
func in_game_display():
	self.text = "Shoots : " + str(lives.live) + "\nScore : " + str(camera.zone[0] - 2)
	self.get_font("font").size = 30

func _physics_process(delta):
	timer += delta
	if lives.live > 0 and camera.zone[0] > 1: in_game_display()
	elif camera.zone[0] == 1:
		pass
	else:
		self.text = "Score : " + str(camera.zone[0] - 2)
		self.get_font("font").size = 100 * camera.zone[0]
