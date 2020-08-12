; #########################################################################
;
;   game.asm - Assembly file for EECS205 Assignment 4/5
;
;
; #########################################################################

      .586
      .MODEL FLAT,STDCALL
      .STACK 4096
      option casemap :none  ; case sensitive


include C:\masm32\include\windows.inc
include C:\masm32\include\winmm.inc

include C:\masm32\include\masm32.inc

includelib C:\masm32\lib\winmm.lib

includelib C:\masm32\lib\masm32.lib

include stars.inc
include lines.inc
include trig.inc
include blit.inc
include game.inc

;; Has keycodes
include keys.inc


.DATA

schoolboy BYTE "sq.wav",0


pomeranian1 EECS205BITMAP <44, 37, 255,, offset pomeranian1 + sizeof pomeranian1>

BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh

BYTE 0ffh,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh

BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh

BYTE 0ffh,0ffh,000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h

BYTE 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh

BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0adh

BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0adh,000h,0ffh,0ffh,0ffh

BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh

BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0adh,0adh,0adh,0adh,0f9h,0f9h,0f9h

BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,000h,0adh,0adh,0adh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh

BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh

BYTE 0ffh,0ffh,0ffh,0ffh,000h,0adh,0adh,000h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h

BYTE 0f9h,0f9h,0f9h,0adh,0adh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh

BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h

BYTE 0f9h,0f9h,000h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h

BYTE 0adh,0adh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh

BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f9h,0f9h,0f5h,0f5h,0f5h

BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,0f9h,000h

BYTE 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh

BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h

BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,000h,000h,0ffh,000h

BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh

BYTE 0ffh,000h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h

BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,000h,000h,0f9h,0f9h,0f9h,0f9h,0f9h

BYTE 0f9h,0f9h,0f9h,0f9h,0f5h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h

BYTE 0f5h,0adh,0adh,0adh,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0adh,0adh,0adh,0adh,0f5h,0f5h

BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f5h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h

BYTE 0f5h,0f5h,0f9h,0f9h,000h,0ffh,0ffh,0ffh,000h,0f9h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h

BYTE 0adh,0adh,0f5h,0f5h,0adh,0adh,0f5h,0f9h,0f9h,0f9h,0adh,0f5h,0f5h,0f5h,0f5h,0f5h

BYTE 0f5h,0f5h,0f9h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h

BYTE 0f5h,000h,0ffh,0ffh,000h,0f9h,0f5h,0f5h,0f5h,0ffh,000h,000h,0adh,0f5h,0adh,0adh

BYTE 0f5h,0adh,0ffh,000h,000h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,000h,000h

BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,000h,0ffh

BYTE 000h,000h,000h,0f9h,0f9h,000h,000h,000h,0f9h,0adh,0adh,0adh,0adh,0f5h,000h,000h

BYTE 000h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h

BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,000h,0ffh,0ffh,000h,0adh,0adh

BYTE 0f9h,000h,000h,000h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,000h,000h,000h,0f9h,0f9h,0f5h

BYTE 0f9h,0f9h,0f5h,0f5h,0f5h,0f9h,0f5h,0f5h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h

BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,000h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h

BYTE 0f9h,0f9h,024h,024h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h

BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h

BYTE 0f5h,0f5h,000h,0ffh,0ffh,000h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,024h,024h

BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h

BYTE 0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f5h,0f5h,0f5h,000h,000h,0f5h,0f5h,0f5h,000h,0ffh

BYTE 0ffh,000h,0f9h,0f9h,0f9h,0f9h,0f9h,000h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,000h

BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h

BYTE 0f5h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,000h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,000h,0f5h

BYTE 0f9h,0f9h,0f9h,0f9h,000h,000h,0f3h,0f3h,000h,000h,000h,0f9h,0f9h,0f9h,0f9h,0f9h

BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h

BYTE 0f5h,0f5h,0f5h,000h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f9h,0f9h,0f9h

BYTE 0f9h,0f9h,000h,000h,000h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,000h

BYTE 000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,000h

BYTE 0f5h,0f5h,0f9h,000h,0ffh,0ffh,000h,0f9h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h

BYTE 0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,0f9h,0f5h,0f5h,0f5h

BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,000h,000h,0f5h,0f5h,0f5h,0f9h,000h

BYTE 0ffh,0ffh,000h,000h,0f9h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h

BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h

BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,0f5h,0f5h,0f9h,000h,0ffh,0ffh,0ffh,0ffh,000h

BYTE 000h,0f9h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h

BYTE 0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h

BYTE 0f5h,0f5h,000h,000h,0f5h,0f9h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f9h,0f9h,0f9h

BYTE 0f5h,0f5h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h

BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h

BYTE 0f5h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,0f9h,0f9h,0f9h,0f9h

BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h

BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,000h,000h,0ffh,0ffh

BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,000h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h

BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h

BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh

BYTE 0ffh,0ffh,000h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h

BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h

BYTE 0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h

BYTE 0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h

BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,0ffh

BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,0f5h,0f5h

BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h

BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh

BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h

BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h

BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh

BYTE 0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h

BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,000h,0f5h,0f5h,0f5h,0f5h

BYTE 0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh

BYTE 000h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h

BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,0ffh,000h,0f5h,0f5h,0f5h,0f5h,000h,0ffh,0ffh

BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h

BYTE 0f5h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h

BYTE 0f5h,0f5h,000h,0ffh,000h,000h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh

BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,000h,0f5h,0f5h

BYTE 0f5h,0f5h,0f5h,000h,000h,000h,0ffh,0ffh,0ffh,000h,000h,0f5h,0f5h,000h,000h,0ffh

BYTE 0ffh,000h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh

BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,000h,0ffh,000h,0f5h,0f5h,0f5h,000h,0ffh

BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,000h,0f5h,0f5h

BYTE 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh

BYTE 0ffh,000h,0adh,0f5h,000h,0ffh,000h,0f5h,0adh,0adh,000h,0ffh,0ffh,0ffh,0ffh,0ffh

BYTE 0ffh,0ffh,000h,0adh,0adh,000h,0ffh,0ffh,0ffh,000h,0adh,0adh,000h,0ffh,0ffh,0ffh

BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0adh,0adh,0adh

BYTE 000h,0ffh,0adh,0adh,0adh,0adh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0adh,0adh

BYTE 0adh,000h,0ffh,0ffh,000h,0adh,0adh,0adh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh

BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h,0ffh,0ffh,000h,000h

BYTE 000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,0ffh,0ffh,0ffh

BYTE 000h,000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh


pomeranian2 EECS205BITMAP <44, 37, 255,, offset pomeranian2 + sizeof pomeranian2>
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h
	BYTE 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0adh
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0adh,000h,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0adh,0adh,0adh,0adh,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,000h,0adh,0adh,0adh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,000h,0adh,0adh,000h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,0f9h,0adh,0adh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h
	BYTE 0f9h,0f9h,000h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h
	BYTE 0adh,0adh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f9h,0f9h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,000h,0f9h,000h
	BYTE 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,000h,000h,0ffh,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,000h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,000h,000h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f9h,0f5h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h
	BYTE 0f5h,0adh,0adh,0adh,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0adh,0adh,0adh,0adh,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f5h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f9h,0f9h,000h,0ffh,0ffh,0ffh,000h,0f9h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h
	BYTE 0adh,0adh,0f5h,0f5h,0adh,0adh,0f5h,0f9h,0f9h,0f9h,0adh,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f9h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,000h,0ffh,0ffh,000h,0f9h,0f5h,0f5h,0f5h,0ffh,000h,000h,0adh,0f5h,0adh,0adh
	BYTE 0f5h,0adh,0ffh,000h,000h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,000h,000h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,000h,0ffh
	BYTE 000h,000h,000h,0f9h,0f9h,000h,000h,000h,0f9h,0adh,0adh,0adh,0adh,0f5h,000h,000h
	BYTE 000h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,000h,0ffh,0ffh,000h,0adh,0adh
	BYTE 0f9h,000h,000h,000h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,000h,000h,000h,0f9h,0f9h,0f5h
	BYTE 0f9h,0f9h,0f5h,0f5h,0f5h,0f9h,0f5h,0f5h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,000h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,024h,024h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,000h,0ffh,0ffh,000h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,024h,024h
	BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f5h,0f5h,0f5h,000h,000h,0f5h,0f5h,0f5h,000h,0ffh
	BYTE 0ffh,000h,0f9h,0f9h,0f9h,0f9h,0f9h,000h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,000h
	BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,000h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,000h,0f5h
	BYTE 0f9h,0f9h,0f9h,0f9h,000h,000h,0f3h,0f3h,000h,000h,000h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h
	BYTE 0f5h,0f5h,0f5h,000h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,000h,000h,000h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,000h
	BYTE 000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,000h
	BYTE 0f5h,0f5h,0f9h,000h,0ffh,0ffh,000h,0f9h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,0f9h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,000h,000h,0f5h,0f5h,0f5h,0f9h,000h
	BYTE 0ffh,0ffh,000h,000h,0f9h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,0f5h,0f5h,0f9h,000h,0ffh,0ffh,0ffh,0ffh,000h
	BYTE 000h,0f9h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,000h,000h,0f5h,0f9h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f9h,0f9h,0f9h
	BYTE 0f5h,0f5h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h
	BYTE 0f5h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,000h,000h,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,000h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,000h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h
	BYTE 0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,0f5h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,000h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,0ffh,000h,0f5h,0f5h,0f5h,0f5h,000h,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,000h,0ffh,000h,000h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,000h,000h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,000h,000h,000h,0ffh,0ffh,000h,000h,0f5h,0f5h,000h,000h,0ffh,0ffh
	BYTE 0ffh,000h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,000h,0adh,0f5h,000h,000h,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,000h
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h
	BYTE 0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0adh
	BYTE 0adh,0adh,000h,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0adh,0adh,000h,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,000h,0adh,0adh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0adh,0adh,000h,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0adh,0adh,0adh,0adh,000h,0ffh,0ffh,0ffh,0ffh,000h,0adh,0adh,0adh
	BYTE 000h,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0adh,0adh,0adh,000h,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h
	BYTE 000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh


pomeranian3 EECS205BITMAP <44, 37, 255,, offset pomeranian3 + sizeof pomeranian3>
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h 
BYTE 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0adh 
BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0adh,000h,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0adh,0adh,0adh,0adh,0f9h,0f9h,0f9h 
BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,000h,0adh,0adh,0adh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,000h,0adh,0adh,000h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h 
BYTE 0f9h,0f9h,0f9h,0adh,0adh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h 
BYTE 0f9h,0f9h,000h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h 
BYTE 0adh,0adh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f9h,0f9h,0f5h,0f5h,0f5h 
BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,000h,0f9h,000h 
BYTE 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h 
BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,000h,000h,0ffh,000h 
BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,000h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h 
BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,000h,000h,0f9h,0f9h,0f9h,0f9h,0f9h 
BYTE 0f9h,0f9h,0f9h,0f9h,0f5h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h 
BYTE 0f5h,0adh,0adh,0adh,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0adh,0adh,0adh,0adh,0f5h,0f5h
BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f5h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h 
BYTE 0f5h,0f5h,0f9h,0f9h,000h,0ffh,0ffh,0ffh,000h,0f9h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h 
BYTE 0adh,0adh,0f5h,0f5h,0adh,0adh,0f5h,0f9h,0f9h,0f9h,0adh,0f5h,0f5h,0f5h,0f5h,0f5h 
BYTE 0f5h,0f5h,0f9h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h 
BYTE 0f5h,000h,0ffh,0ffh,000h,0f9h,0f5h,0f5h,0f5h,0ffh,000h,000h,0adh,0f5h,0adh,0adh 
BYTE 0f5h,0adh,0ffh,000h,000h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,000h,000h 
BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,000h,0ffh 
BYTE 000h,000h,000h,0f9h,0f9h,000h,000h,000h,0f9h,0adh,0adh,0adh,0adh,0f5h,000h,000h 
BYTE 000h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h 
BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,000h,0ffh,0ffh,000h,0adh,0adh 
BYTE 0f9h,000h,000h,000h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,000h,000h,000h,0f9h,0f9h,0f5h 
BYTE 0f9h,0f9h,0f5h,0f5h,0f5h,0f9h,0f5h,0f5h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h 
BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,000h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h 
BYTE 0f9h,0f9h,024h,024h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h 
BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h 
BYTE 0f5h,0f5h,000h,0ffh,0ffh,000h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,024h,024h 
BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h 
BYTE 0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f5h,0f5h,0f5h,000h,000h,0f5h,0f5h,0f5h,000h,0ffh 
BYTE 0ffh,000h,0f9h,0f9h,0f9h,0f9h,0f9h,000h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,000h 
BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h 
BYTE 0f5h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,000h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,000h,0f5h 
BYTE 0f9h,0f9h,0f9h,0f9h,000h,000h,0f3h,0f3h,000h,000h,000h,0f9h,0f9h,0f9h,0f9h,0f9h 
BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h 
BYTE 0f5h,0f5h,0f5h,000h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f9h,0f9h,0f9h 
BYTE 0f9h,0f9h,000h,000h,000h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,000h 
BYTE 000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,000h 
BYTE 0f5h,0f5h,0f9h,000h,0ffh,0ffh,000h,0f9h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h 
BYTE 0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,0f9h,0f5h,0f5h,0f5h 
BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,000h,000h,0f5h,0f5h,0f5h,0f9h,000h 
BYTE 0ffh,0ffh,000h,000h,0f9h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h 
BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h 
BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,0f5h,0f5h,0f9h,000h,0ffh,0ffh,0ffh,0ffh,000h 
BYTE 000h,0f9h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h 
BYTE 0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h 
BYTE 0f5h,0f5h,000h,000h,0f5h,0f9h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f9h,0f9h,0f9h 
BYTE 0f5h,0f5h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h 
BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h 
BYTE 0f5h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,0f9h,0f9h,0f9h,0f9h 
BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h 
BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,000h,000h,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,000h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h 
BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h 
BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,000h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h 
BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h 
BYTE 0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h 
BYTE 0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h 
BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,0f5h,0f9h 
BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h 
BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h 
BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h 
BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h 
BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,000h,0f5h,0f5h,0f5h,0f5h 
BYTE 0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h 
BYTE 0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h 
BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,0ffh,000h,0f5h,0f5h,0f5h,0f5h,000h,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,0f5h 
BYTE 0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h 
BYTE 0f5h,0f5h,000h,0ffh,000h,000h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,0f5h,000h,000h,000h,000h 
BYTE 0f5h,0f5h,0f5h,000h,000h,000h,0ffh,0ffh,000h,000h,0f5h,0f5h,000h,000h,0ffh,0ffh 
BYTE 0ffh,000h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,000h,0f5h,0f5h,0f5h,000h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,000h,0f5h 
BYTE 0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 000h,0f5h,0adh,0adh,000h,0ffh,0ffh,000h,0adh,0adh,000h,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,000h,0adh,0adh,000h,0ffh,0ffh,0ffh,0ffh,000h,0adh,0adh,000h,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0adh,0adh,0adh,0adh 
BYTE 000h,0ffh,000h,0adh,0adh,0adh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0adh,0adh 
BYTE 0adh,000h,0ffh,0ffh,0ffh,000h,0adh,0adh,0adh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,0ffh,000h,000h 
BYTE 000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 

