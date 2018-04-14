;@2018
;AUTHOR     :   - LIVIA ELLEN                   ( TEKNIK KOMPUTER - 1606887560 - M )    
;               - MAHDI YUSUF                   ( TEKNIK KOMPUTER - 1606825341 - M )
;               - M. KHARISMA RAMADHAN          ( TEKNIK KOMPUTER - 1606823166 - M )
;               - RIZKY NURFAIZI W              ( TEKNIK KOMPUTER - 1606893696 - M )
;KELOMPOK   :   M
;TEMA       :   GAME MATEMATIK SEDERHANA
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;SKENARIO   :   1. USER MEMASUKAN NAMA 
;               2. USER MENJAWAB PERTANYAAN YANG DITAMPILKAN
;               3. HASIL PEMERIKSAAN JAWABAN DITAMPILKAN
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;
;       MATHGAMES is a game that create random math question that the user must answer.   
;
;        Copyright (C) 2018 Livia Ellen, Mahdi Yusuf, M. Kharisma R., Rizky Nurfaizi W
;
;           This program is free software; you can redistribute it and/or modify                             
;           it under the terms of the GNU General Public License as published by
;           the Free Software Foundation; either version 3 of the License, or
;           (at your option) any later version.
;   
;           This program is distributed in the hope that it will be useful,
;           but WITHOUT ANY WARRANTY; without even the implied warranty of
;           MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;           GNU General Public License for more details.
;   
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;REFERENCE  :   1. https://stackoverflow.com/questions/34500138/play-music-with-assembly-code 
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;!! RAMA
;SOUND VARIABLE
;BAGIAN INI MERUPAKAN NILAI-NILAI YANG MENENTUKAN FREKUENSI SUARA YANG DIHASILKAN
;VARIABEL FREQUENCY

C1      =   9121
C1S     =   8609
D1      =   8126
D1S     =   7670
E1      =   7239
F1      =   6833
F1S     =   6449
G1      =   6087
G1S     =   5746
A1      =   5423
A1S     =   5119
B1      =   4831

C2      =   4560 
C2S     =   4304
D2      =   4063
D2S     =   3834
E2      =   3619
F2      =   3416
F2S     =   3224
G2      =   3043
G2S     =   2873
A2      =   2711
A2S     =   2559
B2      =   2415

C3      =   2280
C3S     =   2152
D3      =   2031
D3S     =   1917
E3      =   1809
F3      =   1715
F3S     =   1612
G3      =   1521
G3S     =   1436
A3      =   1355
A3S     =   1292
B3      =   1207

C4      =   1140

;BAGIAN INI MERUPAKAN NILAI DELAY BERAPA LAMA NADA YANG DIBUNYIKAN AKAN DIJALANKAN
;VARIABEL DELAY

P8      = 1500
P7      = P8/2  + P8/4           
P6      = P8/2
P5      = P8/4  + P8/8
P4      = P8/4
P3      = P8/8  + P8/16
P2      = P8/8
P1      = P8/16 + P8/32
P0      = P8/16

PAUSE   = 300

LOCALS

.MODEL SMALL

.STACK

