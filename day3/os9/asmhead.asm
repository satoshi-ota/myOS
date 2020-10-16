;haribote os

CYLS    EQU 0xff0
LEDS    EQU 0xff1
VMODE   EQU 0xff2
SCRNX   EQU 0xff4
SCRNY   EQU 0xff6
VRAM    EQU 0xff8

        ORG 0xc200

        MOV AL,0x13
        MOV AH,0x00
        INT 0x10
        MOV BYTE [VMODE],8
        MOV WORD [SCRNX],320
        MOV WORD [SCRNY],200
        MOV DWORD [VRAM],0x000a0000

        MOV AH,0x02
        INT 0x16
        MOV [LEDS],AL

fin:
    HLT
    JMP fin
