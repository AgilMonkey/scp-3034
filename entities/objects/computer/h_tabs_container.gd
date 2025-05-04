extends HBoxContainer


@onready var tabs: VBoxContainer = $Tabs
@onready var content: Panel = $Content

var tabs_buttons: Array
var tabs_content: Array


func _ready() -> void:
	tabs_buttons = tabs.get_children()
	tabs_content = content.get_children()
	
	connect_tabs_to_content()


func connect_tabs_to_content():
	for i in tabs_content.size():
		var tab = tabs_buttons[i]
		if tab is Button:
			tab.button_down.connect(func(): show_content(i))


func show_content(i: int):
	for tab: Control in tabs_content:
		tab.hide()
	tabs_content[i].show()
