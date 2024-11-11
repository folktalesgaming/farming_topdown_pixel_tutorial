extends PanelContainer

@onready var tool_axe = $MarginContainer/HBoxContainer/ToolAxe
@onready var tool_tilling = $MarginContainer/HBoxContainer/ToolTilling
@onready var tool_corn_seed = $MarginContainer/HBoxContainer/ToolCornSeed
@onready var tool_tomato_seed = $MarginContainer/HBoxContainer/ToolTomatoSeed
@onready var tool_water_can = $MarginContainer/HBoxContainer/ToolWaterCan

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
