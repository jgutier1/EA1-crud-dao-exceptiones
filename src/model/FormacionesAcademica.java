/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 *
 * @author jcgut
 */
public class FormacionesAcademica {

    private int id;
    private String nombres;
    private LocalDateTime fechaCreacion;
    private LocalDateTime fechaActualizacion;
    private Funcionario funcionario;
    private Universidades universidad;
    private EstadosFormacion estadosFormacion;
    private NivelesEducativos nivelEducativo;

    public FormacionesAcademica() {
    }

    public FormacionesAcademica(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public LocalDateTime getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(LocalDateTime fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public LocalDateTime getFechaActualizacion() {
        return fechaActualizacion;
    }

    public void setFechaActualizacion(LocalDateTime fechaActualizacion) {
        this.fechaActualizacion = fechaActualizacion;
    }

    public Funcionario getFuncionario() {
        return funcionario;
    }

    public void setFuncionario(Funcionario funcionario) {
        this.funcionario = funcionario;
    }

    public Universidades getUniversidad() {
        return universidad;
    }

    public void setUniversidad(Universidades universidad) {
        this.universidad = universidad;
    }

    public EstadosFormacion getEstadosFormacion() {
        return estadosFormacion;
    }

    public void setEstadosFormacion(EstadosFormacion estadosFormacion) {
        this.estadosFormacion = estadosFormacion;
    }

    public NivelesEducativos getNivelEducativo() {
        return nivelEducativo;
    }

    public void setNivelEducativo(NivelesEducativos nivelEducativo) {
        this.nivelEducativo = nivelEducativo;
    }

}
