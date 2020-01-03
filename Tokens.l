%option noyywrap
%{
#include <stdlib.h>
#include <stdio.h>
#include "y.tab.h"
%}
blancs [ \t]+
chif [0-9]
let [a-z|A-Z]
entier {chif}+
id {let}(_?({let}|{chif})+)*

%%
"Set"		{return(MRSET);}
"Get"		{return(MRGET);}
"From"		{return(MRFROM);}
"Snl_Int" {return(MRINT);}
"Snl_Real" {return(MRREEL);}
"%." {return(FINIST);}
"," {return(VIR);}
"\n" {return(FINLIGNE);}
{blancs} {/* On l'ignore */}
{id} {return(IDENT); }
{entier}	{return(INT);}
. {yyerror(); }
%%