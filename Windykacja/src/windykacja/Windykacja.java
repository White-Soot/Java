/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package windykacja;

import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author White-Soot
 */
public class Windykacja {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
            DB db = new DB();
            db.query("select * from information_schema.tables");
            List<Object[]> listObject = db.getListObject();
            for(int i = 0; i < db.getColumnNames().length; i++) {
                System.out.print(""+db.getColumnNames()[i]+"; ");
            }
            System.out.print("\n");
            for(int i = 0; i < listObject.size(); i++) {
                for(int j = 0; j<db.getColumnNames().length; j++) {
                    System.out.print(""+listObject.get(i)[j]+"; ");
                }
                System.out.print("\n");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Windykacja.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