pomeranian4 EECS205BITMAP <44, 37, 255,, offset pomeranian4 + sizeof pomeranian4>
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h
	BYTE 000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h
	BYTE 0adh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0adh,000h,000h,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0adh,0adh,0adh,000h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0adh,0adh,0adh,0adh,000h,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0adh,0adh,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f9h,000h,0adh,0adh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,000h,0adh,0adh,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f9h,000h,0f9h,0f9h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0f9h,000h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h
	BYTE 0f9h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,0ffh,000h,000h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,000h,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,000h,000h,000h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f9h,000h,000h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,000h,0ffh,0ffh,0ffh,0ffh,000h
	BYTE 0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f5h,0f9h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0adh,0adh,0adh,0adh,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0adh,0adh,0adh,0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0adh,0f9h,0f9h,0f9h,0f5h,0adh,0adh,0f5h,0f5h,0adh,0adh,0f9h,0f9h,0f9h,0f5h
	BYTE 0f5h,0f5h,0f9h,000h,0ffh,000h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,000h,000h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,000h
	BYTE 000h,0ffh,0adh,0f5h,0adh,0adh,0f5h,0adh,000h,000h,0ffh,0f5h,0f5h,0f5h,0f9h,000h
	BYTE 0ffh,000h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,000h,000h,000h,0f5h,0adh
	BYTE 0adh,0adh,0adh,0f9h,000h,000h,000h,0f9h,0f9h,000h,000h,000h,0ffh,000h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f5h,0f5h,0f9h,0f5h
	BYTE 0f5h,0f5h,0f9h,0f9h,0f5h,0f9h,0f9h,000h,000h,000h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 000h,000h,000h,0f9h,0adh,0adh,000h,0ffh,0ffh,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,024h,024h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,000h,0ffh,0ffh,000h,0f5h,0f5h,0f5h,000h,000h,0f5h,0f5h,0f5h,0f9h,0f9h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f9h,024h,024h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,000h,0ffh
	BYTE 0ffh,000h,0f5h,0f5h,000h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,000h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f9h,000h,0f9h,0f9h,0f9h,0f9h,0f9h,000h,0ffh,0ffh,000h,0f5h,0f5h
	BYTE 000h,0f5h,0f5h,0f5h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,000h,000h,000h,0f3h,0f3h,000h,000h
	BYTE 0f9h,0f9h,0f9h,0f9h,0f5h,000h,0ffh,0ffh,000h,0f9h,0f5h,0f5h,000h,000h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,000h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,000h,000h,000h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h
	BYTE 0f5h,000h,0ffh,0ffh,000h,0f9h,0f5h,0f5h,0f5h,000h,000h,000h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f9h,000h,0ffh,0ffh
	BYTE 0ffh,000h,0f9h,0f5h,0f5h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f9h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f9h,000h,000h,0ffh,0ffh,0ffh,000h,0f9h,0f5h
	BYTE 000h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f5h,0f5h,0f9h,000h,000h,0ffh,0ffh,0ffh,0ffh,000h,000h,0f5h,000h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f5h,0f5h,0f9h,0f9h,0f9h,000h
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,000h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,0f9h,000h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h
	BYTE 0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,000h,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f5h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h
	BYTE 0f5h,0f5h,0f5h,000h,0ffh,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,000h,000h
	BYTE 0ffh,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f9h,0f5h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,000h,000h,0f5h
	BYTE 0f5h,000h,000h,0ffh,0ffh,0ffh,000h,000h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,0f5h
	BYTE 0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,000h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,000h,0f5h,0f5h,000h,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,000h,0ffh,000h,0f5h,0f5h,000h,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h
	BYTE 0adh,0adh,000h,0ffh,0ffh,0ffh,000h,0adh,0adh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,000h,0adh,0adh,0f5h,000h,0ffh,000h,0f5h,0adh,000h,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0adh,0adh,0adh,000h
	BYTE 0ffh,0ffh,000h,0adh,0adh,0adh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0adh,0adh
	BYTE 0adh,0adh,0ffh,000h,0adh,0adh,0adh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,0ffh,0ffh,0ffh,000h
	BYTE 000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,0ffh,0ffh
	BYTE 000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh

pomeranian5 EECS205BITMAP <44, 37, 255,, offset pomeranian5 + sizeof pomeranian5>
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h
	BYTE 000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h
	BYTE 0adh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0adh,000h,000h,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0adh,0adh,0adh,000h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0adh,0adh,0adh,0adh,000h,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0adh,0adh,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f9h,000h,0adh,0adh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,000h,0adh,0adh,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f9h,000h,0f9h,0f9h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0f9h,000h,0f9h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h
	BYTE 0f9h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,0ffh,000h,000h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,000h,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,000h,000h,000h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f9h,000h,000h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,000h,0ffh,0ffh,0ffh,0ffh,000h
	BYTE 0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f5h,0f9h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0adh,0adh,0adh,0adh,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0adh,0adh,0adh,0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0adh,0f9h,0f9h,0f9h,0f5h,0adh,0adh,0f5h,0f5h,0adh,0adh,0f9h,0f9h,0f9h,0f5h
	BYTE 0f5h,0f5h,0f9h,000h,0ffh,000h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,000h,000h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,000h
	BYTE 000h,0ffh,0adh,0f5h,0adh,0adh,0f5h,0adh,000h,000h,0ffh,0f5h,0f5h,0f5h,0f9h,000h
	BYTE 0ffh,000h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,000h,000h,000h,0f5h,0adh
	BYTE 0adh,0adh,0adh,0f9h,000h,000h,000h,0f9h,0f9h,000h,000h,000h,0ffh,000h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f5h,0f5h,0f9h,0f5h
	BYTE 0f5h,0f5h,0f9h,0f9h,0f5h,0f9h,0f9h,000h,000h,000h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 000h,000h,000h,0f9h,0adh,0adh,000h,0ffh,0ffh,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,024h,024h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,000h,0ffh,0ffh,000h,0f5h,0f5h,0f5h,000h,000h,0f5h,0f5h,0f5h,0f9h,0f9h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f9h,024h,024h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,000h,0ffh
	BYTE 0ffh,000h,0f5h,0f5h,000h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,000h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f9h,000h,0f9h,0f9h,0f9h,0f9h,0f9h,000h,0ffh,0ffh,000h,0f5h,0f5h
	BYTE 000h,0f5h,0f5h,0f5h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,000h,000h,000h,0f3h,0f3h,000h,000h
	BYTE 0f9h,0f9h,0f9h,0f9h,0f5h,000h,0ffh,0ffh,000h,0f9h,0f5h,0f5h,000h,000h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,000h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,000h,000h,000h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h
	BYTE 0f5h,000h,0ffh,0ffh,000h,0f9h,0f5h,0f5h,0f5h,000h,000h,000h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f9h,000h,0ffh,0ffh
	BYTE 0ffh,000h,0f9h,0f5h,0f5h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f9h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f9h,000h,000h,0ffh,0ffh,0ffh,000h,0f9h,0f5h
	BYTE 000h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f5h,0f5h,0f9h,000h,000h,0ffh,0ffh,0ffh,0ffh,000h,000h,0f5h,000h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f5h,0f5h,0f9h,0f9h,0f9h,000h
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,000h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,0f9h,000h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h
	BYTE 0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,000h,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h
	BYTE 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h
	BYTE 0f5h,0f5h,0f5h,000h,0ffh,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,000h,000h
	BYTE 0ffh,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,000h,000h
	BYTE 0f5h,0f5h,000h,000h,0ffh,0ffh,000h,000h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,000h
	BYTE 0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,000h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,000h,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,000h,000h,0f5h,0adh
	BYTE 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0adh,0adh
	BYTE 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0adh,0adh,000h,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 000h,0adh,0adh,0f5h,000h,0ffh,0ffh,0ffh,0ffh,000h,0adh,0adh,0adh,000h,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0adh,0adh,0adh,000h,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,000h,0adh,0adh,0adh,000h,0ffh,0ffh,0ffh,0ffh,000h,0adh,0adh,0adh
	BYTE 0adh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh


pomeranian6 EECS205BITMAP <44, 37, 255,, offset pomeranian6 + sizeof pomeranian6>
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h
	BYTE 000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h
	BYTE 0adh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0adh,000h,000h,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0adh,0adh,0adh,000h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0adh,0adh,0adh,0adh,000h,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0adh,0adh,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f9h,000h,0adh,0adh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,000h,0adh,0adh,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f9h,000h,0f9h,0f9h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0f9h,000h,0f9h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h
	BYTE 0f9h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,0ffh,000h,000h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,000h,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,000h,000h,000h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f9h,000h,000h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,000h,0ffh,0ffh,0ffh,0ffh,000h
	BYTE 0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f5h,0f9h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0adh,0adh,0adh,0adh,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0adh,0adh,0adh,0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0adh,0f9h,0f9h,0f9h,0f5h,0adh,0adh,0f5h,0f5h,0adh,0adh,0f9h,0f9h,0f9h,0f5h
	BYTE 0f5h,0f5h,0f9h,000h,0ffh,000h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,000h,000h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,000h
	BYTE 000h,0ffh,0adh,0f5h,0adh,0adh,0f5h,0adh,000h,000h,0ffh,0f5h,0f5h,0f5h,0f9h,000h
	BYTE 0ffh,000h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,000h,000h,000h,0f5h,0adh
	BYTE 0adh,0adh,0adh,0f9h,000h,000h,000h,0f9h,0f9h,000h,000h,000h,0ffh,000h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f5h,0f5h,0f9h,0f5h
	BYTE 0f5h,0f5h,0f9h,0f9h,0f5h,0f9h,0f9h,000h,000h,000h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 000h,000h,000h,0f9h,0adh,0adh,000h,0ffh,0ffh,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,024h,024h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,000h,0ffh,0ffh,000h,0f5h,0f5h,0f5h,000h,000h,0f5h,0f5h,0f5h,0f9h,0f9h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f9h,024h,024h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,000h,0ffh
	BYTE 0ffh,000h,0f5h,0f5h,000h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,000h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f9h,000h,0f9h,0f9h,0f9h,0f9h,0f9h,000h,0ffh,0ffh,000h,0f5h,0f5h
	BYTE 000h,0f5h,0f5h,0f5h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,000h,000h,000h,0f3h,0f3h,000h,000h
	BYTE 0f9h,0f9h,0f9h,0f9h,0f5h,000h,0ffh,0ffh,000h,0f9h,0f5h,0f5h,000h,000h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,000h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,000h,000h,000h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h
	BYTE 0f5h,000h,0ffh,0ffh,000h,0f9h,0f5h,0f5h,0f5h,000h,000h,000h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f9h,000h,0ffh,0ffh
	BYTE 0ffh,000h,0f9h,0f5h,0f5h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f9h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f9h,000h,000h,0ffh,0ffh,0ffh,000h,0f9h,0f5h
	BYTE 000h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f5h,0f5h,0f9h,000h,000h,0ffh,0ffh,0ffh,0ffh,000h,000h,0f5h,000h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f5h,0f5h,0f9h,0f9h,0f9h,000h
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,000h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f9h,0f9h,000h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h
	BYTE 0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,000h,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h
	BYTE 0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f9h
	BYTE 0f9h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,000h,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h
	BYTE 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h
	BYTE 0f5h,0f5h,0f5h,000h,0ffh,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f5h,0f5h,0f5h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,000h,000h
	BYTE 0ffh,000h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h
	BYTE 0f5h,0f5h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,000h,000h
	BYTE 0f5h,0f5h,000h,000h,0ffh,0ffh,000h,000h,000h,0f5h,0f5h,0f5h,000h,000h,000h,000h
	BYTE 0f5h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,000h,0f5h,0f5h,000h,0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,000h,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,000h,0f5h,0f5h,0f5h,000h,0ffh,0ffh,000h,0f5h,0f5h,0f5h,000h
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0adh
	BYTE 0adh,000h,0ffh,0ffh,0ffh,0ffh,000h,0adh,0adh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,000h,0adh,0adh,000h,0ffh,0ffh,000h,0adh,0adh,0f5h,000h,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0adh,0adh,0adh,000h,0ffh
	BYTE 0ffh,0ffh,000h,0adh,0adh,0adh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0adh,0adh
	BYTE 0adh,000h,0ffh,000h,0adh,0adh,0adh,0adh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,000h
	BYTE 000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h,0ffh,000h
	BYTE 000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh


platform EECS205BITMAP <64, 5, 255,, offset platform + sizeof platform>
BYTE 017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h
BYTE 017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h
BYTE 017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h
BYTE 017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h
BYTE 017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h
BYTE 017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h
BYTE 017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h
BYTE 017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h
BYTE 017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h
BYTE 017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h
BYTE 017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h
BYTE 017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h
BYTE 017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h
BYTE 017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h
BYTE 017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h
BYTE 017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h
BYTE 017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h
BYTE 017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h
BYTE 017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h
BYTE 017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h,017h


