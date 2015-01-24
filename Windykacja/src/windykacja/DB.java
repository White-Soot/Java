/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package windykacja;

import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;


/**
 *
 * @author geeorge
 */
public class DB implements Cloneable {
    
    private java.sql.Connection conn;
    private String[] columnName;
    private java.util.List<Object[]> objectList;
    private String[] columnClass;
    private java.util.List<String[]> stringList;
    
    private int maxRow;
    private int actualRow;
    
    private java.sql.Statement currenrQuery;
    private java.sql.ResultSet resultSet;
    private java.sql.ResultSetMetaData metaData;
    
    DB() throws SQLException {
        conn = createConnection("jdbc:postgresql://localhost:5432/wind", "geeorge", "geeorge");
    }
    
    DB(String url, String user, String password) throws SQLException {
        conn = createConnection(url, user, password);
    }
    
    DB(String url, int port, String dabaBase, String user, String password) throws SQLException {
        conn = createConnection(url, port, dabaBase, user, password);
    }
    
    private java.sql.Connection createConnection(String url, int port, String dabaBase, String user, String password) throws SQLException {
        return createConnection(url+":"+port+"/"+dabaBase, user, password);
    }
    
    private java.sql.Connection createConnection(String url, String user, String password) throws SQLException {
        String fullUrl = new String(url);
        if(!fullUrl.startsWith("jdbc")) {
            if(!fullUrl.startsWith("postgresql")) {
                fullUrl = "postgresql://" + fullUrl;
            }
            fullUrl = "jdbc:" + fullUrl;
        }
        return java.sql.DriverManager.getConnection(fullUrl, user, password);
    }
    
    void query(String query) throws SQLException {
        currenrQuery = conn.createStatement();
        currenrQuery.executeQuery(query);
        resultSet = currenrQuery.getResultSet();
        metaData = resultSet.getMetaData();
        columnName = new String[metaData.getColumnCount()];
        columnClass = new String[metaData.getColumnCount()];
        for(int i = 0; i < metaData.getColumnCount(); i++) {
            columnName[i] = metaData.getColumnName(i+1);
            columnClass[i] = metaData.getColumnClassName(i+1);
        }
        objectList = new Vector<Object[]>(resultSet.getFetchSize());
        while(resultSet.next()) { // wykona sie tyle samo razy co for(int i = 0; i<resuleSet.getFetchSize(); i++)
            Object[] objArr = new Object[columnName.length];
            for(int i = 0; i<objArr.length; i++) {
                objArr[i] = resultSet.getObject(i+1);
            }
            objectList.add(objArr);
        }
        // tu można zrobić czyszczenie poprzednich wyników 
    }
    
    void updateQuery(String query) throws SQLException {
        currenrQuery = conn.createStatement();
        currenrQuery.executeUpdate(query);
        // tu można zrobić czyszczenie poprzednich wyników
    }
    
    String[] getRowString() {
        return null;
    }
    
    Object[] getRowObject() {
        return null;
    }
    
    String getObjectString(String columnName) {
        return null;
    }
    
    Object getObject(String columnName) {
        return null;
    }
    
    String[] getColumnNames() {
        return columnName;
    }
    
    String[] getColumnClass() {
        return columnClass;
    }
    
    List<String[]> getListString() {
        return null;
    }
    
    List<Object[]> getListObject() {
        return objectList;
    }
    
    DB getCloneDB() throws CloneNotSupportedException {
        Object o = super.clone();
        return (DB) o;
    }
    
    java.sql.Date getDate(String columnName) {
        return null;
    }
    
    int getInt(String columnName) {
        return 0;
    }
    
    // getArray // parseArray 

    /**
     * @return the conn
     */
    public java.sql.Connection getConn() {
        return conn;
    }

    /**
     * @param conn the conn to set
     */
    public void setConn(java.sql.Connection conn) {
        this.conn = conn;
    }

    /**
     * @return the maxRow
     */
    public int getMaxRow() {
        return maxRow;
    }

    /**
     * @param maxRow the maxRow to set
     */
    public void setMaxRow(int maxRow) {
        this.maxRow = maxRow;
    }
    
    
}
