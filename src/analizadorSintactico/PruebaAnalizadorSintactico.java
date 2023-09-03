package analizadorSintactico;

import java_cup.runtime.Scanner;
import java_cup.runtime.Symbol;

import java.io.BufferedReader;
import java.io.FileReader;

public class PruebaAnalizadorSintactico {
    public static void main(String[] args) {
            String ficheroEntrada = "prueba1.pck";
            String directorio = System.getProperty("user.dir") + "\\examples\\";

            String resultado = "";

            System.out.println("Analizando: " + directorio + ficheroEntrada);

            parser myParser;

            try {
                BufferedReader lector = new BufferedReader(new FileReader(directorio + ficheroEntrada));
                Scanner myScanner = new Yylex(lector);
                myParser = new parser(myScanner);
                myParser.parse();
            }
            catch (Exception e) {
                System.out.println(e.getMessage());
            }
    }
}