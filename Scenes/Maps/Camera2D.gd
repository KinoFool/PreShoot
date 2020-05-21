extends Camera2D

onready var zone = [1, 0, 0]

onready var times = 0

func trans_way(way):
	if way == 0: return Vector2(308, -231)
	if way == 1: return Vector2(616, -231)
	if way == 2: return Vector2(616, 0)
	if way == 3: return Vector2(616, 231)
	if way == 4: return Vector2(308, 231)
	if way == 5: return Vector2(0, 231)
	if way == 6: return Vector2(0, 0)
	if way == 7: return Vector2(0, -231)

func change_camera(way):
	times += 1
	print(times)
	self.position += trans_way(way)
	if times >= 2: self.position.y += trans_way(way).y
	if way == 1:
		zone[0] += 1
		zone[1] += 1
	if way == 2: zone[0] += 1
	if way == 3:
		zone[0] += 1
		zone[2] += 1
