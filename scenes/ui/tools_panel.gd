extends PanelContainer

@onready var tool_axe: Button = $MarginContainer/HBoxContainer/ToolAxe
@onready var tool_tilling: Button = $MarginContainer/HBoxContainer/ToolTilling
@onready var tool_corn_seed: Button = $MarginContainer/HBoxContainer/ToolCornSeed
@onready var tool_tomato_seed: Button = $MarginContainer/HBoxContainer/ToolTomatoSeed
@onready var tool_water_can: Button = $MarginContainer/HBoxContainer/ToolWaterCan

func _ready() -> void:
	ToolManager.enable_tool.connect(on_enable_tool_button)
	
	tool_tilling.disabled = true
	tool_tilling.focus_mode = Control.FOCUS_NONE
	
	tool_water_can.disabled = true
	tool_water_can.focus_mode = Control.FOCUS_NONE
	
	tool_corn_seed.disabled = true
	tool_corn_seed.focus_mode = Control.FOCUS_NONE
	
	tool_tomato_seed.disabled = true
	tool_tomato_seed.focus_mode = Control.FOCUS_NONE

func _on_tool_axe_pressed():
	ToolManager.select_tool(DataTypes.Tools.AxeWood)

func _on_tool_tilling_pressed():
	ToolManager.select_tool(DataTypes.Tools.TillGround)

func _on_tool_water_can_pressed():
	ToolManager.select_tool(DataTypes.Tools.WaterCorp)

func _on_tool_corn_seed_pressed():
	ToolManager.select_tool(DataTypes.Tools.PlantCorn)

func _on_tool_tomato_seed_pressed():
	ToolManager.select_tool(DataTypes.Tools.PlantTomato)

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			ToolManager.select_tool(DataTypes.Tools.None)
			tool_axe.release_focus()
			tool_tilling.release_focus()
			tool_water_can.release_focus()
			tool_corn_seed.release_focus()
			tool_tomato_seed.release_focus()

func on_enable_tool_button(tool: DataTypes.Tools) -> void:
	if tool == DataTypes.Tools.TillGround:
		tool_tilling.disabled = false
		tool_tilling.focus_mode = Control.FOCUS_ALL
	elif tool == DataTypes.Tools.WaterCorp:
		tool_water_can.disabled = false
		tool_water_can.focus_mode = Control.FOCUS_ALL
	elif tool == DataTypes.Tools.PlantCorn:
		tool_corn_seed.disabled = false
		tool_corn_seed.focus_mode = Control.FOCUS_ALL
	elif tool == DataTypes.Tools.PlantTomato:
		tool_tomato_seed.disabled = false
		tool_tomato_seed.focus_mode = Control.FOCUS_ALL
