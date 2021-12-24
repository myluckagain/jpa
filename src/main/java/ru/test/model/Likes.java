package ru.test.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import ru.test.model.help.TargetTypeConverter;
import ru.test.model.help.TargetTypeEnum;

import javax.persistence.*;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Likes {
    @Id
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "likes_id_seq-generator"
    )
    @SequenceGenerator(
            name = "likes_id_seq-generator",
            sequenceName = "likes_id_seq"
    )
    private long id;

    private long targetId;

    @Convert(converter = TargetTypeConverter.class)
    private TargetTypeEnum targetType;

    @ManyToOne
    private Users user;

    private LocalDateTime createdAt;
}
