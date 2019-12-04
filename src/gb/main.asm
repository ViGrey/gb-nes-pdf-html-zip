INCLUDE "initialize.asm"

  ld de, FontTiles
	ld hl, CHARACTERRAM
  ld bc, FontTilesEnd-FontTiles

  call CopyNESTilesetToGBVRAM
  call SetPalettes
  call PrintTextToScreen
  call EnableLCD

  di
  halt


EnableLCD:
	ld hl, LCDCONTROL
  set 7, [hl] ;Turn on screen
  ret

Blank:
	ld hl, LCDCONTROL
  res 7, [hl] ; Turn off screen
  ret

	
LCDWait:
	push af
    di
LCDWaitAgain:
    ld a, [LCDSTATUS]
    and %00000010
    jr nz, LCDWaitAgain 
  pop af	
	ret
 

SetVRAM:
	inc	b
	inc	c
  jr	SetVRAMSkip
SetVRAMLoop:
    call LCDWait
    ldi      [hl],a
    ei
SetVRAMSkip:
  dec	c
  jr	nz, SetVRAMLoop
	dec	b
  jr	nz, SetVRAMLoop
	ret
	

SetPalettes:
  ld a, %00011011
  ld hl, BACKGROUNDPALETTE
  ldi [hl], a
	ldi [hl], a
	cpl
	ldi [hl], a
  ret


CopyNESTilesetToGBVRAM:
  ld a, [de]
  ldi [hl], a
  inc de
  inc de
  inc de
  inc de
  inc de
  inc de
  inc de
  inc de
  ld a, [de]
  ldi [hl], a
  dec bc
  dec bc
  ld a, c
  and 15
  cp 0
  jr z, CopyNESTilesetToGBVRAMNotMultipleOf16
    dec de
    dec de
    dec de
    dec de
    dec de
    dec de
    dec de
    dec de
CopyNESTilesetToGBVRAMNotMultipleOf16:
  inc de
  ld a, b
  or c
  jr nz, CopyNESTilesetToGBVRAM
    ret


PrintTextToScreen:
  ld de, TextData - 1
  ld hl, BGMAP1
  ld a, l
  ld [addr], a
  ld [tmp], a
  ld a, h
  ld [addr + 1], a
  ld [tmp + 1], a
  ld b, 0
PrintTextToScreenLoop:
  inc de
  ld a, [de] 
  cp 255
  jr nz, PrintTextToScreenNotEnd
    jp PrintTextToScreenDone
PrintTextToScreenNotEnd:
  cp 0
  jr nz, PrintTextToScreenNotNewline
    ld a, [tmp]
    ld l, a
    ld a, [tmp + 1]
    ld h, a
    ld c, 32
    add hl, bc
    ld a, l
    ld [tmp], a
    ld [addr], a
    ld a, h
    ld [tmp + 1], a
    ld [addr + 1], a
    jp PrintTextToScreenLoop
PrintTextToScreenNotNewline:
  ld a, [addr]
  ld l, a
  ld a, [addr + 1]
  ld h, a
  ld a, [de] 
  ld [hl], a
  inc hl
  ld a, l
  ld [addr], a
  ld a, h
  ld [addr + 1], a
  jp PrintTextToScreenLoop
PrintTextToScreenDone:
  ret

TextData:
  DB 0,"  This Gameboy ROM",0,"   is also an NES",0,"  ROM, a PDF File,",0," an HTML File, and",0,"  a ZIP File that",0,"  contains its own",0,"    source code",0,0,0,0,0,0,0,"   ",127," 2019 - Vi Grey",0,"         vigrey.com",0,"        @ViGreyTech",255
