;haribote os

    ORG 0xc200

    MOV AL,0x13
    MOV AH,0x00
    INT 0x00

fin:
    HLT
    JMP fin
