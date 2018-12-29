.Model Small
.Stack 100
.Data
    ;Put your varialbe here     
    STR DW 'Nguyen Ha Minh Huy   $'
.Code
    MAIN Proc
        MOV AX, @Data
        MOV DS, AX
            
       ;Put your main code here
            MOV CX, 3     ;CX la thanh ghi dem so lan lap, moi lan lap xong tu giam 1
            MOV AH, 9
            LEA DX, STR
    
    SHOW:
            INT 21H
            LOOP SHOW
    EXIT:
        MOV AH, 4CH
        INT 21H
    MAIN Endp
            ;Put your sub code here
    END MAIN