extends ParallaxBackground

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	scroll_offset.y += 150 * delta
	get_node("ParallaxLayer").motion_offset.y += 200 * delta
