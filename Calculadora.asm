TITLE	CALCULADORA
.MODEL	SMALL
.STACK 	100H
.DATA
BARRA		DB		'--------------------------------------------------------------------------------$'
INICIAR		DB		'Para iniciar selecione a primeira base:$'
INICIAR2	DB		'Escolha a segunda base: (se for NOT digite 0)$'
INICIAR3	DB		'Escolha a base:$'
INICIAR4	DB		'Escolha a base de saida:$'
LETA		DB		'A - AND$'
LETB		DB		'B - OR$'
LETC		DB		'C - XOR$'
LETD		DB		'D - NOT$'
LETE		DB		'E - Soma$'
LETF		DB		'F - Subtracao$'
LETG		DB		'G - Multiplicacao$'
LETH		DB		'H - Divisao$'
LETI		DB		'I - Multiplicacao por 2$'
LETJ		DB		'J - Divisao por 2$'
FUNCAO		DB		'Digite a letra: $'
BINARIO		DB		'1 - Binario$'
DEDIMAL		DB		'2 - Decimal$'
HEXADECIMAL	DB		'3 - Hexadecimal$'
OCTAL		DB		'4 - Octal$'
BASEESC		DB		'Digite o numero: $'
DIG1		DB		'Digite o primeiro numero: $'
DIG2		DB		'Digite o segundo numero: $'
RESP		DB		'A resposta e: $'
ESCOLHER	DB		'Deseja continuar (S / N): $'
AUX1		DW		?
AUX2		DW		?
.CODE
	MAIN		PROC
	
	MOV		AX,@DATA		;Comando para strings
	MOV		DS,AX

INICIAR5:
	LEA		DX,BARRA		;print
	CALL	PRINTSTRING
	
	LEA		DX,INICIAR		;print
	CALL	PRINTSTRING
	
	CALL	USADO
	
	CMP		AL,31H			;Comparacao para jumps
	JE		AU1
	CMP		AL,32H
	JE		AU2
	CMP		AL,33H
	JE		AU3
	CMP		AL,34H
	JE		AU4
	CALL	PULALINHA
	JMP		INICIAR5

AU1:
	JMP		A1
AU2:
	JMP		A2
AU3:
	JMP		A3
AU4:
	JMP		A4
	
A1:	;Binario

	CALL	PULALINHA
	LEA		DX,DIG1
	CALL	PRINTSTRING
	CALL	ENTBIN
	MOV		AUX1,BX
	JMP		ENTNUM2

A2:	;Decimal

	CALL	PULALINHA
	LEA		DX,DIG1
	CALL	PRINTSTRING
	CALL	ENTDEC
	MOV		AUX1,AX
	JMP		ENTNUM2

A3:	;Hexadecimal

	CALL	PULALINHA
	LEA		DX,DIG1
	CALL	PRINTSTRING
	CALL	ENTHEX
	MOV		AUX1,BX
	JMP		ENTNUM2

A4:	;Octal

	CALL	PULALINHA
	LEA		DX,DIG1
	CALL	PRINTSTRING
	CALL	ENTOCT
	MOV		AUX1,AX
	JMP		ENTNUM2
	
ENTNUM2:

INICIAR6:
	LEA		DX,BARRA		;print
	CALL	PRINTSTRING
	
	LEA		DX,INICIAR2		;print
	CALL	PRINTSTRING
	
	CALL	PULALINHA
	
	LEA		DX,BINARIO		;print
	CALL	PRINTSTRING
	
	CALL	PULALINHA
	
	LEA		DX,DEDIMAL		;print
	CALL	PRINTSTRING
	
	CALL	PULALINHA
	
	LEA		DX,HEXADECIMAL	;print
	CALL	PRINTSTRING
	
	CALL	PULALINHA
	
	LEA		DX,OCTAL		;print
	CALL	PRINTSTRING
	
	CALL	PULALINHA
	
	LEA		DX,BARRA		;print
	CALL	PRINTSTRING
	
	CALL	PULALINHA
	
	LEA		DX,BASEESC		;print
	CALL	PRINTSTRING
	
	MOV		AH,1			;seleciona o numero
	INT		21H
	
	CMP		AL,31H			;Comparacao para jumps
	JE		AU5
	CMP		AL,32H
	JE		AU6
	CMP		AL,33H
	JE		AU7
	CMP		AL,34H
	JE		AU8
	CMP		AL,30H
	JE		SUPERNOTAU
	CALL	PULALINHA
	JMP		INICIAR6
	
AU5:
	JMP		A5
AU6:
	JMP		A6
AU7:
	JMP		A7
AU8:
	JMP		A8
SUPERNOTAU:
	JMP		SUPERNOT
	
