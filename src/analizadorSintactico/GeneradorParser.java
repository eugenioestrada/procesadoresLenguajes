package analizadorSintactico;

public class GeneradorParser {
    public static void main(String[] args) {
        String ficheroEspecificacion = System.getProperty("user.dir") + "\\src\\analizadorSintactico\\pocket.cup";
        System.out.println(ficheroEspecificacion);
        String[] opciones = { "-package", "analizadorSintactico", "-progress", ficheroEspecificacion };
        try {
            java_cup.Main.main(opciones);
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
