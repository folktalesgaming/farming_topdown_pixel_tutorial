extends Control

@onready var day_label: Label = $DayNightPanel/MarginContainer/DayLabel
@onready var time_label: Label = $DayNightTimePanel/MarginContainer/TimeLabel

@export var normal_speed: int = 5
@export var fast_speed: int = 100
@export var super_fast_speed: int = 200

func _ready() -> void:
	DayNightCycleManager.time_tick.connect(on_time_tick)

func on_time_tick(day: int, hour: int, minute: int) -> void:
	day_label.text = "Day " + str(day)
	time_label.text = "%02d:%02d" % [hour, minute]

func _on_normal_speed_button_pressed():
	DayNightCycleManager.game_speed = normal_speed

func _on_fast_speed_button_pressed():
	DayNightCycleManager.game_speed = fast_speed

func _on_super_speed_button_pressed():
	DayNightCycleManager.game_speed = super_fast_speed
