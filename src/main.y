

%{
#include <stdio.h>
#include <stdlib.h>
void yyerror();
int yylex(void);
int flag = 0;
%}


%token ABRE_CHAVES FECHA_CHAVES ABRE_COLCHETES FECHA_COLCHETES INTEIRO FLOAT STRING VIRGULA PONTOS

%%

PROGRAMA:
	OBJETO {
		if (flag == 0)
			printf("VALIDO\n");
	}
	;

OBJETO:
	ABRE_CHAVES MEMBROS FECHA_CHAVES
	; 

MEMBROS:
	MEMBRO VIRGULA MEMBROS
	| MEMBRO
	|
	;

MEMBRO:
	STRING PONTOS VALOR
	;

VETOR:
	ABRE_COLCHETES VALORES FECHA_COLCHETES
	| ABRE_COLCHETES FECHA_COLCHETES
	;


VALORES:
	VALOR
	| VALOR VIRGULA VALORES
	;

VALOR:
	  STRING
	| INTEIRO
	| FLOAT
	| OBJETO
	| VETOR
	;


%%

void yyerror() {
	if (flag == 0){
		printf("INVALIDO\n");
		flag = 1;
	}

}

int main() {
  	yyparse();
  	return 0;

}
