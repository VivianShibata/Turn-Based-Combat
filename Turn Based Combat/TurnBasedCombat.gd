extends Node2D

export(Resource) var enemy = null #exportando o "Mentor"

signal textbox_closed

var current_Dellman_health = 0
var current_enemy_health = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	
	$Textbox.hide()
	
	set_health($Mentor/ProgressBar, enemy.health, enemy.health) #define a vida dos personagens
	set_health($Dellman/ProgressBar, GlobalVariables.current_health, GlobalVariables.total_health)
	
	current_Dellman_health = GlobalVariables.current_health
	current_enemy_health = enemy.health
	
	display_text("Mentor: Are you prepared to face me?")
	yield(self, "textbox_closed")
	$ColorRect/Fight.show()
	

func _input(event):
	if (Input.is_action_pressed("ui_accept") or Input.is_mouse_button_pressed(BUTTON_LEFT)) and $Textbox.visible:
		$Textbox.hide()
		emit_signal("textbox_closed")
		

func display_text(text):
	$Textbox.show()
	$Textbox/Label.text = text


func _on_Fight_pressed(): #starting the fight // começando a luta
	if $ColorRect2.visible == false:
		$ColorRect2.visible = true
	$ColorRect/Fight.visible = false
	
	
#func _input(event):   #to make the text box dissapear when pressing space or mouse
#	if (Input.is_action_pressed("ui_accept") or Input.is_mouse_button_pressed(BUTTON_LEFT) and ///.visible)
#	// .hide()

func set_health(progress_bar, health, total_health): #função para a verificação da vida
	progress_bar.value = health
	progress_bar.max_value = total_health
	progress_bar.get_node("Label").text = "HP:%d/%d" % [health, total_health] #appear health percentage



func enemy_turn():
	$ColorRect2.hide()
	display_text("The Mentor gethers their vast knowledge!")
	yield(self, "textbox_closed")
	$ColorRect2.show()
	
	current_Dellman_health = max(0, current_Dellman_health - enemy.damage)
	set_health($Dellman/ProgressBar, current_Dellman_health, GlobalVariables.total_health)
	
	$AnimationPlayer.play("Dellman.damage")
	yield($AnimationPlayer,"animation_finished")
	
	$ColorRect2.hide()
	display_text("Mentor dealt %d damage!" % enemy.damage)
	yield(self, "textbox_closed")
	$ColorRect2.show()


func _on_TextureButton_pressed(): #ataque fraco
	
	$ColorRect2.hide()
	display_text("You try to remember what you've just seen, but there's nothing there...")
	yield(self, "textbox_closed")
	$ColorRect2.show()
	
	current_enemy_health = max(0, current_enemy_health - GlobalVariables.damage1)
	set_health($Mentor/ProgressBar, current_enemy_health, enemy.health)
	
	$AnimationPlayer.play("Mentor_damage")
	yield($AnimationPlayer,"animation_finished")
	#animação... não sei muito o que falar sobre isso...
	
	$ColorRect2.hide()
	display_text("You dealt %d damage!" % GlobalVariables.damage1)
	yield(self, "textbox_closed")
	$ColorRect2.show()
	
	if current_enemy_health == 0:
		display_text("You could cure the Mentor!")
		yield(self, "textbox_closed")
		
		$AnimationPlayer.play("Mentor.died")
		yield($AnimationPlayer,"animation_finished")
		
		yield(get_tree().create_timer(0.40),"timeout")
		get_tree().quit()
	
	if current_Dellman_health == 0:
		display_text("You were defeated...")
		yield(self, "textbox_closed")
		
		$AnimationPlayer.play("Dellman.died")
		yield($AnimationPlayer,"animation_finished")
		
		yield(get_tree().create_timer(0.40),"timeout")
		get_tree().quit()
	
	enemy_turn()
	


