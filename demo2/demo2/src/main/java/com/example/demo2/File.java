package com.example.demo2;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Data
@Table(name = "photo")
public class File implements Serializable {

    /** ID */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;

    /** バイナリデータ */
    @Column(name = "photo")
    private byte bytedata[];

    public byte[] getPhoto() {
        return this.bytedata;
    }

}