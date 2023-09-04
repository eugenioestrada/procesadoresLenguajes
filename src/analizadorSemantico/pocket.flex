package analizadorSemantico;

import java_cup.runtime.*;
import java.io.Writer;
import java.io.IOException;
import java.io.BufferedWriter;
import java.io.FileWriter;

%%

%cup

%eofval{
    return new Symbol(sym.EOF, linea(), columna());
%eofval}

%line
%column
%{
    public String lexema;
	public int linea() { return yyline + 1; }
	public int columna() { return yycolumn + 1; }

    private void writeln(String str) {
        Writer writer;
        try {
             writer = new BufferedWriter(new FileWriter("sinout.txt", true));
             writer.write(str + "\n");
             writer.close();
        } catch (IOException e) {
             System.out.println(e.getMessage());
        }
    }
%}

letra = [a-zA-Z]
digito = [0-9]
espacio = [ \t\r\n]

%%

/* Palabras reservadas */

"main" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_MAIN, linea(), columna()); }
"int" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_INT, linea(), columna()); }
"boolean" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_BOOLEAN, linea(), columna()); }
"if" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_IF, linea(), columna()); }
"else" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_ELSE, linea(), columna()); }
"while" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_WHILE, linea(), columna()); }
"printf" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_PRINTF, linea(), columna()); }
"scanf" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_SCANF, linea(), columna()); }

/* Símbolos de puntuación y especiales */

"{" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_LLAVEIZQUIERDA, linea(), columna()); }
"}" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_LLAVEDERECHA, linea(), columna()); }
"(" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_PARENTESISIZQUIERDO, linea(), columna()); }
")" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_PARENTESISDERECHO, linea(), columna()); }
"," { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_COMA, linea(), columna()); }
";" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_PUNTOYCOMA, linea(), columna()); }

/* Operadores */

"+" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_MAS, linea(), columna()); }
"-" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_MENOS, linea(), columna()); }
"/" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_DIVISION, linea(), columna()); }
"*" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_ASTERISCO, linea(), columna()); }
"&&" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_AND, linea(), columna()); }
"||" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_OR, linea(), columna()); }
"!" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_NOT, linea(), columna()); }
"=" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_ASIGNACION, linea(), columna()); }
"==" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_IGUAL, linea(), columna()); }
"!=" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_DISTINTO, linea(), columna()); }
"<=" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_MENORIGUAL, linea(), columna()); }
">=" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_MAYORIGUAL, linea(), columna()); }
"<" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_MENOR, linea(), columna()); }
">" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_MAYOR, linea(), columna()); }

/* Identificadores y constantes */

"true" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_TRUE, linea(), columna()); }
"false" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_FALSE, linea(), columna()); }

{letra}({letra}|{digito})* {
    lexema = yytext();
    if (yylength() > 100) {
        System.out.println("****ERROR MORFROLÓGICO EN [lin " + linea() + ", col " + columna() + "]: IDENTIFICADOR DEMASIADO LARGO (" + lexema + ")");
        return new Symbol(sym.TOK_ERROR, linea(), columna());
    }
    else {
        writeln(";D:\t" + lexema);
        return new Symbol(sym.TOK_IDENTIFICADOR, linea(), columna());
    }
}
{digito}+ {
    lexema = yytext();
    writeln(";D:\t" + lexema);
    return new Symbol(sym.TOK_CONSTANTE_ENTERA, linea(), columna());
}

/* Eliminación de espacios */

{espacio}+ { }

/* Eliminación de comentarios */

"//".* { }

/* Resto de carácteres (No permitidos) */

. {
    System.out.println("****ERROR MORFROLÓGICO EN [lin " + linea() + ", col " + columna() + "]: CARÁCTER NO PERMITIDO (" + yytext() + ")");
    return new Symbol(sym.TOK_ERROR, linea(), columna());
}