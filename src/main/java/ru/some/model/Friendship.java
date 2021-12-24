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
public class Friendship {
    @EmbeddedId
    private FriendshipId id;

    //кто добавил
    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("userId")
    private Users user;

    //кого добавил
    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("friendId")
    private Users friend;


    @ManyToOne
    private FriendshipStatuses friendshipStatus;

    public Friendship(Users user, Users friend) {
        this.user = user;
        this.friend = friend;
        this.id=new FriendshipId(user.getId(), friend.getId());
    }

    public Friendship(Users user, Users friend, FriendshipStatuses friendshipStatuses) {
        this.user = user;
        this.friend = friend;
        this.id=new FriendshipId(user.getId(), friend.getId());
        this.friendshipStatus=friendshipStatuses;

    }

    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private LocalDateTime confirmedAt;
}
