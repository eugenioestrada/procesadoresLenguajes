package compilador;

import java_cup.runtime.Scanner;

import java.io.*;

public class PruebaParser {
    public static void main(String[] args) {
        String ficheroEntrada = "prueba1.pck";
        String directorio = System.getProperty("user.dir") + "\\examples\\";
        System.out.println("Analizando: " + directorio + ficheroEntrada);
        parser myParser;

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
            Scanner myScanner = new Yylex(lector);
            myParser = new parser(myScanner);
            myParser.parse();
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}