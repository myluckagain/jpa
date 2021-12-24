package ru.test.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.test.model.Users;

public interface UserRepository extends JpaRepository<Users, Long> {

}
