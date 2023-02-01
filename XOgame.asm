IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
	x_coordinate dw ?
    y_coordinate dw ?
    color dw 10
    len dw 120
	arr1 db 9 dup (0)
	turn db 0
	win db 0 ;win or draw
	clock equ es:6Ch
	
; --------------------------
CODESEG
	proc draw1
	mov cx, [x_coordinate]
    mov dx, [y_coordinate]
	mov ax, [color]
	mov ah, 0ch
	int 10h
    ret 
	endp    draw1
	
	
	proc drawTAB
	mov [color], 10
	mov [x_coordinate], 60
	mov cx, 4
drawV1:  ;vertical lines
	mov [y_coordinate], 40
	add [x_coordinate], 40
	push cx
	mov cx, [len]
drawV2:
	inc [y_coordinate]
	push cx
	call draw1
	pop cx
    loop drawV2
	pop cx
	loop drawV1
	mov [y_coordinate], 0
	mov cx, 4
drawH1:  ;horizontal lines
	mov [x_coordinate], 99
	add [y_coordinate], 40
	push cx
	mov cx, [len]
drawH2:
	inc [x_coordinate]
	push cx
	call draw1
	pop cx
    loop drawH2
	pop cx
	loop drawH1
	
	ret
	endp
	
	
	proc circ16
	mov [color], 32
	;TOPRIGHT
	mov cx, 8
TopR1:
	inc [x_coordinate]
	push cx
	call draw1
	pop cx
	loop TopR1
	inc [y_coordinate]
	
	mov cx, 3
TopR2:
	inc [x_coordinate]
	push cx
	call draw1
	pop cx
	loop TopR2
	inc [y_coordinate]
	mov cx, 2
TopR3:
	inc [x_coordinate]
	push cx
	call draw1
	pop cx
	loop TopR3
	mov cx, 5
TopR4:
	inc [y_coordinate]
	inc [x_coordinate]
	push cx
	call draw1
	pop cx
	loop TopR4
	mov cx, 2
	inc [x_coordinate]
TopR5:
	inc [y_coordinate]
	push cx
	call draw1
	pop cx
	loop TopR5
	mov cx, 3
	inc [x_coordinate]
TopR6:
	inc [y_coordinate]
	push cx
	call draw1
	pop cx
	loop TopR6
	mov cx, 8
	inc [x_coordinate]
TopR7:
	inc [y_coordinate]
	push cx
	call draw1
	pop cx
	loop TopR7
	;BOTTOM RIGHT
	mov cx, 3
	dec [x_coordinate]
BotR1:
	inc [y_coordinate]
	push cx
	call draw1
	pop cx
	loop BotR1
	mov cx, 2
	dec [x_coordinate]
BotR2:
	inc [y_coordinate]
	push cx
	call draw1
	pop cx
	loop BotR2
	mov cx, 5
BotR3:
	inc [y_coordinate]
	dec [x_coordinate]
	push cx
	call draw1
	pop cx
	loop BotR3
	inc [y_coordinate]
	mov cx, 2
BotR4:
	dec [x_coordinate]
	push cx
	call draw1
	pop cx
	loop BotR4
inc [y_coordinate]
	mov cx, 3
BotR5:
	dec [x_coordinate]
	push cx
	call draw1
	pop cx
	loop BotR5
	inc [y_coordinate]
	mov cx, 8
BotR6:
	dec [x_coordinate]
	push cx
	call draw1
	pop cx
	loop BotR6
	;bottom left
	dec [y_coordinate]
	mov cx, 3
BotL1:
	dec [x_coordinate]
	push cx
	call draw1
	pop cx
	loop BotL1
	dec [y_coordinate]
	mov cx, 2
BotL2:
	dec [x_coordinate]
	push cx
	call draw1
	pop cx
	loop BotL2
	mov cx, 5
BotL3:
	dec [x_coordinate]
	dec [y_coordinate]
	push cx
	call draw1
	pop cx
	loop BotL3
	mov cx, 2
	dec [x_coordinate]
BotL4:
	dec [y_coordinate]
	push cx
	call draw1
	pop cx
	loop BotL4
	mov cx, 3
	dec [x_coordinate]
BotL5:
	dec [y_coordinate]
	push cx
	call draw1
	pop cx
	loop BotL5
	mov cx, 8
	dec [x_coordinate]
BotL6:
	dec [y_coordinate]
	push cx
	call draw1
	pop cx
	loop BotL6
	;top left
	mov cx, 3
	inc [x_coordinate]
TopL1:
	dec [y_coordinate]
	push cx
	call draw1
	pop cx
	loop TopL1
	mov cx, 2
	inc [x_coordinate]
TopL2:
	dec [y_coordinate]
	push cx
	call draw1
	pop cx
	loop TopL2
	mov cx, 5
