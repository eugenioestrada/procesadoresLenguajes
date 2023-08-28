package lexico;

import java.io.*;

public class GeneradorScanner {
    public static void main(String[] args) {
        String[] ruta = { System.getProperty("user.dir") + "\\src\\lexico\\pocket.flex" };
        try {
            jflex.Main.generate(ruta);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
