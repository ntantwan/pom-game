; #########################################################################
;
;   lines.asm - Assembly file for EECS205 Assignment 2
;   by Nathan Antwan 
;

; #########################################################################

      .586
      .MODEL FLAT,STDCALL
      .STACK 4096
      option casemap :none  ; case sensitive

include stars.inc
include lines.inc

.DATA

	;; If you need to, you can place global variables here

	
.CODE
	

;; Don't forget to add the USES the directive here
;;   Place any registers that you modify (either explicitly or implicitly)
;;   into the USES list so that caller's values can be preserved


	
;;   For example, if your procedure uses only the eax and ebx registers
;;   DrawLine PROC USES eax ebx x0:DWORD, y0:DWORD, x1:DWORD, y1:DWORD, color:DWORD
DrawLine PROC USES eax ebx edx x0:DWORD, y0:DWORD, x1:DWORD, y1:DWORD, color:DWORD
	;; Feel free to use local variables...declare them here
	;; For example:
	;; 	LOCAL foo:DWORD, bar:DWORD
LOCAL delta_x:DWORD, delta_y:DWORD, inc_x:DWORD, inc_y:DWORD, curr_x:DWORD, curr_y: DWORD, error:DWORD, prev_error:DWORD	
	;; Place your code here

  mov eax, x1
  sub eax, x0
  cmp eax, 0
  jge A
  neg eax
A:mov delta_x, eax ; delta_x = abs(x1-x0)

  mov eax, y1
  sub eax, y0
  cmp eax, 0
  jge B
  neg eax
B:mov delta_y, eax ; delta_y = abs(y1-y0)

  mov eax, x0
  cmp eax, x1
  jge cc
  mov inc_x, 1 ; inc_x = 1
  jmp W
cc:mov inc_x, -1 ; inc_x = -1

W:mov eax, y0
  cmp eax, y1
  jge D
  mov inc_y, 1 ; inc_y = 1
  jmp X
D:mov inc_y, -1 ; inc_y = -1
  
X:mov eax, delta_x
  cmp eax, delta_y
  jle E
  mov edx, 0
  mov ebx, 2
  div ebx
  mov error, eax ; error = delta_x / 2
  jmp R

E:mov eax, delta_y
  mov edx, 0
  mov ebx, 2
  div ebx
  neg eax
  mov error, eax ; error = delta_y / 2
  
R:mov eax, x0
  mov curr_x, eax ; curr_x = x0

  mov eax, y0
  mov curr_y, eax ; curry_y = y0

  invoke DrawPixel, curr_x, curr_y, color

F:mov eax, curr_x 
  cmp eax, x1
  je I
  mov eax, curr_y
  cmp eax, y1
  je I ; while statement...
  
  invoke DrawPixel, curr_x, curr_y, color
  
  mov eax, error
  mov prev_error, eax ; prev_error = error
  
  mov eax, delta_x
  neg eax
  cmp eax, prev_error
  jge G

  mov eax, error
  sub eax, delta_y
  mov error, eax ; error = error - delta_y
  
  mov eax, curr_x
  add eax, inc_x
  mov curr_x, eax ; curr_x = curr_x + inc_x
  
G:mov eax, delta_y
  cmp eax, prev_error
  jle H

  mov eax, error
  add eax, delta_x
  mov error, eax ; error = error + delta_x
  
  mov eax, curr_y
  add eax, inc_y
  mov curr_y, eax ; curr_y = curr_y + inc_y

H:jmp F

I:ret







  







  







  



  

       	;;  Don't delete this line...you need it
DrawLine ENDP




END
