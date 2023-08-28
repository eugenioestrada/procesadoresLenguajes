package lexico;

import java.io.*;

public class Main {
    public static void main(String[] args) {
        String rutaEntrada = System.getProperty("user.dir") + "\\examples\\entrada2.txt";
        if (args.length > 0) {
            rutaEntrada = args[0];
        }

        String rutaSalida = System.getProperty("user.dir") + "\\examples\\salida2.txt";
        if (args.length > 1) {
            rutaSalida = args[1];
        }

        String resultado = "";

        try {
            Reader lector = new BufferedReader(new FileReader(rutaEntrada));
            Scanner scanner = new Scanner(lector);

            while (true) {
                Tokens token = scanner.yylex();

                if (token == null) {
                    break;
                }

                switch (token) {
                    case TOK_ERROR:
                        throw new Exception("Carácter no permitido: " + scanner.yytext());
                    case TOK_IDENTIFICADOR:
                        String identificador = scanner.yytext();
                        if (identificador.length() > 100) {
                            throw new Exception("Identificador con más de 100 carácteres no permitido: " + identificador);
                        }
                        else {
                            resultado += token + "\t" + scanner.yytext() + "\n";
                        }
                        break;
                    default:
                        resultado += token + "\t" + scanner.yytext() + "\n";
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