extends Panel

@onready var animated_sprite_2d = $Emotes/AnimatedSprite2D
@onready var emote_idle_timer = $EmoteIdleTimer

var idle_emote: Array = ["emote_1_idle", "emote_2_smile", "emote_3_ear_wave", "emote_4_blink"]

func _ready() -> void:
	animated_sprite_2d.play("emote_1_idle")

func play_emote(animation: String) -> void:
	animated_sprite_2d.play(animation)

func _on_emote_idle_timer_timeout():
	var index = randi_range(0, idle_emote.size() - 1)
	var emote = idle_emote[index]
	
	animated_sprite_2d.play(emote)
