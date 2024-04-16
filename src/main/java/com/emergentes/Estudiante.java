
package com.emergentes;

public class Estudiante {
    private int id;
    private String nombre;
    private String apellido;
    private String turno;
    private String fecha;
    private String seminario;

    public Estudiante() {
        this.id=0;
        this.nombre="";
        this.apellido="";
        this.turno="";
        this.fecha="";
        this.seminario="";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getTurno() {
        return turno;
    }

    public void setTurno(String turno) {
        this.turno = turno;
    }

    public String getSeminario() {
        return seminario;
    }

    public void setSeminario(String seminario) {
        this.seminario = seminario;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    

   
}
