package analizadorSintactico;
import java_cup.runtime.*;
import java.io.Writer;
import java.io.IOException;
import java.io.BufferedWriter;
import java.io.FileWriter;

%%

%cup

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

"main" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_MAIN); }
"int" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_INT); }
"boolean" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_BOOLEAN); }
"if" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_IF); }
"else" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_ELSE); }
"while" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_WHILE); }
"printf" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_PRINTF); }
"scanf" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_SCANF); }

/* Símbolos de puntuación y especiales */

"{" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_LLAVEIZQUIERDA); }
"}" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_LLAVEDERECHA); }
"(" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_PARENTESISIZQUIERDO); }
")" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_PARENTESISDERECHO); }
"," { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_COMA); }
";" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_PUNTOYCOMA); }

/* Operadores */

"+" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_MAS); }
"-" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_MENOS); }
"/" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_DIVISION); }
"*" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_ASTERISCO); }
"&&" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_AND); }
"||" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_OR); }
"!" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_NOT); }
"=" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_ASIGNACION); }
"==" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_IGUAL); }
"!=" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_DISTINTO); }
"<=" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_MENORIGUAL); }
">=" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_MAYORIGUAL); }
"<" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_MENOR); }
">" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_MAYOR); }

/* Identificadores y constantes */

"true" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_TRUE); }
"false" { writeln(";D:\t" + yytext()); return new Symbol(sym.TOK_FALSE); }

{letra}({letra}|{digito})* {
    lexema = yytext();
    if (yylength() > 100) {
        System.out.println("****ERROR MORFROLÓGICO EN [lin " + linea() + ", col " + columna() + "]: IDENTIFICADOR DEMASIADO LARGO (" + lexema + ")");
        return new Symbol(sym.TOK_ERROR);
    }
    else {
        writeln(";D:\t" + lexema);
        return new Symbol(sym.TOK_IDENTIFICADOR);
    }
}
{digito}+ {
    lexema = yytext();
    writeln(";D:\t" + lexema);
    return new Symbol(sym.TOK_CONSTANTE_ENTERA);
}

/* Eliminación de espacios */

{espacio}+ { }

/* Eliminación de comentarios */

"//".* { }

/* Resto de carácteres (No permitidos) */

. {
    System.out.println("****ERROR MORFROLÓGICO EN [lin " + linea() + ", col " + columna() + "]: CARÁCTER NO PERMITIDO (" + yytext() + ")");
    return new Symbol(sym.TOK_ERROR);
}