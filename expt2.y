%{
#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
int yylex();
int yyerror();
%}
%name parse
%token A B
%%
str:S'\n' {printf("Valid String\n");exit(0);}
;
S:A S
|B
;
%%
int main()
{

	printf("\nEnter the String:\n");
	yyparse();
	printf("\nValid Expression\n");

}
int yyerror()
{
	printf("\nInvalid String\n");
	exit(0);

}
int yywrap()
{


	return 1;

}