A5:	;Binario

	CALL	PULALINHA
	LEA		DX,DIG2
	CALL	PRINTSTRING
	CALL	ENTBIN
	MOV		AUX2,BX
	JMP		ESCOP

A6:	;Decimal

	CALL	PULALINHA
	LEA		DX,DIG2
	CALL	PRINTSTRING
	CALL	ENTDEC
	MOV		AUX2,AX
	JMP		ESCOP

A7:	;Hexadecimal

	CALL	PULALINHA
	LEA		DX,DIG2
	CALL	PRINTSTRING
	CALL	ENTHEX
	MOV		AUX2,BX
	JMP		ESCOP

A8:	;Octal

	CALL	PULALINHA
	LEA		DX,DIG2
	CALL	PRINTSTRING
	CALL	ENTOCT
	MOV		AUX2,AX
	JMP		ESCOP
	
ESCOP:

INICIAR7:
	LEA		DX,BARRA		;print
	CALL	PRINTSTRING
	
	CALL	PULALINHA
	
	LEA		DX,INICIAR3		;print
	CALL	PRINTSTRING

	CALL	PULALINHA
	
	LEA		DX,LETA			;print
	CALL	PRINTSTRING
	
	CALL	PULALINHA
	
	LEA		DX,LETB			;print
	CALL	PRINTSTRING
	
	CALL	PULALINHA
	
	LEA		DX,LETC			;print
	CALL	PRINTSTRING
	
	CALL	PULALINHA
	
	LEA		DX,LETD			;print
	CALL	PRINTSTRING
	
	CALL	PULALINHA
	
	LEA		DX,LETE			;print
	CALL	PRINTSTRING
	
	CALL	PULALINHA
	
	LEA		DX,LETF			;print
	CALL	PRINTSTRING
	
	CALL	PULALINHA
	
	LEA		DX,LETG			;print
	CALL	PRINTSTRING
	
	CALL	PULALINHA
	
	LEA		DX,LETH			;print
	CALL	PRINTSTRING
	
	CALL	PULALINHA
	
	LEA		DX,LETI			;print
	CALL	PRINTSTRING
	
	CALL	PULALINHA
	
	LEA		DX,LETJ			;print
	CALL	PRINTSTRING
	
	CALL	PULALINHA
	
	LEA		DX,BARRA		;print
	CALL	PRINTSTRING

	LEA		DX,FUNCAO		;print
	CALL	PRINTSTRING
	
	MOV		AH,1			;seleciona o numero
	INT		21H
	
	CMP		AL,41H			;switch case
	JE		AuxA
	CMP		AL,61H
	JE		AuxA
	CMP		AL,42H
	JE		AuxB
	CMP		AL,62H
	JE		AuxB
	CMP		AL,43H
	JE		AuxC
	CMP		AL,63H
	JE		AuxC
	CMP		AL,44H
	JE		AuxD
	CMP		AL,64H
	JE		AuxD
	CMP		AL,45H
	JE		AuxE
	CMP		AL,65H
	JE		AuxE
	CMP		AL,46H
	JE		AuxF
	CMP		AL,66H
	JE		AuxF
	CMP		AL,47H
	JE		AuxG
	CMP		AL,67H
	JE		AuxG
	CMP		AL,48H
	JE		AuxH
	CMP		AL,68H
	JE		AuxH
	CMP		AL,49H
	JE		AuxI
	CMP		AL,69H
	JE		AuxI
	CMP		AL,74D
	JE		AuxJ
	CMP		AL,106D
	JE		AuxJ
	CALL	PULALINHA
	JMP		INICIAR7
	
AuxA:
	JMP		A
AuxB:
	JMP		B
AuxC:
	JMP		C
AuxD:
	JMP		D
AuxE:
	JMP		E
AuxF:
	JMP		F
AuxG:
	JMP		G
AuxH:
	JMP		H
AuxI:
	JMP		I	
AuxJ:
	JMP		J
	
A:	;AND

	MOV		BX,AUX2
	AND		AUX1,BX
	JMP		AQUI

B:	;OR

	MOV		BX,AUX2
	OR		AUX1,BX
	JMP		AQUI
	
C:	;XOR

	MOV		BX,AUX2
	XOR		AUX1,BX
	JMP		AQUI

SUPERNOT:
D:	;NOT

	NOT		AUX1
	JMP		AQUI

E:	;SOMA

	MOV		BX,AUX2
	ADD		AUX1,BX
	JMP		AQUI

F:	;SUBTRACAO

	MOV		BX,AUX2
	SUB		AUX1,BX
	JMP		AQUI

G:	;MULTIPLICACAO

	MOV		AX,AUX1
	MOV		BX,AUX2
	IMUL	BX
	MOV		AUX1,AX
	JMP		AQUI
	
H:	;DIVISAO

	MOV		AX,AUX1
	MOV		BX,AUX2
	CWD
	IDIV	BX
	MOV		AUX1,AX
	JMP		AQUI

