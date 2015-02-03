/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package windykacja;

import java.sql.SQLException;

/**
 *
 * @author geeorge
 */
public abstract class DBObject {
    private Long id;
    
    public void save(DB db) throws SQLException {
        if(getId() <= 0) {
            insert(db);
        } else {
            update(db);
        }
    }
    
    protected abstract void insert(DB db) throws SQLException;
    
    protected abstract void update(DB db) throws SQLException;

    /**
     * @return the id
     */
    public Long getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Long id) {
        this.id = id;
    }
}
