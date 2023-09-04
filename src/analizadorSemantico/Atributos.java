package analizadorSemantico;

import java.util.HashMap;

public class Atributos {
    static HashMap<String, Atributos> variables_globales = new HashMap<>();

    public static Atributos GetVariableGlobal(String nombre) {
        if (variables_globales.containsKey(nombre)) {
            return variables_globales.get(nombre);
        }
        else {
            return null;
        }
    }

    public static void SetVariableGlobal(String nombre, Atributos atributos) {
        variables_globales.put(nombre, atributos);
    }

    Tipos tipo; // 0 boolean, 1 int
    int valor;

    public Atributos(Tipos tipo, int valor) {
        this.tipo = tipo;
        this.valor = valor;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }

    public Tipos getTipo() {
        return tipo;
    }

    public void setTipo(Tipos tipo) {
        this.tipo = tipo;
    }
}
