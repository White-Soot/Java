/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package windykacja;

import java.sql.SQLException;


/**
 *
 * @author soot
 */
public class Dluznik {
    
private long id;
private long dluznik_typ;
private long id_adres;

    public Dluznik(long id) {
        this.id = id;
    }
    
    
    public void loadData(DB db) throws SQLException{
        String query = "select * from dluznik where id = "+ id;
        db.query(query);
        db.
     }

    public Dluznik(long id, long dluznik_typ, long id_adres) {
        this.id = id;
        this.dluznik_typ = dluznik_typ;
        this.id_adres = id_adres;
    }

    /**
     * @return the id
     */
    public long getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(long id) {
        this.id = id;
    }

    /**
     * @return the dluznik_typ
     */
    public long getDluznik_typ() {
        return dluznik_typ;
    }

    /**
     * @param dluznik_typ the dluznik_typ to set
     */
    public void setDluznik_typ(long dluznik_typ) {
        this.dluznik_typ = dluznik_typ;
    }

    /**
     * @return the id_adres
     */
    public long getId_adres() {
        return id_adres;
    }

    /**
     * @param id_adres the id_adres to set
     */
    public void setId_adres(long id_adres) {
        this.id_adres = id_adres;
    }

}
