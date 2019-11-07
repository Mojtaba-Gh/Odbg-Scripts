;finding in whole memmory! 
    findmem #534730313130363533#        ;<?xml
    mov sfile, "C:\Users\NEGAR\Desktop\find-xml-mem.txt"
    wrt sfile, $RESULT
    mov addr, $RESULT
    add addr, 1
find:
    findmem #534730313130363533#, addr        ;<?xml
    wrta sfile, $RESULT
    ifne $RESULT, 0
        mov addr, $RESULT
        add addr, 1
        jmp find
    endif