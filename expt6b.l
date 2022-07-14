%{
#include<stdio.h>
#include"y.tab.h"
extern int yylval;
%}

%%
[ \t] ;
[+|-|*|/|=|<|>] {printf("%s is an opertaor\n",yytext);return OP;}
[0-9]+ {return DIGIT;}
int |
char |
boo |
float |
void |
for |
do |
while |
if |
esle |
return |
main {printf("%s is keyword\n",yytext);return KEY;}
[a-zA-Z][a-zA-Z0-9]* {printf("%s is an identifier\n",yytext);return ID;}
. ;
%%


