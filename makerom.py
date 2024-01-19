code = bytearray([
  0xa9, 0xff,        # lda #$ff
  0x8d, 0x02, 0x60,  # sta $6002

  0xa9, 0x55,        # lda #$55
  0x8d, 0x00, 0x60,  # sta $6000

  0xa9, 0xaa,        # lda #$aa
  0x8d, 0x00, 0x60,  # sta $6000

  0x4c, 0x05, 0x80,  # jmp $8005
])

rom = code + bytearray([0xea] * (32768 - len(code)))

"""
rom[0] = 0xa9 #load the next byte from ROM into A Register (A9)
rom[1] = 0x42 #load value (42) to A Register

#those three bits below says: store the contents of A register at address 6000
rom[2] = 0x8d   #(8D) - store a value in A Register to an address somewhere in memory
rom[3] = 0x00
rom[4] = 0x60
"""

rom[0x7ffc] = 0x00
rom[0x7ffd] = 0x80

with open("rom.bin", "wb") as out_file:
    out_file.write(rom);