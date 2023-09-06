package compilador;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

public class Atributos {
    private Tipos tipo;
    private int valor;
    private String nombre;
    private List<String> identificadores = new LinkedList<>();

    public Atributos(Tipos tipo, int valor, String nombre) {
        this.tipo = tipo;
        this.valor = valor;
        this.nombre = nombre;
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

    public Boolean exists(String identificador) {
        if (this.identificadores.indexOf(identificador) > -1) { // existe
            return true;
        }
        else {
            return false;
        }
    }

    public void addIdentificador(String identificador) {
        identificadores.add(identificador);
    }

    public List<String> getIdentificadores() {
        return identificadores;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
