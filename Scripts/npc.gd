extends Node2D

var player_ref: Node2D = null
@onready var label: Label = $Label

func _ready():
	$Area2D.body_entered.connect(_on_body_entered)
	$Area2D.body_exited.connect(_on_body_exited)
	label.add_theme_font_size_override("font_size", 12)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_ref = body
		_show_dialogue()

func _on_body_exited(body: Node2D) -> void:
	if body == player_ref:
		player_ref = null
		label.text = ""

func _show_dialogue():
	if player_ref == null:
		return

	if LevelManager.golden_corn == false:
		label.text = "Seek to find the golden acorn and return it to me for the ultimate reward."
	else:
		LevelManager.NPC_speak = true
		label.text = "Thank you for your generosity. The path has opened for you."
		dissapear()

func dissapear():
	await get_tree().create_timer(1.5).timeout
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 1.0)
	await tween.finished
	queue_free()
