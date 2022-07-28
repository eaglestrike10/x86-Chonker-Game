; ***********************************
;
;=====================================
;	Student Name: Sunao Gomi
;	Studen ID: 101073228
;	Course: ELEC 4601
;=====================================
;
; First, some assembler directives that tell the assembler:
; - assume a small code space
; - use a 100h size stack (a type of temporary storage)
; - output opcodes for the 386 processor
.MODEL small
.STACK 100h
.386

; Next, begin a data section
.data
	msg DB "Chonker never made it home.  His family wonders where he is...$", 0	; He ded message
	nSize DW ($ - msg)-1
	
 ; You'll want to make a few variable here.
; For example, to track the chonker's location on the screen.
	randSet	DB 7, 27, 48, 24, 52, 9, 3, 65, 77, 39, 53, 33, 40, 29, 20, 19, 34, 41, 10, 11
			DB 62, 9, 51, 77, 34, 36, 35, 13, 65, 19, 69, 41, 14, 75, 64, 20, 63, 44, 38, 73
			DB 45, 44, 39, 54, 18, 2, 24, 19, 33, 23, 52, 1, 5, 22, 50, 69, 20, 3, 77, 30
			DB 27, 17, 36, 31, 16, 42, 0, 55, 11, 24, 21, 18, 76, 26, 53, 6, 1, 63, 46, 10
			DB 18, 14, 59, 64, 62, 29, 21, 48, 2, 30, 8, 77, 68, 28, 50, 42, 31, 37, 13, 7
			DB 58, 38, 77, 73, 19, 60, 5, 47, 2, 21, 74, 55, 25, 64, 28, 6, 8, 14, 30, 12
			DB 55, 72, 1, 64, 22, 53, 31, 7, 39, 36, 6, 14, 23, 0, 73, 16, 68, 60, 12, 41
			DB 72, 51, 45, 75, 44, 17, 73, 13, 70, 3, 12, 62, 19, 48, 65, 21, 8, 9, 18, 47
			DB 54, 5, 27, 0, 73, 41, 29, 60, 33, 50, 68, 77, 23, 11, 67, 15, 7, 58, 65, 66
			DB 1, 2, 23, 36, 3, 52, 22, 60, 9, 47, 49, 18, 41, 32, 13, 66, 56, 25, 45, 14
			DB 4, 44, 0, 61, 11, 47, 22, 39, 71, 20, 23, 51, 48, 72, 37, 76, 58, 62, 3, 16
			DB 49, 10, 13, 60, 58, 3, 52, 31, 29, 38, 64, 73, 21, 57, 26, 12, 18, 5, 2, 70
			DB 43, 12, 11, 63, 47, 74, 75, 72, 61, 26, 55, 15, 45, 25, 23, 8, 18, 31, 66, 62
			DB 46, 68, 62, 30, 17, 43, 22, 3, 33, 16, 25, 31, 19, 78, 55, 74, 44, 7, 12, 6
			DB 63, 25, 53, 27, 20, 31, 66, 23, 15, 50, 29, 61, 2, 49, 22, 16, 7, 3, 17, 58
			DB 13, 38, 12, 15, 2, 44, 72, 68, 8, 64, 28, 65, 77, 59, 29, 49, 7, 39, 79, 61
			DB 7, 45, 53, 20, 62, 25, 44, 59, 4, 17, 32, 67, 79, 2, 63, 37, 27, 41, 72, 69
			DB 8, 24, 30, 32, 13, 62, 74, 52, 16, 10, 36, 67, 29, 2, 43, 9, 68, 66, 11, 60
			DB 5, 37, 53, 79, 74, 39, 40, 50, 22, 48, 76, 3, 78, 38, 1, 20, 44, 12, 14, 10
			DB 1, 41, 74, 66, 33, 78, 69, 73, 38, 47, 25, 0, 22, 17, 46, 48, 2, 32, 12, 6
			DB 43, 25, 1, 79, 75, 33, 39, 4, 36, 32, 70, 2, 62, 18, 17, 6, 40, 71, 7, 47
			DB 27, 59, 76, 73, 50, 39, 24, 54, 53, 65, 16, 78, 58, 0, 18, 40, 20, 32, 31, 57
			DB 53, 16, 26, 23, 57, 29, 25, 50, 56, 47, 27, 72, 0, 37, 65, 28, 2, 52, 78, 73
			DB 19, 28, 53, 55, 10, 3, 5, 70, 30, 29, 25, 40, 20, 41, 15, 46, 72, 76, 16, 75
			DB 65, 3, 56, 49, 51, 21, 19, 13, 71, 58, 28, 24, 16, 59, 47, 61, 68, 11, 45, 29
			DB 7, 55, 70, 28, 32, 14, 12, 76, 46, 50, 62, 59, 64, 17, 72, 24, 39, 52, 73, 22
			DB 75, 53, 54, 47, 45, 27, 9, 42, 29, 37, 19, 14, 43, 7, 26, 41, 60, 65, 10, 12
			DB 31, 48, 4, 76, 77, 35, 28, 47, 79, 30, 46, 57, 67, 32, 14, 68, 66, 9, 21, 52
			DB 61, 76, 36, 51, 1, 57, 52, 10, 17, 69, 62, 35, 16, 78, 15, 0, 66, 26, 56, 25
			DB 32, 78, 4, 33, 50, 65, 39, 69, 34, 7, 61, 72, 64, 19, 49, 16, 58, 26, 29, 53
			DB 31, 38, 50, 20, 25, 19, 75, 48, 51, 1, 49, 55, 16, 44, 54, 28, 4, 47, 59, 33
			DB 56, 26, 48, 44, 78, 17, 73, 43, 18, 59, 6, 64, 52, 68, 0, 23, 50, 31, 79, 7
			DB 42, 79, 48, 24, 43, 77, 21, 8, 53, 61, 50, 20, 29, 12, 5, 11, 1, 67, 60, 6
			DB 15, 19, 7, 78, 35, 29, 58, 64, 40, 53, 63, 5, 18, 9, 67, 75, 43, 56, 20, 62
			DB 26, 61, 3, 20, 56, 1, 63, 34, 42, 23, 36, 38, 32, 52, 37, 59, 19, 11, 14, 65
			DB 72, 4, 77, 17, 75, 27, 40, 65, 6, 79, 18, 28, 70, 14, 0, 41, 23, 67, 66, 73
			DB 17, 73, 52, 22, 72, 44, 46, 28, 68, 18, 67, 64, 4, 55, 79, 49, 14, 26, 1, 43
			DB 67, 51, 15, 3, 65, 73, 56, 13, 58, 79, 49, 11, 42, 40, 4, 62, 66, 7, 61, 2
			DB 10, 29, 68, 75, 46, 6, 52, 38, 11, 70, 45, 73, 44, 17, 26, 8, 77, 0, 9, 60
			DB 16, 59, 77, 31, 29, 15, 61, 53, 56, 23, 55, 52, 38, 48, 58, 76, 49, 32, 39, 4
			DB 47, 2, 64, 10, 39, 56, 59, 58, 76, 65, 38, 9, 6, 24, 31, 71, 44, 5, 48, 15
			DB 30, 48, 42, 33, 29, 62, 28, 61, 25, 47, 43, 38, 74, 19, 39, 21, 34, 72, 7, 16
			DB 46, 27, 63, 42, 49, 1, 6, 40, 44, 17, 58, 31, 16, 45, 23, 11, 54, 57, 64, 59
			DB 23, 26, 24, 44, 65, 31, 61, 70, 37, 56, 57, 22, 59, 0, 25, 49, 9, 64, 12, 11
			DB 48, 52, 1, 63, 53, 69, 41, 37, 27, 6, 73, 68, 19, 17, 78, 46, 75, 35, 40, 76
			DB 42, 46, 17, 28, 41, 38, 32, 53, 15, 25, 60, 36, 55, 68, 64, 24, 12, 6, 0, 45
			DB 39, 72, 12, 56, 47, 62, 42, 49, 34, 78, 15, 18, 45, 24, 36, 53, 58, 43, 64, 38
			DB 61, 40, 9, 70, 1, 50, 42, 0, 7, 73, 25, 60, 44, 74, 75, 54, 51, 45, 53, 19
			DB 6, 53, 25, 7, 51, 24, 59, 29, 11, 14, 50, 47, 57, 70, 78, 27, 49, 12, 13, 62
			DB 36, 45, 19, 47, 56, 25, 77, 6, 17, 61, 39, 12, 15, 32, 73, 40, 24, 10, 26, 65
	setSize DW ($-randSet)-1

	setPtr DW 0 ;pointer for use when reading rock position data from varable above

	counter DB 0 ;generic counter variable for loops

	difficulty DB 3 ; for scaling difficulty (number of rocks per row) 

	lives DB 3	;for counting number of lives

	soundmode DB 0 ;0 for difficulty increase, 1 for life lost

