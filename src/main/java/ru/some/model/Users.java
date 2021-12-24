package ru.some.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Users {


    @Id
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "users_id_seq-generator"
    )
    @SequenceGenerator(
            name = "users_id_seq-generator",
            sequenceName = "users_id_seq"
    )
    long id;
    private String firstName;

    public Users(String firstName, String lastName, String email, String phone) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
    }

    private String lastName;
    private String email;
    private String phone;

    //кого добавил
    @OneToMany(
            mappedBy = "user",
            cascade = CascadeType.PERSIST,
            orphanRemoval = false
    )
    private List<Friendship> friends = new ArrayList<>();

    //кто его добавил
    @OneToMany(
            mappedBy = "friend",
            cascade = CascadeType.PERSIST,
            orphanRemoval = false
    )
    private List<Friendship> friendsOf = new ArrayList<>();

    @OneToMany(mappedBy = "user")
    private List<CommunitiesUsers> communitiesUsers = new ArrayList<>();

    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    public void addFriend(Users user, FriendshipStatuses friendshipStatuses) {
        Friendship friendship = new Friendship(this, user, friendshipStatuses);
        friends.add(friendship);
        user.friendsOf.add(friendship);
    }


    public void removeFriend(Users friend) {
        for (Iterator<Friendship> iterator = friends.iterator();
             iterator.hasNext(); ) {
            Friendship friendship = iterator.next();

            if (friendship.getUser().equals(this) &&
                    friendship.getFriend().equals(friend)) {
                iterator.remove();
                friendship.getFriend().getFriendsOf().remove(friendship);
                friendship.setUser(null);
                friendship.setFriend(null);
            }
        }
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Users users = (Users) o;
        return id == users.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
