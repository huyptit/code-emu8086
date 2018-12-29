.Model Small
.Stack 100
.Data
    ;Put your varivable here  
    MSG DW 'HelloWorld$'   ;DW the hien 4byte
    STR DB 13,10,'$'       ;DB the hien 1byte
    
    ;13: lui ve dau dong,  10: xuong dong
    
   
.Code                 
    MAIN Proc
        MOV AX, @Data
        MOV DS, AX              
        
        ;Put your main code here    
        ;Print string
        MOV AH, 9      ;in HelloWorld ra dau tien,  9 o day la dung Ham 09h
        LEA DX, MSG                              ;Ham 09h dung de xuat ra 1 chuoi
        INT 21H
        
        MOV AH, 9      ; 3 dong nay de cho xuong dong
        LEA DX, STR
        INT 21H                                      
        
        MOV AH, 9      ;in HelloWorld ra lan thu 2
        LEA DX, MSG
        INT 21H
    
    EXIT:
        
        MOV AH, 4CH
        INT 21H
    MAIN Endp
        ;Put your sub code here
    END MAIN
        