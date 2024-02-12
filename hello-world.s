PORTB = $6000
PORTA = $6001
DDRB = $6002
DDRA = $6003

E  = %10000000
RW = %01000000
RS = %00100000

    .org $8000
reset:
    lda #%11111111     ; Set all pins on port B to output
    sta DDRB

    lda #%11100000     ; Set top 3 pins on port A to output
    sta DDRA

    lda #%00111000     ; Set 8-bit mode; 2-line display; 5x8 font
    sta PORTB

    lda #0
    sta PORTA          ; Clear RS/RW/E bits

    lda #E
    sta PORTA          ; Set E bit to send instruction

    lda #0
    sta PORTA          ; Clear RS/RW/E bits

 ; new line

    lda #%00001110     ; Display on; cursor on; blink off   
    sta PORTB

    lda #0
    sta PORTA          ; Clear RS/RW/E bits

    lda #E
    sta PORTA          ; Set E bit to send instruction

    lda #0
    sta PORTA          ; Clear RS/RW/E bits

    lda #%00000110     ; Increment and shift cursor do not shift display 
    sta PORTB

    lda #0
    sta PORTA          ; Clear RS/RW/E bits

    lda #E
    sta PORTA          ; Set E bit to send instruction

    lda #0
    sta PORTA          ; Clear RS/RW/E bits

    lda #"B"
    sta PORTB
    lda #RS
    sta PORTA          ; Set RW/E bits
    lda #(RS | E)
    sta PORTA          ; Set E bit to send instruction
    lda #RS
    sta PORTA          ; Clear E bits

    lda #"a"
    sta PORTB
    lda #RS
    sta PORTA          ; Set RW/E bits
    lda #(RS | E)
    sta PORTA          ; Set E bit to send instruction
    lda #RS
    sta PORTA          ; Clear E bits

    lda #"w"
    sta PORTB
    lda #RS
    sta PORTA          ; Set RW/E bits
    lda #(RS | E)
    sta PORTA          ; Set E bit to send instruction
    lda #RS
    sta PORTA          ; Clear E bits

    lda #"o"
    sta PORTB
    lda #RS
    sta PORTA          ; Set RW/E bits
    lda #(RS | E)
    sta PORTA          ; Set E bit to send instruction
    lda #RS
    sta PORTA          ; Clear E bits

    lda #"l"
    sta PORTB
    lda #RS
    sta PORTA          ; Set RW/E bits
    lda #(RS | E)
    sta PORTA          ; Set E bit to send instruction
    lda #RS
    sta PORTA          ; Clear E bits

    lda #"e"
    sta PORTB
    lda #RS
    sta PORTA          ; Set RW/E bits
    lda #(RS | E)
    sta PORTA          ; Set E bit to send instruction
    lda #RS
    sta PORTA          ; Clear E bits

    lda #"k"
    sta PORTB
    lda #RS
    sta PORTA          ; Set RW/E bits
    lda #(RS | E)
    sta PORTA          ; Set E bit to send instruction
    lda #RS
    sta PORTA          ; Clear E bits

loop:
    jmp loop

    .org $fffc
    .word reset
    .word $0000