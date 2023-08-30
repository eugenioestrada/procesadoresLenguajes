package analizadorSintactico;

import java.io.BufferedReader;
import java.io.FileReader;

public class PruebaAnalizadorSintactico {
    public static void main(String[] args) {
        String ficheroEntrada = "prueba1.pck";
        String directorio = System.getProperty("user.dir") + "\\src\\examples\\";

        String resultado = "";

        try {
            BufferedReader lector = new BufferedReader(new FileReader(directorio + ficheroEntrada));

            //Scanner myScanner = new Yylex(lector);
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}