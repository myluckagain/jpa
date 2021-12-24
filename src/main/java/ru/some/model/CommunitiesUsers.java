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
public class CommunitiesUsers {
    @EmbeddedId
    private CommunitiesUsersId communitiesUsersId;

    private LocalDateTime createdAt;


    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("communityId")
    private Communities community;

    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("userId")
    private Users user;
}
