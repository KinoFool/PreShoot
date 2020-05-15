extends Camera2D

func _ready():
	pass
	

func trans_way(way):
	if way == 0:
		return Vector2(0, -200)
	if way == 1:
		return Vector2(600, -200)
	if way == 2:
		return Vector2(600, 0)
	if way == 3:
		return Vector2(600, 200)
	if way == 4:
		return Vector2(0, 200)
	if way == 5:
		return Vector2(-600, 200)
	if way == 6:
		return Vector2(-600, 0)
	if way == 7:
		return Vector2(-600, -200)

func change_camera(way):
	print("Yes ", way)
	self.position += trans_way(way)