; Next begins the code portion of the program.
; First, a few useful procedures are defined.
.code

; This procedure creates a 0.1 second delay.
; Make sure you understand how it works.

delay proc
	MOV CX, 01h	;amount of time to wait in microseconds
	MOV DX, 86A0h	;amount of time to wait in microseconds
	MOV AH, 86h	;subfunction "elapsed time wait"
	INT 15h	; 1 seconds delay	
	RET
delay ENDP

; Write your own procedures below to reduce the amount of repetitive code in your program
;
;
;
;
;
cls proc ;A clear screen procedure based on advice from https://stackoverflow.com/questions/8239143/how-can-i-clear-the-screen-without-having-to-fill-it
	mov ah, 0h	;clear screen by changing to video mode 2 (720x400 resolution)
	mov al, 2
	int 10h
cls endp
drawTunnel proc
	mov ah, 03h	;subfunction to get cursor position 
	mov bh, 0	;position to check on page 0
	int 10h	;should return row to dh and column to dl

	mov ah, 09h	;write character/attribute to cursor position to make tunnel
	mov al, 0f0h	;bars is the character to represent tunnel
	mov bh, 0	; write on page 0
	mov bl, 08h	; sets black background and cyan forground for tunnel
	mov cx, 1   ; print character one time
	int 10h		; print the tunnel character at cursor position
	ret
