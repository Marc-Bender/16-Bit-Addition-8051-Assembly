				NAME	_16BitAddition
				CSEG AT 0000H
			
	sum16AH		equ 	0x21
	sum16AL		equ		0x20

	sum16BH		equ		0x23
	sum16BL		equ		0x22

	sum16EH		equ		0x25
	sum16EL		equ		0x24
init:			mov 	sum16AL, #0xab
				mov		sum16AH, #0x01
				mov  	sum16BL, #0xab
				mov		sum16BH, #0x01
				lcall   _16BitAdd
loop_forever:	sjmp 	loop_forever
_16BitAdd:		mov 	psw,#0x00d
				mov		a,sum16AL
				mov		b,sum16BL
				addc	a,b
				mov		sum16EL,a
				mov 	a,sum16AH
				mov		b,sum16BH
				addc	a,b
				mov		sum16EH,a
				ret			
				END