.DATA
;KUMPULAN VARIABEL DAN DATA
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ;OTHER
    DIV1         DD 14318180
    DIV2         DD 786432000
    RANDOM1      DB 0           ;STORE NILAI RANDOM UNTUK PROSES ANGKA RANDOM
    RANDOM2      DB 0           ;STORE NILAI RANDOM UNTUK PROSES ANGKA RANDOM
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
    ;TAMPILAN INTERFACE PROGRAM
    
    ;OPENING
    S_1         DB      '::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::$',0
    S_2         DB      ':                                                                              :$',0
    S_3         DB      ':                                                                              :$',0
    S_4         DB      ':     |      |      | ||||||| ||      ||||||| ||||||| ||||   |||| |||||||      :$',0
    S_5         DB      ':      ||   |||   ||  ||      ||      ||      ||   || || || || || ||           :$',0
    S_6         DB      ':       || || || ||   |||||   ||      ||      ||   || ||  |||  || |||||        :$',0
    S_7         DB      ':        |||   |||    ||      ||      ||      ||   || ||   |   || ||           :$',0
    S_8         DB      ':         |     |     ||||||| ||||||| ||||||| ||||||| ||       || |||||||      :$',0
    S_9         DB      ':                                                                              :$',0
    S_10        DB      ':                                                                              :$',0
    S_11        DB      ':                                                                              :$',0
    S_12        DB      ':                                  MATH GAMES                                  :$',0
    S_13        DB      ':                                ..............                                :$',0
    S_14        DB      ':                                                                              :$',0
    S_15        DB      ':                                                                              :$',0
    S_16        DB      ':                          DID I DO SOMETHING WRONG ?                          :$',0
    S_17        DB      ':                                                                              :$',0
    S_18        DB      ':                         1ST GRADE MATHEMATICAL GAMES                         :$',0
    S_19        DB      ':                       ................................                       :$',0
    S_20        DB      ':                                                                              :$',0
    S_21        DB      ':                        ++++++++++++++++++++++++++++++                        :$',0
    S_22        DB      ':                        + PRESS ANY KEY TO CONTINUE! +                        :$',0
    S_23        DB      ':                        ++++++++++++++++++++++++++++++                        :$',0
    S_24        DB      '::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::$',0      

    ;ENDING    
    E_1         DB      '::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::$',0 
    E_2         DB      ':                                                                              :$',0
    E_3         DB      ':                                                                              :$',0
    E_4         DB      ':          _____  ____   ____  _____     _____           __  __ ______         :$',0
    E_5         DB      ':         / ____|/ __ \ / __ \|  __ \   / ____|   /\    |  \/  |  ____|        :$',0
    E_6         DB      ':        | |  __| |  | | |  | | |  | | | |  __   /  \   | \  / | |__           :$',0
    E_7         DB      ':        | | |_ | |  | | |  | | |  | | | | |_ | / /\ \  | |\/| |  __|          :$',0
    E_8         DB      ':        | |__| | |__| | |__| | |__| | | |__| |/ ____ \ | |  | | |____         :$',0
    E_9         DB      ':         \_____|\____/ \____/|_____/   \_____/_/    \_\|_|  |_|______|        :$',0                                                         
    E_10        DB      ':                                                                              :$',0
    E_11        DB      ':                                                                              :$',0
    E_12        DB      ':                                  MATH GAMES                                  :$',0
    E_13        DB      ':                                ..............                                :$',0
    E_14        DB      ':                                                                              :$',0
    E_15        DB      ':                             DID IT FUN TO PLAY ?                             :$',0
    E_16        DB      ':                                                                              :$',0
    E_17        DB      ':                         1ST GRADE MATHEMATICAL GAMES                         :$',0
    E_18        DB      ':                       ................ ................                      :$',0
    E_19        DB      ':                                                                              :$',0
    E_20        DB      ':                        ++++++++++++++++++++++++++++++                        :$',0
    E_21        DB      ':                        +      THANKS FOR PLAYING    +                        :$',0
    E_22        DB      ':                        ++++++++++++++++++++++++++++++                        :$',0
    E_23        DB      '::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::$',0      
    
    ;DIVIDER INTERFACE
    DIVIDE      DB      '--------------------------------------------------------------------------------$',0

