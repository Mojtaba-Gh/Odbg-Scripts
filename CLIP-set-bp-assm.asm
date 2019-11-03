start:
	mov start_addr, dc90000
	mov end_addr, start_addr
	add end_addr , 38000
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

	;C:\CLIP\Lib\PackEcu\CommManager.dll
	IFB end_addr, dd30000
		mov start_addr, dd30000
		mov end_addr, start_addr
		add end_addr , 7f000
		mov addr, start_addr
		jmp setbp
	ENDIF
	
	;C:\CLIP\Lib\PackEcu\PackEcuCommon.dll
	IFB end_addr, ddb0000
		mov start_addr, ddb0000
		mov end_addr, start_addr
		add end_addr , 46000
		mov addr, start_addr
		jmp setbp
	ENDIF

	;C:\CLIP\Lib\PackEcu\DiagData.dll
	IFB end_addr, de00000
		mov start_addr, de00000
		mov end_addr, start_addr
		add end_addr , 61000
		mov addr, start_addr
		jmp setbp
	ENDIF

	;C:\CLIP\Lib\PackEcu\DRProtocol.dll
	IFB end_addr, de70000
		mov start_addr, de70000
		mov end_addr, start_addr
		add end_addr , 38000
		mov addr, start_addr
		jmp setbp
	ENDIF

	;C:\CLIP\Lib\Application\IHMIntegrity.dll
	IFB end_addr, e040000
		mov start_addr, e040000
		mov end_addr, start_addr
		add end_addr , 8f000
		mov addr, start_addr
		jmp setbp
	ENDIF

