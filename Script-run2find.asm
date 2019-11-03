find_next:
	cmp eip, b7dbf6						;stop script here
	je end		
	cmp eip, 536f75						;stop script here
	je end	
	IFB eip, 40752c
		IFA eip, 407566
			bc eip
			run
			jmp find_next	
		ENDIF
	ENDIF	
	IFB eip, 404444
		IFA eip, 40425a
			bc eip
			run
			jmp find_next	
		ENDIF
	ENDIF	
	IFB eip, 406336
		IFA eip, 406313
			bc eip
			run
			jmp find_next	
		ENDIF
	ENDIF			
	IFB eip, 403185
		IFA eip, 403104
			bc eip
			run
			jmp find_next	
		ENDIF
	ENDIF

	mov current_addr, eip				
    gci current_addr, DESTINATION			;detect if command is jmp/call/return
	IFEQ $RESULT, 0							;if not jmp
		gci eip, TYPE
		IFEQ $RESULT, 50					;if jmp dword
			gopi eip, 1, TYPE  			
			IFEQ $RESULT, 4					;if dword
				gopi current_addr, 1, ADDR  ;get dword address
				mov next_addr, [$RESULT]
				jmp set_bp
			ENDIF
		ENDIF
		gci current_addr, SIZE
		mov next_addr, current_addr
		add next_addr, $RESULT
	ELSE								;if jump/call/retn
		gci eip, TYPE
		IFEQ $RESULT, 70				;if call; skip it
			gci current_addr, SIZE
			mov next_addr, current_addr
			add next_addr, $RESULT
			jmp set_bp
		ENDIF
		gci current_addr, DESTINATION
		mov next_addr, $RESULT
		bp next_addr
		gci current_addr, SIZE
		mov next_addr, current_addr
		add next_addr, $RESULT
	ENDIF
set_bp:
	bp next_addr
	run
	find 4bff868, #37d4da8f#
	IFNEQ $RESULT, 0
		bp eip
		mov tmp, " | FOUUUUUUNDDDD  AT  "
		add tmp, $RESULT
		GCMT next_addr
		add $RESULT, tmp
		cmt eip, $RESULT
		jmp end
	ENDIF
	; find1:
	; findmem #37d4da8f# , 4c58000
    ; ifneq $RESULT, 0
	; 	cmp $RESULT, 4d00000
	; 	jg find2
    ;     ; msg $RESULT
	; 	mov tmp, " | Found 1->"
	; 	add tmp, $RESULT
	; 	GCMT next_addr
	; 	add $RESULT, tmp
	; 	cmt current_addr, $RESULT
	; 	;jmp find_next
    ; ENDIF
	; find2:
	; findmem #8fdad437# , 4c58000
    ; ifneq $RESULT, 0
	; 	cmp $RESULT, 4d00000
	; 	jg find3
    ;    	; msg $RESULT 
	; 	mov tmp, " | Found 2->"
	; 	add tmp, $RESULT
	; 	GCMT next_addr
	; 	add $RESULT, tmp
	; 	cmt current_addr, $RESULT
	; 	;jmp find_next
    ; ENDIF
	; find3:
	; IFEQ [eax], 37d4da8f
	; 	mov tmp, " | Check [EAX]"
	; 	GCMT next_addr
	; 	add $RESULT, tmp
	; 	cmt current_addr, $RESULT
	; 	;jmp find_next
	; ENDIF
	; find4:
	; IFEQ ecx, 8fdad437
	; 	mov tmp, " | Check ECX"
	; 	GCMT next_addr
	; 	add $RESULT, tmp
	; 	cmt current_addr, $RESULT
	; 	;jmp find_next
	; ENDIF
del_bp:									;delete the bp
	GCMT next_addr
	IFEQ $RESULT, " "
		bc next_addr
	ENDIF
	jmp find_next
end:
	msg "done"
