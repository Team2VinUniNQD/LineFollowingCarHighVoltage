
.pio/build/uno/firmware.elf:     file format elf32-avr


Disassembly of section .text:

00000000 <__vectors>:
   0:	0c 94 5c 00 	jmp	0xb8	; 0xb8 <__ctors_end>
   4:	0c 94 6e 00 	jmp	0xdc	; 0xdc <__bad_interrupt>
   8:	0c 94 6e 00 	jmp	0xdc	; 0xdc <__bad_interrupt>
   c:	0c 94 6e 00 	jmp	0xdc	; 0xdc <__bad_interrupt>
  10:	0c 94 6e 00 	jmp	0xdc	; 0xdc <__bad_interrupt>
  14:	0c 94 6e 00 	jmp	0xdc	; 0xdc <__bad_interrupt>
  18:	0c 94 6e 00 	jmp	0xdc	; 0xdc <__bad_interrupt>
  1c:	0c 94 6e 00 	jmp	0xdc	; 0xdc <__bad_interrupt>
  20:	0c 94 6e 00 	jmp	0xdc	; 0xdc <__bad_interrupt>
  24:	0c 94 6e 00 	jmp	0xdc	; 0xdc <__bad_interrupt>
  28:	0c 94 6e 00 	jmp	0xdc	; 0xdc <__bad_interrupt>
  2c:	0c 94 6e 00 	jmp	0xdc	; 0xdc <__bad_interrupt>
  30:	0c 94 6e 00 	jmp	0xdc	; 0xdc <__bad_interrupt>
  34:	0c 94 6e 00 	jmp	0xdc	; 0xdc <__bad_interrupt>
  38:	0c 94 6e 00 	jmp	0xdc	; 0xdc <__bad_interrupt>
  3c:	0c 94 6e 00 	jmp	0xdc	; 0xdc <__bad_interrupt>
  40:	0c 94 3a 01 	jmp	0x274	; 0x274 <__vector_16>
  44:	0c 94 6e 00 	jmp	0xdc	; 0xdc <__bad_interrupt>
  48:	0c 94 6e 00 	jmp	0xdc	; 0xdc <__bad_interrupt>
  4c:	0c 94 6e 00 	jmp	0xdc	; 0xdc <__bad_interrupt>
  50:	0c 94 6e 00 	jmp	0xdc	; 0xdc <__bad_interrupt>
  54:	0c 94 6e 00 	jmp	0xdc	; 0xdc <__bad_interrupt>
  58:	0c 94 6e 00 	jmp	0xdc	; 0xdc <__bad_interrupt>
  5c:	0c 94 6e 00 	jmp	0xdc	; 0xdc <__bad_interrupt>
  60:	0c 94 6e 00 	jmp	0xdc	; 0xdc <__bad_interrupt>
  64:	0c 94 6e 00 	jmp	0xdc	; 0xdc <__bad_interrupt>

00000068 <__trampolines_end>:
  68:	00 00       	nop
  6a:	00 08       	sbc	r0, r0
  6c:	00 02       	muls	r16, r16
  6e:	01 00       	.word	0x0001	; ????
  70:	00 03       	mulsu	r16, r16
  72:	04 07       	cpc	r16, r20
	...

