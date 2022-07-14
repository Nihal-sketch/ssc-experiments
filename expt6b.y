%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror();
extern int yylex();
extern FILE *yyin;
int id=0,dig=0,key=0,op=0;
%}
 
%name parse
%token DIGIT ID KEY OP
%%
input:input DIGIT {dig++;}
| input ID {id++;}
| input KEY {key++;}
| input OP {op++;}
| DIGIT {dig++;}
| KEY {key++;}
| OP {op++;}
;
%%
int main(int argc,char* argv[])
{
	if(argc==2)
        {
          yyin=fopen(argv[1],"r");
}
	else
	{
	printf("Enter the input\n");
	exit(0);
}
yyparse();
	printf("\nNumbers=%d",dig);
	printf("\nKeywords=%d",key);
	printf("\nIdentifier=%d",id);
	printf("\nOpertator=%d\n",op);
}
int yyerror()
{
	printf("Parse Error!");
	exit(0);
}
int yywrap()
{
	return 1;
}




