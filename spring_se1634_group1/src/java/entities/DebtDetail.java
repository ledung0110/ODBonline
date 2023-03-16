/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entities;

import java.util.Date;

/**
 *
 * @author nvash
 */
public class DebtDetail {

    private long id;
    private long debtId;
    private String note;
    private boolean debtType;
    private double amount;
    private String image;
    private Date debtCreatedAt;
    private Date dateCreateAt;

    public DebtDetail() {
    }

    public DebtDetail(long id, long debtId, String note, boolean debtType, double amount, String image, Date debtCreatedAt, Date dateCreateAt) {
        this.id = id;
        this.debtId = debtId;
        this.note = note;
        this.debtType = debtType;
        this.amount = amount;
        this.image = image;
        this.debtCreatedAt = debtCreatedAt;
        this.dateCreateAt = dateCreateAt;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getDebtId() {
        return debtId;
    }

    public void setDebtId(long debtId) {
        this.debtId = debtId;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public boolean isDebtType() {
        return debtType;
    }

    public void setDebtType(boolean debtType) {
        this.debtType = debtType;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getDebtCreatedAt() {
        return debtCreatedAt;
    }

    public void setDebtCreatedAt(Date debtCreatedAt) {
        this.debtCreatedAt = debtCreatedAt;
    }

    public Date getDateCreateAt() {
        return dateCreateAt;
    }

    public void setDateCreateAt(Date dateCreateAt) {
        this.dateCreateAt = dateCreateAt;
    }

}
