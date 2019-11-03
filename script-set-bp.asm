;bp between 2 addreses
; start:
; 	mov start_addr, 17a0000
; 	mov end_addr, 17abcfd
; 	mov addr, start_addr
; setbp:
; 	bp addr
; 	gci addr, SIZE
; 	add addr, $RESULT
; 	cmp addr , end_addr
; 	jl setbp
; end:


;--------------------------
;pb between 2 addreses for special commands Type:
; 8		rdtsc; time
; 10 	push
; 20 	pop
; 50	jmp dword
; 60 	jmp
; 70	call
; 80 	return
;--------------------------
; start:
; 	mov start_addr, b901000
; 	mov end_addr, b92eeee
; 	mov addr, start_addr
; setbp:
; 	gci addr, TYPE						;get command TYPE
; 	;gci addr, COMMAND					;get command String
;     IFEQ $RESULT, 70	
; 		;bp addr					
; 		gci addr, SIZE					;get command SIZE
; 		add addr, $RESULT				
; 		bp addr							;set bp after call
; 		cmp addr , end_addr
; 		jl setbp
; 	ENDIF
; 	gci addr, SIZE
; 	add addr, $RESULT
; 	cmp addr , end_addr
; 	jl setbp


;pb between 2 addreses for special commands:
