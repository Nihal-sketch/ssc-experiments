%{
#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
int yylex();
int yyerror();
%}
%name parse
%token NUM
%left '+''-'
%left '*''/'
%%
expr:e { printf("Result:%d\n",$$); return 0; }
 ;
e:e'+'e {$$=$1+$3;}
| e'-'e {$$=$1-$3;}
| e'*'e {$$=$1*$3;}
| e'/'e {$$=$1/$3;}
| '('e')'{$$=$2;}
| NUM {$$=$1;}
;

%%
int main()
{

	printf("\nEnter the Arithmetic Expression:\n");
	yyparse();
	printf("\nValid Expression\n");

}
int yyerror()
{
	printf("\nInvalid Expression\n");
	exit(0);

}
int yywrap()
{


	return 1;

}





