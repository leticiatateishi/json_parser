
%{
#include <stdlib.h>
void yyerror();

#include "y.tab.h"

%}


%%


(-?[0-9]+) {
		return INTEIRO;
}

([-]?[0-9]+[.][0-9]+) {
		return FLOAT;
}

[{]	{
 		return ABRE_CHAVES;
 	}

[}] {
 		return FECHA_CHAVES;
 	}

[[] {
 		return ABRE_COLCHETES;
 }

[]] {
 		return FECHA_COLCHETES;
 }


(\"[^\"]*\") {
		return STRING;
}


[,] {
		return VIRGULA;
}

[:] {
		return PONTOS;
}


[ \t\n]* ;

.     {yyerror();}

%%

int yywrap() {
  return 1;
}