drawTunnel endp

drawLives proc

	mov counter, 0
	mov dh, 1
	mov dl, 1
	printLoop:
		mov ah, 02h	;move cursor to top corner and squentially rightwards to draw lives
		mov bh, 0
		int 10h

		mov ah, 09h
		mov al, 0dbh ;square as hearts for lives
		mov bh, 0	;first page
		mov bl, 04h ;light gray background with dark grey foreground
		mov cx, 1
		int  10h

		add dl, 2 ;move cursor to next position to write next heart
		inc counter ; increase scanloop amount
		mov cl, lives	;move lives to register to compare with counter
		cmp counter, cl 	;see how many life hearts need to be printed to screen
		jne printLoop	;loop again if not all hearts are printed 
		ret

drawLives endp
drawRocks proc
	mov counter, 0
	scanLoop:
		;set cursor to position to write first rock
		mov di, setPtr
		mov dl, [randSet + di]
		mov ah, 02h
		mov dh, 24
		mov bh, 0
		int 10h

		mov ah, 09h
		mov al, 0dch ;square as rock character
		mov bh, 0	;first page
		mov bl, 78h ;light gray background with dark grey foreground
		mov cx, 1
		int  10h
		
		inc setPtr	;increase the ptr to get the next random rock location
		call resetPTR	;check to make sure setPtr is not out of bounds
		inc counter	;increase counter 
		mov cl, difficulty
		cmp counter, cl ;check if the number of rocks for difficulty level have been written to the screen this row
		jne scanLoop ;if not, write next rock
		ret	;if done, return to main loop

drawRocks endp

resetPTR proc 
	cmp setPtr, 1000 ;check to make sure pointer does not exceed dataset of random rocks
	je reset	; if at end, reset the ptr
	ret			;if not, exit this function

	reset:
	mov setPtr, 0	; if it is out of bounds, reset the ptr to zero
	add difficulty, 2	;every time it goes through the entire rock set, increase number of rocks per row by 2
	call beep	;play a beep everytime the difficulty increases

	ret	
resetPTR endp

