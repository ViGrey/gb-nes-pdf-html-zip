  ret
  REPT 7
    nop
  ENDR
  ret
  REPT 7
    nop
  ENDR
  ret
  REPT 7
    nop
  ENDR
  ret
  REPT 7
    nop
  ENDR
  ret
  REPT 7
    nop
  ENDR
  ret
  REPT 7
    nop
  ENDR
  ret
  REPT 7
    nop
  ENDR
  ret
  REPT 7
    nop
  ENDR
  jp draw
  REPT 5
    nop
  ENDR
  jp stat
  REPT 5
    nop
  ENDR
  jp timer
  REPT 5
    nop
  ENDR
  jp serial
  REPT 5
    nop
  ENDR
  jp joypad
  REPT 5
    nop
  ENDR
  DS $98
  nop
  jp main
  DB $CE,$ED,$66,$66,$CC,$0D,$00,$0B,$03,$73,$00,$83,$00,$0C,$00,$0D,$00,$08,$11,$1F,$88,$89,$00,$0E,$DC,$CC,$6E,$E6,$DD,$DD,$D9,$99,$BB,$BB,$67,$63,$6E,$0E,$EC,$CC,$DD,$DC,$99,$9F,$BB,$B9,$33,$3E
  DB "GB-POLYGLOT"
  DS 4
  DB GBC_UNSUPPORTED
  DB "VI"
  DB SGB_UNSUPPORTED
  DB CART_ROM_ONLY
  DB ROM_32K
  DB RAM_NONE
  DB DEST_INTERNATIONAL
  DB $33
  DB $00
  DB $FF
  DW $0000