I:	;MULTIPLICACAO POR 2

	MOV		AX,AUX1
	XOR		CX,CX
	MOV		CX,AUX2
LOOPING1:
	SHL			AX,1
	SHL			AX,1
	DEC			CX
	JNZ			LOOPING1
	MOV			AUX1,AX
	JMP			AQUI
	
J:	;DIVISAO POR 2

	MOV		AX,AUX1
	XOR		CX,CX
	MOV		CX,AUX2
LOOPING2:
	SHR			AX,1
	SHR			AX,1
	DEC			CX
	JNZ			LOOPING2
	MOV			AUX1,AX
	JMP			AQUI

AQUI:

INICIAR8:	
	CALL	PULALINHA
	
	LEA		DX,BARRA		;print
	CALL	PRINTSTRING
	
	LEA		DX,INICIAR4		;print
	CALL	PRINTSTRING
	
	CALL	USADO
	
	CMP		AL,31H			;Comparacao para jumps
	JE		AU9
	CMP		AL,32H
	JE		AU10
	CMP		AL,33H
	JE		AU11
	CMP		AL,34H
	JE		AU12
	CALL	PULALINHA
	JMP		INICIAR8

AU9:
	JMP		A9
AU10:
	JMP		A10
AU11:
	JMP		A11
AU12:
	JMP		A12
	
A9:	;Binario

	CALL	PULALINHA
	LEA		DX,RESP
	CALL	PRINTSTRING
	MOV		BX,AUX1
	CALL	SAIBIN
	CALL	ESCOLHA

A10:;Decimal

	CALL	PULALINHA
	LEA		DX,RESP
	CALL	PRINTSTRING
	MOV		AX,AUX1
	CALL	SAIDEC
	CALL	ESCOLHA

A11:;Hexadecimal

	CALL	PULALINHA
	LEA		DX,RESP
	CALL	PRINTSTRING
	MOV		BX,AUX1
	CALL	SAIHEX
	CALL	ESCOLHA

A12:;Octal

	CALL	PULALINHA
	LEA		DX,RESP
	CALL	PRINTSTRING
	MOV		AX,AUX1
	CALL	SAIOCT
	CALL	ESCOLHA
	
	MAIN		ENDP
	
	ENTDEC	PROC	;Entrada decimal
	
		PUSH 	BX
		PUSH 	CX
		PUSH 	DX
		XOR 	BX,BX
		XOR 	CX,CX
		MOV 	AH,1h
		INT 	21h
		CMP 	AL, '-'
		JE 		MENOS
		CMP 	AL,'+'
		JE 		MAIS
		JMP 	NUM
MENOS: 	MOV		CX,1
MAIS: 	INT 	21h
NUM: 	AND 	AX,000Fh
		PUSH 	AX
		MOV	 	AX,10
		MUL 	BX
		POP 	BX
		ADD 	BX,AX
		MOV 	AH,1h
		INT 	21h
		CMP 	AL,0Dh
		JNE 	NUM
		MOV 	AX,BX
		CMP 	CX,1
		JNE 	SAIDA
		NEG 	AX
SAIDA: 	POP 	DX
		POP 	CX
		POP 	BX
		RET

	ENTDEC	ENDP
	
	SAIDEC	PROC	;Saida decimal

		PUSH 	AX
		PUSH 	BX
		PUSH 	CX
		PUSH 	DX
		OR 		AX,AX
		JGE 	PT1
		PUSH 	AX
		MOV 	DL,'-'
		MOV 	AH,2h
		INT 	21h
		POP 	AX
		NEG 	AX
PT1: 	XOR 	CX,CX
		MOV 	BX,10
PT2: 	XOR 	DX,DX
		DIV 	BX
		PUSH 	DX
		INC 	CX
		OR 		AX,AX
		JNE 	PT2
		MOV 	AH,2h
PT3: 	POP 	DX
		ADD 	DL,30h
		INT 	21h
		LOOP 	PT3
		POP 	DX
		POP 	CX
		POP 	BX
		POP 	AX
		RET

	SAIDEC	ENDP
	
	ENTBIN	PROC	;Entrada Binario
	
		MOV 	CX,16
		MOV 	AH,1h
		XOR 	BX,BX
		INT 	21h
TOPO: 	CMP 	AL,0Dh
		JE 		FIM
		AND 	AL,0Fh
		SHL 	BX,1
		OR 		BL,AL
		INT 	21h
		LOOP 	TOPO
FIM:	RET
	
	ENTBIN	ENDP
	
	SAIBIN	PROC	;Saida Binario
	
		MOV 	CX,16
		MOV 	AH,02h
PAR1: 	ROL 	BX,1
		JNC 	PAR2
		MOV 	DL,31h
		INT 	21h
		JMP		PAR3
