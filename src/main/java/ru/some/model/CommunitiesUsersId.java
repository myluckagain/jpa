package ru.some.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommunitiesUsersId  implements Serializable {

    private long userId;
    private long communityId;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CommunitiesUsersId that = (CommunitiesUsersId) o;
        return userId == that.userId &&
                communityId == that.communityId;
    }

    @Override
    public int hashCode() {
        return Objects.hash(userId, communityId);
    }

}
