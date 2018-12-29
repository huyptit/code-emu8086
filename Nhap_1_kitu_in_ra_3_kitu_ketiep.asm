.Model Small
.Stack 100
.Data
       Mes1 DB 10,13, 'Nhap vao 1 ki tu: $'
       Mes2 DB 10,13, 'Ket qua: $'    
       Mes3 DB 10,13, 'Ban da nhap ki tu khong co trong bang ma ASCII$'
       UserChar DB ?
.Code
    MAIN Proc   
        MOV AX, @Data
        MOV DS, AX 
        
        ;Thong bao nhap vao 1 ki tu
        MOV AH, 9
        LEA DX, Mes1
        INT 21H        
        
        ;Nhap 1 ki tu
        MOV AH, 1
        INT 21H
        
        CMP AL, 252
        JA NhapSai 
        
        ;Gan Ma ASCII cua ki tu vua nhap trong AL vao 1 bien UserChar
        MOV UserChar, AL
        
        ;In ket qua
        MOV AH, 9
        LEA DX, Mes2
        INT 21h 
           
        
        
        ;Xuat 3 ki tu ke tiep
        MOV CX, 3
        MOV DL, UserChar
        
    Lap:
        INC DX
        MOV AH, 2
        INT 21H
        LOOP Lap 
        JMP EXIT 
        
NhapSai:
        MOV AH, 9
        LEA DX, Mes3
        INT 21H
      
        
    EXIT:
        MOV AH, 4CH
        INT 21H
        