extends Node2D

@onready var branch_8: StaticBody2D = $Boundary/Branch8

func _process(delta: float) -> void:
	if branch_8:
		if LevelManager.path_open == true:
			branch_8.queue_free()
