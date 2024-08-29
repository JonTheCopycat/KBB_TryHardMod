[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s
;----------------------------------------------------------------------------
;Tag Commands
;----------------------------------------------------------------------------
[Command]
name = "snapback"
command = x+d
time = 15
buffer.time = 5

[Command]
name = "snapback_prev"
command = x+d
time = 15
buffer.time = 5

[Command]
name = "snapback"
command = x+w
time = 15
buffer.time = 5

[Command]
name = "snapback_next"
command = x+w
time = 15
buffer.time = 5

[Command]
name = "dhc_a"
command = d+a
time = 15
buffer.time = 5

[Command]
name = "dhc_a"
command = w+a
time = 15
buffer.time = 5

[Command]
name = "dhc_b"
command = d+b
time = 15
buffer.time = 5

[Command]
name = "dhc_b"
command = w+b
time = 15
buffer.time = 5

[Command]
name = "dhc_c"
command = d+c
time = 15
buffer.time = 5

[Command]
name = "dhc_c"
command = w+c
time = 15
buffer.time = 5

[Command]
name = "TagShiftBack"
command = d
time = 1

[Command]
name = "TagShiftFwd"
command = w
time = 1

;----------------------------------------------------------------------------
;Normal Buttons
;----------------------------------------------------------------------------

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
name = "start"
command = s
time = 1

[Command]
name = "s"
command = s
time = 1

[Command]
name = "d"
command = d
time = 1

[Command]
name = "w"
command = w
time = 1

[Command]
name = "m"
command = m
time = 1

[Command]
name = "menu"
command = m
time = 1

;----------------------------------------------------------------------------
;Double Tap Commands
;----------------------------------------------------------------------------

[Command]
name = "hyperhop"
command = ~D, $U
time = 5

[Command]
name = "FF"
command = F, F
time = 10

[Command]
name = "BB"
command = B, B
time = 10

[Command]
name = "ss"
command = s, s
time = 10

[Command]
name = "WD"
command = ~F, D, F, F, D, DF
time = 30
buffer.time = 5

[Command]
name = "WD"
command = ~F, F, D, DF
time = 20
buffer.time = 5

[Command]
name = "WD"
command = ~F, F, D, F
time = 20
buffer.time = 5

[Command]
name = "WD"
command = ~F, D, DF
time = 12
buffer.time = 5

[Command]
name = "WD"
command = ~F, D, F
time = 12
buffer.time = 5

[Command]
name = "NotWD"
command = B, D, DF
time = 12

;----------------------------------------------------------------------------
;Single Direction
;----------------------------------------------------------------------------
[Command]
name = "fwd"
command = $F
time = 1
buffer.time = 1

[Command]
name = "downfwd"
command = $DF
time = 1
buffer.time = 1

[Command]
name = "down"
command = $D
time = 1
buffer.time = 1

[Command]
name = "downback"
command = $DB
time = 1
buffer.time = 1

[Command]
name = "back"
command = $B
time = 1
buffer.time = 1

[Command]
name = "upback"
command = $UB
time = 1
buffer.time = 1

[Command]
name = "up"
command = $U
time = 1
buffer.time = 1

[Command]
name = "upfwd"
command = $UF
time = 1
buffer.time = 1

;----------------------------------------------------------------------------
;Hold Button
;----------------------------------------------------------------------------
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

;----------------------------------------------------------------------------
;Hold Direction
;----------------------------------------------------------------------------
[Command]
name = "holdfwd"
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