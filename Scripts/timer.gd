extends CanvasLayer

class_name TimerScene

@onready var label: Label = $Label
@onready var label_2: Label = $Label2
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var time_left: float = 10.0
var countdown_active: bool = true

func _ready() -> void:
	label_2.text = ""

func _process(delta):
	label.add_theme_font_size_override("font_size", 30)
	if LevelManager.countdown_end == false:
		if countdown_active:
			time_left -= delta
			if time_left <= 0:
				time_left = 0
				countdown_active = false
				LevelManager.countdown_end = true
				LevelManager.WinLose()
			update_label()

func update_label():
	label.text = str(int(time_left))

func exit_note():
	if label_2 != null:
		label_2.add_theme_font_size_override("font_size", 30)
		label_2.text = "Seek and Find the Exit"
		animation_player.play("text_flash")
