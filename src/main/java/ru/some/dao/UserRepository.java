package ru.some.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.some.model.Users;

public interface UserRepository extends JpaRepository<Users, Long> {

}
