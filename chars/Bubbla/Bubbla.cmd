; The CMD file.
;
; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;
; 1. Command definition
; ---------------------
; Note: The commands are CASE-SENSITIVE, and so are the command names.
; The eight directions are:
;   B, DB, D, DF, F, UF, U, UB     (all CAPS)
;   corresponding to back, down-back, down, downforward, etc.
; The six buttons are:
;   a, b, c, x, y, z               (all lower case)
;   In default key config, abc are are the bottom, and xyz are on the
;   top row. For 2 button characters, we recommend you use a and b.
;   For 6 button characters, use abc for kicks and xyz for punches.
;
; Each [Command] section defines a command that you can use for
; state entry, as well as in the CNS file.
; The command section should look like:
;
;   [Command]
;   name = some_name
;   command = the_command
;   time = time (optional -- defaults to 15 if omitted)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas.
;   Directions and buttons can be preceded by special characters:
;   slash (/) - means the key must be held down
;          egs. command = /D       ;hold the down direction
;               command = /DB, a   ;hold down-back while you press a
;   tilde (~) - to detect key releases
;          egs. command = ~a       ;release the a button
;               command = ~D, F, a ;release down, press fwd, then a
;          If you want to detect "charge moves", you can specify
;          the time the key must be held down for (in game-ticks)
;          egs. command = ~30a     ;hold a for at least 30 ticks, then release
;   dollar ($) - Direction-only: detect as 4-way
;          egs. command = $D       ;will detect if D, DB or DF is held
;               command = $B       ;will detect if B, DB or UB is held
;   plus (+) - Buttons only: simultaneous press
;          egs. command = a+b      ;press a and b at the same time
;               command = x+y+z    ;press x, y and z at the same time
;   You can combine them:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;   It's recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This matches the way most
;   popular fighting games implement their command detection.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. Defaults to 15
;   if omitted
;
; If you have two or more commands with the same name, all of them will
; work. You can use it to allow multiple motions for the same move.
;
; Some common commands examples are given below.
;
; [Command] ;Quarter circle forward + x
; name = "QCF_x"
; command = ~D, DF, F, x
;
; [Command] ;Half circle back + a
; name = "HCB_a"
; command = ~F, DF, D, DB, B, a
;
; [Command] ;Two quarter circles forward + y
; name = "2QCF_y"
; command = ~D, DF, F, D, DF, F, y
;
; [Command] ;Tap b rapidly
; name = "5b"
; command = b, b, b, b, b
; time = 30
;
; [Command] ;Charge back, then forward + z
; name = "charge_B_F_z"
; command = ~60$B, F, z
; time = 10
; 
; [Command] ;Charge down, then up + c
; name = "charge_D_U_c"
; command = ~60$D, U, c
; time = 10
; 

;-| Button Remapping |-----------------------------------------------------
; This section lets you remap the player's buttons (to easily change the
; button configuration). The format is:
;   old_button = new_button
; If new_button is left blank, the button cannot be pressed.
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| Default Values |-------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 30

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 3

;-| Supers |-------------------------------------------------------

[command]
name = "SUPER1"
command = x+y
time = 30

;-| Specials |-------------------------------------------------------
[command]
name = "SPECIAL 1"
command = ~D,DF,F,a
time = 15
buffer.time = 5

[command]
name = "SPECIAL 2"
command = ~D,DB,B,a
time = 15
buffer.time = 5

[command]
name = "SPECIAL 3"
command = ~D,DF,F,b
time = 15
buffer.time = 5

[command]
name = "SPECIAL 4"
command = ~D,DB,B,b
time = 15
buffer.time = 5

[command]
name = "SPECIAL 5"
command = ~D,DF,F,c
time = 15
buffer.time = 5

[command]
name = "SPECIAL 6"
command = ~D,DB,B,c
time = 15
buffer.time = 5
;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10
buffer.time = 1

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10
buffer.time = 1

[Command]
name = "DD"     ;Required (do not remove)
command = D, D
time = 10
buffer.time = 1
;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery" ;Required (do not remove)
command = /x
time = 1

[Command]
name = "recovery"
command = /s
time = 1

[Command]
name = "recovery"
command = /y
time = 1

[Command]
name = "recovery"
command = /c
time = 1

[Command]
name = "recovery"
command = /b
time = 1

[Command]
name = "recovery"
command = /a
time = 1

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "back_x"
command = /$B,x
time = 1

