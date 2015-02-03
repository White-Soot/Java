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
public class Osoba extends Dluznik {

    private String imie;
    private String nazwisko;
    private String pesel;
    
    public Osoba(long id) {
        super(id);
    }

    public void loadData(DB db) throws SQLException{
        super.loadData(db);
        String query = "select * from dluznik_osoba where id = "+ getId();
        db.query(query);
        initData(db);
     }
    
    public void initData(DB db) {
        setImie(db.getObjectString("imie"));
        setNazwisko(db.getObjectString("nazwisko"));
        setPesel(db.getObjectString("pesel"));
    }
    
    @Override
     protected void insert(DB db) throws SQLException {
        super.insert(db);
        String query = "insert into osoba(id, imie, nazwisko, pesel) values ("+getId()+", "+imie+", "+nazwisko+", "+pesel+")";
        db.updateQuery(query);
    }
    
    @Override
     protected void update(DB db) throws SQLException {
        super.update(db);
        String query = "update osoba set imie = "+imie+",  nazwisko = "+nazwisko+",  pesel = "+pesel+" where id = "+getId();
        db.updateQuery(query);
    }
    
    /**
     * @return the imie
     */
    public String getImie() {
        return imie;
    }

    /**
     * @return the nazwisko
     */
    public String getNazwisko() {
        return nazwisko;
    }

    /**
     * @return the pesel
     */
    public String getPesel() {
        return pesel;
    }

    /**
     * @param imie the imie to set
     */
    public void setImie(String imie) {
        this.imie = imie;
    }

    /**
     * @param nazwisko the nazwisko to set
     */
    public void setNazwisko(String nazwisko) {
        this.nazwisko = nazwisko;
    }

    /**
     * @param pesel the pesel to set
     */
    public void setPesel(String pesel) {
        this.pesel = pesel;
    }
    
    
    
}
