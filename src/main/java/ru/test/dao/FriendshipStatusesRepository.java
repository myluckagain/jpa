package ru.test.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.test.model.FriendshipStatuses;

public interface FriendshipStatusesRepository extends JpaRepository<FriendshipStatuses, Long> {

    FriendshipStatuses findByName(String name);
}