ladder EECS205BITMAP <60, 128, 255,, offset ladder + sizeof ladder> 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,069h,069h,069h,069h,048h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,048h,069h 
BYTE 069h,069h,048h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,069h,048h,069h,048h,069h,048h,069h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,048h,069h,048h,069h,069h,069h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,069h,069h,069h,048h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,069h,069h,069h,069h,069h,069h,048h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,069h,048h 
BYTE 069h,048h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,048h,069h,048h,069h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,069h,069h,048h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,0ffh,0ffh,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,048h,069h,048h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,0ffh,0ffh,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,048h,069h,069h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,0ffh,0ffh,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h 
BYTE 069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,048h,069h,048h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,0ffh 
BYTE 0ffh,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,048h,069h,048h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,0ffh,0ffh,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,048h,069h,069h,069h,048h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,0ffh,0ffh,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,048h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,0ffh,0ffh,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,048h 
BYTE 069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,048h,069h,048h,069h,048h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,069h,069h 
BYTE 048h,069h,048h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,069h,048h,069h,048h,069h,048h,069h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,048h,069h,048h,069h,048h,069h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,069h,069h,069h,069h,069h,048h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,069h,069h,069h,069h,048h,069h,048h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,048h,069h,048h 
BYTE 069h,048h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,069h,069h,048h,069h,048h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,048h,069h,048h,069h,048h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,048h,069h 
BYTE 048h,069h,048h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,069h,069h,069h,048h,069h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,069h,048h,069h,048h,069h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,069h,048h,069h,048h,069h,048h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,069h,069h,048h,069h,048h,069h,048h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,069h,048h 
BYTE 069h,069h,069h,048h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,069h,069h,069h,069h,048h,069h,048h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,048h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h 
BYTE 048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,048h,069h,048h,069h,048h,069h,048h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,048h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,048h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,048h,069h,048h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,069h 
BYTE 069h,048h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,048h,069h,048h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,048h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,048h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,048h,069h,048h,069h,048h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,048h,069h,069h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,048h 
BYTE 069h,048h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,048h,069h,048h,069h,048h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,048h,069h,048h,069h,048h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,069h,069h 
BYTE 048h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,069h,048h,069h,069h,069h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,048h,069h,048h,069h,048h,069h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,069h,048h,069h,069h,069h,048h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,069h,069h,069h,069h,048h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,048h,069h,048h,069h,048h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,048h,069h,069h,069h,048h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,069h,069h 
BYTE 048h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,069h,069h,069h,048h,069h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,048h,069h,048h,069h,048h,069h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,069h,048h,069h,048h,069h,048h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,069h,069h,069h,069h,048h,069h,048h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,069h,048h 
BYTE 069h,048h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,048h,069h,048h,069h,048h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,069h,069h,048h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 048h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,0ffh,0ffh,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,069h,069h,048h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,0ffh,0ffh,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,048h,069h,069h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,048h,069h,048h,069h,048h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,0ffh,0ffh,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,048h,069h,069h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,0ffh 
BYTE 0ffh,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,069h,069h,048h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h 
BYTE 048h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,0ffh,0ffh,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,048h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,0ffh,0ffh,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,048h,069h,048h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,048h,069h,048h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,0ffh,0ffh,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,048h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,048h,069h,048h,069h,048h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,048h,069h 
BYTE 048h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,069h,069h,069h,048h,069h,048h,069h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,069h,048h,069h,048h,069h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,069h,048h,069h,069h,069h,048h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,069h,069h,048h,069h,048h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,069h,069h,048h,069h,048h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,048h,069h,048h,069h,048h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,048h,069h 
BYTE 069h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,069h,048h,069h,069h,069h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,069h,048h,069h,048h,069h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,069h,048h,069h,048h,069h,048h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,069h,069h,048h,069h,069h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,069h,069h,048h,069h,048h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,048h,069h,048h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,048h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,048h,069h,048h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,048h,069h,048h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,048h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,069h,069h,048h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,048h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,048h,069h,069h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,048h,069h,048h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,048h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,048h,069h,069h,069h,048h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,069h,069h 
BYTE 048h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,069h,069h,069h,069h,069h,048h,069h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,069h,048h,069h,048h,069h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,069h,048h,069h,048h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,069h,069h,048h,069h,048h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,048h,069h,069h 
BYTE 069h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,069h,069h,048h,069h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,069h,069h,048h,069h,069h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,048h,069h 
BYTE 048h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,069h,048h,069h,048h,069h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,069h,048h,069h,069h,069h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,069h,069h,069h,048h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,069h,069h,048h,069h,048h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,048h,069h,048h 
BYTE 069h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h 
BYTE 048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,0ffh,0ffh,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,048h,069h,048h,069h,048h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,0ffh,0ffh,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,048h,069h,048h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,0ffh,0ffh,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,048h 
BYTE 069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,048h,069h,069h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,0ffh 
BYTE 0ffh,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 048h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,0ffh,0ffh,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,048h,069h,048h,069h,048h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,069h,069h,048h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,0ffh,0ffh,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,048h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,0ffh,0ffh,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,048h 
BYTE 069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,048h,069h,069h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,048h,069h,069h,069h,069h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,069h,069h 
BYTE 048h,069h,048h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,069h,048h,069h,048h,069h,048h,069h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,048h,069h,069h,069h,048h,069h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,069h,048h,069h,069h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,069h,069h,069h,069h,048h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,048h,069h,048h 
BYTE 069h,048h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,048h,069h,069h,069h,048h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,069h,069h,048h,069h,069h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,069h,069h 
BYTE 048h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,069h,048h,069h,048h,069h,048h,069h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,048h,069h,048h,069h,048h,069h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,069h,069h,069h,069h,069h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,048h,069h,048h 
BYTE 069h,048h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,048h,069h,048h,069h,048h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,048h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,048h,069h,048h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,048h,069h,048h,069h,048h,069h,048h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,048h 
BYTE 069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,048h,069h 
BYTE 048h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,048h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,048h,069h,048h,069h,048h,069h,048h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,048h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,048h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,069h,069h,069h,069h,048h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,048h,069h,048h,069h 
BYTE 048h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,069h,048h,069h,048h,069h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,069h,069h,069h,048h,069h,048h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,069h,048h,069h,069h,069h,048h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,048h,069h,048h,069h,048h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,048h,069h,048h 
BYTE 069h,048h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,069h,069h,048h,069h,048h,069h,048h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,069h,069h 
BYTE 048h,069h,048h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,069h,048h,069h,048h,069h,048h,069h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,048h,069h,048h,069h,069h,069h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,069h,069h,048h,069h,048h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,048h,069h,048h 
BYTE 069h,048h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,069h,069h,048h,069h,048h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h 
BYTE 048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,0ffh,0ffh,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,048h,069h,048h,069h,048h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,0ffh,0ffh,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,048h,069h,048h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,0ffh,0ffh,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,048h 
BYTE 069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,0ffh 
BYTE 0ffh,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h 
BYTE 048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,0ffh,0ffh,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,048h,069h,048h,069h,048h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,0ffh,0ffh,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,048h,069h,048h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,0ffh,0ffh,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,048h 
BYTE 069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,048h,069h 
BYTE 048h,069h,048h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,069h,048h,069h,048h,069h,048h,069h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,069h,048h,069h,069h,069h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,069h,069h,048h,069h,069h,069h,048h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,048h,069h,048h 
BYTE 069h,048h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,048h,069h,069h,069h,069h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,048h,069h 
BYTE 069h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,069h,048h,069h,048h,069h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,069h,048h,069h,069h,069h,048h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,069h,048h,069h,069h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,069h,069h,048h,069h,048h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,069h,069h,069h,069h,069h,069h,048h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,0ffh,0ffh,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,048h 
BYTE 069h,069h,069h,069h,069h,069h,069h,0ffh,0ffh,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,048h,069h,069h,069h,048h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,0ffh,0ffh,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h 
BYTE 069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,048h,069h,069h,069h,069h,069h,069h,069h,0ffh 
BYTE 0ffh,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,048h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h 
BYTE 048h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,0ffh,0ffh,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,048h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,0ffh,0ffh,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,0ffh,0ffh,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h,069h 
BYTE 069h,069h,069h,069h,069h,048h,069h,069h,069h,069h,069h,069h,069h,069h,069h,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,048h,069h,048h,069h,069h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,048h,069h 
BYTE 069h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,069h,048h,069h,069h,069h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,069h,069h,048h,069h,048h,069h,069h 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,069h,069h,069h,048h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,069h,069h,069h,069h,048h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,069h,048h,069h,069h 
BYTE 069h,069h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 
BYTE 069h,069h,069h,048h,069h,048h,069h,069h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh  

dollar1 EECS205BITMAP <37, 18, 255,, offset dollar1 + sizeof dollar1> 
BYTE 055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h
BYTE 055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h
BYTE 055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,0feh,0feh,0feh,0feh,0feh
BYTE 0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh
BYTE 0feh,0feh,0feh,0feh,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,0feh
BYTE 0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,055h,055h,055h,0feh,0feh
BYTE 0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,055h,055h,055h,055h,055h,055h
BYTE 055h,055h,055h,055h,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,055h,055h
BYTE 055h,055h,055h,055h,055h,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,055h
BYTE 055h,055h,055h,055h,055h,055h,055h,055h,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh
BYTE 0feh,0feh,055h,055h,055h,055h,0feh,055h,055h,055h,055h,0feh,0feh,0feh,0feh,0feh
BYTE 0feh,0feh,0feh,0feh,0feh,055h,055h,055h,055h,055h,055h,055h,0feh,0feh,055h,055h
BYTE 0feh,0feh,0feh,0feh,0feh,0feh,055h,055h,055h,055h,0feh,0feh,0feh,055h,055h,055h
BYTE 0feh,0feh,0feh,0feh,0feh,0feh,0feh,055h,055h,0feh,0feh,0feh,055h,055h,055h,0feh
BYTE 0feh,0feh,055h,055h,055h,055h,0feh,0feh,0feh,0feh,0feh,055h,055h,055h,0feh,0feh
BYTE 055h,055h,0feh,055h,055h,055h,0feh,0feh,0feh,0feh,0feh,055h,055h,055h,055h,0feh
BYTE 0feh,0feh,055h,055h,0feh,0feh,055h,055h,055h,055h,055h,055h,0feh,0feh,0feh,055h
BYTE 055h,055h,055h,0feh,0feh,055h,055h,055h,055h,055h,055h,055h,0feh,0feh,0feh,055h
BYTE 055h,055h,055h,055h,055h,0feh,0feh,055h,055h,0feh,055h,055h,055h,055h,055h,055h
BYTE 055h,055h,0feh,0feh,055h,055h,055h,055h,055h,0feh,0feh,055h,055h,055h,055h,055h
BYTE 055h,0feh,0feh,055h,055h,055h,055h,055h,055h,055h,055h,0feh,055h,055h,0feh,055h
BYTE 055h,055h,055h,055h,055h,055h,055h,0feh,0feh,055h,055h,055h,055h,055h,055h,0feh
BYTE 0feh,055h,055h,055h,055h,055h,0feh,0feh,055h,055h,055h,055h,055h,055h,055h,055h
BYTE 0feh,055h,055h,0feh,0feh,055h,055h,055h,055h,055h,055h,0feh,0feh,0feh,055h,055h
BYTE 055h,055h,055h,055h,055h,0feh,0feh,055h,055h,055h,055h,0feh,0feh,0feh,055h,055h
BYTE 055h,055h,055h,055h,0feh,0feh,055h,055h,0feh,0feh,0feh,055h,055h,055h,055h,0feh
BYTE 0feh,0feh,0feh,055h,055h,055h,055h,0feh,055h,055h,0feh,0feh,055h,055h,055h,055h
BYTE 0feh,0feh,0feh,0feh,055h,055h,055h,055h,0feh,0feh,0feh,055h,055h,055h,0feh,0feh
BYTE 0feh,055h,055h,0feh,0feh,0feh,0feh,0feh,0feh,055h,055h,055h,055h,0feh,0feh,0feh
BYTE 055h,055h,055h,055h,0feh,0feh,0feh,0feh,0feh,0feh,055h,055h,0feh,0feh,0feh,055h
BYTE 055h,055h,055h,055h,055h,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,055h
BYTE 055h,055h,055h,0feh,055h,055h,055h,055h,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh

BYTE 0feh,0feh,055h,055h,055h,055h,055h,055h,055h,055h,055h,0feh,0feh,0feh,0feh,0feh
BYTE 0feh,0feh,0feh,0feh,0feh,055h,055h,055h,055h,055h,055h,055h,0feh,0feh,0feh,0feh
BYTE 0feh,0feh,0feh,0feh,0feh,0feh,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h
BYTE 0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,055h,055h,055h,0feh
BYTE 0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,055h,055h,055h,055h,055h
BYTE 055h,055h,055h,055h,055h,055h,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh
BYTE 0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,055h
BYTE 055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h
BYTE 055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h
BYTE 055h,055h,055h,055h,055h,055h,055h,055h,055h,055h 

dollar2 EECS205BITMAP <37, 18, 255,, offset dollar2 + sizeof dollar2>
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
 BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
 BYTE 0ffh,0ffh,0ffh,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h
 BYTE 055h,055h,055h,055h,055h,055h,055h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
 BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,055h,055h,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh
 BYTE 0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,055h,055h,055h,055h
 BYTE 055h,055h,055h,055h,055h,055h,055h,0ffh,0ffh,055h,055h,055h,0feh,0feh,0feh,0feh
 BYTE 0feh,0feh,0feh,0dah,0dah,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh
 BYTE 0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,055h,0ffh,055h,0feh
 BYTE 0feh,0feh,0feh,0feh,0feh,0feh,0feh,0dah,0feh,0feh,0feh,0feh,0feh,0feh,055h,055h
 BYTE 055h,055h,055h,055h,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh
 BYTE 0feh,0feh,055h,055h,0feh,0feh,0feh,055h,055h,055h,0feh,0feh,0feh,0feh,0feh,0feh
 BYTE 0feh,055h,055h,055h,055h,0feh,055h,055h,055h,055h,0feh,0feh,0feh,0feh,0feh,0feh
 BYTE 0feh,055h,055h,0feh,0feh,0feh,0feh,055h,055h,0feh,0feh,055h,055h,055h,055h,055h
 BYTE 055h,0feh,0feh,0feh,0feh,055h,055h,055h,055h,0feh,0feh,0feh,0feh,055h,055h,055h
 BYTE 0feh,0feh,0feh,0feh,055h,055h,055h,055h,055h,055h,0feh,0feh,055h,055h,0feh,055h
 BYTE 055h,055h,055h,055h,055h,055h,055h,0feh,0feh,055h,055h,055h,055h,0feh,0feh,0feh
 BYTE 055h,055h,055h,055h,055h,055h,0feh,0feh,055h,055h,055h,055h,055h,055h,055h,055h
 BYTE 0feh,055h,055h,0feh,0feh,055h,055h,055h,055h,055h,055h,0feh,0feh,0feh,0feh,055h
 BYTE 055h,055h,055h,0feh,0feh,0feh,0feh,0feh,055h,055h,055h,0feh,0feh,0feh,055h,055h
 BYTE 055h,055h,055h,0feh,0feh,0feh,055h,055h,0feh,0feh,0feh,0feh,055h,055h,0feh,0feh
 BYTE 0feh,0feh,0feh,0dah,0feh,055h,055h,055h,055h,055h,055h,0feh,055h,055h,0feh,0feh
 BYTE 0feh,0dah,0feh,0feh,0feh,055h,055h,0feh,0feh,0feh,0feh,055h,055h,055h,0feh,0feh
 BYTE 0feh,0feh,0feh,0feh,0feh,0dah,0dah,0dah,0feh,0feh,0feh,0feh,055h,055h,0feh,0feh
 BYTE 0feh,0feh,0feh,0feh,0dah,0dah,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh
 BYTE 055h,055h,055h,055h,055h,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh
 BYTE 0feh,0feh,055h,055h,055h,055h,0feh,0feh,0dah,0feh,0feh,0feh,0feh,0feh,0feh,0feh
 BYTE 0feh,0feh,0feh,0feh,055h,055h,0ffh,0ffh,0ffh,0ffh,055h,055h,055h,055h,055h,055h
 BYTE 0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh
 BYTE 0feh,0feh,0feh,0feh,0feh,0feh,0feh,055h,055h,055h,055h,0ffh,0ffh,0ffh,0ffh,0ffh
 BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h
 BYTE 055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,0ffh,0ffh,0ffh,0ffh
 BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
 BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
 BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
 BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
 BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 

