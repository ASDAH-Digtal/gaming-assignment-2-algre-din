extends CharacterBody2D
class_name MainCharacter

@onready var animation = $AnimationPlayer

var wheel_base = 70
var steering_angle = 20
var engine_power = 900
var friction = -55
var drag = -0.06
var braking = -450
var max_speed_reverse = 250
var slip_speed = 400
var traction_fast = 2.5
var traction_slow = 10

var acceleration = Vector2.ZERO
var steer_direction

var max_health = 3
var health = 0
var can_take_damage = true
@export var hit = false

func _ready():
	health = max_health
	GameManager.player = self
	

func _physics_process(delta):
	acceleration = Vector2.ZERO
	get_input()
	apply_friction(delta)
	calculate_steering(delta)
	velocity += acceleration * delta
	move_and_slide()

func apply_friction(delta):
	if acceleration == Vector2.ZERO and velocity.length() < 50:
		velocity = Vector2.ZERO
	var friction_force = velocity * friction * delta
	var drag_force = velocity * velocity.length() * drag * delta
	acceleration += drag_force + friction_force

func get_input():
	var turn = Input.get_axis("steer_left", "steer_right")
	steer_direction = turn * deg_to_rad(steering_angle)
	if Input.is_action_pressed("accelerate"):
		acceleration = transform.x * engine_power
	if Input.is_action_pressed("brake"):
		acceleration = transform.x * braking
	if Input.is_action_just_pressed("indicate_left"):
		animation.play("left_indicate")
#		$Timer.start ( float time_sec=-1 )
#	elif Input.is_action_just_pressed("indicate_left") and $AnimationPlayer.current_animation == "left_indicate":
#		$AnimationPlayer.stop("left_indicate")
	if Input.is_action_just_pressed("indicate_right"):
		animation.play("right_indicate")
#	elif Input.is_action_just_pressed("indicate_left") and $AnimationPlayer.current_animation == "right_indicate":
#		$AnimationPlayer.stop("right_indicate")

func calculate_steering(delta):
	var rear_wheel = position - transform.x * wheel_base / 2.0
	var front_wheel = position + transform.x * wheel_base / 2.0
	rear_wheel += velocity * delta
	front_wheel += velocity.rotated(steer_direction) * delta
	var new_heading = rear_wheel.direction_to(front_wheel)
	var traction = traction_slow
	if velocity.length() > slip_speed:
		traction = traction_fast
	var d = new_heading.dot(velocity.normalized())
	if d > 0:
		velocity = lerp(velocity, new_heading * velocity.length(), traction * delta)
	if d < 0:
		velocity = -new_heading * min(velocity.length(), max_speed_reverse)
#	velocity = new_heading * velocity.length()
	rotation = new_heading.angle()

func take_damage(damage_amount:int):
	if can_take_damage:
		iframes()
		
		hit = true
		animation.play("hit")
		
		health -= damage_amount

		$Healthbar.update_healthbar(health, max_health)

		if health <= 0:
			die()

func iframes():
	can_take_damage = false
	await get_tree().create_timer(1).timeout
	can_take_damage = true

func die():
	GameManager.main_menu()


#func _on_area_2d_area_entered(area):
#	if area.get_parent() is NPC:
#		take_damage(1)
