package ru.test.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="communities")
public class Communities {


    @Id
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "communities_id_seq-generator"
    )
    @SequenceGenerator(
            name = "communities_id_seq-generator",
            sequenceName = "communities_id_seq"
    )
    long id;
    private String name;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    public Communities(String name) {
        this.name = name;

    }

    @OneToMany(mappedBy = "community")
    private List<CommunitiesUsers> communitiesUsers=new ArrayList<>();

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Communities users = (Communities) o;
        return id == users.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