dollar3 EECS205BITMAP <37, 18, 255,, offset dollar3 + sizeof dollar3> 
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0dah,0dah,0dah,0dah,055h,0dah
BYTE 0dah,0dah,0dah,0dah,0dah,0dah,0dah,0dah,0dah,0dah,0dah,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,055h
BYTE 0feh,0feh,0feh,0feh,0feh,0feh,0feh,0dah,0feh,0feh,0feh,0feh,0feh,055h,0dah,0dah
BYTE 0dah,0dah,0dah,0dah,055h,0feh,0feh,0feh,0dah,0dah,0dah,0dah,0dah,0dah,0dah,0feh
BYTE 0feh,0feh,0ffh,0ffh,055h,0feh,0feh,0feh,055h,055h,055h,0feh,0feh,0feh,0feh,0feh
BYTE 0feh,0feh,0feh,055h,055h,0feh,0feh,0feh,055h,055h,0feh,0feh,0feh,0feh,0feh,0feh
BYTE 0feh,0feh,0feh,0feh,0feh,0feh,0feh,0dah,0ffh,055h,0feh,0feh,0feh,055h,055h,055h
BYTE 0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,055h,055h,0feh,0feh,055h,055h,0feh
BYTE 0feh,0feh,0feh,0feh,0feh,0feh,0feh,055h,055h,0feh,0feh,0feh,0feh,0ffh,0ffh,0ffh
BYTE 0ffh,055h,055h,055h,055h,055h,055h,0dah,0dah,0dah,0dah,0dah,055h,0feh,055h,055h
BYTE 055h,055h,055h,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0feh,055h,055h,055h,055h,0feh
BYTE 0feh,0feh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,055h,055h,055h,0feh,055h,055h,055h,055h
BYTE 055h,055h,055h,055h,0feh,0feh,0feh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,055h,055h,055h,055h,055h,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh 

reloading EECS205BITMAP <50, 8, 255,, offset reloading + sizeof reloading>
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0c0h,0c0h,0c0h,0ffh,0ffh,0ffh,0c0h,0c0h,0c0h,0c0h,0ffh,0c0h
	BYTE 0ffh,0ffh,0ffh,0c0h,0c0h,0c0h,0c0h,0ffh,0ffh,0ffh,0c0h,0c0h,0ffh,0ffh,0c0h,0c0h
	BYTE 0c0h,0c0h,0ffh,0ffh,0c0h,0ffh,0ffh,0c0h,0ffh,0ffh,0c0h,0ffh,0ffh,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0ffh,0ffh,0ffh,0ffh,0c0h,0ffh,0ffh,0c0h,0ffh,0ffh,0c0h,0ffh,0ffh,0ffh
	BYTE 0ffh,0c0h,0ffh,0ffh,0ffh,0c0h,0ffh,0ffh,0c0h,0ffh,0ffh,0ffh,0c0h,0c0h,0ffh,0ffh
	BYTE 0c0h,0ffh,0ffh,0c0h,0ffh,0ffh,0c0h,0ffh,0ffh,0c0h,0c0h,0ffh,0c0h,0ffh,0ffh,0c0h
	BYTE 0ffh,0ffh,0ffh,0c0h,0ffh,0ffh,0ffh,0ffh,0c0h,0ffh,0ffh,0c0h,0ffh,0ffh,0c0h,0c0h
	BYTE 0c0h,0ffh,0ffh,0c0h,0ffh,0ffh,0c0h,0ffh,0ffh,0ffh,0ffh,0c0h,0ffh,0c0h,0ffh,0ffh
	BYTE 0c0h,0ffh,0c0h,0ffh,0ffh,0ffh,0c0h,0ffh,0c0h,0ffh,0ffh,0c0h,0c0h,0c0h,0c0h,0ffh
	BYTE 0c0h,0c0h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0c0h,0c0h,0c0h,0ffh,0ffh,0ffh
	BYTE 0c0h,0ffh,0ffh,0ffh,0ffh,0c0h,0ffh,0ffh,0c0h,0ffh,0ffh,0ffh,0ffh,0c0h,0ffh,0c0h
	BYTE 0ffh,0ffh,0c0h,0ffh,0c0h,0ffh,0ffh,0ffh,0c0h,0ffh,0c0h,0ffh,0ffh,0c0h,0ffh,0c0h
	BYTE 0c0h,0ffh,0c0h,0ffh,0ffh,0c0h,0c0h,0c0h,0ffh,0ffh,0ffh,0ffh,0c0h,0ffh,0c0h,0ffh
	BYTE 0ffh,0ffh,0c0h,0ffh,0ffh,0ffh,0ffh,0c0h,0ffh,0ffh,0ffh,0c0h,0ffh,0ffh,0c0h,0ffh
	BYTE 0ffh,0c0h,0c0h,0c0h,0c0h,0ffh,0c0h,0ffh,0ffh,0c0h,0c0h,0ffh,0c0h,0ffh,0ffh,0c0h
	BYTE 0ffh,0c0h,0c0h,0ffh,0c0h,0c0h,0ffh,0ffh,0ffh,0c0h,0ffh,0ffh,0ffh,0ffh,0c0h,0ffh
	BYTE 0ffh,0c0h,0c0h,0ffh,0c0h,0c0h,0c0h,0c0h,0ffh,0c0h,0c0h,0c0h,0ffh,0c0h,0c0h,0c0h
	BYTE 0c0h,0ffh,0ffh,0c0h,0ffh,0ffh,0c0h,0ffh,0c0h,0c0h,0c0h,0ffh,0ffh,0ffh,0c0h,0ffh
	BYTE 0ffh,0c0h,0ffh,0ffh,0c0h,0ffh,0ffh,0c0h,0c0h,0c0h,0c0h,0c0h,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh

star EECS205BITMAP <32, 36, 255,, offset star + sizeof star>
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh
	BYTE 0feh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh
	BYTE 0feh,0feh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0fdh
	BYTE 0f9h,0f9h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0fdh
	BYTE 0f8h,0f8h,0fdh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0fdh
	BYTE 0f8h,0f8h,0f8h,0feh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0feh,0fdh
	BYTE 0f8h,0f8h,0d8h,0f9h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0feh,0f9h
	BYTE 0f8h,0f8h,0d8h,0d8h,0feh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0fdh,0f8h
	BYTE 0f8h,0f4h,0f8h,0d8h,0d9h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fah,0feh,0fdh,0f8h
	BYTE 0f8h,0f4h,0f8h,0d8h,0d8h,0fdh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0feh,0fdh,0f8h
	BYTE 0f4h,0f4h,0f4h,0f8h,0f8h,0d4h,0feh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0feh,0feh,0f9h,0d4h
	BYTE 0f8h,0f4h,0f4h,0d4h,0f8h,0f8h,0d4h,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0feh,0f9h,0fdh,0f8h,0f8h
	BYTE 0f4h,0f8h,0f4h,0f4h,0f8h,0d4h,0d4h,0f8h,0d9h,0d9h,0d9h,0f9h,0d9h,0f9h,0d9h,0fah
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0feh,0fdh,0f9h,0f8h,0f8h,0f8h,0f8h
	BYTE 0f8h,0d4h,0f8h,0f8h,0f4h,0f8h,0f8h,0d8h,0f8h,0f8h,0f8h,0f8h,0d8h,0d4h,0d5h,0feh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0feh,0feh,0f9h,0f9h,0f8h,0f8h,0fch,0fch,0f8h,0f8h
	BYTE 0f8h,0f8h,0f8h,0f8h,0f4h,0f8h,0b0h,0d8h,0d8h,0f8h,0f8h,0f4h,0f8h,0d8h,0d9h,0feh
	BYTE 0ffh,0ffh,0feh,0fdh,0f9h,0f8h,0f8h,0f8h,0f8h,0f8h,0fdh,0fdh,0f8h,0f8h,0f8h,0f8h
	BYTE 0f8h,0b0h,0d8h,0f8h,0f8h,0f8h,044h,08ch,0d4h,0d8h,0d4h,0d4h,0d4h,0d4h,0feh,0ffh
	BYTE 0feh,0feh,0d9h,0d8h,0f8h,0f8h,0fch,0fch,0f8h,0f8h,0f8h,0f8h,0f8h,0f8h,0f8h,0fch
	BYTE 0f8h,06ch,06ch,0fch,0f8h,0d8h,06ch,06ch,0d4h,0f8h,0d4h,0d4h,0d4h,0d5h,0ffh,0ffh
	BYTE 0ffh,0dah,0d4h,0d4h,0f8h,0f8h,0f8h,0f8h,0f4h,0f4h,0f4h,0f8h,0f8h,0f8h,0fch,0fch
	BYTE 0fdh,06ch,06ch,0fdh,0fch,0d8h,048h,068h,0f8h,0d4h,0d4h,0d4h,0d4h,0feh,0ffh,0ffh
	BYTE 0ffh,0ffh,0feh,0d8h,0d4h,0f4h,0f8h,0f4h,0f4h,0f4h,0f8h,0f8h,0f8h,0f8h,0fch,0fch
	BYTE 0fdh,048h,048h,0fdh,0fch,0fch,044h,024h,0f8h,0d4h,0d4h,0d4h,0d9h,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0feh,0f9h,0f8h,0f8h,0f8h,0f8h,0f8h,0f8h,0f8h,0f8h,0fch,0fch,0fch
	BYTE 0fdh,048h,000h,0fdh,0fch,0f8h,048h,024h,0f8h,0f4h,0d4h,0d5h,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0feh,0f9h,0f8h,0f8h,0d8h,0f8h,0f8h,0f8h,0f8h,0fch,0fch,0fch
	BYTE 0fch,06ch,020h,0f8h,0fch,0fch,090h,044h,0f8h,0f4h,0d4h,0fah,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fdh,0f9h,0d8h,0d8h,0f8h,0f8h,0f8h,0fch,0fch,0fch
	BYTE 0fch,0b4h,020h,0fdh,0fch,0fch,0d8h,0d8h,0f8h,0f4h,0d5h,0feh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0f9h,0d8h,0f8h,0f8h,0f8h,0fch,0fch,0fch
	BYTE 0fch,0fch,0fch,0fch,0fch,0fch,0f8h,0d8h,0f8h,0f4h,0d5h,0feh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0f9h,0f8h,0f8h,0f8h,0fch,0fch,0fch
	BYTE 0fch,0fch,0fch,0fch,0fch,0fch,0fch,0d8h,0f8h,0d4h,0d4h,0feh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0f8h,0f8h,0f8h,0f8h,0fch,0fch
	BYTE 0fch,0fch,0fch,0fch,0fch,0f8h,0f8h,0d8h,0f8h,0d4h,0d4h,0feh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0f8h,0f8h,0f8h,0f8h,0f8h,0fch
	BYTE 0fch,0fch,0fch,0fch,0f8h,0f8h,0f8h,0d8h,0d4h,0d4h,0d4h,0feh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0f8h,0f8h,0f8h,0f8h,0f8h,0f8h
	BYTE 0f8h,0fch,0f8h,0f8h,0f8h,0f8h,0d8h,0f8h,0f4h,0d4h,0d4h,0f9h,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0f8h,0f8h,0f4h,0f8h,0f8h,0f8h
	BYTE 0f8h,0f8h,0f8h,0f8h,0f8h,0f8h,0f8h,0d4h,0d4h,0d4h,0f4h,0f9h,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fah,0f8h,0f4h,0f4h,0f8h,0f8h,0f8h
	BYTE 0f8h,0f8h,0f8h,0f8h,0d4h,0d4h,0d4h,0d4h,0d4h,0d4h,0d4h,0d5h,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fah,0f8h,0f4h,0f4h,0f4h,0f4h,0d4h
	BYTE 0d4h,0d8h,0d4h,0f9h,0f9h,0d5h,0b0h,0d4h,0d4h,0d4h,0d4h,0d4h,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0f9h,0f8h,0f4h,0f4h,0f4h,0d4h,0d4h
	BYTE 0d8h,0d4h,0feh,0ffh,0ffh,0ffh,0feh,0d5h,0d5h,0d4h,0d4h,0d5h,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0f9h,0f8h,0f4h,0f4h,0f4h,0d4h,0d8h
	BYTE 0d5h,0feh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fah,0d5h,0b5h,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0f9h,0f4h,0f4h,0f4h,0d4h,0d4h,0f9h
	BYTE 0feh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0d9h,0d8h,0d4h,0d4h,0d5h,0fah,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fah,0d4h,0d4h,0d5h,0feh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0dah,0d5h,0d4h,0feh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0f9h,0feh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh


gameover EECS205BITMAP <369, 47, 0a3h,, offset gameover + sizeof gameover>
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0a2h,0c2h,0c1h,0c1h,0c0h,0c0h,0c1h,0c1h,0c1h
	BYTE 0a2h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a2h,0c2h,0c1h,0c1h,0c0h,0c0h,0c0h,0c1h,0c2h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a2h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0c1h,0c2h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c1h,0c1h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0c2h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0c1h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a2h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a2h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c1h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a2h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a2h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0c1h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h
	BYTE 0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h
	BYTE 0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h
	BYTE 0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a2h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c1h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0a2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0a2h,0a2h,0c0h,0c0h,0c0h,0c0h,0c1h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a2h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h
	BYTE 0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c1h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a2h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c2h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a2h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0a2h,0c1h,0c1h
	BYTE 0c0h,0c0h,0c0h,0c1h,0c1h,0c2h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c2h,0c1h,0c1h,0c0h,0c0h,0c1h,0c1h,0c1h,0a2h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h


