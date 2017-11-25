extends Node2D

func _ready():
	# set menu active
	get_node( "menulayer/menu" ).set_active( true )
	get_node( "menulayer/menu" ).connect( "selected_item", self, "_on_menu_selected_item" )
	if not game.continue_game: get_node( "menulayer/menu" ).set_unselectable_item( 1 )



func _on_menu_selected_item( item ):
	if item == 0:
		# reset game settings
		game.score = 0
		game.has_key = false
		game.boss_fight = false
		game.act_specific = { \
				game.ACTS.HELL : { "scene": 1, "persistent": [] }, \
				game.ACTS.GRAVEYARD : { "scene": 1, "persistent": [] } }
		game.player_char = game.PLAYER_CHAR.HUMAN
		# start new game
		game.main.act_nxt = "res://scenes/act_1/act_1.tscn"
	elif item == 1:
		# continue game
		if game.cur_act == game.ACTS.HELL:
			game.main.act_nxt = "res://scenes/act_1/act_1.tscn"
		elif game.cur_act == game.ACTS.GRAVEYARD:
			game.main.act_nxt = "res://scenes/act_2/act_2.tscn"
	elif item == 2:
		# show controls
		game.main.act_nxt = "res://scenes/intro/controls.tscn"
	elif item == 3:
		# show credits
		game.main.act_nxt = "res://scenes/intro/credits.tscn"
	elif item == 4:
		# quit
		get_tree().quit()
