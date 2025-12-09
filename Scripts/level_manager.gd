extends Node


var timerinstance = preload("res://Group-Project-2/Scenes/timer.tscn")
var instance = timerinstance.instantiate()
var acorn_amount = 0
var required_corns = 2
var golden_corn = false
var countdown_end = false
var NPC_speak = false

func WinLose():
	if NPC_speak == false:
		if acorn_amount >= required_corns:
			game_won()
		else:
			game_lost()
	else:
		add_child(instance)
		instance.exit_note()

func game_won():
	get_tree().change_scene_to_file("res://Group-Project-2/Scenes/won.tscn")

func game_lost():
	get_tree().change_scene_to_file("res://Group-Project-2/Scenes/lost.tscn")
