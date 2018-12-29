.Model Small
.Stack 100
.Data
    ;Put your code varibale here

.Code
    MAIN Proc
         MOV AX, @Data
         MOV DS, AX
         
         ;Put your main code here
         MOV AH, 1     ;Ham 01h: Nhap 1 ki tu
         INT 21H
         ;Sao khi nhap 1 ki tu, ASCII -> se duoc luu trong thanh ghi AL
                                                                                       
                          
         MOV AH, 2     ;In ra cai ki tu vua nhap vao
         MOV DL, AL    ;Di chuyen du lieu tu thanh ghi Al qua DL
         INT 21H
         
         
    EXIT:                        
        MOV AH, 4CH
        INT 21H
    MAIN Endp
        ;Put your sub code here
    END MAIN
                                                            