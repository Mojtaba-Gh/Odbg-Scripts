start:
	mov start_addr, 10000000
	mov end_addr, start_addr
	add end_addr , 70000
	mov addr, start_addr
setbp:
	gci addr, COMMAND					;get command String
    IFEQ $RESULT, "CALL DWORD PTR DS:[<&KERNEL32.CreateFileA>]"	
		bp addr					
		gci addr, SIZE					;get command SIZE
		add addr, $RESULT	
		cmp addr , end_addr
		jl setbp
	ENDIF
    IFEQ $RESULT, "CALL DWORD PTR DS:[<&KERNEL32.CreateFileW>]"	
		bp addr					
		gci addr, SIZE					;get command SIZE
		add addr, $RESULT	
		cmp addr , end_addr
		jl setbp
	ENDIF
    IFEQ $RESULT, "CALL DWORD PTR DS:[<&KERNEL32.CreateDirectoryW>]"	
		bp addr					
		gci addr, SIZE					;get command SIZE
		add addr, $RESULT	
		cmp addr , end_addr
		jl setbp
	ENDIF
    IFEQ $RESULT, "CALL DWORD PTR DS:[<&KERNEL32.CopyFileExA>]"	
		bp addr					
		gci addr, SIZE					;get command SIZE
		add addr, $RESULT	
		cmp addr , end_addr
		jl setbp
	ENDIF
    IFEQ $RESULT, "CALL DWORD PTR DS:[<&KERNEL32.MoveFileExA>]"	
		bp addr					
		gci addr, SIZE					;get command SIZE
		add addr, $RESULT	
		cmp addr , end_addr
		jl setbp
	ENDIF
    IFEQ $RESULT, "CALL DWORD PTR DS:[<&KERNEL32.FindClose>]"	
		bp addr					
		gci addr, SIZE					;get command SIZE
		add addr, $RESULT	
		cmp addr , end_addr
		jl setbp
	ENDIF
    IFEQ $RESULT, "CALL DWORD PTR DS:[<&KERNEL32.FindFirstFileA>]"	
		bp addr					
		gci addr, SIZE					;get command SIZE
		add addr, $RESULT	
		cmp addr , end_addr
		jl setbp
	ENDIF
    IFEQ $RESULT, "CALL DWORD PTR DS:[<&KERNEL32.FindNextFileA>]"	
		bp addr					
		gci addr, SIZE					;get command SIZE
		add addr, $RESULT	
		cmp addr , end_addr
		jl setbp
	ENDIF
    IFEQ $RESULT, "CALL DWORD PTR DS:[<&KERNEL32.ReadFile>]"	
		bp addr					
		gci addr, SIZE					;get command SIZE
		add addr, $RESULT	
		cmp addr , end_addr
		jl setbp
	ENDIF
    IFEQ $RESULT, "CALL DWORD PTR DS:[<&KERNEL32.WriteFile>]"	
		bp addr					
		gci addr, SIZE					;get command SIZE
		add addr, $RESULT	
		cmp addr , end_addr
		jl setbp
	ENDIF
    IFEQ $RESULT, "CALL DWORD PTR DS:[<&MSVCR90._fullpath>]"	
		bp addr					
		gci addr, SIZE					;get command SIZE
		add addr, $RESULT	
		cmp addr , end_addr
		jl setbp
	ENDIF

	gci addr, SIZE
	add addr, $RESULT
	cmp addr , end_addr
	jl setbp

	;C:\CLIP\Lib\Borneo\qt-mt.dll
	IFB end_addr, 39D00000
		mov start_addr, 39D00000
		mov end_addr, start_addr
		add end_addr , 4b1000
		mov addr, start_addr
		jmp setbp
	ENDIF
	
	;C:\CLIP\Lib\Borneo\ACE.dll
	IFB end_addr, 61810000
		mov start_addr, 61810000
		mov end_addr, start_addr
		add end_addr , 14c000
		mov addr, start_addr
		jmp setbp
	ENDIF

	;C:\CLIP\Lib\Application\ClipWidgets.dll
	IFB end_addr, 61E70000
		mov start_addr, 61E70000
		mov end_addr, start_addr
		add end_addr , 58000
		mov addr, start_addr
		jmp setbp
	ENDIF
