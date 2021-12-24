package ru.test.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Media {

    @Id
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "media_id_seq-generator"
    )
    @SequenceGenerator(
            name = "media_id_seq-generator",
            sequenceName = "media_id_seq"
    )
   private long id;

    @ManyToOne
    private MediaTypes mediaType;

    @ManyToOne
    private Users user;

    private String filename;
    private int size;
    private String metadata;


    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