TopL3:
	inc [x_coordinate]
	dec [y_coordinate]
	push cx
	call draw1
	pop cx
	loop TopL3
	mov cx, 2
	dec [y_coordinate]
TopL4:
	inc [x_coordinate]
	push cx
	call draw1
	pop cx
	loop TopL4
	mov cx, 3
	dec [y_coordinate]
TopL5:
	inc [x_coordinate]
	push cx
	call draw1
	pop cx
	loop TopL5
	ret
	endp circ16
	
	
	proc drawX
	mov [color], 41
	mov [len], 25
	mov cx, [len]
	sub [x_coordinate], 9
	add [y_coordinate], 3
BLToTR:  ;bottom left to top right
	inc[x_coordinate]
	inc [y_coordinate]
	push cx
	call draw1
	pop cx
	loop BLToTR
	mov ax, [len]
	sub [y_coordinate], ax
	mov cx, [len]
BRtoTL: ;bottom right to top left
	dec[x_coordinate]
	inc [y_coordinate]
	push cx
	call draw1
	pop cx
	loop BRtoTL
	ret
	endp drawX
	
	
	proc drawtie ;draw "TIE"
	mov [color], 10
T:
	mov [x_coordinate], 114
	mov [y_coordinate], 10
	mov cx, 17
HORITloop:
	push cx
	inc [x_coordinate]
	call draw1
	pop cx
	loop HORITloop
	mov cx, 22
	mov [x_coordinate], 123
VERTloop:
	push cx
	inc [y_coordinate]
	call draw1
	pop cx
	loop VERTloop
	
I:
	add [x_coordinate], 36
	mov cx, 22
	Iloop:
	push cx
	dec [y_coordinate]
	call draw1
	pop cx
	loop Iloop
E:
	add [x_coordinate], 33
	mov cx, 22
	vertEloop:
	push cx
	inc [y_coordinate]
	call draw1
	pop cx
	loop vertEloop
	mov cx, 11
Eloop2:
	push cx
	inc [x_coordinate]
	call draw1
	pop cx
	loop Eloop2
	sub [y_coordinate], 11
	inc [x_coordinate]
	mov cx, 11
Eloop3:
	push cx
	dec [x_coordinate]
	call draw1
	pop cx
	loop Eloop3
	sub [y_coordinate], 11
	sub [x_coordinate], 2
	mov cx, 12
Eloop4:
	push cx
	inc [x_coordinate]
	call draw1
	pop cx
	loop Eloop4
	ret
	endp drawtie
	
	
	proc drawwin ;draw "WIN"
w:
	mov [x_coordinate], 105
	mov [y_coordinate], 8
	mov cx, 2
largeloop:
	push cx
	mov cx, 9
small1:
	push cx
	inc [y_coordinate]
	call draw1
	inc [y_coordinate]
	call draw1
	inc [x_coordinate]
	inc [y_coordinate]
	call draw1
	pop cx
	loop small1
	mov cx, 9
small2:
	push cx
	inc [x_coordinate]
	dec [y_coordinate]
	call draw1
	dec [y_coordinate] 
	call draw1
	dec [y_coordinate] 
	call draw1
	pop cx
	loop small2
	pop cx
	loop largeloop
I2:
	add [x_coordinate], 27
	mov cx, 27
winIloop:
	push cx
	inc [y_coordinate]
	call draw1
	pop cx
	loop winIloop
N:
	add [x_coordinate], 27
	
	mov cx, 27
N1loop:
	push cx
	dec [y_coordinate]
	call draw1
	pop cx
	loop N1loop
	mov cx, 13
N2loop:
	push cx
	inc [y_coordinate]
	call draw1
	inc [x_coordinate]
	inc [y_coordinate]
	call draw1
	pop cx
	loop N2loop
	mov cx, 26
N3loop:
	push cx
	dec [y_coordinate]
	call draw1
	pop cx
	loop N3loop
	ret
	endp drawwin
	
	
	proc timer7 ;proc waits for 7 seconds
	mov ax, 40h
	mov es, ax
	mov ax, [clock]
FirstTick:
	cmp ax, [clock]
	je FirstTick
	mov cx, 126
Delayloop:
	mov ax, [clock]
Tick:
	cmp ax, [clock]
	je Tick
	loop Delayloop
	ret
	endp timer7 
	
	
	proc CLICK
	xor ax, ax ;reset pointer
	int 33h
label1:
	mov ax, 1h ;show pointer
	int 33h
MouseLoop:
	mov ax, 3h ;check click status and position
	int 33h
	
	cmp bx, 01h
	jne MouseLoop ;returns if right click, end if left
	mov ax, 2h ;remove pointer
	int 33h
	call COORDS
	cmp [win] , 0
	jne VICTORY
	cmp [turn], 10
	jne label1
TIE:
	call drawtie
	jmp CLICKEND
VICTORY:
	call drawwin