0000007c <port_to_output_PGM>:
  7c:	00 00 00 00 25 00 28 00 2b 00                       ....%.(.+.

00000086 <port_to_mode_PGM>:
  86:	00 00 00 00 24 00 27 00 2a 00                       ....$.'.*.

00000090 <digital_pin_to_port_PGM>:
  90:	04 04 04 04 04 04 04 04 02 02 02 02 02 02 03 03     ................
  a0:	03 03 03 03                                         ....

000000a4 <digital_pin_to_bit_mask_PGM>:
  a4:	01 02 04 08 10 20 40 80 01 02 04 08 10 20 01 02     ..... @...... ..
  b4:	04 08 10 20                                         ... 

000000b8 <__ctors_end>:
  b8:	11 24       	eor	r1, r1
  ba:	1f be       	out	0x3f, r1	; 63
  bc:	cf ef       	ldi	r28, 0xFF	; 255
  be:	d8 e0       	ldi	r29, 0x08	; 8
  c0:	de bf       	out	0x3e, r29	; 62
  c2:	cd bf       	out	0x3d, r28	; 61

000000c4 <__do_clear_bss>:
  c4:	21 e0       	ldi	r18, 0x01	; 1
  c6:	a0 e0       	ldi	r26, 0x00	; 0
  c8:	b1 e0       	ldi	r27, 0x01	; 1
  ca:	01 c0       	rjmp	.+2      	; 0xce <.do_clear_bss_start>

000000cc <.do_clear_bss_loop>:
  cc:	1d 92       	st	X+, r1

000000ce <.do_clear_bss_start>:
  ce:	a9 30       	cpi	r26, 0x09	; 9
  d0:	b2 07       	cpc	r27, r18
  d2:	e1 f7       	brne	.-8      	; 0xcc <.do_clear_bss_loop>
  d4:	0e 94 84 01 	call	0x308	; 0x308 <main>
  d8:	0c 94 10 02 	jmp	0x420	; 0x420 <_exit>

000000dc <__bad_interrupt>:
  dc:	0c 94 00 00 	jmp	0	; 0x0 <__vectors>

000000e0 <pinMode.constprop.13>:
  e0:	90 e0       	ldi	r25, 0x00	; 0
  e2:	fc 01       	movw	r30, r24
  e4:	ec 55       	subi	r30, 0x5C	; 92
  e6:	ff 4f       	sbci	r31, 0xFF	; 255
  e8:	24 91       	lpm	r18, Z
  ea:	fc 01       	movw	r30, r24
  ec:	e0 57       	subi	r30, 0x70	; 112
  ee:	ff 4f       	sbci	r31, 0xFF	; 255
  f0:	84 91       	lpm	r24, Z
  f2:	88 23       	and	r24, r24
  f4:	99 f0       	breq	.+38     	; 0x11c <pinMode.constprop.13+0x3c>
  f6:	90 e0       	ldi	r25, 0x00	; 0
  f8:	88 0f       	add	r24, r24
  fa:	99 1f       	adc	r25, r25
  fc:	fc 01       	movw	r30, r24
  fe:	ea 57       	subi	r30, 0x7A	; 122
 100:	ff 4f       	sbci	r31, 0xFF	; 255
 102:	a5 91       	lpm	r26, Z+
 104:	b4 91       	lpm	r27, Z
 106:	fc 01       	movw	r30, r24
 108:	e4 58       	subi	r30, 0x84	; 132
 10a:	ff 4f       	sbci	r31, 0xFF	; 255
 10c:	85 91       	lpm	r24, Z+
 10e:	94 91       	lpm	r25, Z
 110:	8f b7       	in	r24, 0x3f	; 63
 112:	f8 94       	cli
 114:	ec 91       	ld	r30, X
 116:	e2 2b       	or	r30, r18
 118:	ec 93       	st	X, r30
 11a:	8f bf       	out	0x3f, r24	; 63
 11c:	08 95       	ret

0000011e <digitalWrite>:
 11e:	90 e0       	ldi	r25, 0x00	; 0
 120:	fc 01       	movw	r30, r24
 122:	e8 59       	subi	r30, 0x98	; 152
 124:	ff 4f       	sbci	r31, 0xFF	; 255
 126:	24 91       	lpm	r18, Z
 128:	fc 01       	movw	r30, r24
 12a:	ec 55       	subi	r30, 0x5C	; 92
 12c:	ff 4f       	sbci	r31, 0xFF	; 255
 12e:	34 91       	lpm	r19, Z
 130:	fc 01       	movw	r30, r24
 132:	e0 57       	subi	r30, 0x70	; 112
 134:	ff 4f       	sbci	r31, 0xFF	; 255
 136:	e4 91       	lpm	r30, Z
 138:	ee 23       	and	r30, r30
 13a:	09 f4       	brne	.+2      	; 0x13e <digitalWrite+0x20>
 13c:	3c c0       	rjmp	.+120    	; 0x1b6 <digitalWrite+0x98>
 13e:	22 23       	and	r18, r18
 140:	39 f1       	breq	.+78     	; 0x190 <digitalWrite+0x72>
 142:	23 30       	cpi	r18, 0x03	; 3
 144:	91 f0       	breq	.+36     	; 0x16a <digitalWrite+0x4c>
 146:	38 f4       	brcc	.+14     	; 0x156 <digitalWrite+0x38>
 148:	21 30       	cpi	r18, 0x01	; 1
 14a:	a9 f0       	breq	.+42     	; 0x176 <digitalWrite+0x58>
 14c:	22 30       	cpi	r18, 0x02	; 2
 14e:	01 f5       	brne	.+64     	; 0x190 <digitalWrite+0x72>
 150:	84 b5       	in	r24, 0x24	; 36
 152:	8f 7d       	andi	r24, 0xDF	; 223
 154:	12 c0       	rjmp	.+36     	; 0x17a <digitalWrite+0x5c>
 156:	27 30       	cpi	r18, 0x07	; 7
 158:	91 f0       	breq	.+36     	; 0x17e <digitalWrite+0x60>
 15a:	28 30       	cpi	r18, 0x08	; 8
 15c:	a1 f0       	breq	.+40     	; 0x186 <digitalWrite+0x68>
 15e:	24 30       	cpi	r18, 0x04	; 4
 160:	b9 f4       	brne	.+46     	; 0x190 <digitalWrite+0x72>
 162:	80 91 80 00 	lds	r24, 0x0080	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
 166:	8f 7d       	andi	r24, 0xDF	; 223
 168:	03 c0       	rjmp	.+6      	; 0x170 <digitalWrite+0x52>
 16a:	80 91 80 00 	lds	r24, 0x0080	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
 16e:	8f 77       	andi	r24, 0x7F	; 127
 170:	80 93 80 00 	sts	0x0080, r24	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
 174:	0d c0       	rjmp	.+26     	; 0x190 <digitalWrite+0x72>
 176:	84 b5       	in	r24, 0x24	; 36
 178:	8f 77       	andi	r24, 0x7F	; 127
 17a:	84 bd       	out	0x24, r24	; 36
 17c:	09 c0       	rjmp	.+18     	; 0x190 <digitalWrite+0x72>
 17e:	80 91 b0 00 	lds	r24, 0x00B0	; 0x8000b0 <__TEXT_REGION_LENGTH__+0x7e00b0>
 182:	8f 77       	andi	r24, 0x7F	; 127
 184:	03 c0       	rjmp	.+6      	; 0x18c <digitalWrite+0x6e>
 186:	80 91 b0 00 	lds	r24, 0x00B0	; 0x8000b0 <__TEXT_REGION_LENGTH__+0x7e00b0>
 18a:	8f 7d       	andi	r24, 0xDF	; 223
 18c:	80 93 b0 00 	sts	0x00B0, r24	; 0x8000b0 <__TEXT_REGION_LENGTH__+0x7e00b0>
 190:	f0 e0       	ldi	r31, 0x00	; 0
 192:	ee 0f       	add	r30, r30
 194:	ff 1f       	adc	r31, r31
 196:	e4 58       	subi	r30, 0x84	; 132
 198:	ff 4f       	sbci	r31, 0xFF	; 255
 19a:	a5 91       	lpm	r26, Z+
 19c:	b4 91       	lpm	r27, Z
 19e:	9f b7       	in	r25, 0x3f	; 63
 1a0:	f8 94       	cli
 1a2:	61 11       	cpse	r22, r1
 1a4:	04 c0       	rjmp	.+8      	; 0x1ae <digitalWrite+0x90>
 1a6:	8c 91       	ld	r24, X
 1a8:	30 95       	com	r19
 1aa:	38 23       	and	r19, r24
 1ac:	02 c0       	rjmp	.+4      	; 0x1b2 <digitalWrite+0x94>
 1ae:	ec 91       	ld	r30, X
 1b0:	3e 2b       	or	r19, r30
 1b2:	3c 93       	st	X, r19
 1b4:	9f bf       	out	0x3f, r25	; 63
 1b6:	08 95       	ret

000001b8 <analogWrite>:
 1b8:	1f 93       	push	r17
 1ba:	cf 93       	push	r28
 1bc:	df 93       	push	r29
 1be:	18 2f       	mov	r17, r24
 1c0:	eb 01       	movw	r28, r22
 1c2:	0e 94 70 00 	call	0xe0	; 0xe0 <pinMode.constprop.13>
 1c6:	20 97       	sbiw	r28, 0x00	; 0
 1c8:	11 f4       	brne	.+4      	; 0x1ce <analogWrite+0x16>
 1ca:	60 e0       	ldi	r22, 0x00	; 0
 1cc:	04 c0       	rjmp	.+8      	; 0x1d6 <analogWrite+0x1e>
 1ce:	cf 3f       	cpi	r28, 0xFF	; 255
 1d0:	d1 05       	cpc	r29, r1
 1d2:	39 f4       	brne	.+14     	; 0x1e2 <analogWrite+0x2a>
 1d4:	61 e0       	ldi	r22, 0x01	; 1
 1d6:	81 2f       	mov	r24, r17
 1d8:	df 91       	pop	r29
 1da:	cf 91       	pop	r28
 1dc:	1f 91       	pop	r17
 1de:	0c 94 8f 00 	jmp	0x11e	; 0x11e <digitalWrite>
 1e2:	e1 2f       	mov	r30, r17
 1e4:	f0 e0       	ldi	r31, 0x00	; 0
 1e6:	e8 59       	subi	r30, 0x98	; 152
 1e8:	ff 4f       	sbci	r31, 0xFF	; 255
 1ea:	e4 91       	lpm	r30, Z
 1ec:	e3 30       	cpi	r30, 0x03	; 3
 1ee:	f9 f0       	breq	.+62     	; 0x22e <analogWrite+0x76>
 1f0:	48 f4       	brcc	.+18     	; 0x204 <analogWrite+0x4c>
 1f2:	e1 30       	cpi	r30, 0x01	; 1
 1f4:	b9 f0       	breq	.+46     	; 0x224 <analogWrite+0x6c>
 1f6:	e2 30       	cpi	r30, 0x02	; 2
 1f8:	a1 f5       	brne	.+104    	; 0x262 <analogWrite+0xaa>
 1fa:	84 b5       	in	r24, 0x24	; 36
 1fc:	80 62       	ori	r24, 0x20	; 32
 1fe:	84 bd       	out	0x24, r24	; 36
 200:	c8 bd       	out	0x28, r28	; 40
 202:	34 c0       	rjmp	.+104    	; 0x26c <analogWrite+0xb4>
 204:	e7 30       	cpi	r30, 0x07	; 7
 206:	e9 f0       	breq	.+58     	; 0x242 <analogWrite+0x8a>
 208:	e8 30       	cpi	r30, 0x08	; 8
 20a:	19 f1       	breq	.+70     	; 0x252 <analogWrite+0x9a>
 20c:	e4 30       	cpi	r30, 0x04	; 4
 20e:	49 f5       	brne	.+82     	; 0x262 <analogWrite+0xaa>
 210:	80 91 80 00 	lds	r24, 0x0080	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
 214:	80 62       	ori	r24, 0x20	; 32
 216:	80 93 80 00 	sts	0x0080, r24	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
 21a:	d0 93 8b 00 	sts	0x008B, r29	; 0x80008b <__TEXT_REGION_LENGTH__+0x7e008b>
 21e:	c0 93 8a 00 	sts	0x008A, r28	; 0x80008a <__TEXT_REGION_LENGTH__+0x7e008a>
 222:	24 c0       	rjmp	.+72     	; 0x26c <analogWrite+0xb4>
 224:	84 b5       	in	r24, 0x24	; 36
 226:	80 68       	ori	r24, 0x80	; 128
 228:	84 bd       	out	0x24, r24	; 36
 22a:	c7 bd       	out	0x27, r28	; 39
 22c:	1f c0       	rjmp	.+62     	; 0x26c <analogWrite+0xb4>
 22e:	80 91 80 00 	lds	r24, 0x0080	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
 232:	80 68       	ori	r24, 0x80	; 128
 234:	80 93 80 00 	sts	0x0080, r24	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
 238:	d0 93 89 00 	sts	0x0089, r29	; 0x800089 <__TEXT_REGION_LENGTH__+0x7e0089>
 23c:	c0 93 88 00 	sts	0x0088, r28	; 0x800088 <__TEXT_REGION_LENGTH__+0x7e0088>
 240:	15 c0       	rjmp	.+42     	; 0x26c <analogWrite+0xb4>
 242:	80 91 b0 00 	lds	r24, 0x00B0	; 0x8000b0 <__TEXT_REGION_LENGTH__+0x7e00b0>
 246:	80 68       	ori	r24, 0x80	; 128
 248:	80 93 b0 00 	sts	0x00B0, r24	; 0x8000b0 <__TEXT_REGION_LENGTH__+0x7e00b0>
 24c:	c0 93 b3 00 	sts	0x00B3, r28	; 0x8000b3 <__TEXT_REGION_LENGTH__+0x7e00b3>
 250:	0d c0       	rjmp	.+26     	; 0x26c <analogWrite+0xb4>
 252:	80 91 b0 00 	lds	r24, 0x00B0	; 0x8000b0 <__TEXT_REGION_LENGTH__+0x7e00b0>
 256:	80 62       	ori	r24, 0x20	; 32
 258:	80 93 b0 00 	sts	0x00B0, r24	; 0x8000b0 <__TEXT_REGION_LENGTH__+0x7e00b0>
 25c:	c0 93 b4 00 	sts	0x00B4, r28	; 0x8000b4 <__TEXT_REGION_LENGTH__+0x7e00b4>
 260:	05 c0       	rjmp	.+10     	; 0x26c <analogWrite+0xb4>
 262:	c0 38       	cpi	r28, 0x80	; 128
 264:	d1 05       	cpc	r29, r1
 266:	0c f0       	brlt	.+2      	; 0x26a <analogWrite+0xb2>
 268:	b5 cf       	rjmp	.-150    	; 0x1d4 <analogWrite+0x1c>
 26a:	af cf       	rjmp	.-162    	; 0x1ca <analogWrite+0x12>
 26c:	df 91       	pop	r29
 26e:	cf 91       	pop	r28
 270:	1f 91       	pop	r17
 272:	08 95       	ret

00000274 <__vector_16>:
 274:	1f 92       	push	r1
 276:	0f 92       	push	r0
 278:	0f b6       	in	r0, 0x3f	; 63
 27a:	0f 92       	push	r0
 27c:	11 24       	eor	r1, r1
 27e:	2f 93       	push	r18
 280:	3f 93       	push	r19
 282:	8f 93       	push	r24
 284:	9f 93       	push	r25
 286:	af 93       	push	r26
 288:	bf 93       	push	r27
 28a:	80 91 05 01 	lds	r24, 0x0105	; 0x800105 <timer0_millis>
 28e:	90 91 06 01 	lds	r25, 0x0106	; 0x800106 <timer0_millis+0x1>
 292:	a0 91 07 01 	lds	r26, 0x0107	; 0x800107 <timer0_millis+0x2>
 296:	b0 91 08 01 	lds	r27, 0x0108	; 0x800108 <timer0_millis+0x3>
 29a:	30 91 04 01 	lds	r19, 0x0104	; 0x800104 <timer0_fract>
 29e:	23 e0       	ldi	r18, 0x03	; 3
 2a0:	23 0f       	add	r18, r19
 2a2:	2d 37       	cpi	r18, 0x7D	; 125
 2a4:	20 f4       	brcc	.+8      	; 0x2ae <__vector_16+0x3a>
 2a6:	01 96       	adiw	r24, 0x01	; 1
 2a8:	a1 1d       	adc	r26, r1
 2aa:	b1 1d       	adc	r27, r1
 2ac:	05 c0       	rjmp	.+10     	; 0x2b8 <__vector_16+0x44>
 2ae:	26 e8       	ldi	r18, 0x86	; 134
 2b0:	23 0f       	add	r18, r19
 2b2:	02 96       	adiw	r24, 0x02	; 2
 2b4:	a1 1d       	adc	r26, r1
 2b6:	b1 1d       	adc	r27, r1
 2b8:	20 93 04 01 	sts	0x0104, r18	; 0x800104 <timer0_fract>
 2bc:	80 93 05 01 	sts	0x0105, r24	; 0x800105 <timer0_millis>
 2c0:	90 93 06 01 	sts	0x0106, r25	; 0x800106 <timer0_millis+0x1>
 2c4:	a0 93 07 01 	sts	0x0107, r26	; 0x800107 <timer0_millis+0x2>
 2c8:	b0 93 08 01 	sts	0x0108, r27	; 0x800108 <timer0_millis+0x3>
 2cc:	80 91 00 01 	lds	r24, 0x0100	; 0x800100 <_edata>
 2d0:	90 91 01 01 	lds	r25, 0x0101	; 0x800101 <_edata+0x1>
 2d4:	a0 91 02 01 	lds	r26, 0x0102	; 0x800102 <_edata+0x2>
 2d8:	b0 91 03 01 	lds	r27, 0x0103	; 0x800103 <_edata+0x3>
 2dc:	01 96       	adiw	r24, 0x01	; 1
 2de:	a1 1d       	adc	r26, r1
 2e0:	b1 1d       	adc	r27, r1
 2e2:	80 93 00 01 	sts	0x0100, r24	; 0x800100 <_edata>
 2e6:	90 93 01 01 	sts	0x0101, r25	; 0x800101 <_edata+0x1>
 2ea:	a0 93 02 01 	sts	0x0102, r26	; 0x800102 <_edata+0x2>
 2ee:	b0 93 03 01 	sts	0x0103, r27	; 0x800103 <_edata+0x3>
 2f2:	bf 91       	pop	r27
 2f4:	af 91       	pop	r26
 2f6:	9f 91       	pop	r25
 2f8:	8f 91       	pop	r24
 2fa:	3f 91       	pop	r19
 2fc:	2f 91       	pop	r18
 2fe:	0f 90       	pop	r0
 300:	0f be       	out	0x3f, r0	; 63
 302:	0f 90       	pop	r0
 304:	1f 90       	pop	r1
 306:	18 95       	reti

00000308 <main>:
 308:	8f b7       	in	r24, 0x3f	; 63
 30a:	f8 94       	cli
 30c:	c0 90 05 01 	lds	r12, 0x0105	; 0x800105 <timer0_millis>
 310:	d0 90 06 01 	lds	r13, 0x0106	; 0x800106 <timer0_millis+0x1>
 314:	e0 90 07 01 	lds	r14, 0x0107	; 0x800107 <timer0_millis+0x2>
 318:	f0 90 08 01 	lds	r15, 0x0108	; 0x800108 <timer0_millis+0x3>
 31c:	8f bf       	out	0x3f, r24	; 63
 31e:	84 e6       	ldi	r24, 0x64	; 100
 320:	c8 1a       	sub	r12, r24
 322:	d1 08       	sbc	r13, r1
 324:	e1 08       	sbc	r14, r1
 326:	f1 08       	sbc	r15, r1
 328:	86 e0       	ldi	r24, 0x06	; 6
 32a:	0e 94 70 00 	call	0xe0	; 0xe0 <pinMode.constprop.13>
 32e:	83 e0       	ldi	r24, 0x03	; 3
 330:	0e 94 70 00 	call	0xe0	; 0xe0 <pinMode.constprop.13>
 334:	88 e0       	ldi	r24, 0x08	; 8
 336:	0e 94 70 00 	call	0xe0	; 0xe0 <pinMode.constprop.13>
 33a:	87 e0       	ldi	r24, 0x07	; 7
 33c:	0e 94 70 00 	call	0xe0	; 0xe0 <pinMode.constprop.13>
 340:	78 94       	sei
 342:	84 b5       	in	r24, 0x24	; 36
 344:	82 60       	ori	r24, 0x02	; 2
 346:	84 bd       	out	0x24, r24	; 36
 348:	84 b5       	in	r24, 0x24	; 36
 34a:	81 60       	ori	r24, 0x01	; 1
 34c:	84 bd       	out	0x24, r24	; 36
 34e:	85 b5       	in	r24, 0x25	; 37
 350:	82 60       	ori	r24, 0x02	; 2
 352:	85 bd       	out	0x25, r24	; 37
 354:	85 b5       	in	r24, 0x25	; 37
 356:	81 60       	ori	r24, 0x01	; 1
 358:	85 bd       	out	0x25, r24	; 37
 35a:	80 91 6e 00 	lds	r24, 0x006E	; 0x80006e <__TEXT_REGION_LENGTH__+0x7e006e>
 35e:	81 60       	ori	r24, 0x01	; 1
 360:	80 93 6e 00 	sts	0x006E, r24	; 0x80006e <__TEXT_REGION_LENGTH__+0x7e006e>
 364:	10 92 81 00 	sts	0x0081, r1	; 0x800081 <__TEXT_REGION_LENGTH__+0x7e0081>
 368:	80 91 81 00 	lds	r24, 0x0081	; 0x800081 <__TEXT_REGION_LENGTH__+0x7e0081>
 36c:	82 60       	ori	r24, 0x02	; 2
 36e:	80 93 81 00 	sts	0x0081, r24	; 0x800081 <__TEXT_REGION_LENGTH__+0x7e0081>
 372:	80 91 81 00 	lds	r24, 0x0081	; 0x800081 <__TEXT_REGION_LENGTH__+0x7e0081>
 376:	81 60       	ori	r24, 0x01	; 1
 378:	80 93 81 00 	sts	0x0081, r24	; 0x800081 <__TEXT_REGION_LENGTH__+0x7e0081>
 37c:	80 91 80 00 	lds	r24, 0x0080	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
 380:	81 60       	ori	r24, 0x01	; 1
 382:	80 93 80 00 	sts	0x0080, r24	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
 386:	80 91 b1 00 	lds	r24, 0x00B1	; 0x8000b1 <__TEXT_REGION_LENGTH__+0x7e00b1>
 38a:	84 60       	ori	r24, 0x04	; 4
 38c:	80 93 b1 00 	sts	0x00B1, r24	; 0x8000b1 <__TEXT_REGION_LENGTH__+0x7e00b1>
 390:	80 91 b0 00 	lds	r24, 0x00B0	; 0x8000b0 <__TEXT_REGION_LENGTH__+0x7e00b0>
 394:	81 60       	ori	r24, 0x01	; 1
 396:	80 93 b0 00 	sts	0x00B0, r24	; 0x8000b0 <__TEXT_REGION_LENGTH__+0x7e00b0>
 39a:	80 91 7a 00 	lds	r24, 0x007A	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
 39e:	84 60       	ori	r24, 0x04	; 4
 3a0:	80 93 7a 00 	sts	0x007A, r24	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
 3a4:	80 91 7a 00 	lds	r24, 0x007A	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
 3a8:	82 60       	ori	r24, 0x02	; 2
 3aa:	80 93 7a 00 	sts	0x007A, r24	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
 3ae:	80 91 7a 00 	lds	r24, 0x007A	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
 3b2:	81 60       	ori	r24, 0x01	; 1
 3b4:	80 93 7a 00 	sts	0x007A, r24	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
 3b8:	80 91 7a 00 	lds	r24, 0x007A	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
 3bc:	80 68       	ori	r24, 0x80	; 128
 3be:	80 93 7a 00 	sts	0x007A, r24	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
 3c2:	10 92 c1 00 	sts	0x00C1, r1	; 0x8000c1 <__TEXT_REGION_LENGTH__+0x7e00c1>
 3c6:	8f b7       	in	r24, 0x3f	; 63
 3c8:	f8 94       	cli
 3ca:	80 90 05 01 	lds	r8, 0x0105	; 0x800105 <timer0_millis>
 3ce:	90 90 06 01 	lds	r9, 0x0106	; 0x800106 <timer0_millis+0x1>
 3d2:	a0 90 07 01 	lds	r10, 0x0107	; 0x800107 <timer0_millis+0x2>
 3d6:	b0 90 08 01 	lds	r11, 0x0108	; 0x800108 <timer0_millis+0x3>
 3da:	8f bf       	out	0x3f, r24	; 63
 3dc:	d5 01       	movw	r26, r10
 3de:	c4 01       	movw	r24, r8
 3e0:	8c 19       	sub	r24, r12
 3e2:	9d 09       	sbc	r25, r13
 3e4:	ae 09       	sbc	r26, r14
 3e6:	bf 09       	sbc	r27, r15
 3e8:	84 36       	cpi	r24, 0x64	; 100
 3ea:	91 05       	cpc	r25, r1
 3ec:	a1 05       	cpc	r26, r1
 3ee:	b1 05       	cpc	r27, r1
 3f0:	10 f4       	brcc	.+4      	; 0x3f6 <main+0xee>
 3f2:	46 01       	movw	r8, r12
 3f4:	57 01       	movw	r10, r14
 3f6:	60 e0       	ldi	r22, 0x00	; 0
 3f8:	87 e0       	ldi	r24, 0x07	; 7
 3fa:	0e 94 8f 00 	call	0x11e	; 0x11e <digitalWrite>
 3fe:	60 e0       	ldi	r22, 0x00	; 0
 400:	88 e0       	ldi	r24, 0x08	; 8
 402:	0e 94 8f 00 	call	0x11e	; 0x11e <digitalWrite>
 406:	64 e6       	ldi	r22, 0x64	; 100
 408:	70 e0       	ldi	r23, 0x00	; 0
 40a:	83 e0       	ldi	r24, 0x03	; 3
 40c:	0e 94 dc 00 	call	0x1b8	; 0x1b8 <analogWrite>
 410:	64 e6       	ldi	r22, 0x64	; 100
 412:	70 e0       	ldi	r23, 0x00	; 0
 414:	86 e0       	ldi	r24, 0x06	; 6
 416:	0e 94 dc 00 	call	0x1b8	; 0x1b8 <analogWrite>
 41a:	75 01       	movw	r14, r10
 41c:	64 01       	movw	r12, r8
 41e:	d3 cf       	rjmp	.-90     	; 0x3c6 <main+0xbe>

00000420 <_exit>:
 420:	f8 94       	cli

00000422 <__stop_program>:
 422:	ff cf       	rjmp	.-2      	; 0x422 <__stop_program>
