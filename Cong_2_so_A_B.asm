.Model Small
.Stack 100
.Data
    Mes1 DB 10,13, 'Nhap vao so nguyen thu nhat: $'
    Mes2 DB 10,13, 'Nhap vao so nguyen thu hai: $'
    Mes3 DB 10,13, 'Ket qua: $'
.Code
    MAIN Proc
        MOV AX, @Data
        MOV DS, AX
        
        ;So nguyen thu 1
        MOV AH, 9
        LEA DX, Mes1
        INT 21H
        
        CALL NHAP
        PUSH AX
        
        
        ;So nguyen thu 2
        MOV AH, 9
        LEA DX, Mes2
        INT 21H
        
        CALL NHAP
        PUSH AX
        
        MOV AH, 9
        LEA DX, Mes3
        INT 21H
        
        POP BX
        POP AX
        ADD AX, BX
        CALL XUAT
               
        
    EXIT:
        MOV AH, 4CH
        INT 21H
    MAIN Endp
    
        NHAP Proc
            
            XOR BX, BX
            XOR CX, CX
            
            
            MOV AH, 8
            INT 21H
            
            CMP AL, '-'
            JE Am
            
            CMP AL, '+'
            JE Duong
            
            JMP So
            
        Am:
            MOV CX, 1
        Duong:
            MOV AH, 2
            MOV DL, AL
            INT 21H
            
            MOV AH, 8
            INT 21H
        So:
            CMP AL, '0'
            JB Nhaplai
            CMP AL, '9'
            JA Nhaplai
            
            MOV AH, 2
            MOV DL, AL
            INT 21H
            
            AND AL,0Fh
            CBW
            MOV SI, AX
            MOV AX, 10
            MUL BX
            MOV BX, SI
            ADD BX, AX
            
        Nhaplai:
            MOV AH, 8
            INT 21H
            CMP AL, 13
            JNZ So 
            
            MOV AX, BX
            OR CX, CX
            JZ KetThuc
            NEG AX
            
            
        KetThuc: RET
            
        NHAP Endp 
        
        
        XUAT Proc
            
            OR AX, AX
            JGE TiepTheo
            
            PUSH AX
            MOV AH, 2
            MOV DL, '-'
            INT 21H
            POP AX
            NEG AX
        TiepTheo:
            XOR CX, CX
            MOV BX, 10
        Lap:
            XOR DX, DX
            DIV BX
            PUSH DX
            INC CX
            OR AX, AX
            JNZ Lap
            
            MOV AH, 2
        XuatKiTu:
            POP DX
            OR DL, 30h
            INT 21H
            
            LOOP XuatKiTu
            
            RET          
            
        XUAT Endp
            
    END MAIN