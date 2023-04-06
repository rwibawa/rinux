/* Bootloader with GAS assembler */
.code16
.org 0

.text

.global _start
_start:
    cli

    /* segment setup */
    mov %cs, %ax
    mov %ax, %ds
    mov %ax, %es
    mov %ax, %fs
    mov %ax, %gs
    mov %ax, %ss

    /* place stack pointer in middle of free memory area */
    movw $0x3000, %sp

    /* save drive number to read kernel later */
    mov %dl, drive_num

    sti

    /* should print Hello Ryan! */
    movw $welcome_str, %si
    call print


_loop:
    jmp _loop


/* prints string in %ds:si */
print:
    xorb %bh, %bh
    movb $0x0E, %ah

    lodsb

    /* NULL check */
    cmpb $0, %al
    je 1f

    /* print %al to screen */
    int $0x10
    jmp print

1:  ret

welcome_str:
    .asciz "Hello Ryan!\n"

/* SAVED DRIVE NUMBER TO READ FROM */
drive_num:
    .word 0x0000

/* MBR BOOT SIGNATURE */
.fill 510-(.-_start), 1, 0
.word 0xAA55
