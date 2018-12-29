.Model Small
.Stack 100
.Data
    ;Put your varialbe here
.Code
    MAIN Proc
        MOV AX, @Data
        MOV DS, AX
            
            ;Put your main code here
            MOV AH, 2   ;Ham 02: Hien thi 1 ki tu len man hinh   
            MOV DL, 99  ;99 o day la ki tu trong bang ma ASCII
            INT 21H
    EXIT:
        MOV AH, 4CH
        INT 21H
    MAIN Endp
            ;Put your sub code here
    END MAIN