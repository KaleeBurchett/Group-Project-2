extends Area2D


func _process(delta: float) -> void:
	if LevelManager.NPC_speak == true:
		$".".show()


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		get_tree().change_scene_to_file("res://Group-Project-2/Scenes/won.tscn")
