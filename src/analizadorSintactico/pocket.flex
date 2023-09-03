package analizadorSintactico;
import java_cup.runtime.*;

%%

%cup

%line
%column
%{

	public int linea() { return yyline; }
	public int columna() {return yycolumn;}

%}
%{
public String lexema;
%}
letra = [a-zA-Z]
digito = [0-9]
espacio = [ \t\r\n]

%%

/* Palabras reservadas */

"main" { return new Symbol(sym.TOK_MAIN); }
"int" { return new Symbol(sym.TOK_INT); }
"boolean" { return new Symbol(sym.TOK_BOOLEAN); }
"if" { return new Symbol(sym.TOK_IF); }
"else" { return new Symbol(sym.TOK_ELSE); }
"while" { return new Symbol(sym.TOK_WHILE); }
"printf" { return new Symbol(sym.TOK_PRINTF); }
"scanf" { return new Symbol(sym.TOK_SCANF); }

/* Símbolos de puntuación y especiales */

"{" { return new Symbol(sym.TOK_LLAVEIZQUIERDA); }
"}" { return new Symbol(sym.TOK_LLAVEDERECHA); }
"(" { return new Symbol(sym.TOK_PARENTESISIZQUIERDO); }
")" { return new Symbol(sym.TOK_PARENTESISDERECHO); }
"," { return new Symbol(sym.TOK_COMA); }
";" { return new Symbol(sym.TOK_PUNTOYCOMA); }

/* Operadores */

"+" { return new Symbol(sym.TOK_MAS); }
"-" { return new Symbol(sym.TOK_MENOS); }
"/" { return new Symbol(sym.TOK_DIVISION); }
"*" { return new Symbol(sym.TOK_ASTERISCO); }
"&&" { return new Symbol(sym.TOK_AND); }
"||" { return new Symbol(sym.TOK_OR); }
"!" { return new Symbol(sym.TOK_NOT); }
"=" { return new Symbol(sym.TOK_ASIGNACION); }
"==" { return new Symbol(sym.TOK_IGUAL); }
"!=" { return new Symbol(sym.TOK_DISTINTO); }
"<=" { return new Symbol(sym.TOK_MENORIGUAL); }
">=" { return new Symbol(sym.TOK_MAYORIGUAL); }
"<" { return new Symbol(sym.TOK_MENOR); }
">" { return new Symbol(sym.TOK_MAYOR); }

/* Identificadores y constantes */

"true" { return new Symbol(sym.TOK_TRUE); }
"false" { return new Symbol(sym.TOK_FALSE); }

{letra}({letra}|{digito})* {
    lexema = yytext();
    if (yylength() > 100) {
        System.out.println("****ERROR MORFROLÓGICO EN [lin " + linea() + ", col " + columna() + "]: IDENTIFICADOR DEMASIADO LARGO (" + lexema + ")");
        return new Symbol(sym.TOK_ERROR);
    }
    else {
        return new Symbol(sym.TOK_IDENTIFICADOR);
    }
}
{digito}+ { lexema = yytext(); return new Symbol(sym.TOK_CONSTANTE_ENTERA); }

/* Eliminación de espacios */

{espacio}+ { }

/* Eliminación de comentarios */

"//".* { }

/* Resto de carácteres (No permitidos) */

. {
    System.out.println("****ERROR MORFROLÓGICO EN [lin " + linea() + ", col " + columna() + "]: CARÁCTER NO PERMITIDO (" + yytext() + ")");
    return new Symbol(sym.TOK_ERROR);
}