package analizadorSintactico;

import java_cup.runtime.Scanner;
import java_cup.runtime.Symbol;

import java.io.BufferedReader;
import java.io.FileReader;

public class PruebaScanner {
    public static void main(String[] args) {
        String ficheroEntrada = "prueba1.pck";
        String directorio = System.getProperty("user.dir") + "\\examples\\";

        String resultado = "";

        System.out.println("Analizando: " + directorio + ficheroEntrada);

        try {
            BufferedReader lector = new BufferedReader(new FileReader(directorio + ficheroEntrada));

            Scanner myScanner = new Yylex(lector);

            Symbol token = myScanner.next_token();

            while (token != null && token.sym != sym.TOK_ERROR && token.sym != sym.EOF) {

                if (token.sym == sym.TOK_IDENTIFICADOR) {
                    System.out.println(token.toString() + " TOK_IDENTIFICADOR");
                }
                else if (token.sym == sym.TOK_MAIN) {
                    System.out.println(token.toString() + " TOK_MAIN");
                }
                else if (token.sym == sym.TOK_COMA) {
                    System.out.println(token.toString() + " TOK_COMA");
                }
                else if (token.sym == sym.TOK_PUNTOYCOMA) {
                    System.out.println(token.toString() + " TOK_PUNTOYCOMA");
                }
                else if (token.sym == sym.TOK_LLAVEDERECHA) {
                    System.out.println(token.toString() + " TOK_LLAVEDERECHA");
                }
                else if (token.sym == sym.TOK_LLAVEIZQUIERDA) {
                    System.out.println(token.toString() + " TOK_LLAVEIZQUIERDA");
                }
                else {
                    System.out.println(token.toString() + " OTRO");
                }

                token = myScanner.next_token();
            }
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
