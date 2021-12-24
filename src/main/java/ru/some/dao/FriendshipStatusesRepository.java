package ru.some.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.some.model.FriendshipStatuses;

public interface FriendshipStatusesRepository extends JpaRepository<FriendshipStatuses, Long> {

    FriendshipStatuses findByName(String name);
}