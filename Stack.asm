.Model Small
.Stack 100
.Data
    ;Put your varialbe here     
    
.Code
    MAIN Proc
        MOV AX, @Data
        MOV DS, AX
            
       ;Put your main code here
       PUSH 50
       PUSH 51
       PUSH 52
       
       POP DX     ; Moi lan Pop ra DL = Top,  DH = Top - 1  
       MOV AH, 2  ; O day dx hieu la: DL = 52,  DH = 51
       INT 21H  
       
    
    EXIT:
        MOV AH, 4CH
        INT 21H
    MAIN Endp
            ;Put your sub code here
    END MAIN