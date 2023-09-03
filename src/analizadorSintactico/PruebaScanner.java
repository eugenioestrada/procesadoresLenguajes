package analizadorSintactico;

import java_cup.runtime.Symbol;
import java.io.*;
import java.io.Writer;
import java.io.IOException;
import java.io.BufferedWriter;
import java.io.FileWriter;

public class PruebaScanner {
    public static void main(String[] args) {
        String ficheroEntrada = "prueba1.pck";
        String directorio = System.getProperty("user.dir") + "\\examples\\";
        System.out.println("Analizando: " + directorio + ficheroEntrada);

        Writer writer;

        try {
            writer = new BufferedWriter(new FileWriter("sinout.txt", false));
            writer.write("");
            writer.close();
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }

        try {
            BufferedReader lector = new BufferedReader(new FileReader(directorio + ficheroEntrada));

            Yylex myScanner = new Yylex(lector);

            Symbol token = myScanner.next_token();

            while (token != null && token.sym != sym.TOK_ERROR && token.sym != sym.EOF) {

                if (token.sym == sym.TOK_IDENTIFICADOR) {
                    System.out.println(token.toString() + " TOK_IDENTIFICADOR: " + myScanner.yytext());
                }
                else if (token.sym == sym.TOK_MAIN) {
                    System.out.println(token.toString() + " TOK_MAIN " + myScanner.yytext());
                }
                else if (token.sym == sym.TOK_COMA) {
                    System.out.println(token.toString() + " TOK_COMA" + myScanner.yytext());
                }
                else if (token.sym == sym.TOK_PUNTOYCOMA) {
                    System.out.println(token.toString() + " TOK_PUNTOYCOMA" + myScanner.yytext());
                }
                else if (token.sym == sym.TOK_LLAVEDERECHA) {
                    System.out.println(token.toString() + " TOK_LLAVEDERECHA" + myScanner.yytext());
                }
                else if (token.sym == sym.TOK_LLAVEIZQUIERDA) {
                    System.out.println(token.toString() + " TOK_LLAVEIZQUIERDA" + myScanner.yytext());
                }
                else {
                    System.out.println(token.toString() + " OTRO: " + myScanner.yytext());
                }

                token = myScanner.next_token();
            }
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
