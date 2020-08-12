; #########################################################################
;
;   trig.asm - Assembly file for EECS205 Assignment 3
;   by Nathan Antwan
;
; #########################################################################

      .586
      .MODEL FLAT,STDCALL
      .STACK 4096
      option casemap :none  ; case sensitive

include trig.inc

.DATA

;;  These are some useful constants (fixed point values that correspond to important angles)
PI_HALF = 102943                	            ;;  PI / 2
PI =  205887                  	                ;;  PI 
TWO_PI	= 411774                ;;  2 * PI 
PI_INC_RECIP =  5340353        	;;  Use reciprocal to find the table entry for a given angle
   	                                    ;;                               (It is easier to use than divison would be)


	;; If you need to, you can place global variables here
.CODE

FixedSin PROC USES ebx ecx edx angle:FXPT
LOCAL n:DWORD

	mov eax, angle
	mov ebx, PI_INC_RECIP
	mov n, 0
    
	cmp eax, 0           ; check if angle is 0
	je Z
	cmp eax, PI_HALF     ; check if angle is pi-half
	jne N
	mov eax, 1
	sal eax, 16
	jmp q0

Z:	mov eax, 0
	jmp q0


N:
	cmp eax, 0          ; negative angles 
	jge q4
	add eax, TWO_PI
	jmp N

q4:
	cmp eax, TWO_PI     ; subtract two pi until angle is under two pi
	jl q3
	sub eax, TWO_PI
	jmp q4

q3:   
	cmp eax, PI          ; if angle is within pi-2pi range, adjust the negative
	jl q2                ; flag so program knows to negate answer 
	sub eax, PI
	xor n, 1               ; and its also just subtracting pi, like above
	jmp q3

q2:
	cmp eax, PI_HALF
	jl q1                        ; for angles between pi/2 and pi, need to reverse chart ptr
	mov ecx, PI
	sub ecx, eax
	mov eax, ecx
q1:
	imul ebx          
	shl edx, 1                     ; time to go reference the chart.. ha ha 
	movzx eax, WORD PTR [SINTAB + edx]
	
	cmp n, 0
	je q0                       ; if the neg flag was on we're going to negate it
	neg eax    


q0:

	ret			; Don't delete this line!!!
FixedSin ENDP 
	
	
FixedCos PROC USES ebx angle:FXPT
	mov ebx, angle		; call the sine function, but shifted by pi/2
	add ebx, PI_HALF           
	invoke FixedSin, ebx
	ret			; Don't delete this line!!!	
FixedCos ENDP	


END
