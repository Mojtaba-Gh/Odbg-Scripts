mov sfile, "C:\Users\NEGAR\Desktop\Modeule-assembly.txt"
wrt sfile, 0
var string
mov strat_addr, 3543
mov end_addr, 3673
START:
    gmi eip, NAME
    mov string, $RESULT
    add string, "  :  "
    add string, eip
    add string, "  =>  "
    gci eip, COMMAND
    add string, $RESULT
    ;add string, "           ; ASCII '"
    ;gstrw eip
    ;add string, $RESULT
    ;add string, "'"
    wrta sfile, string
    log string
    sto
    jmp START
END:
    msg "Finished"