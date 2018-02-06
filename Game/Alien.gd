extends Node2D

func _ready():
	get_node("Path2D/PathFollow2D/AnimationPlayer").play("alien_follow_path")

func _process(delta):
	pass

func _on_Area2D_area_entered( area ):
	if(area.get_parent().is_in_group("PlayerFire")):
		queue_free()

func _on_VisibilityNotifier2D_viewport_exited( viewport ):
	queue_free()
