mov start_addr, 72f3dc8
mov end_addr, 72f3dfe
mov addr, start_addr
mov cmp_value, 12ffd4

Start:
    cmp addr, end_addr
    je End
    gmi eip, NAME
    mov string, $RESULT
    add string, "  :  "
    add string, eip
    add string, "  =>  "
    gci eip, COMMAND
    add string, $RESULT
    log string
    sto
    cmp [ebp], cmp_value
    je Logg
    jmp Start
Logg:
    log "FOUND"
    msg "Found"

End: