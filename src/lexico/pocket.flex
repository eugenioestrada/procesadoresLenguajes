package lexico;
import static lexico.Tokens.*;

%%

%class Scanner
%type Tokens
%{
public String lexema;
%}
letra = [a-zA-Z]
digito = [0-9]
espacio = [ ,\t,\r,\n]

%%

"+" { return TOK_MAS; }
"-" { return TOK_MENOS; }
"*" { return TOK_ASTERISCO; }
"/" { return TOK_DIVISION; }
"=" { return TOK_ASIGNACION; }
";" { return TOK_PUNTOYCOMA; }
"," { return TOK_COMA; }

"(" { return TOK_PARENTESISIZQUIERDO; }
")" { return TOK_PARENTESISDERECHO; }
"{" { return TOK_LLAVEIZQUIERDA; }
"}" { return TOK_LLAVEDERECHA; }

"&&" { return TOK_AND; }
"||" { return TOK_OR; }
"!" { return TOK_NOT; }
"==" { return TOK_IGUAL; }
"!=" { return TOK_DISTINTO; }
"<=" { return TOK_MENORIGUAL; }
">=" { return TOK_MAYORIGUAL; }
"<" { return TOK_MENOR; }
">" { return TOK_MAYOR; }

"printf" { return TOK_PRINTF; }
"scanf" { return TOK_SCANF; }
"main" { return TOK_MAIN; }
 "int" { return TOK_INT; }
 "boolean" { return TOK_BOOLEAN; }
 "if" { return TOK_IF; }
 "else" { return TOK_ELSE; }
 "while" { return TOK_WHILE; }

 "true" { return TOK_TRUE; }
 "false" { return TOK_FALSE; }

{letra}({letra}|{digito})* { lexema = yytext(); return TOK_IDENTIFICADOR; }
{digito}+ { lexema = yytext(); return TOK_CONSTANTE_ENTERA; }
{espacio}+ { }
"//".* { }
. { return TOK_ERROR; }