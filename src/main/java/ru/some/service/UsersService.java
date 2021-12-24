package ru.some.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.some.dao.FriendshipStatusesRepository;
import ru.some.dao.UserRepository;
import ru.some.model.Friendship;
import ru.some.model.FriendshipStatuses;
import ru.some.model.Users;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class UsersService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private FriendshipStatusesRepository friendshipStatusesRepository;

    public Users save(String firstName, String lastName, String email, String phone) {
        Users user = new Users(firstName, lastName, email, phone);
        userRepository.save(user);
        return user;
    }

    public void addFriend(Users user, Users friend) {
        FriendshipStatuses requested = friendshipStatusesRepository.getById(1l);
        user.addFriend(friend, requested);
        userRepository.save(friend);
        userRepository.save(user);

    }

    public void addManyFriends(Users user, List<Users> friends) {
        FriendshipStatuses requested = friendshipStatusesRepository.getById(1l);
        for (Users friend : friends) {
            user.addFriend(friend, requested);
        }
        userRepository.save(user);
    }

    public List<Friendship> getFriendsOf(long id) {
        Optional<Users> usersOptional = userRepository.findById(id);
        if (usersOptional.isPresent()) {
            return usersOptional.get().getFriendsOf();
        } else {
            return Collections.emptyList();
        }

    }
}
