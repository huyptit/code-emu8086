.Model Small
.Stack 100
.Data
    ;Put your varialbe here
.Code
    MAIN Proc
        MOV AX, @Data
        MOV DS, AX
            
        ;Put your main code here
        MOV AH, 1               
    NHAP:
        INT 21H
        CMP AL, 'a'
        JNE NHAP    ;JNE = Jump if not equal
            
    EXIT:
        MOV AH, 4CH
        INT 21H
    MAIN Endp
            ;Put your sub code here
    END MAIN