package analizadorSemantico;

public class GeneradorParser {
    public static void main(String[] args) {
        String ficheroEspecificacion = System.getProperty("user.dir") + "\\src\\analizadorSemantico\\pocket.cup";
        System.out.println(ficheroEspecificacion);
        String[] opciones = { "-package", "analizadorSemantico", "-progress", ficheroEspecificacion };
        try {
            java_cup.Main.main(opciones);
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