;Taken from http://muruganad.com/8086/8086-assembly-language-program-to-play-sound-using-pc-speaker.html
; Code modified to use delay function instead of original pause implemented
; Utilises use of IO device commands to play audio
beep proc     

	
	mov     al, 182         ; Prepare the speaker for the
    out     43h, al         ;  note.
	mov     ax, 4560        ; Frequency number (in decimal)  for middle C.

	cmp soundmode, 0		; set different sounds for life lost and difficulty increase
	je diff					; don't change sound if its a difficulty increase
	mov ax, 3224			; sound for life lost (F#)

	diff:                          
    out     42h, al         ; Output low byte.
    mov     al, ah          ; Output high byte.
    out     42h, al 
    in      al, 61h         ; Turn on note (get value from
                            ;  port 61h).
    or      al, 00000011b   ; Set bits 1 and 0.
    out     61h, al         ; Send new value.
		
	call delay				; play note for duration of delay

    in      al, 61h         ; Turn off note (get value from
                            ;  port 61h).
    and     al, 11111100b   ; Reset bits 1 and 0.
    out     61h, al         ; Send new value.

	mov soundmode, 0 		;reset soundmode 
	ret
beep endp

; This is the main procedure. The assembler knows to make this the entry point
_main PROC

	call cls

	mov ah, 02h	;set cursor position to center ish screen so chonker starts centered
	mov bh, 0
	mov dh, 8
	mov dl, 39	
	int 10h

	JMP OuterLoop	
; This is the start of the loop that will run continuously

OuterLoop:	
; First, set various registers 
; It's important to set the segment registers.

	MOV DX, @data
	MOV DS, DX
	MOV ES, DX

; draw some rocks
;
; Your code here for drawing rocks.
;
	mov ah, 03h ;get chonk position
	int 10h
	push dx ;save xy coords of chonker since cursor normally tracks location but cursor is used for drawing rocks

	call drawRocks
	call drawLives

	pop dx	;put cursor back to chonk position after rocks are done being written
	mov ah, 02h
	mov bh, 0
	int 10h

; scroll the screen
;
; Perhaps an INT call here to scroll the screen.
	
	
	mov ah, 06h		; Scroll screen subfunction for INT 10h
	mov al, 1		; parameter for how much to scroll (1 row)
	mov bh, 68h		; brown background, grey forground 
	mov ch, 0		; top row
	mov cl, 0		; leftmost column
	mov dh, 24		; bottom row
	mov dl, 79		; rightmost row
	int 10h

; see if a rock hit the chonker
; 
; Perhaps an INT call here to check if a rock hit the chonker.

	mov ah, 08h	;check character at cursor
	mov bh, 0 ;on page 0
	int 10h

	cmp al, 0dch	;if blank
	jne nohit
	sub lives, 1
	mov soundmode, 1	;set beep to play life lost sound
	call beep		;call to play life lost sound
	cmp lives, 0	;check if out of lives
	je terminate ;terminate if last life is lost
	nohit:
; if chonker is safe, draw the chonker
; Your code to draw the chonker. Maybe another INT call?
	
	mov ah, 09h	;write character/attribute to cursor position draw chonk
	mov al, 0f1h	;+- is the character to represent the chonk
	mov bh, 0	; write on page 0
	mov bl, 06h	; sets red background and brown forground for chonker tile
	mov cx, 1;	print character one time
	int 10h

; We wait 0.1 second.	
	CALL delay

; If the "q" is pressed, end the program otherwise loop through the code again.

;CHECK IF KEY WAS PRESSED.
	mov ah, 0bh
  	int 21h      ;RETURNS AL=0 if NO KEY PRESSED otherwise AL!=0 if KEY PRESSED.
  	cmp al, 0
  	je  noKey



;PROCESS KEY.        
;
; check if left or right key was pressed.
; Maybe an INT call for this?
; Use some program flow control logic to get
; to either the moveleft or the moveright section
; of code as needed.
	mov ah, 07h		; non-buffered non-echo input
	int 21h			;should return key pressed to al

	cmp al, 61h	 ;a pressed, go left
	je moveleft

	cmp al, 64h  ;d pressed, go right
	je moveright

	cmp al, 71h	 ;q pressed, quit game
	je terminate
noKey:
;
; Some code related to drawing the tunnel could go here.
	call drawTunnel
	
	mov ah, 03h	;subfunction to get cursor position 
	mov bh, 0	;position to check on page 0
	int 10h	;should return row to dh and column to dl

	mov ah, 02h ;set new cursor position
	mov bh, 0; write on page 0
	int 10h	;update cursor position

	JMP OuterLoop

moveleft:
; some code about moving left could go here.
	call drawTunnel

	mov ah, 03h	;subfunction to get cursor position 
	mov bh, 0	;position to check on page 0
	int 10h	;should return row to dh and column to dl

	cmp dl, 0	;check if at border, don't move off screen if at border
	je leftEdge
	sub dl, 1 ;move column cursor position left one
	leftEdge:
	mov ah, 02h ;set new cursor position
	mov bh, 0; write on page 0
	int 10h	;update cursor position

	JMP OuterLoop

moveright:
; some code about moving right could go here.
	call drawTunnel


	mov ah, 03h	;subfunction to get cursor position 
	mov bh, 0	;position to check on page 0
	int 10h	;should return row to dh and column to dl

	cmp dl, 79	;check if at border, don't move off screen if at border
	je rightEdge
	add dl, 1 ;move column cursor position right one
	rightEdge:
	mov ah, 02h ;set new cursor position
	mov bh, 0; write on page 0
	int 10h	;update cursor position

	JMP OuterLoop

terminate:
; An INT call exists to print a string (about the Chonker being terminated).
; Run 

	;play a game over jingle
	call beep
	call delay
	mov soundmode, 1
	call beep
	call delay
	call beep

	call cls	;clear screen
	
	mov dx, offset msg	;index game over message to print
	mov ah, 09h	;use string print subfunction of int 21h
	int 21h	;print indexed string

	jmp msgend
msgend:
; exit the program.
	MOV AX, 4C00h
	INT 21h
_main ENDP
END _main

; External References Below

;	https://en.wikipedia.org/wiki/INT_10H	For video interrupt list
;	https://en.wikipedia.org/wiki/BIOS_color_attributes 	For BIOS color codes
;	http://spike.scu.edu.au/~barry/interrupts.html		For 21h interrupt table
;	https://www.asciitable.com/		For ASCII table 
;	https://stanislavs.org/helppc/int_15-86.html	For delay interrupt information
;	https://en.wikibooks.org/wiki/X86_Assembly/Arithmetic	For x86 arithmetic function
;	https://cs.lmu.edu/~ray/notes/pcvideomodes/		List of video modes for VGA