extends Area2D


func _on_body_entered(body):
	LevelManager.acorn_amount += 1
	print(LevelManager.acorn_amount)
	queue_free()
