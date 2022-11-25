%{
    /* Declaration Section */

%}

/* Definition section */
WHITESPACE ("\t"|" ")
NEWLINE \n
REAL -?[0-9]+\.[0-9]+
INTEGER -?[0-9]+
STRING \".*\"
COMMENT \/\/.*
KEYWORD ("while"|"int"|"for"|"return"|"cout"|"cin")
SEPARATOR ("("|")"|"{"|"}"|"["|"]")
OPERATOR ("+"|"-"|"*"|"/"|"<"|">"|"="|"=="|"!="|">="|"<="|"<<"|">>"|"%"|"++"|"--"|"&&"|"||"|"!"|".")
IDENTIFIER [a-zA-Z]+
PUNCUATION (";"|",")

/* Rules section */
%%
{WHITESPACE} {}
{NEWLINE} {}
{REAL} {fprintf(yyout,"Real\t\t\t%s\n", yytext);}
{INTEGER} {fprintf(yyout,"Integer\t\t\t%s\n", yytext);}
{STRING} {fprintf(yyout,"String\t\t\t%s\n", yytext);}
{COMMENT} {fprintf(yyout,"Comment\t\t\t%s\n", yytext);}
{KEYWORD} {fprintf(yyout,"Keyword\t\t\t%s\n", yytext);}
{SEPARATOR} {fprintf(yyout,"Separator\t\t\t%s\n", yytext);}
{OPERATOR} {fprintf(yyout,"Operator\t\t\t%s\n", yytext);}
{IDENTIFIER} {fprintf(yyout,"Identifier\t\t\t%s\n", yytext);}
{PUNCUATION} {fprintf(yyout,"Puncuation\t\t\t%s\n", yytext);}
. {fprintf(yyout,"Invalid\t\t\t%s\n", yytext);}
%%
/* User routines section */

int yywrap(void) { return 1; }

int main() {
    yyin = fopen("input_sourcecode.txt", "r");
    yyout = fopen("output.txt", "w");

    printf("Will be reading from text file and dumped into another\n");
    fprintf(yyout, "token\t\t\tlexeme\n");
    fprintf(yyout, "-------------------------------\n");

    yylex();

    printf("Your file has been written\n");
    
    fclose(yyin);
    fclose(yyout);

    system("pause");
    return 0;
}