titlez EECS205BITMAP <399, 85, 0a3h,, offset titlez + sizeof titlez>
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h,0c1h,0c0h,0c0h,0c1h,0c1h
	BYTE 0c1h,0a2h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h,0c1h,0c0h,0c0h,0c1h,0c1h
	BYTE 0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h,0c1h,0c0h,0c0h
	BYTE 0c1h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a2h,0c2h,0c1h,0c1h,0c0h,0c0h,0c1h,0c1h,0c1h,0a2h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h,0c1h,0c0h
	BYTE 0c0h,0c1h,0c1h,0c1h,0a2h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a2h,0c1h,0c1h,0c0h,0c0h,0c1h,0c1h,0c1h,0a2h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0c1h,0c2h,0a2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0c1h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0c2h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a2h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a2h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h
	BYTE 0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a2h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h
	BYTE 0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c2h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a2h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0c1h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c1h,0a2h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a2h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a2h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c1h,0a2h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a2h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a2h,0a2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h
	BYTE 0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h
	BYTE 0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h
	BYTE 0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0c1h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0c1h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c2h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0a2h,0c1h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0a2h,0c1h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a2h,0a2h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a2h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0a2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0c0h,0c1h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c1h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c1h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h
	BYTE 0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c1h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c2h,0c1h,0c1h,0c0h,0c0h,0c1h
	BYTE 0c1h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h,0c1h,0c0h
	BYTE 0c0h,0c1h,0c1h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h
	BYTE 0c1h,0c0h,0c0h,0c1h,0c1h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a2h,0c2h,0c1h,0c1h,0c0h,0c0h,0c1h,0c1h,0c2h,0a2h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c2h,0c1h,0c1h
	BYTE 0c0h,0c0h,0c1h,0c1h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a2h,0c2h,0c1h,0c1h,0c0h,0c0h,0c1h,0c1h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0abh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0afh,0fch,0fah,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0d3h,0fdh,0fch,0fch
	BYTE 0d6h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0afh,0fch
	BYTE 0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0abh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0d3h,0fch,0fah
	BYTE 0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0afh
	BYTE 0fch,0fah,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0abh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a7h,0d7h,0fah,0fdh,0fch,0fdh,0afh,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0d3h,0fch,0fch,0fch,0fch,0fah
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0afh,0fch,0fah
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0abh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0d3h,0fch,0fah,0a3h
	BYTE 0a3h,0afh,0fch,0fah,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0afh,0fch
	BYTE 0fah,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0abh,0afh,0fah,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0afh,0fdh
	BYTE 0fch,0fch,0fch,0fch,0fch,0afh,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0f9h,0fch,0d7h,0abh,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0afh,0fch,0fah,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0abh
	BYTE 0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0afh,0fch,0fah,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0afh,0fch,0fah
	BYTE 0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0d3h
	BYTE 0fch,0fch,0fch,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0abh,0fdh,0fch,0fah
	BYTE 0d3h,0a7h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a7h,0fch,0fdh,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0abh,0fch
	BYTE 0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0afh
	BYTE 0fch,0fah,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0afh,0fch,0fah,0a3h
	BYTE 0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0d3h,0fch
	BYTE 0fch,0fch,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0fah,0fch,0d7h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0abh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0abh,0fch,0fah
	BYTE 0a3h,0a3h,0a3h,0a3h,0d7h,0fch,0fah,0abh,0a3h,0afh,0fch,0fah,0a3h,0a3h,0afh,0fch
	BYTE 0fah,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a7h
	BYTE 0fah,0fdh,0fdh,0fch,0fdh,0f9h,0d7h,0a7h,0a3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h
	BYTE 0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0d3h,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0abh,0fch,0f9h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0afh,0fah
	BYTE 0fdh,0fch,0fdh,0fah,0d7h,0a7h,0d7h,0fch,0fch,0fch,0fch,0fch,0fch,0d7h,0a3h,0a7h
	BYTE 0fah,0fdh,0fdh,0fch,0fdh,0f9h,0d7h,0a7h,0a3h,0a3h,0a3h,0afh,0fch,0fah,0abh,0d6h
	BYTE 0fdh,0fch,0d6h,0a3h,0a3h,0afh,0fah,0fdh,0fch,0fdh,0fah,0d7h,0a7h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0d3h,0fch,0fch,0fch,0fch,0fch,0fch,0a3h,0a3h,0a3h,0d3h,0fah
	BYTE 0fch,0fch,0f9h,0d7h,0a7h,0a3h,0a3h,0a3h,0afh,0fch,0fah,0abh,0d6h,0fdh,0fch,0d6h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0afh,0fch,0fah,0abh,0d6h,0fdh,0fch,0d6h
	BYTE 0a3h,0a3h,0a3h,0d3h,0fah,0fdh,0fch,0fdh,0d6h,0abh,0a3h,0a3h,0abh,0fch,0fdh,0a3h
	BYTE 0a3h,0a3h,0a3h,0fah,0fch,0afh,0a3h,0a3h,0a3h,0d7h,0fch,0d7h,0a3h,0a7h,0fah,0fdh
	BYTE 0fdh,0fch,0fdh,0f9h,0d7h,0a7h,0a3h,0a3h,0a3h,0afh,0fch,0fah,0abh,0d6h,0fdh,0fch
	BYTE 0d6h,0a3h,0a3h,0a3h,0d3h,0fah,0fch,0fdh,0fah,0d6h,0fch,0fah,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0abh,0fch,0fah,0a3h
	BYTE 0a3h,0a3h,0d7h,0fch,0fah,0abh,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0afh,0fch,0fah
	BYTE 0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a7h,0fch
	BYTE 0fch,0fch,0fch,0fch,0fch,0fch,0fah,0a3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0afh
	BYTE 0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0d3h
	BYTE 0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0d3h,0fch,0d6h,0d6h,0fdh,0fch,0fdh,0fah
	BYTE 0d3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0d3h,0fch,0fch,0fch
	BYTE 0fch,0fch,0fch,0fch,0afh,0d7h,0fch,0fch,0fch,0fch,0fch,0fch,0d7h,0a3h,0a7h,0fch
	BYTE 0fch,0fch,0fch,0fch,0fch,0fch,0fah,0a3h,0a3h,0a3h,0afh,0fch,0fdh,0fdh,0fch,0fch
	BYTE 0fch,0fah,0a3h,0d3h,0fch,0fch,0fch,0fch,0fch,0fch,0fch,0afh,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0d3h,0fch,0fch,0fch,0fch,0fch,0fch,0a3h,0a3h,0dah,0fch,0fch,0fch
	BYTE 0fch,0fch,0fch,0fah,0a7h,0a3h,0a3h,0afh,0fch,0fdh,0fdh,0fch,0fch,0fch,0fah,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0afh,0fch,0fdh,0fdh,0fch,0fch,0fch,0fah,0a3h
	BYTE 0a3h,0d7h,0fch,0fch,0fch,0fch,0fch,0fch,0fdh,0a7h,0a3h,0a3h,0fah,0fch,0abh,0a3h
	BYTE 0a3h,0a7h,0fch,0fch,0d6h,0a3h,0a3h,0a3h,0fah,0fch,0afh,0a3h,0a7h,0fch,0fch,0fch
	BYTE 0fch,0fch,0fch,0fch,0fah,0a3h,0a3h,0a3h,0afh,0fch,0fdh,0fdh,0fch,0fch,0fch,0fah
	BYTE 0a3h,0a3h,0d7h,0fch,0fch,0fch,0fch,0fch,0fch,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0abh,0fch,0fah,0a3h,0a3h
	BYTE 0d7h,0fch,0fah,0abh,0a3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0afh,0fch,0fah,0a3h
	BYTE 0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a7h,0abh,0d3h,0fdh,0fch,0abh,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0afh,0fch
	BYTE 0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0d3h,0fch
	BYTE 0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0d6h,0fch,0fch,0fch,0fch,0fch,0fch,0fch,0fch
	BYTE 0d6h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0fah,0fch,0d7h,0abh,0a7h
	BYTE 0abh,0d3h,0fah,0afh,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a7h,0abh,0d3h,0fdh,0fch,0abh,0a3h,0a3h,0afh,0fch,0fch,0fah,0d3h,0a7h,0a3h
	BYTE 0a3h,0a3h,0fah,0fch,0d7h,0abh,0a7h,0abh,0d3h,0fah,0afh,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0abh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0d3h,0fch,0fdh,0d7h,0abh,0abh
	BYTE 0d3h,0fdh,0fch,0d7h,0a3h,0a3h,0afh,0fch,0fch,0fah,0d3h,0a7h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0afh,0fch,0fch,0fah,0d3h,0a7h,0a3h,0a3h,0a3h,0afh
	BYTE 0fch,0fdh,0d3h,0abh,0a7h,0afh,0fah,0fch,0d7h,0a3h,0a3h,0d6h,0fch,0d3h,0a3h,0a3h
	BYTE 0d3h,0fch,0fdh,0fdh,0a3h,0a3h,0a3h,0fdh,0fdh,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a7h
	BYTE 0abh,0d3h,0fdh,0fch,0abh,0a3h,0a3h,0afh,0fch,0fch,0fah,0d3h,0a7h,0a3h,0a3h,0a3h
	BYTE 0afh,0fch,0fch,0d7h,0afh,0a7h,0afh,0d6h,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0abh,0fch,0fah,0a3h,0d3h,0fch
	BYTE 0fah,0abh,0a3h,0a3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h
	BYTE 0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0fah,0fch,0d3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0afh,0fch,0fah
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0d3h,0fch,0fah
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0fah,0fch,0fah,0d3h,0abh,0a7h,0afh,0d6h,0fch,0fch
	BYTE 0afh,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0fdh,0fch,0afh,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0fah,0fch,0d3h,0a3h,0a3h,0afh,0fch,0fah,0a7h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0fdh,0fch,0afh,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0abh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0fah,0fch,0d7h,0a3h,0a3h,0a3h,0a3h
	BYTE 0d3h,0fch,0fdh,0a3h,0a3h,0afh,0fch,0fah,0a7h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0afh,0fch,0fah,0a7h,0a3h,0a3h,0a3h,0a3h,0a3h,0fah,0fch
	BYTE 0afh,0a3h,0a3h,0a3h,0a3h,0a7h,0fdh,0fah,0a3h,0a3h,0d3h,0fch,0fah,0a3h,0a3h,0fah
	BYTE 0fdh,0d6h,0fch,0afh,0a3h,0abh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0fah,0fch,0d3h,0a3h,0a3h,0afh,0fch,0fah,0a7h,0a3h,0a3h,0a3h,0a3h,0a3h,0fah
	BYTE 0fch,0d6h,0a3h,0a3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0abh,0fch,0fah,0d3h,0fch,0fah,0abh
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0afh
	BYTE 0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a7h,0d3h,0fah,0fah
	BYTE 0fdh,0fdh,0fch,0fch,0d3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0afh,0fch,0fah,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0d3h,0fch,0fah,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0fah,0fch,0d3h,0a3h,0a3h,0a3h,0a3h,0a3h,0fah,0fch,0d6h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0d6h,0fch,0fdh,0fah,0d3h,0afh,0a3h
	BYTE 0a3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a7h,0d3h,0fah,0fah
	BYTE 0fdh,0fdh,0fch,0fch,0d3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0d6h,0fch,0fdh,0fah,0d3h,0afh,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0abh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0fdh,0fch,0abh,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0fdh,0fch,0a7h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0fdh,0fch,0fch
	BYTE 0fch,0fch,0fch,0fch,0fch,0fch,0fdh,0a3h,0a3h,0a7h,0fch,0fdh,0a3h,0a7h,0fdh,0d6h
	BYTE 0afh,0fch,0d6h,0a3h,0d3h,0fch,0d3h,0a3h,0a3h,0a3h,0a7h,0d3h,0fah,0fah,0fdh,0fdh
	BYTE 0fch,0fch,0d3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0fdh,0fch
	BYTE 0abh,0a3h,0a3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0abh,0fch,0fdh,0fch,0fch,0fah,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0afh,0fch
	BYTE 0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0afh,0fdh,0fch,0fch,0fch,0fch
	BYTE 0fch,0fch,0fch,0d3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0d3h,0fch,0fah,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0fah,0fch,0d3h,0a3h,0a3h,0a3h,0a3h,0a3h,0d3h,0fch,0fah,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a7h,0d6h,0fdh,0fch,0fch,0fch,0fdh,0d7h
	BYTE 0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0afh,0fdh,0fch,0fch,0fch,0fch
	BYTE 0fch,0fch,0fch,0d3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a7h
	BYTE 0d6h,0fdh,0fch,0fch,0fch,0fdh,0d7h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0abh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0fch,0fch,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0fdh
	BYTE 0fch,0abh,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0fch,0fch,0fch,0fch
	BYTE 0fch,0fch,0fch,0fch,0fch,0fdh,0a3h,0a3h,0a3h,0fah,0fch,0abh,0d3h,0fch,0afh,0a3h
	BYTE 0fdh,0f9h,0a3h,0d6h,0fch,0abh,0a3h,0a3h,0afh,0fdh,0fch,0fch,0fch,0fch,0fch,0fch
	BYTE 0fch,0d3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0fdh,0fch,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0abh,0fch,0fch,0fah,0fah,0fch,0d6h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0afh,0fch,0fah
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0fah,0fch,0fah,0d3h,0afh,0abh,0abh
	BYTE 0d6h,0fch,0d3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0d3h,0fch,0fah,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0d7h,0fch,0d6h,0a3h,0a3h,0a3h,0a3h,0a3h,0d7h,0fch,0d6h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a7h,0afh,0d7h,0fah,0fch,0fch,0d3h
	BYTE 0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0fah,0fch,0fah,0d3h,0afh,0abh,0abh
	BYTE 0d6h,0fch,0d3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a7h,0afh,0d7h,0fah,0fch,0fch,0d3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0abh
	BYTE 0fch,0fah,0a3h,0a3h,0a3h,0a3h,0fdh,0fch,0abh,0a3h,0a3h,0a3h,0a3h,0a3h,0fdh,0fch
	BYTE 0a7h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0fdh,0fch,0a7h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0d7h,0fch,0d3h,0fah,0fdh,0a3h,0a3h,0d6h
	BYTE 0fch,0afh,0fah,0fdh,0a3h,0a3h,0a3h,0fah,0fch,0fah,0d3h,0afh,0abh,0abh,0d6h,0fch
	BYTE 0d3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0fdh,0fch,0abh,0a3h
	BYTE 0a3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0abh,0fch,0fah,0a3h,0abh,0fdh,0fch,0d6h,0a3h,0a3h
	BYTE 0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0afh,0fch,0fah,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0fdh,0fch,0a7h,0a3h,0a3h,0a3h,0a3h,0d6h
	BYTE 0fch,0d3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0d3h,0fch,0fah,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0afh,0fch,0fdh,0abh,0a3h,0a3h,0a3h,0a3h,0fah,0fch,0d3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0d7h,0fch,0d6h,0a3h
	BYTE 0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0fdh,0fch,0a7h,0a3h,0a3h,0a3h,0a3h,0d6h
	BYTE 0fch,0d3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0d7h,0fch,0d6h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0abh,0fch
	BYTE 0fah,0a3h,0a3h,0a3h,0a3h,0fah,0fch,0d7h,0a3h,0a3h,0a3h,0a3h,0d3h,0fch,0fdh,0a3h
	BYTE 0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0fah,0fch,0d3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0afh,0fch,0d6h,0fdh,0d6h,0a3h,0a3h,0afh,0fch
	BYTE 0d6h,0fch,0fah,0a3h,0a3h,0a3h,0fdh,0fch,0a7h,0a3h,0a3h,0a3h,0a3h,0d6h,0fch,0d3h
	BYTE 0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0fah,0fch,0d3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0abh,0fch,0fah,0a3h,0a3h,0abh,0fdh,0fch,0d7h,0a3h,0a3h
	BYTE 0a3h,0afh,0fch,0fah,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0fdh,0fch,0d7h,0abh,0a7h,0afh,0d6h,0fdh,0fch
	BYTE 0d3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0d3h,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0fah,0fch,0f9h,0d3h,0a7h,0afh,0fah,0fch,0fdh,0a7h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0f9h,0d6h,0afh,0a7h,0a7h,0afh,0fah,0fch,0d7h,0a3h,0abh
	BYTE 0fch,0fch,0d3h,0a7h,0a3h,0a3h,0a3h,0fdh,0fch,0d7h,0abh,0a7h,0afh,0d6h,0fdh,0fch
	BYTE 0d3h,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0f9h,0d6h,0afh,0a7h
	BYTE 0a7h,0afh,0fah,0fch,0d7h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0abh,0fch,0fah
	BYTE 0a3h,0a3h,0a3h,0a3h,0d3h,0fch,0fch,0d7h,0abh,0abh,0d3h,0fdh,0fch,0d7h,0a3h,0a3h
	BYTE 0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0d3h,0fch,0fch,0d6h,0afh,0a7h,0a7h
	BYTE 0afh,0d6h,0fah,0a3h,0a3h,0a3h,0a7h,0fdh,0fdh,0fch,0afh,0a3h,0a3h,0a3h,0fdh,0fdh
	BYTE 0fch,0d3h,0a3h,0a3h,0a3h,0fdh,0fch,0d7h,0abh,0a7h,0afh,0d6h,0fdh,0fch,0d3h,0a3h
	BYTE 0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0d7h,0fch,0fdh,0d3h,0abh,0abh
	BYTE 0d7h,0fdh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0abh,0fch,0fah,0a3h,0a3h,0a3h,0afh,0fdh,0fch,0d3h,0a3h,0a3h
	BYTE 0afh,0fch,0fah,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0d7h,0fch,0fch,0fch,0fch,0fch,0fch,0fdh,0fch,0d3h
	BYTE 0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0d3h,0fch,0fch,0fch,0fch,0fch,0fch,0fch,0fah,0a3h,0a3h,0a3h
	BYTE 0a3h,0afh,0fdh,0fch,0fch,0fch,0fch,0fch,0fdh,0afh,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0fdh,0fch,0fch,0fch,0fch,0fch,0fch,0fdh,0abh,0a3h,0a3h,0fah
	BYTE 0fch,0fch,0fch,0fch,0d7h,0a3h,0d7h,0fch,0fch,0fch,0fch,0fch,0fch,0fdh,0fch,0d3h
	BYTE 0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0fdh,0fch,0fch,0fch,0fch
	BYTE 0fch,0fch,0fdh,0abh,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0abh,0fch,0fah,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0fah,0fch,0fch,0fch,0fch,0fch,0fch,0fah,0a7h,0a3h,0a3h,0afh
	BYTE 0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0afh
	BYTE 0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0d6h,0fch,0fch,0fch,0fch,0fch,0fch
	BYTE 0fch,0fah,0a3h,0a3h,0a3h,0a3h,0fah,0fch,0fdh,0a3h,0a3h,0a3h,0a3h,0d6h,0fch,0fch
	BYTE 0abh,0a3h,0a3h,0a3h,0d7h,0fch,0fch,0fch,0fch,0fch,0fch,0fdh,0fch,0d3h,0a3h,0a3h
	BYTE 0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a7h,0fah,0fch,0fch,0fch,0fch,0fch
	BYTE 0fdh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0abh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0afh,0fch,0fch,0d3h,0a3h,0afh
	BYTE 0fch,0fah,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0d3h,0fdh,0fch,0fdh,0fah,0d3h,0d6h,0fch,0d3h,0a3h
	BYTE 0a3h,0afh,0fch,0fah,0a3h,0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0d3h,0fch,0fch,0fch,0fch,0fch,0fch,0fch,0fah,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0abh,0fah,0fdh,0fch,0fdh,0fah,0afh,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0d3h,0fah,0fdh,0fch,0fdh,0fdh,0d6h,0abh,0a3h,0a3h,0a3h,0abh,0fah
	BYTE 0fdh,0fch,0fdh,0d3h,0a3h,0a3h,0d3h,0fdh,0fch,0fdh,0fah,0d3h,0d6h,0fch,0d3h,0a3h
	BYTE 0a3h,0afh,0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0d3h,0fah,0fdh,0fch,0fdh,0fdh
	BYTE 0d6h,0abh,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0abh,0fch,0fah,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0d3h,0fah,0fch,0fch,0fdh,0d7h,0a7h,0a3h,0a3h,0a3h,0afh,0fch
	BYTE 0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0afh,0fch
	BYTE 0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0d3h,0fah,0fdh,0fch,0fch,0f9h,0d6h
	BYTE 0afh,0a3h,0a3h,0a3h,0a3h,0d7h,0fch,0d6h,0a3h,0a3h,0a3h,0a3h,0afh,0fch,0fdh,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0d3h,0fdh,0fch,0fdh,0fah,0d3h,0d6h,0fch,0d3h,0a3h,0a3h,0afh
	BYTE 0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0abh,0fah,0fdh,0fch,0fdh,0d7h,0afh
	BYTE 0fch,0fah,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h,0c0h,0c1h
	BYTE 0c2h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a2h,0c1h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a2h,0c1h,0c1h,0c0h,0c1h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h
	BYTE 0c1h,0c0h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h,0c0h,0c1h,0a2h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a2h,0c1h,0c0h,0c1h,0c2h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h
	BYTE 0a2h,0c1h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c1h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a2h,0c1h,0c0h,0c1h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a2h,0c1h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a2h,0c1h,0c1h,0c0h,0c1h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h,0c0h,0c1h,0c2h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h,0c0h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h,0c1h
	BYTE 0c0h,0c1h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a2h,0c1h,0c0h,0a2h
	BYTE 0a3h,0a3h,0c0h,0a2h,0a3h,0a2h,0c1h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h
	BYTE 0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h,0c0h,0c1h,0c2h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0a2h,0a3h,0a2h,0c1h,0c0h,0c2h,0a3h,0a3h,0a3h,0a2h,0c1h,0c0h,0c1h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h
	BYTE 0c0h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0c0h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0c0h,0c1h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a2h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0c0h,0c1h,0c1h,0c0h,0c0h,0c0h,0a2h,0a3h
	BYTE 0a3h,0c0h,0c1h,0c1h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0a2h,0a3h,0a3h,0a3h,0c2h,0c0h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0a2h,0a3h,0a3h
	BYTE 0a3h,0a2h,0c0h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0c1h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a2h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0a2h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c2h,0a3h,0a3h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0c2h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0a3h,0a3h,0a3h,0c0h,0c0h,0c2h,0a3h,0a3h
	BYTE 0a3h,0a2h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a2h,0c0h,0c1h,0a3h
	BYTE 0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a2h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c1h,0a3h,0a3h,0a3h,0c2h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0c1h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a2h,0c0h,0a3h,0a3h,0a3h,0a3h,0c0h,0c1h,0c1h,0a3h,0a3h,0a3h
	BYTE 0c1h,0c1h,0a3h,0a3h,0c2h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0a3h,0a3h,0a3h,0a2h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c0h,0c2h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0c2h,0c0h,0a2h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0a3h,0a3h,0a3h,0a3h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a2h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0a3h,0a3h,0a3h,0a2h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a2h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c2h,0a3h,0a3h,0a3h
	BYTE 0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0c1h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c1h,0a3h,0a3h,0a3h,0a2h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c1h
	BYTE 0a3h,0a3h,0a2h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c1h,0a3h,0a3h,0a3h,0c0h
	BYTE 0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a2h,0c0h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c1h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a2h,0c0h,0a3h,0a3h,0a3h,0a3h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c1h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a2h,0c1h,0a2h,0c0h,0a3h,0a3h,0a3h,0c0h
	BYTE 0a2h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h
	BYTE 0a2h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c1h,0a3h,0a3h,0a3h,0c0h,0c1h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c1h,0a3h,0a3h,0a3h,0a2h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c1h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h
	BYTE 0c2h,0c1h,0c1h,0c0h,0c0h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h
	BYTE 0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c1h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h
	BYTE 0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0c0h,0a2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c2h
	BYTE 0c1h,0c1h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c1h,0a3h,0a3h,0a3h,0a2h,0c0h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c2h,0c1h,0c1h,0c0h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c1h,0a3h,0a3h,0c1h,0a2h,0a3h,0c0h,0a2h,0a3h,0a3h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a2h,0c0h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c2h,0a3h,0a3h,0c1h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a2h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h
	BYTE 0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h
	BYTE 0c1h,0a3h,0a3h,0a3h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h
	BYTE 0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c1h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a2h,0c1h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h
	BYTE 0a3h,0a3h,0c2h,0c0h,0a3h,0a3h,0c0h,0a3h,0a3h,0c1h,0c1h,0a3h,0a2h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a2h,0c1h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c2h,0a3h,0a3h,0c0h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h
	BYTE 0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0a3h,0a3h,0a3h,0c0h
	BYTE 0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0a3h,0a3h,0c2h,0c0h,0c2h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a2h,0c0h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a2h,0c0h,0c0h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c1h
	BYTE 0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0c1h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0a3h,0a3h,0a3h,0a2h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0a3h,0a3h,0c2h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a2h,0c0h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c1h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0a3h,0a2h,0c1h,0a3h,0a3h,0a2h,0c0h,0a3h,0c2h,0c1h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c2h,0a3h,0a3h,0c1h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0c0h
	BYTE 0a2h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0c0h,0a2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a2h,0c0h,0a3h,0a3h,0a3h,0a2h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c1h,0a3h
	BYTE 0a3h,0a3h,0a2h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c1h,0a3h,0a3h,0a2h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c1h,0a3h,0a3h,0a3h,0c0h,0c2h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c1h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a2h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a2h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c1h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0a2h,0c1h,0a2h,0a3h,0a3h,0a3h,0c0h,0a2h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c2h,0a3h,0a3h,0a2h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a2h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0a3h,0a3h,0a3h,0c0h,0c1h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c1h,0c0h,0a2h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h
	BYTE 0c0h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0a3h,0a3h,0c0h
	BYTE 0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a2h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a2h,0c0h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c1h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c1h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c1h,0c0h,0a2h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c1h,0a3h,0a3h,0a3h
	BYTE 0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0a3h,0a3h,0a3h,0c0h,0c0h,0a2h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a2h,0a2h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h,0c0h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c1h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0c1h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0c1h,0a2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c2h,0a3h,0a3h,0a3h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c1h,0c1h,0c1h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a2h,0a2h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0c0h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a2h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c1h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c1h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c0h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0c0h,0c1h,0a3h,0a3h,0a3h,0c1h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c1h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h
	BYTE 0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c0h
	BYTE 0c0h,0c0h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c2h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h
	BYTE 0c0h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a2h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a2h,0c1h,0c0h,0c1h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0c0h,0c2h,0a2h,0c1h,0c0h
	BYTE 0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c1h,0a2h,0a3h,0a2h,0c0h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c1h,0c0h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h
	BYTE 0c1h,0c0h,0c0h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h,0c0h,0c1h,0c1h,0a2h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c1h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c2h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h
	BYTE 0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h,0c0h,0c1h,0a3h,0a3h,0a3h
	BYTE 0a2h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c2h
	BYTE 0a2h,0c1h,0c0h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c2h,0a2h,0c1h,0c0h,0c1h
	BYTE 0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c1h,0a2h,0a3h,0a2h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a2h,0c1h,0c0h,0c1h,0a2h,0a3h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a2h
	BYTE 0c1h,0c0h,0c1h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h,0c0h,0c0h,0c1h
	BYTE 0a2h,0a3h,0a3h,0a3h,0a3h,0a2h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c1h,0c0h,0c1h,0a2h,0a3h,0a2h,0c0h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h
	BYTE 0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a2h,0c1h,0c0h
	BYTE 0c1h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c2h,0a3h,0a3h,0a3h,0a3h,0a3h,0c2h,0c0h,0c0h,0c1h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a2h,0c1h,0c0h,0c0h,0c1h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c1h
	BYTE 0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0c1h,0c1h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0c0h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0c0h,0a2h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h
	BYTE 0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h,0a3h


