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
public class Messages {

    @Id
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "messages_id_seq-generator"
    )
    @SequenceGenerator(
            name = "messages_id_seq-generator",
            sequenceName = "messages_id_seq"
    )
    long id;

    @ManyToOne
    private Users fromUser;

    @ManyToOne
    private Users toUser;

    @Lob
    private String body;

    private byte isImportant;
    private byte isDelivered;

    private LocalDateTime createdAt;
}
