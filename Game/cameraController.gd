extends Camera2D
export(int) var speed

func _ready():
	pass

func _process(delta):
	position.y -= speed * delta
