  di
  ld sp, $ffff
	xor a					
	ld hl, SCROLLY			
  ldi [hl], a
  ld [hl], a

vwait:
  ld a, [CURRENTSCANLINE]
	cp 145
  jr nz, vwait

  call Blank

ClearBGMap1:
  ld bc, 0
  ld hl, BGMAP1
ClearBGMap1Loop:
  ld a, 0
  ldi [hl], a
  inc bc
  ld a, b
  cp 4
  jr nz, ClearBGMap1Loop

ClearBGMap2:
  ld bc, 0
  ld hl, BGMAP2
ClearBGMap2Loop:
  ld a, 0
  ldi [hl], a
  inc bc
  ld a, b
  cp 4
  jr nz, ClearBGMap2Loop

ClearWRAM:
  ld bc, 0
  ld hl, WORKRAM
ClearWRAMLoop:
  ld a, 0
  ldi [hl], a
  inc bc
  ld a, b
  cp $20
  jr nz, ClearWRAMLoop

ClearOAM:
  ld c, $A0
  ld hl, OAMRAM
ClearOAMLoop:
  ld a, 0
  ldi [hl], a
  dec c
  jr nz, ClearOAMLoop

ResetPalettes:
  ld a, %11100100
  ld hl, BACKGROUNDPALETTE
  ldi [hl], a
  ldi [hl], a
  ldi [hl], a
