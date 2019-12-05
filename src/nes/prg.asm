RESET:
  sei
  cld
  ldx #$40
  stx $4017
  ldx #$FF
  txs
  inx
  stx $4010
  jsr Blank

  ldx #$02

vwait:
  lda $2002
  bpl vwait
    dex
    bne vwait

InitializeCPULoop:
  lda #$00
  sta $0000, x
  sta $0300, x
  sta $0400, x
  sta $0600, x
  sta $0700, x
  lda #$fe
  sta $0200, x
  inx
  bne InitializeCPULoop

InitializePPU:
  lda #$20
  sta PPU_ADDR
  lda #$00
  sta PPU_ADDR
  tax
  ldy #$10
InitializePPULoop:
  sta PPU_DATA
  dex
  bne InitializePPULoop
    dey
    bne InitializePPULoop

InitializePaletteRAM:
  lda #$3F
  sta PPU_ADDR
  lda #$00
  sta PPU_ADDR
  ldx #$08 
  lda #$0F
  ldy #$30
InitializePaletteRAMLoop:
  sta PPU_DATA
  sta PPU_DATA
  sta PPU_DATA
  sty PPU_DATA
  dex
  bne InitializePaletteRAMLoop

CleanUp:
  lda #$00
  ldy #$00

  jsr DrawText
  jsr ResetScroll

Forever:
  jmp Forever

NMI:
  inc $40
  lda #$00
  sta PPU_OAM_ADDR
  lda #$02
  sta OAM_DMA
  jsr Draw
  jsr ResetScroll
  lda PPU_STATUS
NMIDone:
  rti

EnableNMI:
  lda #%10001000
  sta PPU_CTRL
  rts

Draw:
  lda #%00001000
  sta PPU_MASK
  rts

DisableNMI:
  lda #$00
  sta PPU_CTRL
  rts

Blank:
  lda #$00
  sta PPU_MASK
  jsr DisableNMI
  rts

ResetScroll:
  lda #$00
  sta PPU_SCROLL
  sta PPU_SCROLL
  jsr EnableNMI
  rts

DrawText:
  lda #$20
  sta tmp
  lda #<(TextData)
  sta addr
  lda #>(TextData)
  sta (addr + 1)
  ldy #$00
DrawTextLoop:
  lda tmp
  sta PPU_ADDR
  lda (tmp + 1)
  sta PPU_ADDR
DrawTextLineLoop:
  lda (addr), y
  cmp #$FF
  bne DrawTextLineLoopNotEnd
    rts
DrawTextLineLoopNotEnd:
  cmp #$00
  bne DrawTextLineLoopNotNewline
    lda (tmp + 1)
    clc
    adc #$20
    sta (tmp + 1)
    lda tmp
    adc #$00
    sta tmp
    lda addr
    clc
    adc #$01
    sta addr
    lda (addr + 1)
    adc #$00
    sta (addr + 1)
    jmp DrawTextLoop
DrawTextLineLoopNotNewline:
  sta PPU_DATA
  lda addr
  clc
  adc #$01
  sta addr
  lda (addr + 1)
  adc #$00
  sta (addr + 1)
  jmp DrawTextLineLoop

TextData:
  .byte 0,0,0,"     This NES ROM is also a",0,"    Gameboy ROM, a PDF File,",0,"    an HTML File, and a ZIP",0,"     File that contains its",0,"        own source code",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"             ",127," 2019 - Vi Grey",0,"                   vigrey.com",0,"                  @ViGreyTech",255

  .org CALLBACK

  .dw   NMI
  .dw   RESET
  .dw   0
