extends Node

#Mech Stats
var mech_body = 25*4 setget set_mech_body, get_mech_body
var mech_speed = 25 setget , get_mech_speed
var mech_accuracy = 35 setget , get_mech_accuracy

#Weapon Stats
var weapon_fire_rate = 5 setget , get_weapon_fire_rate 
var weapon_damage = 4 setget , get_weapon_damage
var weapon_accuracy = 15 setget , get_weapon_accuracy


onready var mech_body_label = $HP


func initialize_mech_body():
	mech_body_label.text = str(mech_body) + "HP"

func set_mech_body (new_mech_body):
	mech_body = new_mech_body
	mech_body_label.text = str(mech_body) + "HP"

func get_mech_body():
	return mech_body

func get_mech_speed():
	return mech_speed

func get_mech_accuracy():
	return mech_accuracy

func get_weapon_fire_rate():
	return weapon_fire_rate

func get_weapon_damage():
	return weapon_damage

func get_weapon_accuracy():
	return weapon_accuracy
