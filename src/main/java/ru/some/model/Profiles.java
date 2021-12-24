package ru.some.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import ru.some.model.help.GenderConverter;
import ru.some.model.help.GenderEnum;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Profiles {
    @Id
    private long id;
    @Convert(converter = GenderConverter.class)
    @Column(length = 3)
    private GenderEnum gender;
    private LocalDate birthday;
    private String city;
    private String country;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    @OneToOne(fetch = FetchType.LAZY)
    @MapsId
    private Users user;
}