func _on_TextureButton2_pressed(): #ataque mediano
	
	$ColorRect2.hide()
	display_text("You remember what you learn, but will it be enough?")
	yield(self, "textbox_closed")
	$ColorRect2.show()
	
	current_enemy_health = max(0, current_enemy_health - GlobalVariables.damage2)
	set_health($Mentor/ProgressBar, current_enemy_health, enemy.health)
	
	$AnimationPlayer.play("Mentor_damage")
	yield($AnimationPlayer,"animation_finished")
	#animação... não sei muito o que falar sobre isso...
	
	$ColorRect2.hide()
	display_text("You dealt %d damage!" % GlobalVariables.damage2)
	yield(self, "textbox_closed")
	$ColorRect2.show()
	
	if current_enemy_health == 0:
		display_text("You could cure the Mentor!")
		yield(self, "textbox_closed")
		
		$AnimationPlayer.play("Mentor.died")
		yield($AnimationPlayer,"animation_finished")
		
		yield(get_tree().create_timer(0.40),"timeout")
		get_tree().quit()
	
	if current_Dellman_health == 0:
		display_text("You were defeated...")
		yield(self, "textbox_closed")
		
		$AnimationPlayer.play("Dellman.died")
		yield($AnimationPlayer,"animation_finished")
		
		yield(get_tree().create_timer(0.40),"timeout")
		get_tree().quit()
	
	enemy_turn()


func _on_TextureButton3_pressed(): #ataque mediano
	
	$ColorRect2.hide()
	display_text("You concentrate your power and focus on your knowledge!")
	yield(self, "textbox_closed")
	$ColorRect2.show()
	
	current_enemy_health = max(0, current_enemy_health - GlobalVariables.damage3)
	set_health($Mentor/ProgressBar, current_enemy_health, enemy.health)
	
	$AnimationPlayer.play("Mentor_damage")
	yield($AnimationPlayer,"animation_finished")
	#animação... não sei muito o que falar sobre isso...
	
	$ColorRect2.hide()
	display_text("You dealt %d damage!" % GlobalVariables.damage3)
	yield(self, "textbox_closed")
	$ColorRect2.show()
	
	if current_enemy_health == 0:
		display_text("You could cure the Mentor!")
		yield(self, "textbox_closed")
		
		$AnimationPlayer.play("Mentor.died")
		yield($AnimationPlayer,"animation_finished")
		
		yield(get_tree().create_timer(0.40),"timeout")
		get_tree().quit()
	
	
	if current_Dellman_health == 0:
		display_text("You were defeated...")
		yield(self, "textbox_closed")
		
		$AnimationPlayer.play("Dellman.died")
		yield($AnimationPlayer,"animation_finished")
		
		yield(get_tree().create_timer(0.40),"timeout")
		get_tree().quit()
	
	enemy_turn()


func _on_TextureButton4_pressed(): #ataque forte
	
	$ColorRect2.hide()
	display_text("You gather new ideas and reflect upon your inner self!")
	yield(self, "textbox_closed")
	$ColorRect2.show()
	
	current_enemy_health = max(0, current_enemy_health - GlobalVariables.damage4)
	set_health($Mentor/ProgressBar, current_enemy_health, enemy.health)
	
	$AnimationPlayer.play("Mentor_damage")
	yield($AnimationPlayer,"animation_finished")
	#animação... não sei muito o que falar sobre isso...
	
	$ColorRect2.hide()
	display_text("You dealt %d damage!" % GlobalVariables.damage4)
	yield(self, "textbox_closed")
	$ColorRect2.show()
	
	if current_enemy_health == 0:
		display_text("You could cure the Mentor!")
		yield(self, "textbox_closed")
		
		$AnimationPlayer.play("Mentor.died")
		yield($AnimationPlayer,"animation_finished")
		
		yield(get_tree().create_timer(0.40),"timeout")
		get_tree().quit()
	
	
	if current_Dellman_health == 0:
		display_text("You were defeated...")
		yield(self, "textbox_closed")
		
		$AnimationPlayer.play("Dellman.died")
		yield($AnimationPlayer,"animation_finished")
		
		yield(get_tree().create_timer(0.40),"timeout")
		get_tree().quit()
	
	enemy_turn()
