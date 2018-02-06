extends Node2D

var speed = 400
var direction = Vector2()

func _ready():
	direction.y = -1;

func _process(delta):
	var velocity = Vector2()
	velocity = (direction * speed) * delta
	position += velocity

func _on_VisibilityNotifier2D_viewport_exited( viewport ):
	self.queue_free()