PAR2: 	MOV 	DL,30h
		INT 	21h
PAR3:	LOOP	PAR1
		RET
	
	SAIBIN	ENDP	
	
	ENTHEX	PROC	;Entrada Hexadecimal
	
		XOR 	BX,BX
		MOV 	CL,4
		MOV 	AH,1h
		INT 	21h
FINAL:	CMP 	AL,0Dh
		JE 		FINZ
		CMP 	AL,39h
		JG 		LETRA
		AND 	AL,0Fh
		JMP 	DESL
LETRA: 	SUB 	AL,37h
DESL: 	SHL 	BX,CL
		OR 		BL,AL
		INT 	21h
		JMP 	FINAL 
FINZ:	RET
	
	ENTHEX	ENDP

	SAIHEX	PROC	;saida hexadecimal
		
		MOV 	CH,4
		MOV 	CL,4
		MOV 	AH,2h
FIN: 	MOV 	DL,BH
		SHR 	DL,CL
		CMP 	DL,0Ah
		JAE 	LET
		ADD 	DL,30h
		JMP 	PART1
LET: 	ADD 	DL,37h
PART1: 	INT 	21h
		ROL 	BX,CL
		DEC 	CH
		JNZ 	FIN
		RET
	
	SAIHEX	ENDP

	ENTOCT	PROC	;Entrada Octal
	
		PUSH 	BX
		PUSH 	CX
		PUSH 	DX
		XOR 	BX,BX
		XOR 	CX,CX
		MOV 	AH,1h
		INT 	21h
NU: 	AND 	AX,000Fh
		PUSH 	AX
		MOV	 	AX,8
		MUL 	BX
		POP 	BX
		ADD 	BX,AX
		MOV 	AH,1h
		INT 	21h
		CMP 	AL,0Dh
		JNE 	NU
		MOV 	AX,BX
		CMP 	CX,1
		JNE 	SAINDO
		NEG 	AX
SAINDO:	POP 	DX
		POP 	CX
		POP 	BX
		RET

	ENTOCT	ENDP
	
	SAIOCT	PROC		;Saida Octal

		PUSH 	AX
		PUSH 	BX
		PUSH 	CX
		PUSH 	DX
		OR 		AX,AX
		XOR 	CX,CX
		MOV 	BX,8
PT: 	XOR 	DX,DX
		DIV 	BX
		PUSH 	DX
		INC 	CX
		OR 		AX,AX
		JNE 	PT
		MOV 	AH,2h
PTT: 	POP 	DX
		ADD 	DL,30h
		INT 	21h
		LOOP 	PTT
		POP 	DX
		POP 	CX
		POP 	BX
		POP 	AX
		RET

	SAIOCT	ENDP
	
	ESCOLHA		PROC		;escolhe se quer sair ou fazer mais uma conta
REPTI:
	CALL	PULALINHA
	CALL	PULALINHA
	LEA		DX,ESCOLHER
	CALL	PRINTSTRING
	CALL	PULALINHA
	MOV		AH,1
	INT		21H
	CMP		AL,53H
	JE		DNV
	CMP		AL,73H
	JE		DNV
	CMP		AL,78D
	JE		NEM
	CMP		AL,110D
	JE		NEM
	JMP		REPTI
DNV:CALL	MAIN
NEM:CALL	FIMZAO
	ESCOLHA		ENDP
	
	PULALINHA	PROC		;pula linha e volta para o inicio
	MOV		AH,2
	MOV		DL,0DH
	INT		21H
	MOV		DL,0AH
	INT		21H
	RET
	PULALINHA	ENDP
	
	PRINTSTRING	PROC
	MOV		AH,9
	INT		21H
	RET
	PRINTSTRING	ENDP
	
	FIMZAO		PROC			;saida para o DOS
	MOV		AH,4CH
	INT		21H
	FIMZAO		ENDP
	
	USADO		PROC			;printa escolha da base
	CALL	PULALINHA
	
	LEA		DX,BINARIO		;print
	CALL	PRINTSTRING
	
	CALL	PULALINHA
	
	LEA		DX,DEDIMAL		;print
	CALL	PRINTSTRING
	
	CALL	PULALINHA
	
	LEA		DX,HEXADECIMAL	;print
	CALL	PRINTSTRING
	
	CALL	PULALINHA
	
	LEA		DX,OCTAL		;print
	CALL	PRINTSTRING
	
	CALL	PULALINHA
	
	LEA		DX,BARRA		;print
	CALL	PRINTSTRING
	
	CALL	PULALINHA
	
	LEA		DX,BASEESC		;print
	CALL	PRINTSTRING
	
	MOV		AH,1			;seleciona o numero
	INT		21H
	RET
	USADO		ENDP
	
	END		MAIN