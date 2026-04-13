       ORG 0
       MOV R0,#40H;
       MOV A,#0FFH;
       ANL A,#81H;
	   XRL A,#0;
	   MOV @R0,A;
	   END