;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ;LIST OF SOUND
    ;BAGIAN INI MERUPAKAN LIST SUARA/TANGGA NADA YANG AKAN DIBUNYIKAN 
    
    ;ENDING SONG / ZELDA - SONG OF STORM
    ENDINGSONG  DW 0, P3  
                
                DW D2, P2
                DW F2, P2
                DW D3, P5,0,100
                ;
                DW D2, P2
                DW F2, P2
                DW D3, P5,0,100
                ;
                DW E3, P4
                DW F3, P2
                DW E3, P2
                DW F3, P2
                DW E3, P2
                DW C3, P2
                DW A2, P6,0,150
                ;
                DW A2, P1
                DW D2, P4
                DW F2, P2
                DW G2, P2
                DW A2, P6,0,150
                ;
                DW A2, P1
                DW D2, P4
                DW F2, P2
                DW G2, P2
                DW E2, P6,0,300
                
                ;X2
                DW D2, P2
                DW F2, P2
                DW D3, P5,0,100
                ;
                DW D2, P2
                DW F2, P2
                DW D3, P5,0,100
                ;
                DW E3, P4
                DW F3, P2
                DW E3, P2
                DW F3, P2
                DW E3, P2
                DW C3, P2
                DW A2, P6,0,150
                ;
                DW A2, P1
                DW D2, P4
                DW F2, P2
                DW G2, P2
                DW A2, P6,0,150
                ;
                DW A2, P1
                DW D2, P4
                DW F2, P2
                DW G2, P2
                DW E2, P6,0,300
                
                DW 0,0
    
    ;OPENING SONG / HEDWIGS THEME        
    OPENINGSONG DW 0, P3  
                
                ;--
                DW B1,  P3	
                DW E2,  P4	
                DW G2,  P2	
                DW F2S, P3	
                DW E2,  P5	             
                DW B2,  P3	
                DW A2,  P6                
                DW F2S, P6                
                DW E2,  P4 
                DW G2,  P2
                DW F2S, P3
                DW D2S, P5
                DW F2,  P3
                DW B1,  P7,0,500
                
                ;--
                DW B1,  P3
                DW E2,  P4
                DW G2,  P2
                DW F2S, P3
                DW E2,  P5
                DW B2,  P3
                DW D3,  P5
                DW C3S, P3
                DW C3,  P5
                DW G2S, P3
                DW C3 , P5
                DW B2,  P2
                DW A2S, P3
                DW A1S, P5
                DW G2,  P3
                DW E2,  P7,0,500
                
                ;--
                DW G2,  P3
                DW B2,  P5
                DW G2,  P3
                DW B2,  P5
                DW G2,  P3
                DW C3,  P5
                DW B2,  P3
                DW A2S, P5
                DW F2S, P3
                DW G2,  P4
                DW B2,  P2
                DW A2S, P3
                DW A1S, P5
                DW B1,  P3 
                DW B2,  P7,0,500
                
                ;--
                DW G2,  P3
                DW B2,  P5
                DW G2,  P3
                DW B2,  P5
                DW G2,  P3
                DW D3,  P5
                DW C3S, P3
                DW C3,  P5
                DW G2S, P3
                DW C3,  P4
                DW B2,  P2
                DW A2S, P3
                DW A1S, P5
                DW G2,  P3
                DW E2,  P7,0,1500
                                
                DW 0,0
    
    ;TRUE SOUND / JAWABAN BENAR    
    TRUE        DW 0, P1
                DW C2, P2
                DW E2, P2
                DW G2, P2,0,100
                DW 0,0
    ;FALSE SOUND / JAWABAN SALAH
    FALSE       DW 0, P1
                DW A2, P2
                DW F2, P2
                DW D2, P2,0,100
                DW 0,0
            
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ;LIST STRING YANG AKAN DITAMPILKAN
    
    TN          DB 'SIAPA NAMA ANDA : $'
    PL          DB 'PLAYER NAME   = $'
    
    JAWABS      DB 'JAWABAN SALAH :( $' 
    JAWABB      DB 'JAWABAN BENAR :) $'
    
    STREAKPR    DB 'ANSWER STREAK = $'
    
    ENDPROG     DB 'APAKAH ANDA INGIN KELUAR PROGRAM (Y/N) : $' 
    
    ;RANDOM NUMBER / TEMPAT MENYIMPAN RANDOM NUMBER YANG TELAH DICARI
    X           DB 0
    Y           DB 0
    Z           DB 0
    MATH        DB '+'
    
    ;STATUS / STATUS PERMAINAN DARI USER
    STREAK      DB 0
    HPERIKSA    DB 0
    DIFF        DB 0
    
    ;USER VARIABLE / VARIABEL INPUT DARI USER
    NAMA        DB 25 DUP (2)
    BLANK       DB 10 DUP(1)
    JAWAB       DB 5 DUP (0)
               
