.MODEL SMALL
.STACK
.DATA
    MesNhap1 DB 10,13, 'Nhap so nguyen thu 1: $'
    MesNhap2 DB 10,13, 'Nhap so nguyen thu 2: $'
    MesNhapSai DB 10,13, 'So ban nhap da vuot qua kich thuoc nhap lai$'
    MesXuat DB 10,13, 'Ket qua: $'
    num1 dw ?
    num2 dw ?
    sum dw 0
    
.CODE
    MAIN PROC
        ;chuyen data
        MOV AX,@DATA
        MOV DS,AX
       
        ;Nhap so thu 1
   Nhapnum1:
        LEA DX,MesNhap1
        CALL THONGBAO
        CALL NHAP
        
        CMP AX, 500
        JA Nhapnum1 
        
        MOV num1, AX
        
        LEA DX, MesXuat
        CALL THONGBAO 
        CALL XUAT
        
          
        ;Nhap so thu 2
   Nhapnum2:     
        LEA DX,MesNhap2
        CALL THONGBAO
        CALL NHAP
        CMP AX, 500
        JA Nhapnum2
        MOV num2, AX
        
        mov ax, num1
        add sum, ax 
        
        mov ax, num2
        add sum, ax
        
        mov ax, sum 
           
        ;Xuat   
        LEA DX, MesXuat
        CALL THONGBAO 
        CALL XUAT
     EXIT:
        MOV AH, 4CH
        INT 21H
    
    MAIN EndP
    
    THONGBAO PROC
       PUSH AX
       MOV AH,09H
       INT 21H
       POP AX
       RET
    THONGBAO ENDP
    ;nhap n
    NHAP PROC 
                
        MOV BX,10
        MOV CX,0
        
        
       @NHAP:
        
        MOV AH, 1
        INT 21H  
                           
        CMP AL, 13
        JE @NHAPXONG
        
        SUB AL, 48
        MOV AH, 0
        PUSH AX
        MOV AX, CX
        MUL BX    
        POP CX
        ADD CX, AX
        JMP @NHAP
        
        
       @NHAPXONG:
        MOV AX, CX
        RET
     NHAP Endp 
    
     XUAT Proc
          
        MOV BX, 10
        MOV CX, 0
     LAP:
            
        MOV DX, 0
        DIV BX
        PUSH DX
        INC CX  
        
        CMP AX, 0
        JNE LAP   
        MOV AH, 2
        
        
     @XUATKITU:
        POP DX
        ADD DX, 48
        INT 21H 
        LOOP @XUATKITU  
        RET
   
     XUAT Endp
    
    
END MAIN