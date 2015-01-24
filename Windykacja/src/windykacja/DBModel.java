/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package windykacja;

import java.util.List;

/**
 *
 * @author geeorge
 */
public class DBModel extends javax.swing.table.AbstractTableModel {

    List<Object[]> rows;
    String[] columnName;

    public DBModel(List<Object[]> rows, String[] columnName) {
        this.rows = rows;
        this.columnName = columnName;
    }

    public DBModel(DB db) {
        this.rows = db.getListObject();
        this.columnName = db.getColumnNames();
    }
    
    @Override
    public int getRowCount() {
        return rows.size();
    }

    @Override
    public int getColumnCount() {
        return columnName.length;
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        return rows.get(rowIndex)[columnIndex];
    }
    
}
