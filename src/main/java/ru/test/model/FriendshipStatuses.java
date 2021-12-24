package ru.test.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import ru.test.model.help.FriendshipStatusConverter;
import ru.test.model.help.FriendshipStatusesEnum;

import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class FriendshipStatuses {

    @Id
    private long id;

    @Convert(converter = FriendshipStatusConverter.class)
    private FriendshipStatusesEnum name;

    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    public FriendshipStatuses(long id, FriendshipStatusesEnum name) {
        this.id = id;
        this.name = name;
    }

}
