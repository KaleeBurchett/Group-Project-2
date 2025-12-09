extends Area2D




func _on_body_entered(body: Node2D) -> void:
	LevelManager.golden_corn = true
	print(LevelManager.golden_corn)
	queue_free()
