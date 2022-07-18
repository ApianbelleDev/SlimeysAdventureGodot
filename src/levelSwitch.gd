extends Area2D

#TODO: create a variable in a global script for the game to tell which level you are currently on
export (String) var levelName


#calles levelChange on kinematicbody2D collision with the level end component
func _on_player_entered(_body):
	levelChange()

#gets a scene to change based on a variable
func levelChange():
	get_tree().change_scene(levelName)
