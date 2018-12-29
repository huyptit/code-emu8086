.Model Small
.Stack 100
.Data
    ;Put your code varibale here 
    true    DW 'True$' 
    false   DW 'False$'

.Code
    MAIN Proc
         MOV AX, @Data
         MOV DS, AX
         
         ;Put your main code here
         MOV AH, 1     ;Ham 01h: Nhap 1 ki tu
         INT 21H
         ;Sao khi nhap 1 ki tu, ASCII -> se duoc luu trong thanh ghi AL
                                                                                       
                          
         CMP Al, 48  ; So sanh ki tu nhap voi 0 (ASCII = 48)
         JE RIGHT    ; JE = Jump if equal       
         JMP WRONG
    RIGHT:
        MOV AH, 9
        LEA DX, true
        INT 21H  
        JMP EXIT
        
    WRONG:
        MOV AH, 9
        LEA DX, false
        INT 21H
        JMP EXIT
         
         
         
    EXIT:                        
        MOV AH, 4CH
        INT 21H
    MAIN Endp
        ;Put your sub code here
    END MAIN
                                                            