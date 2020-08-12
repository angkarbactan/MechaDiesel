extends Node
onready var enemy = $Enemy
onready var player = $Player
onready var ui = $UI
var rng
var total_accuracy
var player_damage_output = []
var enemy_damage_output = []

func _on_Attack_Button_pressed():
	print("Attack Button Pressed!")
	player_damage_output = []
	for i in player.weapon_fire_rate:
		randomize()
		player_damage_output.append(randi()%player.weapon_damage+1)
	print("Damage Outcome: " + str(player_damage_output))
	print("----")
	$UI/Attack_Button.hide()
	$UI/Offensive_Phase_Label.hide()
	$UI/Block_Button.show()
	$UI/Evade_Button.show()
	$UI/Defensive_Phase_Label.show()




func _on_Battle_ready():
	enemy = get_node("Enemy")
	enemy.initialize_mech_body()
	player = get_node("Player")
	player.initialize_mech_body()



func _on_Block_Button_pressed():
	for i in player_damage_output:
		enemy.set_mech_body(enemy.mech_body-(i/2))
		print(enemy.mech_body)
	print("Enemy")
	enemy_damage_output = []
	for i in enemy.weapon_fire_rate:
		randomize()
		enemy_damage_output.append(randi()%enemy.weapon_damage+1)
	print("Damage Outcome: " + str(enemy_damage_output))
	print("----")
	for i in enemy_damage_output:
		player.set_mech_body(player.mech_body-(i/2))
		print(enemy.mech_body)
	if enemy.mech_body <= 0:
		$Enemy/Sprite.hide()
		$Enemy/HP.hide()
	if player.mech_body <= 0:
		$Player/Sprite.hide()
		$Player/HP.hide()
		$UI.hide()
	$UI/Attack_Button.show()
	$UI/Offensive_Phase_Label.show()
	$UI/Block_Button.hide()
	$UI/Evade_Button.hide()
	$UI/Defensive_Phase_Label.hide()
	
	


func _on_Evade_Button_pressed():
	randomize()
	if randi()%49+1 > enemy.mech_speed:
		for i in player_damage_output:
			enemy.set_mech_body(enemy.mech_body-(i/2))
			print(enemy.mech_body)
	enemy_damage_output = []
	for i in enemy.weapon_fire_rate:
		randomize()
		enemy_damage_output.append(randi()%enemy.weapon_damage+1)
	print("Damage Outcome: " + str(enemy_damage_output))
	print("----")
	randomize()
	if randi()%49+1 > player.mech_speed:
		for i in enemy_damage_output:
			player.set_mech_body(player.mech_body-(i/2))
			print(enemy.mech_body)
	if enemy.mech_body <= 0:
		$Enemy/Sprite.hide()
		$Enemy/HP.hide()
	if player.mech_body <= 0:
		$Player/Sprite.hide()
		$Player/HP.hide()
		$UI.hide()
	$UI/Attack_Button.show()
	$UI/Offensive_Phase_Label.show()
	$UI/Block_Button.hide()
	$UI/Evade_Button.hide()
	$UI/Defensive_Phase_Label.hide()
