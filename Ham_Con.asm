.Model Small
.Stack 100
.Data
    ;Put your varialbe here     
    
.Code
    MAIN Proc
        MOV AX, @Data
        MOV DS, AX
            
       ;Put your main code here
       MOV DX, 042H ;B
       PUSH DX           ;Cat B vao trong Stack
       
       CALL SubCode      ;Di vao ham con SubCode de in ra A
       
       MOV AH, 2
       POP DX            ;Lay B tu trong Stack ra roi xuat len man hinh
       INT 21H
       
    
    EXIT:
        MOV AH, 4CH
        INT 21H
    MAIN Endp
            ;Put your sub code here
            SubCode Proc
                MOV DL, 041H  ;A
                MOV AH, 2
                INT 21H
                RET
            SubCode Endp
            
    END MAIN