package ru.some.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Posts {

    @Id
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "posts_id_seq-generator"
    )
    @SequenceGenerator(
            name = "posts_id_seq-generator",
            sequenceName = "posts_id_seq"
    )
    long id;


    @ManyToOne
    private Users user;

    @ManyToOne
    private Media media;

    @ManyToOne
    private Communities community;

    private String head;
    @Lob
    private String body;

    private byte isPublic;
    private byte isArchived;


    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
