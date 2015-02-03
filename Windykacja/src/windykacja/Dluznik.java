/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package windykacja;

import java.sql.SQLException;
import java.util.Vector;


/**
 *
 * @author soot
 */
public class Dluznik extends DBObject {
    
private long dluznik_typ;
private long id_adres;

    public Dluznik(long id) {
        setId(id);
    }
    
    private Dluznik() {
        
    };
    
    public void initData(DB db) {
        dluznik_typ = (Long) db.getObject("dluznik_typ");
    }
    
    public void loadData(DB db) throws SQLException{
        String query = "select * from dluznik where id = "+ getId();
        db.query(query);
        initData(db);
     }

    public Dluznik(long id, long dluznik_typ, long id_adres) {
        setId(id);
        this.dluznik_typ = dluznik_typ;
        this.id_adres = id_adres;
    }

    public Vector<Dluznik> dluznikWhere(DB db, String where) throws SQLException {
        String query = "select * from dluznik where "+where;
        db.query(query);
        Vector<Dluznik> dluznicy = new Vector<Dluznik>(db.getMaxRow());
        while(db.next()) {
            Dluznik d = new Dluznik();
            initData(db);
            dluznicy.add(d);
        }
        return  dluznicy;
    }
    
    /**
     *
     * @param db
     * @throws SQLException
     */
    @Override
    protected void insert(DB db) throws SQLException {
        String query = "insert into dluznik(dluznik_typ, id_adres) values ("+dluznik_typ+", "+id_adres+") return id";
        db.query(query);
        setId((long) db.getObject("id"));
        
    }
    
    /**
     *
     * @param db
     * @throws SQLException
     */
    @Override
    protected void update(DB db) throws SQLException {
        String query = "update dluznik set dluznik_typ = "+dluznik_typ+",  id_adres = "+id_adres+" where id = "+getId();
        db.updateQuery(query);
    }

    /**
     * @return the dluznik_typ
     */
    protected long getDluznik_typ() {
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