bullet EECS205BITMAP <5, 5, 255,, offset bullet + sizeof bullet>
BYTE 0ffh,0ffh,0a3h,0ffh,0ffh,0ffh,0a3h,0c0h,0a3h,0ffh,0a3h,0c0h,0a3h,0c0h,0a3h,0ffh
BYTE 0a3h,0c0h,0a3h,0ffh,0ffh,0ffh,0a3h,0ffh,0ffh

bullet2 EECS205BITMAP <5, 5, 255,, offset bullet2 + sizeof bullet2>
BYTE 0ffh,0ffh,0a3h,0ffh,0ffh,0ffh,0c0h,0a3h,0c0h,0ffh,0a3h,0a3h,0c0h,0a3h,0a3h,0ffh
BYTE 0c0h,0a3h,0c0h,0ffh,0ffh,0ffh,0a3h,0ffh,0ffh


;; If you need to, you can place global variables here

BulletArchetype STRUCT
live DWORD ?
   x DWORD ? 
   y DWORD ?
   a DWORD ?
 dir DWORD ?
   t DWORD ?
BulletArchetype ENDS

bullets BulletArchetype <0,0,0,0,0,0>,<0,0,0,0,0,0>,<0,0,0,0,0,0>,<0,0,0,0,0,0>,<0,0,0,0,0,0>

EnemyStar STRUCT
live DWORD ?
time DWORD ?
   x DWORD ?
   y DWORD ?
 lvl DWORD ?
dead DWORD ?
EnemyStar ENDS

