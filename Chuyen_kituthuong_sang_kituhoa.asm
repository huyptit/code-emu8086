.Model Small
.Stack 100
.Data
    ;Put your varialbe here
    Mes1 DB 10,13, 'Nhap vao 1 ki tu thuong (a - z): $'
    Mes2 DB 13,10, 'Chu hoa tuong ung la: $'
    Mes3 DB 13,10, 'Ki tu ban nhap vao khong phai la ki tu thuong!$'
.Code
    MAIN Proc
        MOV AX, @Data
        MOV DS, AX
    
    Start:       
            ;Thong bao nhap du lieu
            MOV AH, 9
            LEA DX, Mes1
            INT 21H
                                   
            ;Nhap du lieu
            MOV AH, 1
            INT 21H
            
            CMP AL, 'a'
            JB  Sai
            
            CMP AL, 'z'
            JA  Sai    
                                 
            ;In thong bao in chu Hoa
            MOV CL, AL ;Muon 1 bien tam, neu khong khi AH,9  thi mat du lieu AL
            
            MOV AH, 9
            LEA DX, Mes2
            INT 21H
            
            MOV AL, CL ; Gan gia tri lai cho AL                  
            
            ;Chuyen thanh chu Hoa
            SUB AL, 32            
            MOV AH, 2
            MOV DL, AL
            INT 21H
            JMP EXIT
    
    
    Sai:
        MOV AH, 9
        LEA DX, Mes3
        INT 21H    
        JMP Start
            
    EXIT:
        MOV AH, 4CH
        INT 21H
    MAIN Endp
            ;Put your sub code here
    END MAIN