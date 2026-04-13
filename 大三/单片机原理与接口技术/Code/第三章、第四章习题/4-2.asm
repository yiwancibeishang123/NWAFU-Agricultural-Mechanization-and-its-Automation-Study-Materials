   	   ORG 0
START: 
       MOV DPTR, #1000H
       MOV R0, #30H
       MOV R7, #20
	   MOV A,#0
	 

LOOP:  
       MOVC A, @A+DPTR
       MOVX @R0, A
       INC DPTR
       INC R0
	   CLR A
       DJNZ R7, LOOP
     
	   ORG 1000H
	   DB 10,11,15,16
	   END