.CODE
;!! NURFAIZI
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ;LIST KUMPULAN PROCEDUR
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ;INTERFACE PROCEDUR
    ;OPENING PROCEDUR / PROCEDUR UNTUK PRINT TAMPILAN OPENING
    OPENINT PROC
        LEA DX, S_1
        CALL PRINTSTR
        LEA DX, S_2
        CALL PRINTSTR
        LEA DX, S_3
        CALL PRINTSTR
        LEA DX, S_4
        CALL PRINTSTR
        LEA DX, S_5
        CALL PRINTSTR
        LEA DX, S_6
        CALL PRINTSTR
        LEA DX, S_7
        CALL PRINTSTR
        LEA DX, S_8
        CALL PRINTSTR
        LEA DX, S_9
        CALL PRINTSTR
        LEA DX, S_10
        CALL PRINTSTR
        LEA DX, S_11
        CALL PRINTSTR
        LEA DX, S_12
        CALL PRINTSTR
        LEA DX, S_13
        CALL PRINTSTR
        LEA DX, S_14
        CALL PRINTSTR
        LEA DX, S_15
        CALL PRINTSTR
        LEA DX, S_16
        CALL PRINTSTR
        LEA DX, S_17
        CALL PRINTSTR
        LEA DX, S_18
        CALL PRINTSTR
        LEA DX, S_19
        CALL PRINTSTR
        LEA DX, S_20
        CALL PRINTSTR
        LEA DX, S_21
        CALL PRINTSTR
        LEA DX, S_22
        CALL PRINTSTR
        LEA DX, S_23
        CALL PRINTSTR
        LEA DX, S_24
        CALL PRINTSTR
        RET
    ENDP
    
    ;ENDING PROCEDUR / PROCEDUR UNTUK PRINT TAMPILAN ENDING
    ENDINT PROC
        LEA DX, E_1
        CALL PRINTSTR
        LEA DX, E_2
        CALL PRINTSTR
        LEA DX, E_3
        CALL PRINTSTR
        LEA DX, E_4
        CALL PRINTSTR
        LEA DX, E_5
        CALL PRINTSTR
        LEA DX, E_6
        CALL PRINTSTR
        LEA DX, E_7
        CALL PRINTSTR
        LEA DX, E_8
        CALL PRINTSTR
        LEA DX, E_9
        CALL PRINTSTR
        LEA DX, E_10
        CALL PRINTSTR
        LEA DX, E_11
        CALL PRINTSTR
        LEA DX, E_12
        CALL PRINTSTR
        LEA DX, E_13
        CALL PRINTSTR
        LEA DX, E_14
        CALL PRINTSTR
        LEA DX, E_15
        CALL PRINTSTR
        LEA DX, E_16
        CALL PRINTSTR
        LEA DX, E_17
        CALL PRINTSTR
        LEA DX, E_18
        CALL PRINTSTR
        LEA DX, E_19
        CALL PRINTSTR
        LEA DX, E_20
        CALL PRINTSTR
        LEA DX, E_21
        CALL PRINTSTR
        LEA DX, E_22
        CALL PRINTSTR
        LEA DX, E_23
        CALL PRINTSTR
        RET
    ENDP

;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ;PROCEDURE UMUM
    
    ;PROCEDURE ENTER / PROCEDUR UNTUK PRINT ENTER
    ENTERDONG PROC
        MOV DL, 10
        MOV AH, 02H
        INT 21h
        MOV DL, 13
        MOV AH, 02H
        INT 21H
        RET    
    ENDP
    
    ;CLEAR SCREEN / PROCEDUR UNTUK CLEAR SCREEN 
    CLEARSCR PROC
        MOV AH, 0FH
        INT 10H
        
        MOV AH, 0H
        INT 10H
        
        RET 
    ENDP
    
    ;PRINTSTRING / PROCEDUR UNTUK PRINT STRING
    PRINTSTR PROC
        MOV AH, 09H
        INT 21H
        
        RET         
    ENDP
    
    ;PRINT DIVIDER / PROCEDUR UNTUK PRINT DIVIDER INTERFACE
    PRINTDIV PROC
        LEA DX, DIVIDE
        CALL PRINTSTR
        
        RET
    ENDP

