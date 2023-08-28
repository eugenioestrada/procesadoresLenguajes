package lexico;

import java.io.*;

public class Main {
    public static void main(String[] args) {
        Boolean shouldContinue = true;

        while (shouldContinue) {
            System.out.println("Selecciona una de las siguientes opciones:");
            System.out.println("1. Generar escáner léxico");
            System.out.println("2. Probar escáner léxico");

            java.util.Scanner s = new java.util.Scanner(System.in);
            int option = s.nextInt();

            switch (option) {
                case 1:
                    String[] ruta = { "C:\\Users\\mail\\IdeaProjects\\procesadoresLenguajes\\src\\lexico\\pocket.flex" };
                    try {
                        jflex.Main.generate(ruta);
                    }
                    catch (Exception e) {
                        System.out.println(e.getMessage());
                    }

                    break;
                case 2:
                    try {
                        Reader lector = new BufferedReader(new FileReader("C:\\Users\\mail\\IdeaProjects\\procesadoresLenguajes\\examples\\entrada3.txt"));
                        Scanner scanner = new Scanner(lector);
                        String resultado = "";
                        while (true) {
                            Tokens token = scanner.yylex();
                            if (token == null) {
                                return;
                            }
                            switch (token) {
                                case TOK_ERROR:
                                    throw new Exception("Carácter no permitido: " + scanner.yytext());

                                case TOK_IDENTIFICADOR:
                                    String identificador = scanner.yytext();
                                    if (identificador.length() > 100) {
                                        throw new Exception("Identificador con más de 100 carácteres no permitido: " + identificador);
                                    }
                                    break;
                                default:
                                    System.out.println(token + "\t" + scanner.yytext());
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

                    break;
                default:
                    shouldContinue = false;
                    break;
            }
        }
    }
}