wave1 EnemyStar <0,0,-20,430,0,1>,<0,0,-20,430,0,1>,<0,0,-20,430,0,1>,<0,0,-20,430,0,1>,<0,0,660,430,0,1>,<0,0,660,430,0,1>,<0,0,660,430,0,1>,<0,0,660,430,0,1>,<0,0,-20,310,0,1>,<0,0,-20,310,0,1>,<0,0,-20,310,0,1>,<0,0,-20,310,0,1>,<0,0,660,310,0,1>,<0,0,660,310,0,1>,<0,0,660,310,0,1>,<0,0,660,310,0,1>

PlatformPos STRUCT
  y  DWORD ?
  x1 DWORD ?
  x2 DWORD ?
  x3 DWORD ?
  x4 DWORD ?
  x5 DWORD ?
  x6 DWORD ?
  x7 DWORD ?
  x8 DWORD ?
  x9 DWORD ?
 x10 DWORD ?
PlatformPos ENDS

platform1 PlatformPos <447,32,96,160,224,288,352,416,480,544,608>
platform2 PlatformPos <327,32,96,160,224,288,352,416,480,544,608>
platform3 PlatformPos <207,32,96,160,224,288,352,416,480,544,608>

ladder1x DWORD 416
ladder1y DWORD 385
ladder2x DWORD 224
ladder2y DWORD 265

DollarInfo STRUCT
    x DWORD ?
    y DWORD ?
    a DWORD ?
a_inc DWORD ?
    s DWORD ?
DollarInfo ENDS

pom_x      DWORD 300
pom_y      DWORD 400
pom_a      DWORD 1
pom_a_inc  DWORD 1
pom_a_ptr  DWORD OFFSET pomeranian1
pom_ladder DWORD 0
pom_ground DWORD 0
pom_reload DWORD 0
pom_d      DWORD 0

block_x DWORD 300
block_y DWORD 400

dollars DollarInfo <120,-10,1,1,1>, <200,-20,12,1,1>, <310,-50,14,-1,1>, <350,-10,12,1,1>, <510,-70,2,1,1>, <570,-40,6,1,1>,<50,-164,3,1,1>,<60,-69,7,-1,1>,<90,-40,12,-1,1>,<120,-40,2,1,1>,<140,-40,3,1,1>,<160,-40,9,1,1>,<200,-150,3,1,1>,<230,-140,14,1,1>,<260,-50,1,1,1>,<280,-250,2,1,1>,<300,-140,13,-1,1>,<330,-60,6,1,1>,<360,-40,9,1,1>,<370,-40,12,1,1>,<400,-140,7,1,1>,<430,-50,6,1,1>,<450,-200,13,1,1>,<475,-70,6,1,1>, <515,-140,9,1,1>,<560,-40,8,-1,1>,<599,-220,9,1,1>,<615,-70,6,1,1>,<293,-230,7,1,1>

dollarshower DWORD 0

paused DWORD 0

.CODE

;; Note: You will need to implement CheckIntersect!!!

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

CheckIntersect PROC USES ebx esi oneX:DWORD, oneY:DWORD, oneBitmap:PTR EECS205BITMAP, twoX:DWORD, twoY:DWORD, twoBitmap:PTR EECS205BITMAP
LOCAL oneXupper:DWORD, oneXlower:DWORD, oneYupper:DWORD, oneYlower:DWORD, twoXupper:DWORD, twoXlower:DWORD, twoYupper:DWORD, twoYlower:DWORD

    mov ebx, oneX
    mov oneXupper, ebx
    mov oneXlower, ebx
    mov esi, oneBitmap
    mov edx, (EECS205BITMAP PTR [esi]).dwWidth
    sar edx, 1
    add oneXupper, edx
    sub oneXlower, edx

    mov ebx, oneY
    mov oneYupper, ebx
    mov oneYlower, ebx
    mov edx, (EECS205BITMAP PTR [esi]).dwHeight
    sar edx, 1
    add oneYupper, edx
    sub oneYlower, edx

    mov ebx, twoX
    mov twoXupper, ebx
    mov twoXlower, ebx
    mov esi, twoBitmap
    mov edx, (EECS205BITMAP PTR [esi]).dwWidth
    sar edx, 1
    add twoXupper, edx
    sub twoXlower, edx

    mov ebx, twoY
    mov twoYupper, ebx
    mov twoYlower, ebx
    mov edx, (EECS205BITMAP PTR [esi]).dwHeight
    sar edx, 1
    add twoYupper, edx
    sub twoYlower, edx

leftcheck:
    mov ebx, oneXupper
    cmp ebx, twoXlower
    jl rightcheck
    cmp ebx, twoXupper
    jg rightcheck
 
bottomleftcheck:   
    mov ebx, oneYlower
    cmp ebx, twoYlower
    jl upperleftcheck
    cmp ebx, twoYupper
    jg upperleftcheck
    mov eax, 1
    jmp ree 

upperleftcheck:
    mov ebx, oneYupper
    cmp ebx, twoYlower
    jl rightcheck
    cmp ebx, twoYupper
    jg rightcheck 
    mov eax, 1
    jmp ree 

rightcheck:
    mov ebx, oneXlower  
    cmp ebx, twoXlower
    jl no_int
    cmp ebx, twoXupper
    jg no_int

bottomrightcheck:   
    mov ebx, oneYlower
    cmp ebx, twoYlower
    jl upperrightcheck
    cmp ebx, twoYupper
    jg upperrightcheck
    mov eax, 1
    jmp ree 

upperrightcheck:
    mov ebx, oneYupper 
    cmp ebx, twoYlower
    jl no_int
    cmp ebx, twoYupper
    jg no_int 
    mov eax, 1
    jmp ree 

no_int:
    mov eax, 0

ree:

    ret     ;; Do not delete this line!!
CheckIntersect ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; A


a_pom_1 PROC USES ebx edx
    
    mov ebx, pom_a
    cmp ebx, 9                           
    jge set_as_dec             

    cmp ebx, 0
    jle set_as_inc
    jmp iter

set_as_inc:
    mov pom_a_inc, 1
    jmp iter

set_as_dec:
    mov pom_a_inc, -1
            
iter:
    add ebx, pom_a_inc
    mov pom_a, ebx

one:
    cmp ebx, 3
    jg two
    mov pom_a_ptr, OFFSET pomeranian1
    jmp return
two:
    cmp ebx, 6
    jg three
    mov pom_a_ptr, OFFSET pomeranian2
    jmp return
three:
    cmp ebx, 9
    jg return
    mov pom_a_ptr, OFFSET pomeranian3

return:
    ret
a_pom_1 ENDP


a_pom_2 PROC USES ebx edx
    
    mov ebx, pom_a
    cmp ebx, 9                           
    jge set_as_dec             

    cmp ebx, 0
    jle set_as_inc
    jmp iter

set_as_inc:
    mov pom_a_inc, 1
    jmp iter

set_as_dec:
    mov pom_a_inc, -1
            
iter:
    add ebx, pom_a_inc
    mov pom_a, ebx

one:
    cmp ebx, 3
    jg two
    mov pom_a_ptr, OFFSET pomeranian4
    jmp return
two:
    cmp ebx, 6
    jg three
    mov pom_a_ptr, OFFSET pomeranian5
    jmp return
three:
    cmp ebx, 9
    jg return
    mov pom_a_ptr, OFFSET pomeranian6

return:
    ret
a_pom_2 ENDP

a_dol_1 PROC USES ebx edx ecx esi current_dollar:DWORD
    mov esi, current_dollar
    mov ebx, DWORD PTR [dollars+esi+8]  
    cmp ebx, 15                           
    jge set_as_dec             
    cmp ebx, 0
    jle set_as_inc
    jmp iter

set_as_inc:
    mov edx, 1
    mov DWORD PTR [dollars+esi+12], edx
    jmp iter

set_as_dec:
    mov edx, -1
    mov DWORD PTR [dollars+esi+12], edx
            
iter:
    mov edx, DWORD PTR [dollars+esi+12]  
    add ebx, edx
    mov DWORD PTR [dollars+esi+8], ebx

    mov edx, DWORD PTR [dollars+esi+8]  
one:
    cmp edx, 5
    jg two
    mov eax, OFFSET dollar1
    jmp return
two:
    cmp edx, 10
    jg three
    mov eax, OFFSET dollar2
    jmp return
three:
    cmp edx, 15
    jg return
    mov eax, OFFSET dollar3

return:
    ret
a_dol_1 ENDP


a_dol_2 PROC 

mov eax, OFFSET dollar3

return:
    ret
a_dol_2 ENDP

a_bul PROC USES ecx ebx currentbullet:DWORD
    mov ecx, currentbullet
    mov ebx, DWORD PTR [bullets+ecx+12]
    xor ebx, 1
    mov DWORD PTR [bullets+ecx+12], ebx

    cmp ebx, 0
    jne A
    mov eax, OFFSET bullet
    jmp B
  A:
    mov eax, OFFSET bullet2
  B:
    ret
a_bul ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; X


;EnemyStar STRUCT
;live DWORD ?
;time DWORD ?4
;   x DWORD ?8
;   y DWORD ?12
; lvl DWORD ?16
;EnemyStar ENDS

xy_wave PROC USES esi ebx ecx current:DWORD
    mov esi, current
    mov ebx, pom_x
    mov ecx, DWORD PTR [wave1+esi+8]
    sub ebx, ecx
    cmp ebx, 0
    jl A
    add ecx, 2
    jmp B
  A:
    sub ecx, 2
  B:
    mov DWORD PTR [wave1+esi+8], ecx
    
    ret
xy_wave ENDP


x_bul PROC USES ebx ecx edx currentbullet:DWORD
    mov ecx, currentbullet
    mov ebx, DWORD PTR [bullets+ecx+4]
    mov edx, DWORD PTR [bullets+ecx+16]
    add ebx, edx
    mov DWORD PTR [bullets+ecx+4], ebx
  ret
x_bul ENDP

x_pom_1 PROC USES ecx
    mov pom_d, 1
    mov ecx, pom_x
    add ecx, 9
    mov pom_x, ecx
    invoke a_pom_2
  ree:
    ret
x_pom_1 ENDP

x_pom_2 PROC USES ecx
    mov pom_d, 0
    mov ecx, pom_x
    sub ecx, 9
    mov pom_x, ecx
    invoke a_pom_1
  ree:
    ret
x_pom_2 ENDP

;xy_ast PROC USES edx ebx ecx
;
;    mov edx, OFFSET ladder
;    mov ebx, ast_x
;    mov ecx, ast_y
;    INVOKE BasicBlit, edx, ebx, ecx

;    mov ebx, MouseStatus.horiz
;    mov ecx, MouseStatus.vert
;    mov ast_x, ebx
;    mov ast_y, ecx

;    ret
;xy_ast ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Y

y_pom_1 PROC USES ecx
    mov ecx, pom_y
    add ecx, 5
    mov pom_y, ecx
    ret
y_pom_1 ENDP

y_pom_3 PROC USES ecx
    mov ecx, pom_y
    sub ecx, 5
    mov pom_y, ecx
    ret
y_pom_3 ENDP

y_pom_2 PROC USES ecx
    mov ecx, pom_y
    sub ecx, 10
    mov pom_y, ecx

    ret
y_pom_2 ENDP

y_pom_4 PROC USES ecx
    mov ecx, pom_y
    add ecx, 5
    mov pom_y, ecx

    ret
y_pom_4 ENDP


y_dol_1 PROC USES ecx esi current_dollar:DWORD

    mov esi, current_dollar
    mov ecx, DWORD PTR [dollars+esi+4]   
    inc ecx
    mov DWORD PTR [dollars+esi+4], ecx

    ret
y_dol_1 ENDP

y_dol_2 PROC USES ecx esi current_dollar:DWORD

    mov esi, current_dollar
    mov ecx, DWORD PTR [dollars+esi+4]   
    add ecx, 3
    mov DWORD PTR [dollars+esi+4], ecx

    ret
y_dol_2 ENDP


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; K



k_bul PROC uses ebx ecx esi
LOCAL bsize:DWORD, btotal:DWORD, bcurrent:DWORD 

    mov ebx, KeyPress
    cmp ebx, 20h
    jne ree

    mov ebx, pom_reload
    cmp ebx, 0
    jne ree

    mov ebx, 15
    mov pom_reload, ebx

;bcurrent = 0, bsize = # of bytes of one sprite, btotal = total # of bytes of array
    xor eax, eax
    mov bcurrent, eax
    mov ebx, LENGTHOF bullets
    mov ecx, SIZEOF bullets 
    mov btotal, ecx
    mov eax, btotal
    div ebx
    mov bsize, eax
  
;iterate through every bullet in the array
  loopi: 
;check loop condition
    mov esi, bcurrent
    mov ecx, btotal
    cmp esi, ecx
    jge ree

    mov ecx, DWORD PTR [bullets+esi]
    cmp ecx, 0
    jne next
    
    mov DWORD PTR [bullets+esi], 1
    mov ebx, pom_x
    mov DWORD PTR [bullets+esi+4], ebx
    mov ebx, pom_y
    mov DWORD PTR [bullets+esi+8], ebx

    mov ebx, pom_d
    cmp ebx, 0
    je A
    mov ebx, 5
    jmp B
  A:
    mov ebx, -5
  B:
    mov DWORD PTR [bullets+esi+16], ebx
    mov ebx, 50
    mov DWORD PTR [bullets+esi+20], ebx
    
    jmp ree

  next:
;iterate by adding bsize to bcurrent 
    mov eax, bcurrent
    add eax, bsize
    mov bcurrent, eax
    jmp loopi

ree:
    ret
k_bul ENDP


k_pom PROC USES ebx ecx
    mov ebx, KeyPress
    cmp ebx, 27h
    jne next1
    INVOKE x_pom_1
 next1:
    cmp ebx, 28h
    jne next2
    mov ecx, pom_ladder
    cmp ecx, 1
    jne ree
    INVOKE y_pom_4
  next2:
    cmp ebx, 26h
    jne next3
    mov ecx, pom_ladder
    cmp ecx, 1
    je up
    mov ecx, pom_ground
    cmp ecx, 1
    jne ree
  up:
    INVOKE y_pom_2
  next3: 
    cmp ebx, 25h
    jne ree
    INVOKE x_pom_2     
  ree:
    ret
k_pom ENDP
  
k_dol PROC USES ebx edx ecx esi edi
LOCAL dsize:DWORD, dtotal:DWORD, dcurrent:DWORD 

    mov ecx, KeyPress
    cmp ecx, 20h  
    jne return

;dcurrent = 0, dsize = # of bytes of one sprite, dtotal = total # of bytes of array
    xor eax, eax
    mov dcurrent, eax
    mov ebx, LENGTHOF dollars
    mov ecx, SIZEOF dollars 
    mov dtotal, ecx
    mov eax, dtotal
    div ebx
    mov dsize, eax

;iterate through every dollar in the array
  loopi: 
