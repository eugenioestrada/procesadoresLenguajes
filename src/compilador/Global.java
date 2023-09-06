package compilador;

import java.util.HashMap;

public class Global {
    static HashMap<String, Tipos> variables_globales = new HashMap<>();

    public static Tipos getTipo(String nombre) {
        if (variables_globales.containsKey(nombre)) {
            return variables_globales.get(nombre);
        }
        else {
            return null;
        }
    }

    public static Boolean exists(String nombre) {
        return variables_globales.containsKey(nombre);
    }

    public static void set(String nombre, Tipos tipo) {
        variables_globales.put(nombre, tipo);
    }
}
