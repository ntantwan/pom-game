; #########################################################################
;
;   blit.asm - Assembly file for EECS205 Assignment 3
;   by Nathan Antwan
;
; #########################################################################

      .586
      .MODEL FLAT,STDCALL
      .STACK 4096
      option casemap :none  ; case sensitive

include stars.inc
include lines.inc
include trig.inc
include blit.inc


.DATA

	;; If you need to, you can place global variables here
	
.CODE

DrawPixel PROC USES ecx edx x:DWORD, y:DWORD, color:DWORD
	
      cmp x, 0	; checking to make sure pixel is within bounds of display
	jl fin
	cmp y, 0
	jl fin    
	cmp x, 640
	jge fin
	cmp y, 480
	jge fin
	mov ecx, color
	mov eax, y	
	mov edx, 640	
	mul edx         ;multiply by 640 to get to correct row number of display 
	add eax, ScreenBitsPtr
      add eax, x      ;add x to get to correct spot. and add the ScreenBitsPtr
	mov BYTE PTR[eax], cl;
fin:
	ret 			; Don't delete this line!!!
DrawPixel ENDP



BasicBlit PROC USES ebx ecx edx esi  ptrBitmap:PTR EECS205BITMAP , xcenter:DWORD, ycenter:DWORD
LOCAL transparent:BYTE, x_curr:DWORD, wdth:DWORD, y_curr:DWORD, hght:DWORD, i:DWORD, j:DWORD, ptr_inc:DWORD

	mov esi, ptrBitmap

	mov bl, (EECS205BITMAP PTR[esi]).bTransparent
	mov transparent, bl

	mov edx, (EECS205BITMAP PTR[esi]).dwWidth   ; make x_curr equal to the top left point of the pic
	mov wdth, edx
	sar edx, 1                                   ; make wdth equal to the width of the pic
	mov ebx, xcenter
	mov x_curr, ebx
	sub x_curr, edx 

	mov edx, (EECS205BITMAP PTR[esi]).dwHeight
	mov hght, edx
	sar edx, 1                                  ; same thing for y 
	mov ebx, ycenter
	mov y_curr, ebx
	sub y_curr, edx

	mov i, 0
	mov j, 0
	mov ptr_inc, 0

fillRow:
	mov eax, wdth
      cmp i, eax                                      ; basically going to fill up a row
	jge nextRow                               ;going to make sure our i counter isnt greater than wdth
                                            ;if it is, go to NextRow
	                       
	           mov eax, (EECS205BITMAP PTR[esi]).lpBytes
	mov ecx, ptr_inc
	mov bl, BYTE PTR [eax + ecx]               ;call the next pixel with the base plus the counter (ecx)
	mov dl, transparent
	cmp bl, dl                                 ; if its the transparent color do not call DrawPixel
	je increment

	invoke DrawPixel, x_curr, y_curr, BYTE PTR [eax + ecx]

increment:
	inc i
	inc x_curr                             ; increment our counter, current pixel, and pointer inc 
	inc ptr_inc

	jmp fillRow                            ; go back to fill row for some more row filling 

nextRow:
	inc y_curr                     ; since we have now drawn a full row, we need to skip to the next one
	inc j                      ; increment our current pixel and our counter
	
      mov eax, hght
	cmp j, eax                 ;lets make sure we're not at the last row. that would mean we're done!
	jge fin
	
      mov eax, wdth
	sub x_curr, eax            ;we have to reset our i counter to 0 so it can recount to 640 
	mov i, 0
 	jmp fillRow               ; and .. on to the next row....

fin:

	ret 			; Don't delete this line!!!	

BasicBlit ENDP


