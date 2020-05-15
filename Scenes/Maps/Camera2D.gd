extends Camera2D

func _ready():
	pass
	

func trans_way(way):
	if way == 0:
		return Vector2(0, -231)
	if way == 1:
		return Vector2(616, -231)
	if way == 2:
		return Vector2(616, 0)
	if way == 3:
		return Vector2(616, 231)
	if way == 4:
		return Vector2(0, 231)
	if way == 5:
		return Vector2(-616, 231)
	if way == 6:
		return Vector2(-616, 0)
	if way == 7:
		return Vector2(-616, -231)

func change_camera(way):
	self.position += trans_way(way)