;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ;PROCEDURE PROGRAM
     
    ;TANYA NAMA / PROCEDUR UNTUK MENANYAKAN NAMA USER
    TANYANAMA PROC
        LEA DX, TN
        CALL PRINTSTR
        
        MOV NAMA, 20
        MOV AH, 0AH
        MOV DX, OFFSET NAMA
        INT 21H
        
        RET
    ENDP
    
    ;PRINT NAMA / PROCEDUR UNTUK PRINT NAMA USER
    PRINTNAMA PROC
        
        LEA DX, PL
        CALL PRINTSTR
        
        MOV CL, NAMA[01]
        MOV SI, 02H
        MOV CH, 0H
        
        LOOPNAMA:
        MOV DL, NAMA[SI]
        
        MOV AH, 02H
        INT 21H
        INC CH
        INC SI
        
        CMP CH, CL
        JB LOOPNAMA
        
        RET
    ENDP
    
    ;PRINT STREAK / PROCEDUR UNTUK PRINT STREAK JAWABAN
    PRINTSTREAK PROC
        LEA DX, STREAKPR
        CALL PRINTSTR
    
        MOV AL, STREAK
        AAM
    
        MOV DL, AH
        MOV DH, AL
    
        ADD DL, 30H
    
        MOV AH, 02H
        INT 21H
    
        MOV DL, DH
        ADD DL, 30H
        INT 21H
        
        RET
    ENDP
    
    ;SET DIFFICULTY / PROCEDUR UNTUK MENENTUKAN DIFFICULTY (EZ/UNFAIR)
    CEKDIFF PROC
        ;KETIKA STREAK JAWABAN LEBIH DARI 10 STREAK UBAH DIFFICULTY MENJADI UNFAIR
        ;10 STREAK > HARD
        MOV AL, STREAK
        CMP AL, 0AH
        JA UNF
        
        ;EASY
        MOV DIFF, 01H
        JMP ENDCEKDIFF
        
        ;UNFAIR
        UNF:
        MOV DIFF, 02H 
        
        ENDCEKDIFF:
        
        RET    
    ENDP
    
    ;AMBIL ANGKA RANDOM / PROCEDUR UNTUK MENCARI NILAI RANDOM DAN MENENTUKAN JAWABANNYA >> MASUKAN KE VARIABEL X,Y,Z
    GETRANDOM PROC
        ;CEK DIFF
        MOV AL, DIFF
        CMP AL, 01H
        JNE SULIT
        
        ;DIFFICULTY EZ
        ;X
        MOV AH, 2CH
        INT 21H
        
        MOV AH, 0H
        MOV AL, DH
        MOV DL, CL
        MUL DL
        MOV DL, 13
        MUL DL
        AAM
        
        MOV X, AL
        
        ;Y
        MOV AH, 2CH
        INT 21H
        
        MOV AH, 0H
        MOV AL, DH
        MOV DL, CH
        MUL DL
        MOV DL, 23 
        MUL DL
        AAM
        
        MOV Y, AL
        
        JMP MATHX
        
        ;DIFFICULTY UNFAIR
        SULIT:
        
        ;X
        ;DIGIT1
        MOV AH, 2CH
        INT 21H
        
        MOV AH, 0H
        MOV AL, DH
        
        MOV DL, CL
        MUL DL
        
        MOV DX, 47
        ADD DL, RANDOM1
        MUL DL
        
        AAM
        
        ;X10
        MOV DL, 0AH
        MUL DL
        
        MOV BL, AL
        
        ;DIGIT2
        MOV AH, 2CH
        INT 21H
        
        MOV AH, 0H
        MOV AL, DH
        MOV DL, CH
        MUL DL
        MOV DX, 13
        ADD DL, RANDOM2
        MUL DL
        AAM
        
        ADD BL, AL
        
        MOV X, BL
        
        ;Y
        ;DIGIT1
        MOV AH, 2CH
        INT 21H
        
        MOV AH, 0H
        MOV AL, DH
        MOV DL, CH
        MUL DL
        MOV DX, 31
        ADD DL, RANDOM1
        MUL DL
        AAM
        
        ;X10
        MOV DL, 0AH
        MUL DL
        
        MOV BL, AL
        
        ;DIGIT2
        MOV AH, 2CH
        INT 21H
        
        MOV AH, 0H
        MOV AL, DH
        MOV DL, CL
        MUL DL
        MOV DX, 29
        ADD DL, RANDOM2
        MUL DL
        AAM
        
        ADD BL, AL
        
        MOV Y, BL
        
        MATHX:
        
        ;OPERATOR MATH / MENENTUKAN OPERATOR MATEMATIKA YANG DIGUNAKAN (+/-)
        MOV AH, 2CH
        INT 21H
        MOV AL, DH
        MOV DL, 02H
        MOV AH, 0H
        DIV DL
        
        CMP AH, 0H
        JE MINUS
        
        ;+
        PLUS:
        MOV MATH, '+'
        MOV AL, X
        ADD AL, Y
        MOV Z, AL
         
        JMP ENDGET
        
        ;UNTUK X - Y > 0 MAKA TIDAK PERLU DIBALIK ANGKANYA 
        ;-
        MINUS:
        MOV MATH, '-'
        
        MOV AH, X
        MOV AL, Y
        
        CMP AH, AL
        JB BALIKANGKA
        
        SUB AH, AL
        MOV Z, AH
        JMP ENDGET
        
        ;JIKA X - Y < 0 MAKA LAKUKAN SWAP X Y
        BALIKANGKA:
        MOV X, AL
        MOV Y, AH
        
        SUB AL, AH
        MOV Z, AL
        JMP ENDGET
        
        ENDGET:
        
        MOV CX, AX
        MOV AL, 17
        
        ;CARI NILAI RANDOM UNTUK MENCARI NILAI RANDOM SELANJUTNYA
        LOOPRAND:
        MOV AH, 0H
        MOV DX, SP
        MUL DL
        MOV AL, RANDOM1
        
        MOV AH, 0H
        MOV DX, SP
        MUL DL
        MOV AL, RANDOM2
        
        LOOP LOOPRAND
        
        RET    
    ENDP
    
    ;PERTANYAAN USER / TANYAKAN PERTANYAAN MATEMATIKA DAN KEMUDIAN AMBIL INPUT DARI USER
    PERTANYAAN PROC
        MOV AL, DIFF
        CMP AL, 01H
        JNE BIT2T
        
        MOV AL, 02H
        MOV DL, ' '
        INT 21H
        INT 21H 
        
        ;DIFFICULTY EZ >> PRINT 1 BIT ANGKA
        BIT1T:
        MOV AH, 02H
        
        ;X
        MOV DL, X
        ADD DL, 30H
        INT 21H
        
        ;MATH
        MOV DL, MATH
        INT 21H
        
        ;Y
        MOV DL, Y
        ADD DL, 30H
        INT 21H
        
        ;=
        MOV DL, 3DH
        INT 21H
        
        JMP MIDWAY
        
        ;DIFFICULTY UNFAIR >> PRINT 2 BIT ANGKA
        BIT2T:
        ;X
        MOV AL, X
        AAM
        
        MOV DL, AH
        MOV DH, AL
        ADD DL, 30H
        MOV AH, 02H
        INT 21H
        
        MOV DL, DH
        ADD DL, 30H
        INT 21H
        
        ;MATH
        MOV DL, MATH
        INT 21H
        
        ;Y
        MOV AL, Y
        AAM
        
        MOV DL, AH
        MOV DH, AL
        ADD DL, 30H
        MOV AH, 02H
        INT 21H
        
        MOV DL, DH
        ADD DL, 30H
        INT 21H
                                           
        ;=
        MOV DL, 3DH
        INT 21H
        
        MIDWAY:
        
        ;INPUT USER / TANYAKAN INPUT PADA USER 
        MOV JAWAB, 04H
        MOV AH, 0AH
        MOV DX, OFFSET JAWAB
        INT 21H
        
        ;JAWAB[1] MERUPAKAN JUMLAH BIT YANG USER MASUKAN
        MOV AL, JAWAB[1]
        CMP AL, 3
        JE BIT3
        
        CMP AL, 2
        JE BIT2
        
        ;JAWABAN USER 1 BIT
        BIT1:
        MOV AL, JAWAB[2]
        SUB AL, 30H
        MOV JAWAB[2], AL
        JMP ENDPER
        
        ;JAWABAN USER 2 BIT
        BIT2:
        ;X10
        MOV AL, JAWAB[2]
        SUB AL, 30H
        MOV DL, 10
        MUL DL
        
        ;+ANGKA2
        MOV AH, JAWAB[3]
        SUB AH, 30H
        ADD AL, AH
        MOV JAWAB[2], AL
        JMP ENDPER
        
        ;JAWABAN USER 3 BIT
        BIT3:
        ;X100
        MOV AL, JAWAB[2]
        SUB AL, 30H
        MOV DL, 100
        MUL DL        
        MOV DH, AL
        
        ;X10
        MOV AL, JAWAB[3]
        SUB AL, 30H
        MOV DL, 10
        MUL DL
        ADD DH, AL
        
        ;+ANGKA3
        MOV AL, JAWAB[4]
        SUB AL, 30H
        ADD DH, AL
        MOV JAWAB[2], DH
        
        ENDPER:
        
        RET        
    ENDP
    
    ;PERIKSA JAWABAN / PERIKSA JAWABAN INPUT DARI USER KEMUDIAN UBAH HPERIKSA SEBAGAI INDIKATOR BENAR/SALAH  
    PERIKSA PROC
        MOV BL, Z
        MOV BH, JAWAB[2]
        CMP BL, BH
        
        JNE JAWABANSALAH
        
        ;JAWABAN BENAR 
        MOV HPERIKSA, 01H
        
        ;INC STREAK
        MOV AL, STREAK
        INC AL
        MOV STREAK, AL
        
        JMP ENDPERIKSA
        
        ;JAWABAN SALAH
        JAWABANSALAH:
        MOV HPERIKSA, 02H
        
        ;RESET STREAK
        MOV STREAK, 0H
        
        ENDPERIKSA:
        
        RET   
    ENDP
    
    ;TAMPIL HASIL PERIKSA / TAMPIL HASIL PEMERIKSAAN USER
    HASILPERIKSA PROC
        MOV BL, HPERIKSA
        CMP BL, 01H
        
        JNE SALAH
        
        ;JAWABAN BENAR
        CALL ENTERDONG
        
        MOV AH, 02H
        MOV DL, ' '
        INT 21H
        INT 21H
        
        LEA DX, JAWABB
        CALL PRINTSTR
        
        LEA SI, TRUE
        CALL PLAY
        
        JMP ENDHASILPERIKSA
        
        ;JAWABAN SALAH
        SALAH:
        CALL ENTERDONG
        
        MOV AH, 02H
        MOV DL, ' '
        INT 21H
        INT 21H
        
        LEA DX, JAWABS
        CALL PRINTSTR
        
        LEA SI, FALSE
        CALL PLAY
        
        ENDHASILPERIKSA:
        
        RET
    ENDP
    
    ;ENDPROGRAM ? / TANYAKAN APAKAH USER SELESAI BERMAIN ATAU TIDAK
    ENDPROGAK PROC
        CALL ENTERDONG
        
        MOV AH, 02H
        MOV DL, ' '
        INT 21H
        INT 21H
        
        LEA DX, ENDPROG
        CALL PRINTSTR
        
        ;INPUT USER
        MOV AH, 01H
        INT 21H
        
        ;INPUT 'Y'
        CMP AL, 'Y'
        JE ENDDONG
        
        CMP AL, 'y'
        JE ENDDONG
        
        MOV CL, 05H
        JMP ENDPROG?
        
        ENDDONG:
        MOV CL, 04H
        
        ENDPROG?:
        
        RET 
    ENDP