CLICKEND:
	call timer7
	ret
	endp CLICK
	
	proc COORDS
	lea bx, [arr1]
YSTART: ;start checking y coordinate
	cmp dx, 40d
	JLE COREND
	cmp dx, 80d
	JG YCHECK1
	mov [y_coordinate], 44d
	jmp YEND
YCHECK1:
	cmp dx, 120d
	JG YCHECK2
	mov [y_coordinate], 84d
	add bx, 3
	jmp YEND
YCHECK2:
	cmp dx, 160d
	JG COREND
	mov [y_coordinate], 124d
	add bx, 6
YEND:
	shr cx, 1;start checking x location
	cmp cx, 100d
	JLE COREND
	cmp cx, 140d
	JG XCHECK1
	mov [x_coordinate], 116d
	jmp XEND
XCHECK1:
	cmp cx, 180d
	JG XCHECK2
	mov [x_coordinate], 156d
	inc bx
	JMP XEND
XCHECK2:
	cmp cx, 220d
	JG COREND
	mov [x_coordinate], 196d
	add bx, 2
XEND:
	mov al, [bx]
	cmp al, 0
	jne COREND
	call TURNCHCK
	
COREND:
	ret
	endp COORDS
	
	
	proc TURNCHCK
	mov al, [turn]
	and al, 1h
	jz eventurn
	call drawX
	mov [byte ptr bx], 1h
	jmp TCEND
eventurn:
	call circ16
	mov [byte ptr bx], 2h
TCEND:   ;turn check end
	inc [turn]
	cmp [turn], 6
	jl tcend2 ;no need to check wins if turn is below 5
	call WINCHECK
tcend2:
	ret
	endp TURNCHCK
	
	proc WINCHECK
	lea si, [arr1]
DIA1:  ;top right to bottom left diagonal
	mov bx, si
	mov al, [bx]
	cmp al, 0
	je DIA2
	add bx, 4
	cmp al, [bx]
	jne DIA2
	add bx, 4
	cmp al, [bx]
	jne DIA2
	mov [win], 1
	jmp WINEND
DIA2:  ;top left to bottom right diagonal
	mov bx, si
	add bx, 2
	mov al, [bx]
	cmp al, 0
	je HORICHCK
	add bx, 2
	cmp al, [bx]
	jne HORICHCK
	add bx, 2
	cmp al, [bx]
	jne HORICHCK
	mov [win], 1
	jmp WINEND
	
HORICHCK: ;horizontal win check
TOPHORI:
	mov bx, si
	mov al, [bx]
	cmp al, 0
	je MIDHORI
	inc bx
	cmp al, [bx]
	jne MIDHORI
	inc bx
	cmp al, [bx]
	jne MIDHORI
	mov [win], 1
	jmp WINEND
MIDHORI:
	mov bx, si
	add bx, 3
	mov al, [bx]
	cmp al, 0
	je BOTHORI
	inc bx
	cmp al, [bx]
	jne BOTHORI
	inc bx
	cmp al, [bx]
	jne BOTHORI
	mov [win], 1
	jmp WINEND
BOTHORI:
	mov bx, si
	add bx, 6
	mov al, [bx]
	cmp al, 0
	je VERTCHCK
	inc bx
	cmp al, [bx]
	jne VERTCHCK
	inc bx
	cmp al, [bx]
	jne VERTCHCK
	mov [win], 1
	jmp WINEND
	
VERTCHCK: ;check vertical
LEFTVERT:
	mov bx, si
	mov al, [bx]
	cmp al, 0
	je MIDVERT
	add bx, 3
	cmp al, [bx]
	jne MIDVERT
	add bx, 3
	cmp al, [bx]
	jne MIDVERT
	mov [win], 1
	jmp WINEND
MIDVERT:
	mov bx, si
	inc bx
	mov al, [bx]
	cmp al, 0
	je RIGHTVERT
	add bx, 3
	cmp al, [bx]
	jne RIGHTVERT
	add bx, 3
	cmp al, [bx]
	jne RIGHTVERT
	mov [win], 1
	jmp WINEND
RIGHTVERT:
	mov bx, si
	add bx, 2
	mov al, [bx]
	cmp al, 0
	je WINEND
	add bx, 3
	cmp al, [bx]
	jne WINEND
	add bx, 3
	cmp al, [bx]
	jne WINEND
	mov [win], 1
	jmp WINEND
WINEND:
	
	ret
	endp WINCHECK
	
	
start:
	mov ax, @data
	mov ds, ax
; --------------------------
	mov ax, 13h
	int 10h
	xor bh, bh
	mov [turn], 1
	call drawTAB
	call CLICK
	mov ax,2 ;exit graphic mode
	int 10h
	mov ax, 1
	int 10h
; --------------------------
	
exit:
	mov ax, 4c00h
	int 21h
END start

