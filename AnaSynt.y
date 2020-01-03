%{
#include <stdio.h>
#include <stdlib.h>
%}
%token IDENT MRINT FINIST FINLIGNE VIR MRREEL 
%token MRSET MRGET MRFROM INT
%start Input
%%
Input:
/* Vide */ | Input Ligne ;
Ligne:
FINLIGNE
| Declaration FINLIGNE {
if ($1==1)
printf("Declation d'entier(s) \n");
else
printf("Declaration de reel(s) \n");
}
| Affectation FINLIGNE {
if ($1==1)
printf("Affectation d une valeur à une variable \n");
else
printf("Affectation d une variable à une autre\n");
}
| error FINLIGNE {yyerrok;} ;
Declaration:
MRINT Identificateurs FINIST { $$ = 1;}
| MRREEL Identificateurs FINIST { $$ = 2;};
Affectation:
MRSET IDENT INT FINIST { $$ = 1;}
| MRGET IDENT MRFROM IDENT FINIST { $$ = 2;};
Identificateurs : A IDENT ;
A : /* vide */ | Identificateurs VIR ;
%%
int yyerror(char *s) {
printf("Erreur syntaxique\n\n");
return 1;
}
int main(void) {yyparse();}