extends CanvasLayer

@onready var intro: CanvasLayer = $"."


func _ready() -> void:
	intro.show()
	get_tree().paused = true



func _on_button_pressed() -> void:
	intro.hide()
	get_tree().paused = false
