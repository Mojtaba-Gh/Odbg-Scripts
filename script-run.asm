	mov srch_addr, 4c5f868
	mov count, 0
run:
	run
	inc count
	find srch_addr, #37d4da8f#
	IFEQ $RESULT, srch_addr
		bp eip
		cmt eip, "FOUUUUUUNDDDD"
		jmp end
	ENDIF
	;find srch_addr, #8fdad437#
	;IFEQ $RESULT, srch_addr
	;	bp eip
	;	cmt eip, "FOUND"
	;ENDIF
	jmp run

	; findmem #37d4da8f#
	; ifneq $RESULT, 0
    ;     msg $RESULT
	; 	cmt eip, "FOUND1"
	; 	jmp run
    ; ENDIF
	; findmem #8fdad437#
    ; ifneq $RESULT, 0
    ; 	msg $RESULT
	; 	cmt eip, "FOUND2"
	; 	jmp run
    ; ENDIF
	; IFEQ [eax], 37d4da8f
	; 	cmt eip, "Check [EAX] !!!"
	; 	jmp run
	; ENDIF
	; cmp ecx, 8fdad437
	; jne del_bp
	; cmt eip, "Check ECX !!!"
	; jmp run
;  del_bp:									;delete the bp
;  	GCMT eip							;get comment value
;  	IFEQ $RESULT, " "
;  		bc eip
;  	ENDIF
;  	jmp run

end: