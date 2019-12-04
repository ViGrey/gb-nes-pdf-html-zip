INCLUDE "header-defs.asm"
INCLUDE "ram.asm"
INCLUDE "defs.asm"


SECTION "rom", ROM0

INCLUDE "header.asm"


SECTION "main", ROM0[$800]

main:
  INCLUDE "main.asm"

draw:
stat:
timer:
serial:
joypad:
  reti
