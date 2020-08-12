; #########################################################################
;
;   stars.asm - Assembly file for EECS205 Assignment 1
;
;
; #########################################################################

      .586
      .MODEL FLAT,STDCALL
      .STACK 4096
      option casemap :none  ; case sensitive


include stars.inc

.DATA

	;; If you need to, you can place global variables here

.CODE

DrawStarField proc

  	invoke DrawStar, 50, 50
      invoke DrawStar, 150, 20
      invoke DrawStar, 500, 40
      invoke DrawStar, 400, 160
      invoke DrawStar, 75, 134
      invoke DrawStar, 159, 408
      invoke DrawStar, 538, 273
      invoke DrawStar, 610, 250
      invoke DrawStar, 600, 50
      invoke DrawStar, 250, 204
      invoke DrawStar, 400, 30
      invoke DrawStar, 400, 200
      invoke DrawStar, 73, 144
      invoke DrawStar, 169, 28
      invoke DrawStar, 58, 73
      invoke DrawStar, 610, 470


	ret  			; Careful! Don't remove this line
DrawStarField endp



END
