.Model Small
.Stack 100
.Data
    Mes1 DB 10,13, 'Nhap vao mot chuoi: $'
    Mes2 DB 10,13, 'Chuoi nguoc la: $'
.Code
    MAIN Proc
        MOV AX, @Data
        MOV DS, AX 
        
           ;MOV AH, 3
           ;In thong bao nhap chuoi
           MOV AH, 9
           LEA DX, Mes1
           INT 21H
           
           XOR CX, CX ; Khoi tao CX = 0
           
           
    IMPORT:
           MOV AH,1
           INT 21H
                     
           CMP AL, 13   ;Neu nhan duoc Enter
           JE THONGBAO                    
                     
                    
           PUSH AX
           INC CX
           JMP IMPORT
           
    THONGBAO:      
           MOV AH, 9
           LEA DX, Mes2
           INT 21H
           
     EXPORT:
           POP DX
           MOV AH, 2
           INT 21H
           LOOP EXPORT
           
       
    EXIT:
        MOV AH, 4CH
        INT 21H
    
    MAIN Endp
    END MAIN
    
    
