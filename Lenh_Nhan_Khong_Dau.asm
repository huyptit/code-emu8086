.Model Small
.Stack 100
.Data
    ;Put your varialbe here     
    
.Code
    MAIN Proc
        MOV AX, @Data
        MOV DS, AX
            
       ;Put your main code here
       
       ;MUL Register
       ;Case 1: Register 8 bit
       ;AX = AL * Register
       
       ;Case 2: Register 16 bit
       ;DX.AX = AX * Register
       
       
       MOV BL, 2    ;Gan 2 vao thanh BL (8 bit)  
       MOV AL, 25   ;AL = 25
       MUL BL       ;AX = AL * BL = AL * 2
       
       MOV DX, AX   ; DX = AX = 50 (ki tu = 2)
       MOV AH, 2
       INT 21H
    
    EXIT:
        MOV AH, 4CH
        INT 21H
    MAIN Endp
            ;Put your sub code here
                       
    END MAIN