[Command]
name = "back_y"
command = /$B,y
time = 1

[Command]
name = "back_z"
command = /$B,z
time = 1

[Command]
name = "down_x"
command = /$D,x
time = 1

[Command]
name = "down_y"
command = /$D,y
time = 1

[Command]
name = "down_z"
command = /$D,z
time = 1

[Command]
name = "fwd_x"
command = /$F,x
time = 1

[Command]
name = "fwd_y"
command = /$F,y
time = 1

[Command]
name = "fwd_z"
command = /$F,z
time = 1

[Command]
name = "up_x"
command = /$U,x
time = 1

[Command]
name = "up_y"
command = /$U,y
time = 1

[Command]
name = "up_z"
command = /$U,z
time = 1

[Command]
name = "back_a"
command = /$B,a
time = 1

[Command]
name = "back_b"
command = /$B,b
time = 1

[Command]
name = "back_c"
command = /$B,c
time = 1

[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

[Command]
name = "down_c"
command = /$D,c
time = 1

[Command]
name = "fwd_a"
command = /$F,a
time = 1

[Command]
name = "fwd_b"
command = /$F,b
time = 1

[Command]
name = "fwd_c"
command = /$F,c
time = 1

[Command]
name = "up_a"
command = /$U,a
time = 1

[Command]
name = "up_b"
command = /$U,b
time = 1

[Command]
name = "up_c"
command = /$U,c
time = 1

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "s"
command = s
time = 1

;-| Single Dir |------------------------------------------------------------
[Command]
name = "fwd" ;Required (do not remove)
command = $F
time = 1
buffer.time = 1

[Command]
name = "downfwd"
command = $DF
time = 1

[Command]
name = "down" ;Required (do not remove)
command = $D
time = 1
buffer.time = 1

[Command]
name = "downback"
command = $DB
time = 1

[Command]
name = "back" ;Required (do not remove)
command = $B
time = 1
buffer.time = 1

[Command]
name = "upback"
command = $UB
time = 1

[Command]
name = "up" ;Required (do not remove)
command = $U
time = 1
buffer.time = 1

[Command]
name = "upfwd"
command = $UF
time = 1

;-| Hold Button |--------------------------------------------------------------
[Command]
name = "hold_x"
command = /x
time = 1

[Command]
name = "hold_y"
command = /y
time = 1

[Command]
name = "hold_z"
command = /z
time = 1

[Command]
name = "hold_a"
command = /a
time = 1

[Command]
name = "hold_b"
command = /b
time = 1

[Command]
name = "hold_c"
command = /c
time = 1

[Command]
name = "hold_s"
command = /s
time = 1

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd" ;Required (do not remove)
command = /$F
time = 1
buffer.time = 1

[Command]
name = "holddownfwd"
command = /$DF
time = 1
buffer.time = 1

[Command]
name = "holddown" ;Required (do not remove)
command = /$D
time = 1
buffer.time = 1

[Command]
name = "holddownback"
command = /$DB
time = 1
buffer.time = 1

[Command]
name = "holdback" ;Required (do not remove)
command = /$B
time = 1
buffer.time = 1

[Command]
name = "holdupback"
command = /$UB
time = 1
buffer.time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1
buffer.time = 1

[Command]
name = "holdupfwd"
command = /$UF
time = 1
buffer.time = 1

;---------------------------------------------------------------------------
; 2. State entry
; --------------
; This is where you define what commands bring you to what states.
;
; Each state entry block looks like:
;   [State -1, Label]           ;Change Label to any name you want to use to
;                               ;identify the state with.
;   type = ChangeState          ;Don't change this
;   value = new_state_number
;   trigger1 = command = command_name
;   . . .  (any additional triggers)
;
; - new_state_number is the number of the state to change to
; - command_name is the name of the command (from the section above)
; - Useful triggers to know:
;   - statetype
;       S, C or A : current state-type of player (stand, crouch, air)
;   - ctrl
;       0 or 1 : 1 if player has control. Unless "interrupting" another
;                move, you'll want ctrl = 1
;   - stateno
;       number of state player is in - useful for "move interrupts"
;   - movecontact
;       0 or 1 : 1 if player's last attack touched the opponent
;                useful for "move interrupts"
;
; Note: The order of state entry is important.
;   State entry with a certain command must come before another state
;   entry with a command that is the subset of the first.  
;   For example, command "fwd_a" must be listed before "a", and
;   "fwd_ab" should come before both of the others.
;
; For reference on triggers, see CNS documentation.
;
; Just for your information (skip if you're not interested):
; This part is an extension of the CNS. "State -1" is a special state
; that is executed once every game-tick, regardless of what other state
; you are in.


; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]

;===========================================================================
;---------------------------------------------------------------------------
[State -1, AI ON] ; Turn the AI on when
Type = VarSet
TriggerAll = Var(59) < 1; it is not on yet and
TriggerAll = RoundState=2 ; the fight has started and is not over yet and
Trigger1 = AILevel>0 ; the computer is playing the character
v = 59
value= 1 ; value of 1 will mean the AI is on
Ignorehitpause=1

[State -1, AI OFF] ; Turn the AI off when
Type=VarSet
Trigger1=var(59)>0 ; it is on and
Trigger1=RoundState!=2 ; the round is not started yet or is already over
Trigger2=!IsHelper ; OR if we are a player, but
Trigger2=AILevel=0 ; the computer is not in control
v=59
value=0 ; value of 0 will mean the AI is off. values other than 0 and 1 are not used in this example, we have only one AI mode, the normal one.
Ignorehitpause=1

[State -1]
Type=VarSet
Trigger1=1
var(50)=(AILevel=1)*3+(AILevel=2)*7+(AILevel=3)*16+(AILevel=4)*30+(AILevel=5)*58+(AILevel=6)*90+ (AILevel=7)*150+(AILevel=8)*300

[State -1]
Type=Changestate
Triggerall=Inguarddist; Guard when in guard distance
Triggerall=var(59)>0; and the AI is on
Triggerall=ctrl; and we have control
Trigger1 = random< (var(50)*2+(AiLevel>=3)*30); chance is higher than for attacking, but not by too much.
value=120

[State -1]; The engine will still guard by through pressing the back button, we need to disable that.
Type=Assertspecial
Triggerall=StateNo!=[120,160]
Trigger1=var(59)>0
flag=noairguard
flag2=nocrouchguard
flag3=nostandguard
;---------------------------------------------------------------------------
; Soft Fast Fall
[State -1, Soft Fast Fall]
type = VelSet
triggerall = statetype = A
triggerall = command = "down" && movetype != H
triggerall = vel y > -1 && vel y < 6
triggerall = stateno != 900
trigger1 = 1
y = 6

;===========================================================================
;SPECIALS:
;===========================================================================
;---------------------------------------------------------------------------
; Special 1
[State -1, Giant Bubble Ball]
type = ChangeState
value = 21000
triggerall = var(21) > 0
triggerall = numhelper(3500) = 0
triggerall = command = "SPECIAL 1"
Triggerall = power >= 1000
trigger1 = ctrl
trigger2 = stateno = [200, 290] && movecontact
trigger3 = stateno = [300, 390] && movecontact
trigger4 = stateno = [600, 610] && movecontact
;---------------------------------------------------------------------------
; Special 1 Failed
[State -1, Giant Bubble Ball Fail]
type = ChangeState
value = 451
triggerall = var(21) = 0
triggerall = numhelper(3500) = 0
triggerall = command = "SPECIAL 1"
Triggerall = power >= 1000

trigger1 = ctrl
;---------------------------------------------------------------------------
; Special 2 - Activation
[State -1, Sudsplosion!]
type = ChangeState
value = 22000
triggerall = numhelper(3500) = 0
triggerall = var(22) = 0
triggerall = var(21) >= 1
triggerall = command = "SPECIAL 2"
Triggerall = statetype != A
Triggerall = power >= 1000
trigger1 = ctrl
trigger2 = stateno = [200, 210] && movecontact
trigger3 = stateno = [300, 310] && movecontact
;---------------------------------------------------------------------------
; Special 3 - Setup
[State -1, Triple Bubble Ball]
type = ChangeState
value = 23000
triggerall = numhelper(3500) = 0
triggerall = numhelper(21501) < 1
triggerall = numhelper(21502) < 1
triggerall = numhelper(21503) < 1
triggerall = var(21) >= 3
triggerall = numhelper(24500) < 2
triggerall = command = "SPECIAL 3"
Triggerall = statetype != A
Triggerall = power >= 1000
trigger1 = ctrl
trigger2 = stateno = [200, 210] && movecontact
trigger3 = stateno = [300, 310] && movecontact
;---------------------------------------------------------------------------
; Special 4
[State -1, Triple Bubble Burst]
type = ChangeState
value = 24000
triggerall = numhelper(3500) = 0
triggerall = numhelper(23500) < 2
triggerall = numhelper(24500) < 2
triggerall = command = "SPECIAL 4"
triggerall = var(21) >= 3
Triggerall = statetype != A
Triggerall = power >= 500
trigger1 = ctrl
trigger2 = stateno = [200, 210] && movecontact
trigger3 = stateno = [300, 310] && movecontact
;---------------------------------------------------------------------------
; Special 5
[State -1, Deadly Bubble Blowing]
type = ChangeState
value = 25000
triggerall = numhelper(3500) = 0
triggerall = command = "SPECIAL 5"
Triggerall = statetype != A
triggerall = power >= 1500
trigger1 = ctrl
trigger2 = stateno = [200, 210] && movecontact
trigger3 = stateno = [300, 310] && movecontact
;---------------------------------------------------------------------------
; Special 6
[State -1, Bubblo Bubbla Water Beam]
type = ChangeState
value = 26000
triggerall = numhelper(3500) = 0
triggerall = command = "SPECIAL 6"
Triggerall = statetype != A
Triggerall = power >= 2000
trigger1 = ctrl
trigger2 = stateno = [200, 210] && movecontact
trigger3 = stateno = [300, 310] && movecontact
;===========================================================================
;---------------------------------------------------------------------------
; Wavedash
[State -1, Wavedash]
type = ChangeState
value = 30
trigger1 = command = "WD" && command != "NotWD"
trigger1 = statetype = C || statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Run Back
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
; Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = stateno = 0
triggerall = roundstate = 2 && ailevel > 0 && random < (ailevel * 100)
triggerall = p2bodydist x > 20
trigger1 = statetype = S
trigger1 = ctrl

;===========================================================================
;---------------------------Basics-----------------------------------------
;Hyperhop
[State -1, Hyperhop]
type = ChangeState
value = 60
trigger1 = statetype != A
trigger1 = command = "hyperhop"
trigger1 = ctrl
;---------------------------------------------------------------------------
; Air Dash - Forward
[State -1, Air Dash - Forward]
type = ChangeState
triggerall = var(5) = 0
triggerall = stateno != 60
triggerall = stateno != 65
triggerall = stateno != 70
trigger1 = command = "FF"
trigger1 = ctrl
value = ifelse(pos y >= 0,52,65)
;---------------------------------------------------------------------------
; Air Dash - Backwards
[State -1, Air Dash - Backwards]
type = ChangeState
triggerall = var(5) = 0
triggerall = stateno != 60
triggerall = stateno != 65
triggerall = stateno != 70
value = 70
trigger1 = command = "BB"
trigger1 = ctrl

;===========================================================================
;--------------------------------Normal Attacks---------------------------
;---------------------------------------------------------------------------
; Down + A
[State -1, Down + A]
type = ChangeState
value = 950
triggerall = command = "holddown"
triggerall = command = "a"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; A
[State -1, A]
type = ChangeState
value = 200
triggerall = command = "a"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Back + A
[State -1, Back + A]
type = ChangeState
value = 330
triggerall = command = "holdback"
triggerall = command = "a"
Triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Down + B
[State -1, Down + B]
type = ChangeState
value = 900
triggerall = command = "holddown"
triggerall = command = "b"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; B
[State -1, B]
type = ChangeState
value = 300
triggerall = command = "b"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Down + C
[State -1, Down + C]
type = ChangeState
value = 451
Triggerall = power >= 200
triggerall = numhelper(3500) = 0
triggerall = var(21) = 0 && numhelper(475) = 0
triggerall = command = "holddown"
triggerall = command = "c"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Down + C
[State -1, Down + C]
type = ChangeState
value = 450
Triggerall = power >= 200
triggerall = numhelper(3500) = 0
triggerall = var(21) > 0 || numhelper(475) > 0
triggerall = command = "holddown"
triggerall = command = "c"
Triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
; 4C
[State -1, 4C]
type = ChangeState
value = 470
triggerall = numhelper(3500) = 0
triggerall = numhelper(475) = 0
triggerall = numhelper(476) = 0
triggerall = numhelper(477) = 0
Triggerall = power >= 200
triggerall = command = "holdback"
triggerall = command = "c"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Forward+C
[State -1, 4C]
type = ChangeState
value = 460
triggerall = numhelper(3500) = 0
triggerall = numhelper(475) = 0
triggerall = numhelper(476) = 0
triggerall = numhelper(477) = 0
Triggerall = power >= 200
triggerall = command = "holdfwd"
triggerall = command = "c"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; C
[State -1, C]
type = ChangeState
value = 400
triggerall = numhelper(3500) = 0
Triggerall = power >= 200
triggerall = command = "c"
Triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Starburst in Neutral
[State -1, StarBurst In Neutral ChangeState]
type = ChangeState
triggerall = numhelper(51000) = 0
triggerall = numhelper(55000) = 0
triggerall = numhelper(50750) = 0
triggerall = stateno != [800,832]
triggerall = enemy,stateno != 4000
Triggerall = life <= 700
Triggerall = Power >= 1500
Triggerall = command =  "hold_x"
Triggerall = command =  "hold_y"
trigger1 = ctrl
Trigger2 = movetype = H && stateno = [120,160]
Value = 54500
;---------------------------------------------------------------------------
; Star Buster
[State -1, Star Buster]
type = ChangeState
value = 54000
triggerall = alive
triggerall = numhelper(51000) = 0
triggerall = numhelper(55000) = 0
triggerall = numhelper(50750) = 0
triggerall = enemy,map(busterable) = 0
triggerall = stateno != 4100
Triggerall = power >= 2000
triggerall = command = "hold_x"
triggerall = command = "hold_y"
Trigger1 = movetype = H && stateno != [120,160]
;---------------------------------------------------------------------------
; Unblockable
[State -1, Unblockable]
type = ChangeState
value = 700
triggerall = command = "y"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Counter - Air
;[State -1, Counter]
;type = ChangeState
;value = 810
;triggerall = ailevel = 0
;triggerall = command = "hold_x"
;Triggerall = statetype = A
;trigger1 = ctrl
;;---------------------------------------------------------------------------
;; Counter - Red
;[State -1, Counter]
;type = ChangeState
;value = 830
;triggerall = ailevel = 0
;triggerall = command = "hold_x"
;triggerall = command = "holdfwd"
;Triggerall = statetype != A
;trigger1 = ctrl
;;---------------------------------------------------------------------------
;; Counter - Stand
;[State -1, Counter]
;type = ChangeState
;value = 800
;triggerall = ailevel = 0
;triggerall = command = "hold_x"
;Triggerall = statetype != A
;trigger1 = ctrl
;;---------------------------------------------------------------------------
; Instant Airdash
[State -1, Instant Airdash]
type = ChangeState
value = 66
triggerall = var(4) = 0 
triggerall = command = "s"
Triggerall = statetype = A
triggerall = numhelper(4200) = 0
trigger1 = ctrl
;---------------------------------------------------------------------------
; Health Charge
[State -1, Health Charge]
type = ChangeState
Triggerall = life < 1000
Triggerall = power > 0
trigger1 = numhelper(51000) = 1
value = 53000
triggerall = command = "s"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Power Charge
[State -1, Power Charge]
type = ChangeState
Triggerall = power < 3000
triggerall = numhelper(51000) = 0
triggerall = numhelper(55000) = 0
triggerall = numhelper(56000) = 0
value = 500
triggerall = command = "s"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; A Aire
[State -1, A Aire]
type = ChangeState
value = 600
triggerall = command = "a"
Triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; B Aire
[State -1, B Aire]
type = ChangeState
value = 610
triggerall = command = "b"
Triggerall = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; C+Down Aire
[State -1, C Aire]
type = ChangeState
value = 620
triggerall = command = "holddown"
triggerall = command = "c"
triggerall = power >= 200
Triggerall = statetype = A
;triggerall = var(21) > 0
trigger1 = ctrl
;---------------------------------------------------------------------------
; Back + C Aire
;[State -1, C Aire]
;type = ChangeState
;value = 623
;triggerall = command = "holdback"
;triggerall = command = "c"
;triggerall = map(bubbleTrapsSpawned) = 0
;triggerall = power >= 200
;Triggerall = statetype = A
;triggerall = var(21) > 0
;;triggerall = var(21) > 0
;trigger1 = ctrl
;---------------------------------------------------------------------------
; Foward + C Aire
;[State -1, C Aire]
;type = ChangeState
;value = 623
;triggerall = command = "holdfwd"
;triggerall = command = "c"
;triggerall = power >= 200
;Triggerall = statetype = A
;triggerall = var(21) > 0
;triggerall = var(21) > 0
;trigger1 = ctrl
;---------------------------------------------------------------------------
; C - Aire
[State -1, Down + C Aire]
type = ChangeState
value = 625
triggerall = command = "c"
triggerall = numhelper(621) = 0
triggerall = power >= 200
triggerall = var(21) > 0
Triggerall = statetype = A
trigger1 = ctrl
trigger2 = time >= 5 && roundstate = 2 && ailevel > 0 && stateno = 50

; A.I

[state -1, Reload AI]
Type = Changestate
Triggerall = var(59)>0 
Triggerall = var(21) < 7
Triggerall= abs(P2Bodydist X) > 100 
Triggerall= Statetype = S 
Triggerall= random<var(50)*1.1 + abs(P2Bodydist X) + (10- var(21)) * 20
trigger1 = ctrl
value = 400


[state -1, 2C AI]
Type = Changestate
Triggerall=var(59)>0
triggerall = numhelper(3500) = 0 
Triggerall = power >= 200
Triggerall= Statetype = S  
Triggerall= random < (ailevel ** ailevel) + 100
Triggerall =abs(P2Bodydist X)<20
Triggerall =abs(P2Bodydist Y)<20
triggerall = var(21) > 0
Triggerall = ctrl
Trigger1= enemy,movetype = H
value = 450

[state -1, j2C AI]
Type = Changestate
Triggerall=var(59)>0 
triggerall = numhelper(3500) = 0
Triggerall = power >= 200
Triggerall= Statetype = A  
Triggerall=random < (ailevel ** ailevel) + 500
triggerall = var(21) > 0
Triggerall =abs(P2Bodydist X)<40
Triggerall =abs(P2Bodydist Y)<40 
Triggerall = ctrl
Trigger1= enemy,movetype = H
value = 625

[state -1, 4C AI]
Type = Changestate
Triggerall=var(59)>0 
triggerall = numhelper(3500) = 0
triggerall = numhelper(475) = 0
triggerall = numhelper(476) = 0
triggerall = numhelper(477) = 0
Triggerall = power >= 200
Triggerall= Statetype = S  
Triggerall= random < (ailevel ** ailevel) + 500
Triggerall = ctrl
Triggerall =abs(P2Bodydist X)<50
Triggerall =abs(P2Bodydist Y)<50
Trigger1= enemy,movetype = H
trigger2= abs(P2Bodydist X) >100  && !inguarddist
value = 470

[state -1, A AI]
Type = Changestate
Triggerall=var(59)>0 
Triggerall= Statetype = S 
Triggerall=abs(P2Bodydist X)<40 
Triggerall=P2StateType=S
triggerall =enemy,movetype != A
Triggerall = ctrl
Trigger1 = random < (ailevel ** ailevel) + 500
trigger2 = enemy,movetype = H && abs(P2Bodydist X)<40 
value = 200

[state -1, A-2 AI]
Type = Changestate
Triggerall = stateno = 310 && movehit = 1
Triggerall =var(59)>0 
Triggerall = Statetype = S 
Triggerall =abs(P2Bodydist X)<40 
Triggerall =P2StateType=S
Triggerall=random < (ailevel ** ailevel) + 500
Trigger1 = Stateno = 310 && movehit = 1
value = 210

[state -1, B AI]
Type = Changestate
Triggerall = stateno = 200 && movehit = 1
Triggerall=var(59)>0 
Triggerall= Statetype = S 
Triggerall=abs(P2Bodydist X)<40 
Triggerall=P2StateType=S
Triggerall=random < (ailevel ** ailevel) + 500
Trigger1 = Stateno = 200  && movehit = 1
trigger3 = enemy,movetype != A
value = 300

[state -1, B-2 AI]
Type = Changestate
Triggerall = stateno = 300 && movehit = 1
Triggerall=var(59)>0 
Triggerall= Statetype = S 
Triggerall=abs(P2Bodydist X)<40 
Triggerall=P2StateType=S
Triggerall=random < (ailevel ** ailevel) + 500
Trigger1 = Stateno = 300  && movehit = 1
value = 310

[state -1, B-3 AI]
Type = Changestate
Triggerall = stateno = 210 && movehit = 1
Triggerall=var(59)>0 
Triggerall= Statetype = S 
Triggerall=abs(P2Bodydist X)<40 
Triggerall=P2StateType=S
Triggerall=random < (ailevel ** ailevel) + 500
Trigger1 = Stateno = 210  && movehit = 1
value = 320

[state -1, C AI]
Type = Changestate
Triggerall = var(59)>0 
triggerall = numhelper(3500) = 0
Triggerall = power >= 200
Triggerall= Statetype = S 
Triggerall= abs(P2Bodydist X)>40 
Triggerall= P2StateType = S
Triggerall = ctrl
Trigger1 = Stateno = 950 && movehit = 1
Triggerall= random<var(50)*1.5 = 5
value = 400

[state -1, Low Attack AI]
Type = Changestate
Triggerall=var(59)>0 
Triggerall= Statetype = S 
Triggerall=abs(P2Bodydist X)<20 
Triggerall=P2StateType=L
Triggerall=random<var(50)*1.1
Trigger1 = ctrl
Trigger2 = prevstateno = 623
value = 950

[state -1, Counter AI]
Type = Changestate
Triggerall=var(59)>0 
triggerall = prevstateno != 800
triggerall = power > 1500
Triggerall= Statetype = S 
Trigger1 = p2movetype = A
Triggerall=Inguarddist
Triggerall=random<var(50)*1.2
Trigger1 = ctrl
value = 800

[state -1, Unblockable AI]
Type = Changestate
Triggerall=var(59)>0 
Triggerall= Statetype = S 
Triggerall=abs(P2Bodydist X)<40 
Triggerall=P2StateType=S
Triggerall=random<var(50)*1.3
Trigger1 = ctrl
value = 700

[state -1, Power Charge AI]
Type = Changestate
Triggerall = power < 3000
Triggerall=var(59)>0 
Triggerall=abs(P2Bodydist X)>70 
Triggerall = stateno = 0
Triggerall = P2movetype != A
Triggerall=random<var(50)*1.5
Trigger1 = ctrl
value = 500

[state -1, Power Charge AI]
Type = Changestate
trigger1 = stateno = 500
triggerall = numhelper(51000) = 0
triggerall = numhelper(55000) = 0
triggerall = numhelper(56000) = 0
Triggerall = power > 3000
Triggerall=var(59)>0 
Triggerall= Statetype = S 
value = 501

[state -1, A-Air AI]
Type = Changestate
Triggerall=var(59)>0 
Triggerall= Statetype = A 
Triggerall=abs(P2Bodydist X)<35 
Triggerall=P2StateType=A
Triggerall=random<var(50)*1.1
Trigger1 = ctrl
value = 600

[state -1, B-Air AI]
Type = Changestate
Triggerall=var(59)>0 
;Triggerall = Stateno = 600  && movehit = 1
Triggerall= Statetype = A 
Triggerall=abs(P2Bodydist X)<40 
Triggerall=P2StateType=A
Triggerall=random<var(50)*21.1
Trigger1 = Stateno = 600  && movehit = 1
Trigger1 = Stateno = 601  && movehit = 1
Trigger2 = ctrl
value = 601

;[state -1, B2-Air AI]
;Type = Changestate
;Triggerall=var(59)>0 
;Triggerall = Stateno = 601  && movehit = 1
;Triggerall= Statetype = A 
;Triggerall=abs(P2Bodydist X)<40 
;Triggerall=P2StateType=A
;Triggerall=random<var(50)*1.1
;Trigger1 = Stateno = 601  && movehit = 1
;value = 610

;[state -1, C-Air AI]
;Type = Changestate
;Triggerall=var(59)>0 
;triggerall = numhelper(3500) = 0
;Triggerall = Stateno = 600  && movehit = 1
;Triggerall = power >= 200
;Triggerall= Statetype = A 
;Triggerall=abs(P2Bodydist X)>40 
;triggerall = p2movetype != H
;Triggerall=!Inguarddist
;Triggerall=random<var(50)*1.1
;Trigger1 = Stateno = 610  && movehit = 1
;value = 620

[state -1, Jump forward in combos]
type = VarSet
triggerall = stateno = 40
trigger1 = enemy,movetype = H
sysvar(1) = 1