;check loop condition
    mov esi, dcurrent
    mov ecx, dtotal
    cmp esi, ecx
    jge return

    mov DWORD PTR [dollars+esi+16], 0

  iter:
;iterate by adding dsize to dcurrent 
    mov eax, dcurrent
    add eax, dsize
    mov dcurrent, eax
    jmp loopi

  return:
    ret
k_dol ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; C

;BulletArchetype STRUCT
;live DWORD ?
;   x DWORD ? 
;   y DWORD ?
;   a DWORD ?
; dir DWORD ?
;   t DWORD ?
;BulletArchetype ENDS

;EnemyStar STRUCT
;live DWORD ?
;time DWORD ?
;   x DWORD ?
;   y DWORD ?
; lvl DWORD ?
;dead DWORD ?
;EnemyStar ENDS

c_wave PROC USES ebx ecx edx edi esi current_enemy:DWORD
LOCAL current_bullet
    
    mov edi, 0
  checker:
    mov current_bullet, edi
    mov ebx, DWORD PTR [bullets+edi+4]
    mov ecx, DWORD PTR [bullets+edi+8]
    mov edi, current_enemy
    mov edx, DWORD PTR [wave1+edi+8]
    mov esi, DWORD PTR [wave1+edi+12]
    mov edi, OFFSET bullet2
    mov eax, OFFSET star
    INVOKE CheckIntersect, ebx, ecx, edi, edx, esi, eax
    cmp eax, 0
    je A
    mov edi, current_bullet
    mov DWORD PTR [bullets+edi], 0
    mov esi, current_enemy
    mov DWORD PTR [wave1+esi], 0
    mov DWORD PTR [wave1+esi+20], 0
    mov ebx, dollarshower
    inc ebx
    mov dollarshower, ebx
    jmp ree
  A:
    mov edi, current_bullet
    add edi, 20
    cmp edi, 90
    jl checker
    
  ree:
    ret
c_wave ENDP

c_wave2 PROC USES ebx ecx edx edi esi current_enemy:DWORD
    
    mov edi, current_enemy
    mov edx, DWORD PTR [wave1+edi+8]
    mov esi, DWORD PTR [wave1+edi+12]
    mov edi, OFFSET pomeranian1
    mov eax, OFFSET star
    INVOKE CheckIntersect, pom_x, pom_y, edi, edx, esi, eax
    cmp eax, 0
    je ree
    mov ebx, 300
    mov ecx, 250
    mov edx, OFFSET gameover
    INVOKE BasicBlit, edx, ebx, ecx
    mov ebx, 1
    mov paused, ebx
    
  ree:
    ret
c_wave2 ENDP

c_plat PROC USES ebx ecx edx esi edi
LOCAL pointr:DWORD, intersect:DWORD

    mov intersect, 0
    mov edi, 4
  plat1:
    mov pointr, edi
    mov ebx, DWORD PTR [platform1 + edi]
    mov edx, DWORD PTR [platform1]
    mov ecx, OFFSET platform
    mov eax, OFFSET pomeranian1
    INVOKE CheckIntersect, pom_x, pom_y, eax, ebx, edx, ecx
    mov esi, intersect
    or esi, eax
    mov intersect, esi
    mov edi, pointr
    add edi, 4
    cmp edi, 40
    jle plat1

    mov edi, 4
  plat2:
    mov pointr, edi
    mov ebx, DWORD PTR [platform2 + edi]
    mov edx, DWORD PTR [platform2]
    mov ecx, OFFSET platform
    mov eax, OFFSET pomeranian1
    INVOKE CheckIntersect, pom_x, pom_y, eax, ebx, edx, ecx
    mov esi, intersect
    or esi, eax
    mov intersect, esi
    mov edi, pointr
    add edi, 4
    cmp edi, 40
    jle plat2

    mov edi, 4
  plat3:
    mov pointr, edi
    mov ebx, DWORD PTR [platform3 + edi]
    mov edx, DWORD PTR [platform3]
    mov ecx, OFFSET platform
    mov eax, OFFSET pomeranian1
    INVOKE CheckIntersect, pom_x, pom_y, eax, ebx, edx, ecx
    mov esi, intersect
    or esi, eax
    mov intersect, esi
    mov edi, pointr
    add edi, 4
    cmp edi, 40
    jle plat3

    mov eax, intersect
    mov pom_ground, eax

    ret
c_plat ENDP


c_lad PROC USES ebx edx
LOCAL l1:DWORD, l2:DWORD

    mov ebx, OFFSET pomeranian1
    mov edx, OFFSET ladder
    INVOKE CheckIntersect, pom_x, pom_y, ebx, ladder1x, ladder1y, edx
    mov l1, eax

    mov ebx, OFFSET pomeranian1
    mov edx, OFFSET ladder
    INVOKE CheckIntersect, pom_x, pom_y, ebx, ladder2x, ladder2y, edx
    mov l2, eax 

    mov ebx, l1
    mov edx, l2
    or ebx, edx

    mov pom_ladder, ebx

  ree:
    ret
c_lad ENDP

c_dol PROC USES ebx edx ecx esi edi
LOCAL dsize:DWORD, dtotal:DWORD, dcurrent:DWORD 

;dcurrent = 0, dsize = # of bytes of one sprite, dtotal = total # of bytes of array
    xor eax, eax
    mov dcurrent, eax
    mov ebx, LENGTHOF dollars
    mov ecx, SIZEOF dollars 
    mov dtotal, ecx
    mov eax, dtotal
    div ebx
    mov dsize, eax
  
;iterate through every dollar in the array
  loopi: 
;check loop condition
    mov esi, dcurrent
    mov ecx, dtotal
    cmp esi, ecx
    jge return

    mov ebx, DWORD PTR [dollars+esi]
    mov ecx, DWORD PTR [dollars+esi+4]
    lea esi, pomeranian1
    lea edi, dollar1
    INVOKE CheckIntersect, ebx, ecx, edi, pom_x, pom_y, esi
    cmp eax, 0
    je iter
    mov esi, dcurrent
    mov DWORD PTR [dollars+esi+16], 0


  iter:
;iterate by adding dsize to dcurrent 
    mov eax, dcurrent
    add eax, dsize
    mov dcurrent, eax
    jmp loopi

  return:
    ret
c_dol ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; T

t_bul PROC USES ebx ecx currentbullet:DWORD

    mov ebx, currentbullet
    mov ecx, DWORD PTR [bullets+ebx+20]
    cmp ecx, 0
    jg A
    mov DWORD PTR [bullets+ebx], 0
    jmp B
  A:
    dec ecx
    mov DWORD PTR [bullets+ebx+20], ecx
  B:
    ret
t_bul ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; S

s_dol PROC USES ebx edx ecx esi
LOCAL dsize:DWORD, dtotal:DWORD, dcurrent:DWORD 

;dcurrent = 0, dsize = # of bytes of one sprite, dtotal = total # of bytes of array
    xor eax, eax
    mov dcurrent, eax
    mov ebx, LENGTHOF dollars
    mov ecx, SIZEOF dollars 
    mov dtotal, ecx
    mov eax, dtotal
    div ebx
    mov dsize, eax
  
;iterate through every dollar in the array
  loopi: 
;check loop condition
    mov esi, dcurrent
    mov ecx, dtotal
    cmp esi, ecx
    jge return

;move & animate dollar, and draw to screen

    mov ecx, DWORD PTR [dollars+esi+16]
    cmp ecx, 0
    jne s1

;dollar state 2
  s2:
    INVOKE y_dol_2, esi
    INVOKE a_dol_2
    mov edx, eax
    jmp draw

;dollar state 1
  s1:
    INVOKE y_dol_1, esi
    INVOKE a_dol_1, esi
    mov edx, eax

  draw:
    mov ebx, DWORD PTR [dollars+esi]
    mov ecx, DWORD PTR [dollars+esi+4]
    INVOKE BasicBlit, edx, ebx, ecx

;iterate by adding dsize to dcurrent 
    mov eax, dcurrent
    add eax, dsize
    mov dcurrent, eax
    jmp loopi

  return:
    ret
s_dol ENDP


s_bul PROC USES ebx edx ecx esi
LOCAL bsize:DWORD, btotal:DWORD, bcurrent:DWORD 

;bcurrent = 0, bsize = # of bytes of one sprite, btotal = total # of bytes of array
    xor eax, eax
    mov bcurrent, eax
    mov ebx, LENGTHOF bullets 
    mov ecx, SIZEOF bullets 
    mov btotal, ecx
    mov eax, btotal
    div ebx
    mov bsize, eax
  
;iterate through every bullet in the array
  loopi: 
;check loop condition
    mov esi, bcurrent
    mov ecx, btotal
    cmp esi, ecx
    jge return

    mov ecx, DWORD PTR [bullets+esi]
    cmp ecx, 0
    je next
    
    invoke t_bul, esi
    invoke x_bul, esi
    invoke a_bul, esi
   
    mov ebx, DWORD PTR [bullets+esi+4]
    mov edx, DWORD PTR [bullets+esi+8]
    
    invoke BasicBlit, eax, ebx, edx 

  next:
;iterate by adding bsize to bcurrent 
    mov eax, bcurrent
    add eax, bsize
    mov bcurrent, eax
    jmp loopi

  return:
    ret
s_bul ENDP

t_wave1 PROC USES ebx esi current:DWORD

    mov esi, current  
    mov ebx, DWORD PTR [wave1+esi+4]
    dec ebx
    cmp ebx, 0
    jge A
    mov ebx, 1
    mov DWORD PTR [wave1+esi], ebx
    jmp B
  A:
    mov DWORD PTR [wave1+esi+4], ebx
  B:
    ret
t_wave1 ENDP

s_wave1 PROC USES ebx edx ecx esi
LOCAL current:DWORD

    xor esi, esi
  D:  
    mov current, esi
    mov ebx, DWORD PTR [wave1+esi+20]
    cmp ebx, 0
    je B
    mov ebx, DWORD PTR [wave1+esi]
    cmp ebx, 0
    je A
    INVOKE xy_wave, esi
    INVOKE c_wave, esi
    INVOKE c_wave2, esi
    mov ebx, DWORD PTR [wave1+esi+8]
    mov ecx, DWORD PTR [wave1+esi+12]
    mov eax, OFFSET star
    INVOKE BasicBlit, eax, ebx, ecx
    jmp B
  A:
    invoke t_wave1, esi
  B:
    mov esi, current
    add esi, 24
    cmp esi, 384
    jl D

    ret
s_wave1 ENDP


s_wave_ PROC USES ebx ecx esi
LOCAL orguy:DWORD    

    xor esi, esi
    xor ebx, ebx

  checker:
    mov ebx, orguy
    mov ecx, DWORD PTR [wave1+esi+20]
    add ebx, ecx

    mov orguy, ebx
    add esi, 24
    cmp esi, 100
    jle checker

    cmp ebx, 0
    jne ree
    
    mov ecx, 1
    mov dollarshower, ecx

  ree:
    ret
s_wave_ ENDP

s_dol_ PROC USES ecx
    mov ecx, dollarshower
    cmp ecx, 16
    jne ree
    invoke s_dol
  ree:
    ret
s_dol_ ENDP

s_pom PROC USES ebx ecx edx

    ;invoke nrandom, 640
    ;mov pom_x, eax
    mov ebx, pom_reload
    cmp ebx, 0
    jle D
    dec ebx
    mov pom_reload, ebx
    mov ebx, OFFSET reloading
    mov ecx, pom_y
    sub ecx, 30
    INVOKE BasicBlit, ebx, pom_x, ecx

  D:
    mov ebx, pom_ground
    cmp ebx, 1
    jne A
    INVOKE y_pom_3
  A:
    INVOKE y_pom_1
  B:
    mov edx, pom_a_ptr
    mov ebx, pom_x
    mov ecx, pom_y
    INVOKE BasicBlit, edx, ebx, ecx
    ret
s_pom ENDP


DrawGame PROC USES ebx ecx edx esi edi
LOCAL pointr:DWORD

    mov ebx, OFFSET titlez
    mov ecx, 250
    mov edx, 100
    INVOKE BasicBlit, ebx, ecx, edx

    mov edi, 4
  plat1:
    mov pointr, edi
    mov ebx, DWORD PTR [platform1 + edi]
    mov edx, DWORD PTR [platform1]
    mov ecx, OFFSET platform
    INVOKE BasicBlit, ecx, ebx, edx
    mov edi, pointr
    add edi, 4
    cmp edi, 40
    jle plat1

    mov edi, 4
  plat2:
    mov pointr, edi
    mov ebx, DWORD PTR [platform2 + edi]
    mov edx, DWORD PTR [platform2]
    mov ecx, OFFSET platform
    INVOKE BasicBlit, ecx, ebx, edx
    mov edi, pointr
    add edi, 4
    cmp edi, 40
    jle plat2

    mov edi, 4
  plat3:
    mov pointr, edi
    mov ebx, DWORD PTR [platform3 + edi]
    mov edx, DWORD PTR [platform3]
    mov ecx, OFFSET platform
    INVOKE BasicBlit, ecx, ebx, edx
    mov edi, pointr
    add edi, 4
    cmp edi, 40
    jle plat3

  ladders:
    mov ebx, ladder1x
    mov ecx, ladder1y
    mov eax, OFFSET ladder
    INVOKE BasicBlit, eax, ebx, ecx
    mov ebx, ladder2x
    mov ecx, ladder2y
    mov eax, OFFSET ladder
    INVOKE BasicBlit, eax, ebx, ecx
    
    ret
DrawGame ENDP

p_game PROC USES ebx

    mov ebx, KeyPress
    cmp ebx, 50h
    jne ree

    mov ebx, paused
    xor ebx, 1 
    mov paused, ebx

  ree:
    ret
p_game ENDP


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; GAME

GameInit PROC 

    rdtsc
    invoke nseed, eax
    invoke nrandom, 640
    mov pom_x, eax


    xor esi, esi
  FillEnemies:
    
    invoke nrandom, 1000
    mov DWORD PTR [wave1+esi+4], eax

    add esi, 24
    cmp esi, 384
    jl FillEnemies

    INVOKE PlaySound, OFFSET schoolboy,0, SND_FILENAME OR SND_ASYNC OR SND_LOOP

	ret         ;; Do not delete this line!!!
GameInit ENDP



GamePlay PROC 

    invoke p_game

    mov eax, paused
    cmp eax, 0
    jne ree

    invoke BlackStarField
    invoke DrawGame
    invoke c_lad
    invoke c_plat
    invoke c_dol
    invoke s_bul
    invoke k_bul    
    invoke k_pom
    invoke s_pom
    invoke s_wave1
    invoke s_wave_
    invoke s_dol_
    
  ree:
	ret         ;; Do not delete this line!!!
GamePlay ENDP


END



