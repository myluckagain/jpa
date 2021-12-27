package ru.some.model.help;

import lombok.Getter;

public enum FriendshipStatusesEnum implements HasName{
    REQUESTED("Requested"),
    CONFIRMED("Confirmed"),
    REJECTED("Rejected");
    FriendshipStatusesEnum(String name){
        this.name=name;
    }
    @Getter
    String name;


}
