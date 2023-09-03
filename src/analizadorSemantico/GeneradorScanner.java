package analizadorSemantico;

public class GeneradorScanner {
    public static void main(String[] args) {
        String[] ruta = { System.getProperty("user.dir") + "\\src\\analizadorSemantico\\pocket.flex" };
        try {
            jflex.Main.generate(ruta);
        } catch (Exception e) {
            System.out.println("ERROR GENERANDO SCANNER: " + e.getMessage());
        }
    }
}
