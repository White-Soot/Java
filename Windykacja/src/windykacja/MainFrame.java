/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package windykacja;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.GridLayout;
import javax.swing.JLabel;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JInternalFrame;
import javax.swing.JPanel;
import javax.swing.event.InternalFrameEvent;
import javax.swing.event.InternalFrameListener;

/**
 *
 * @author geeorge
 */
public class MainFrame extends javax.swing.JFrame implements InternalFrameListener {

    private static MainFrame main = null;
    private DB db;
    private int countPanel;
    
    /**
     * Creates new form mainFrame
     */
    private MainFrame() {
        initComponents();
        countPanel = 0;
        
    }

    public MainFrame getMainFrame() {
        if(main == null) main = new MainFrame();
        return main;
    }
    
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {
        java.awt.GridBagConstraints gridBagConstraints;

        toolBoxPanel = new javax.swing.JPanel();
        jScrollPane2 = new javax.swing.JScrollPane();
        toolBox = new javax.swing.JPanel();
        jPanel2 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        desktop = new javax.swing.JDesktopPane();
        jMenuBar1 = new javax.swing.JMenuBar();
        opcje = new javax.swing.JMenu();
        menuSzukaj = new javax.swing.JMenuItem();
        menuDodajSprawe = new javax.swing.JMenuItem();
        menuDodajZleceniodawce = new javax.swing.JMenuItem();
        menuWyjdz = new javax.swing.JMenuItem();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setMinimumSize(new java.awt.Dimension(400, 300));
        getContentPane().setLayout(new java.awt.GridBagLayout());

        toolBoxPanel.setBackground(new java.awt.Color(153, 204, 255));
        toolBoxPanel.setMinimumSize(new java.awt.Dimension(50, 50));
        toolBoxPanel.setPreferredSize(new java.awt.Dimension(50, 50));
        toolBoxPanel.setLayout(new java.awt.GridLayout(1, 0));

        jScrollPane2.setAutoscrolls(true);
        jScrollPane2.setMinimumSize(new java.awt.Dimension(25, 25));
        jScrollPane2.setPreferredSize(new java.awt.Dimension(25, 25));

        toolBox.setBackground(new java.awt.Color(153, 255, 255));
        toolBox.setAutoscrolls(true);
        toolBox.setMinimumSize(new java.awt.Dimension(25, 25));
        toolBox.setPreferredSize(new java.awt.Dimension(25, 25));
        toolBox.setLayout(new java.awt.GridBagLayout());
        jScrollPane2.setViewportView(toolBox);

        toolBoxPanel.add(jScrollPane2);

        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 0;
        gridBagConstraints.fill = java.awt.GridBagConstraints.HORIZONTAL;
        getContentPane().add(toolBoxPanel, gridBagConstraints);

        jPanel2.setLayout(new java.awt.GridLayout(1, 0));

        jScrollPane1.setMinimumSize(new java.awt.Dimension(100, 100));

        desktop.setMinimumSize(new java.awt.Dimension(100, 100));
        desktop.setLayout(new java.awt.CardLayout());
        jScrollPane1.setViewportView(desktop);

        jPanel2.add(jScrollPane1);

        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 1;
        gridBagConstraints.fill = java.awt.GridBagConstraints.BOTH;
        gridBagConstraints.weightx = 0.1;
        gridBagConstraints.weighty = 0.1;
        getContentPane().add(jPanel2, gridBagConstraints);

        opcje.setText("Opcje");

        menuSzukaj.setAccelerator(javax.swing.KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_F, java.awt.event.InputEvent.CTRL_MASK));
        menuSzukaj.setText("Szukaj");
        menuSzukaj.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                menuSzukajActionPerformed(evt);
            }
        });
        opcje.add(menuSzukaj);

        menuDodajSprawe.setText("Dodaj sprawę");
        menuDodajSprawe.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                menuDodajSpraweActionPerformed(evt);
            }
        });
        opcje.add(menuDodajSprawe);

        menuDodajZleceniodawce.setText("Dodaj zleceniodawcę");
        opcje.add(menuDodajZleceniodawce);

        menuWyjdz.setAccelerator(javax.swing.KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_Q, java.awt.event.InputEvent.CTRL_MASK));
        menuWyjdz.setText("Wyjdź");
        menuWyjdz.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                menuWyjdzActionPerformed(evt);
            }
        });
        opcje.add(menuWyjdz);

        jMenuBar1.add(opcje);

        setJMenuBar(jMenuBar1);

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void menuSzukajActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_menuSzukajActionPerformed
        JInternalFrame iframe = new JInternalFrame("szukaj");
        iframe.setLayout(new GridLayout());
        iframe.add(new JPanel());
        iframe.addInternalFrameListener(this);
        iframe.setVisible(true);
        iframe.setClosable(true);
        JPanel p = new JPanel();
        p.setName("Panel"+countPanel);
        p.setMinimumSize(new Dimension(30, 30));
        p.setPreferredSize(new Dimension(30, 30));
        p.setBackground(Color.GREEN);
        p.add(new javax.swing.JLabel(""+countPanel));
        toolBox.add(p);
        toolBox.revalidate();
        desktop.add(iframe, p.getName());
        System.err.println("size: "+toolBox.getSize());
    }//GEN-LAST:event_menuSzukajActionPerformed

    private void menuWyjdzActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_menuWyjdzActionPerformed
        System.exit(0);
    }//GEN-LAST:event_menuWyjdzActionPerformed

    private void menuDodajSpraweActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_menuDodajSpraweActionPerformed
        JPanel p = new JPanel();
//        p.setMinimumSize(new Dimension);
        toolBox.add(p);
    }//GEN-LAST:event_menuDodajSpraweActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(MainFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(MainFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(MainFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(MainFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new MainFrame().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JDesktopPane desktop;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JMenuItem menuDodajSprawe;
    private javax.swing.JMenuItem menuDodajZleceniodawce;
    private javax.swing.JMenuItem menuSzukaj;
    private javax.swing.JMenuItem menuWyjdz;
    private javax.swing.JMenu opcje;
    private javax.swing.JPanel toolBox;
    private javax.swing.JPanel toolBoxPanel;
    // End of variables declaration//GEN-END:variables

    @Override
    public void internalFrameOpened(InternalFrameEvent e) {
        System.err.println("internalFrameOpened");
    }

    @Override
    public void internalFrameClosing(InternalFrameEvent e) {
        System.err.println("internalFrameClosing");
    }

    @Override
    public void internalFrameClosed(InternalFrameEvent e) {
        System.err.println("internalFrameClosed");
    }

    @Override
    public void internalFrameIconified(InternalFrameEvent e) {
        System.err.println("internalFrameIconified");
    }

    @Override
    public void internalFrameDeiconified(InternalFrameEvent e) {
        System.err.println("internalFrameDeiconified");
    }

    @Override
    public void internalFrameActivated(InternalFrameEvent e) {
        System.err.println("internalFrameActivated");
    }

    @Override
    public void internalFrameDeactivated(InternalFrameEvent e) {
        System.err.println("internalFrameDeactivated");
    }
}