RotateBlit PROC USES ecx edx ebx esi edi  lpBmp:PTR EECS205BITMAP, xcenter:DWORD, ycenter:DWORD, angle:FXPT
	LOCAL x_curr:DWORD, y_curr:DWORD, transparent:BYTE, cosa:DWORD, sina:DWORD, shiftX:DWORD, shiftY:DWORD, dstWidth:DWORD, dstHeight:DWORD, dstX:DWORD, dstY:DWORD, srcX:DWORD, srcY:DWORD
	
	
	invoke FixedCos, angle
	mov cosa, eax				;making cosa
	
	invoke FixedSin, angle	
	mov sina, eax				;making sina
	
	mov esi, lpBmp
	mov cl, (EECS205BITMAP PTR [esi]).bTransparent		;set transparent color variable
	mov transparent, cl		

	mov eax, (EECS205BITMAP PTR [esi]).dwWidth	;first half of shiftX
	imul cosa
	mov shiftX, eax
	sar shiftX, 1			
	
        mov eax, (EECS205BITMAP PTR [esi]).dwHeight
	imul sina
	sar eax, 1					;subtracting second part of shiftX
	sub shiftX, eax			
	
	mov eax, (EECS205BITMAP PTR [esi]).dwHeight
	imul cosa
	mov shiftY, eax					;first part of shiftY
	sar shiftY, 1
	
        mov eax, (EECS205BITMAP PTR [esi]).dwWidth
	imul sina					;adding second part of shiftX
	sar eax, 1
	add shiftY, eax 
							
	mov eax, (EECS205BITMAP PTR [esi]).dwWidth
	add eax, (EECS205BITMAP PTR [esi]).dwHeight	;set width and height
	mov dstWidth, eax		
	mov dstHeight, eax
	
	neg eax
	mov dstX, eax					;get variables ready for loop...
	mov dstY, eax		
	sar shiftY, 16		
	sar shiftX, 16

	jmp loop_x_check				;first loop time

for_y:	
	mov eax, dstX	
	imul cosa
	mov srcX, eax					;set srcX
	mov eax, dstY
	imul sina
	add srcX, eax
	sar srcX, 16	
	
	mov eax, dstY
	imul cosa
	mov srcY, eax					;set srcY
	mov eax, dstX
	imul sina
	sub srcY, eax		
	sar srcY, 16
	
	cmp srcX, 0		
	jl loop_y_inc
	mov eax, (EECS205BITMAP PTR [esi]).dwWidth	;beginning all of the if-conditions
	cmp srcX, eax		
	jge loop_y_inc
	
	cmp srcY, 0			
	jl loop_y_inc
	
	mov eax, (EECS205BITMAP PTR [esi]).dwHeight
	cmp srcY, eax		
	jge loop_y_inc

	mov eax, xcenter
	add eax, dstX
	sub eax, shiftX
	cmp eax, 0
	jl loop_y_inc		
	
	mov eax, xcenter
	add eax, dstX
	sub eax, shiftX
	cmp eax, 639
	jge loop_y_inc		

	mov eax, ycenter
	add eax, dstY
	sub eax, shiftY
	cmp eax, 0
	jl loop_y_inc		

	mov eax, ycenter
	add eax, dstY
	sub eax, shiftY
	cmp eax, 479
	jge loop_y_inc		

	mov eax, (EECS205BITMAP PTR [esi]).dwWidth
	mov edx, srcY				
	imul edx					
	add eax, srcX
	add eax, (EECS205BITMAP PTR [esi]).lpBytes
	mov dl, BYTE PTR [eax]
	cmp dl, transparent					;finishing up all the if conditions
	je loop_y_inc
	
	mov ebx, xcenter		
	add ebx, dstX
	sub ebx, shiftX
	mov x_curr, ebx					;creating x_curr and y_curr to DrawPixel
	mov ebx, ycenter
	add ebx, dstY
	sub ebx, shiftY
	mov y_curr, ebx
	invoke DrawPixel, x_curr, y_curr, BYTE PTR [eax]
loop_y_inc:
	inc dstY					;run through y iterator if got through everything

loop_y_check:
	mov ebx, dstY
	cmp ebx, dstHeight				;check inner loop condition
	jl for_y
	
	inc dstX					;run through x iterator if got through 

loop_x_check:
        mov ebx, dstHeight
	neg ebx
        mov dstY, ebx					;check outer loop condition
	mov ebx, dstX
	cmp ebx, dstWidth
	jl loop_y_check

	ret 			; Don't delete this line!!!		
RotateBlit ENDP

END



