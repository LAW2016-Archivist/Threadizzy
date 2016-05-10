/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

/**
 *
 * @author ismail.hassan
 */
public class Rating {
    private int idUser;
    private int idThread;
    private int jumlahBintang;
    /**
     * @return the idUser
     */
    public int getIdUser() {
        return idUser;
    }

    /**
     * @param idUser the idUser to set
     */
    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    /**
     * @return the idThread
     */
    public int getIdThread() {
        return idThread;
    }

    /**
     * @param idThread the idThread to set
     */
    public void setIdThread(int idThread) {
        this.idThread = idThread;
    }

    /**
     * @return the jumlahBintang
     */
    public int getJumlahBintang() {
        return jumlahBintang;
    }

    /**
     * @param jumlahBintang the jumlahBintang to set
     */
    public void setJumlahBintang(int jumlahBintang) {
        this.jumlahBintang = jumlahBintang;
    }
}
