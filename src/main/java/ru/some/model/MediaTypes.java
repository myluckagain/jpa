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
public class MediaTypes {
    @Id
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "media_types_id_seq-generator"
    )
    @SequenceGenerator(
            name = "media_types_id_seq-generator",
            sequenceName = "media_types_id_seq"
    )
    private long id;

    private String name;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