;!! MAHDI            
.486
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ;PROCEDURE UNTUK OUTPUT SUARA
    ;SOUND PROCEDURE
    
    ;DELAY SUARA PADA LAGU
    DELAY PROC NEAR MS:WORD
        PUSH BP
        MOV BP, SP
        SUB SP, 4
        
        XOR AX, AX
        MOV ES, AX
        MOV EDX, ES:[046CH]
              
        FILD WORD PTR MS
        FIMUL DWORD PTR DIV1
        FIDIV DWORD PTR DIV2
        FISTP DWORD PTR [BP-4]
    
        ADD EDX, [BP-4]
    
        @@L1:
        MOV EAX, ES:[046CH]
        CMP EAX, EDX
        JB @@L1
    
        LEAVE
        
        RET 2
    DELAY ENDP
    
    ;PROCEDUR UNTUK MEM-PLAY LIST NADA YANG SUDAH DISEDIAKAN
    PLAY PROC NEAR              
        MOV DI, SI              
    
        @@L1:
        CMP WORD PTR [SI], 0    
        JE @@J1                 
    
        ;MENGATUR FREQUENCY
        CLI                     
        MOV AL, 0B6H
        OUT 43H, AL
        MOV AX, [SI]
        OUT 42H, AL
        MOV AL, AH
        OUT 42H, AL
        STI
    
        IN AL, 61H              ;SPEAKER ON
        OR AL, 03H
        OUT 61H, AL
    
        @@J1:
        PUSH WORD PTR [SI+2]    
        CALL DELAY
    
        IN AL, 61H              ;SPEAKER OFF
        AND AL, 0FCH
        OUT 61H, AL
    
        ADD SI, 4
        CALL CHECK_KEY          ;CEK INPUT DARI KEYBOARD USER
        CMP WORD PTR [SI+2], 0
        JNE @@L1
        
        RET
    PLAY ENDP
    
    ;CEK INPUT KEYBOARD DARI USER
    CHECK_KEY PROC              
        
        MOV AH, 1               ;CEK INPUT KEYBOARD
        INT 16H
        JZ @@DONE               
        MOV AH, 0               
        INT 16H
    
        @@K2:                   ;KETIKA USER MENEKAN APAPUN SELAIN '`' MAKA EXIT DARI LOOP LAGU KEMUDIAN MASUK KE PLAY INTERFACE
        CMP AL, '`'
        JNE PLAYONCE
        
        @@DONE:
        
        RET
    CHECK_KEY ENDP
    
