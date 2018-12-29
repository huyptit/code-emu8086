.Model Small
.Stack 50
.Data
    Mes1 DB 10,13, 'Nhap so a: $'
    Mes2 DB 10,13, 'Nhap so b: $'
    Mes3 DB 10,13, 'So ban nhap phai be hon 100$'
    Mes4 DB 10,13, 'Chi duoc nhap so nguyen. Nhap lai: $'
    Mes5 DB 10,13, 'Ket qua = $'
    
    Number1 DW ?
    Number2 DW ?
.Code

    MAIN Proc
        MOV AX, @Data
        MOV DS, AX
        
 Nhap1: LEA DX, Mes1
        CALL THONGBAO
        CALL NHAP
        
        CMP AX, 100
        JA Nhapsai1
              
        MOV Number1, AX
        
 Nhap2: LEA DX, Mes2
        CALL THONGBAO
        CALL NHAP
        
        CMP AX, 100
        JA Nhapsai2
        
        MOV Number2, AX
        
        MOV AX, Number1
        LEA DX, Mes5
        CALL THONGBAO
        CALL XUAT
        
        MOV AX, Number2
        
        MOV AX, Number2
        LEA DX, Mes5
        CALL THONGBAO
        CALL XUAT
        
        
        
  EXIT: MOV AH, 4CH
        INT 21H
        
Nhapsai1: LEA DX, Mes3
          CALL THONGBAO
          JMP Nhap1
Nhapsai2: LEA DX, Mes3
          CALL THONGBAO
          JMP Nhap2
               
        
    MAIN Endp
        THONGBAO Proc
            PUSH AX
            MOV AH, 09H
            INT 21H
            POP AX
            RET
        THONGBAO Endp
        
        NHAP Proc
            MOV BX, 10
            MOV CX, 0
            
      LAP:  MOV AH, 01H
            INT 21H
            
            CMP AL, 0DH
            JE NHAPXONG
            
            CMP AL, '0'
            JB Nhaplai
            CMP AL, '9'
            JA Nhaplai
            
            SUB AX, 30H
            XOR AH, AH
            XCHG AX, CX
            MUL BX
            ADD CX, AX
            JMP LAP    
            
    Nhaplai:       
            XOR AX, AX
            XOR CX, CX            
            LEA DX, Mes4
            CALL THONGBAO
            JMP LAP                 
  NHAPXONG:
        MOV AX, CX
        RET
            
        NHAP Endp 
        
        
        XUAT Proc
            MOV BX, 10
            MOV CX, 0
            
       Lap1:MOV DX, 0
            DIV BX
            PUSH DX
            INC CX
            
            CMP AX, 0
            JNE Lap1
            
            MOV AH, 02H
            
       Lap2:POP DX
            ADD DX, 30H
            INT 21H
            LOOP Lap2
        RET         
            
            
        XUAT Endp
        
        
        
END MAIN