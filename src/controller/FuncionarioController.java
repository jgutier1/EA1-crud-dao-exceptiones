/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.FuncionarioDao;
import java.util.List;
import javax.swing.table.DefaultTableModel;
import model.Funcionario;


public class FuncionarioController {

    private FuncionarioDao funcionarioDao;

    public FuncionarioController(FuncionarioDao funcionarioDao) {
        this.funcionarioDao = funcionarioDao;
    }

    public DefaultTableModel llenarTabla() {
        DefaultTableModel model = new DefaultTableModel() {
            @Override
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };
        model.addColumn("Id");
        model.addColumn("Número Doc.");
        model.addColumn("Nombre");
        model.addColumn("Apellido");
        model.addColumn("Fecha Nac.");
        List<Funcionario> funcionarios = funcionarioDao.findAll();
        String[] registros = new String[5];
        for (Funcionario f : funcionarios) {
            registros[0] = String.valueOf(f.getId());
            registros[1] = f.getNumeroIdentificacion();
            registros[2] = f.getNombres();
            registros[3] = f.getApellidos();
            registros[4] = f.getFechaNacimiento().toString();
            model.addRow(registros);
        }
        return model;
    }


    public Funcionario listarPorDocumento(String documento) {
        return funcionarioDao.findByDocumento(documento);
    }

    public int guardar(Funcionario funcionario) {
        return funcionarioDao.save(funcionario);
    }

    public void eliminar (String documento) {
        funcionarioDao.delete(documento);
    }
    // jcgr

    public int editar (Funcionario funcionario) {
        return funcionarioDao.update(funcionario);
    }



    // TODO: llamar los métodos restantes: editar y eliminar
}
