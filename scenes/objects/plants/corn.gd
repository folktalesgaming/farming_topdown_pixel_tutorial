extends Node2D

var corn_harvest_scene = preload("res://scenes/objects/plants/corn_harvest.tscn")

@onready var sprite_2d = $Sprite2D
@onready var watering_particles = $WateringParticles
@onready var flowering_particles = $FloweringParticles
@onready var growth_cycle_component = $GrowthCycleComponent
@onready var hurt_component = $HurtComponent

var growth_state: DataTypes.GrowthStates = DataTypes.GrowthStates.Seed

func _ready() -> void:
	watering_particles.emitting = false
	flowering_particles.emitting = false
	
	hurt_component.hurt.connect(on_hurt)
	growth_cycle_component.crop_maturity.connect(on_crop_maturity)
	growth_cycle_component.crop_harvesting.connect(on_crop_harvesting)

func _process(_delta) -> void:
	growth_state = growth_cycle_component.get_current_growth_state()
	sprite_2d.frame = growth_state
	
	if growth_state == DataTypes.GrowthStates.Maturity:
		flowering_particles.emitting = true

func on_hurt(hit_damage: int) -> void:
	if !growth_cycle_component.is_watered:
		watering_particles.emitting = true
		await get_tree().create_timer(5).timeout
		watering_particles.emitting = false
		growth_cycle_component.is_watered = true

func on_crop_maturity() -> void:
	flowering_particles.emitting = true

func on_crop_harvesting() -> void:
	var corn_harvest_instance = corn_harvest_scene.instantiate() as Node2D
	corn_harvest_instance.global_position = global_position
	get_parent().add_child(corn_harvest_instance)
	queue_free()