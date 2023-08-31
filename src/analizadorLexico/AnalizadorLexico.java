package analizadorLexico;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;

public class AnalizadorLexico {
    public static void main(String[] args) {
        String rutaEntrada = System.getProperty("user.dir") + "\\examples\\entrada3.txt";
        if (args.length > 0) {
            rutaEntrada = args[0];

            if (!Files.exists(Paths.get(rutaEntrada))) {
                System.out.println("El fichero de entrada del primer argumento no existe, se espera una ruta absoluta.");
            }
        }

        String rutaSalida = System.getProperty("user.dir") + "\\examples\\salida3.txt";
        if (args.length > 1) {
            rutaSalida = args[1];
        }

        String resultado = "";

        try {
            Reader lector = new BufferedReader(new FileReader(rutaEntrada));
            Scanner scanner = new Scanner(lector);

            while (true) {
                Tokens token = scanner.yylex();

                if (token == null || token == Tokens.TOK_ERROR) {
                    break;
                }

                resultado += token + "\t" + scanner.yytext() + "\n";

                switch (token) {
                    case TOK_ERROR:
                        System.out.println("Se ha encontrado un error morfológico");
                        break;
                    default:

                        break;
                }
            }
        } catch (FileNotFoundException e) {
            System.out.println(e.getMessage());
        } catch (IOException e) {
            System.out.println(e.getMessage());
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        System.out.println("Escribiendo resultado en " + rutaSalida);

        try {
            BufferedWriter writer = new BufferedWriter(new FileWriter(rutaSalida));
            writer.write(resultado);
            writer.close();
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
    }
}