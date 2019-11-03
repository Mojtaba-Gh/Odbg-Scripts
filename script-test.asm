; find:
    ;ifeq eip, 536f88
    ;    jmp end
    ;endif
    ;findmem #37d4da8f#
    ;findmem #8fdad437#
    findmem #12345678# , 4c58000
    ;ifneq $RESULT, 0
     ;   msg "found"
    ;endif
    ;run
    ;jmp find
; end:

mov addr, 49c1fc
gci addr, COMMAND		
ifeq $RESULT , "CALL DWORD PTR DS:[<&KERNEL32.CreateFileA>]"
    msg "equal"
endif