;PROGRAM UTAMA 
.STARTUP
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    MOV AX, @DATA
    MOV DS, AX
    
    NEW:
       
    ;OPENING INTERFACE AND SOUND
    CALL OPENINT
    
    OPENINGLOOP:
    LEA SI, OPENINGSONG
    CALL PLAY
    JMP OPENINGLOOP
    
    ;MULAI PERMAINAN
    PLAYONCE:
    
    ;TANYAKAN NAMA USER
    CALL TANYANAMA
    
    PLAYFOREV:
    CALL CLEARSCR
    
    ;CEK DIFFICULTY
    CALL CEKDIFF
    
    ;GET RANDOM
    CALL GETRANDOM
    
    ;INTERFACE GAME PLAY
    
    ;PRINT NAMA DAN STREAK
    CALL PRINTDIV
    
    CALL ENTERDONG
    
    ;NAMA USER
    CALL PRINTNAMA
    CALL ENTERDONG
    
    ;STREAK USER
    CALL PRINTSTREAK
    CALL ENTERDONG
    
    CALL ENTERDONG
    
    CALL PRINTDIV
    
    CALL ENTERDONG    
    
    ;PERTANYAAN    
    CALL PERTANYAAN
    
    ;CEK JAWABAN
    CALL PERIKSA
    
    CALL ENTERDONG
    
    ;HASIL PEMERIKSAAN
    CALL HASILPERIKSA
    
    CALL ENTERDONG
    CALL ENTERDONG
    
    ;SETELAH BENAR / SALAH
    MOV AL, STREAK
    CMP AL, 0H
    JE ABISKALAH
    
    ;KALAU MENANG LOOP TERUS SAMPAI SALAH
    ABISMENANG:
    JMP PLAYFOREV    
    
    ;KALAU KALAH BARU TANYAKAN LAGI MAU MAIN LAGI ATAU TIDAK
    ABISKALAH:
    ;CEK USER SELESAI BERMAIN ATAU TIDAK
    CALL ENDPROGAK
    CALL ENTERDONG
    CMP CL, 05H
    JE NEW
    
    ;EXIT PROGRAM
    JMP FINPROGRAM
    
    ;KELUAR DARI PROGRAM
    FINPROGRAM:
    
    ;ENDING INTERFACE AND SOUND
    CALL CLEARSCR
    
    CALL ENDINT
    
    LEA SI, ENDINGSONG
    CALL PLAY
    
    MOV AX, 4C00H
    INT 21H
    
    .EXIT
END 