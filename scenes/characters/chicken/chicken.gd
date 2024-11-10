extends NonPlayableCharacter

func _ready() -> void:
	walk_cycles = randi_range(min_cycles, max_cycles)
