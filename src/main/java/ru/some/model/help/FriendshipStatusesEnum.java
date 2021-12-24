package ru.some.model.help;

import lombok.Getter;

public enum FriendshipStatusesEnum {
    REQUESTED("Requested"),
    CONFIRMED("Confirmed"),
    REJECTED("Rejected");
    FriendshipStatusesEnum(String name){
        this.name=name;
    }
    @Getter
    String name;

    public static FriendshipStatusesEnum fromTextName(String shortName) {
        switch (shortName) {
            case "Requested":
                return FriendshipStatusesEnum.REQUESTED;

            case "Confirmed":
                return FriendshipStatusesEnum.CONFIRMED;

            case "Rejected":
                return FriendshipStatusesEnum.REJECTED;


            default:
                throw new IllegalArgumentException("ShortName [" + shortName
                        + "] not supported.");
        }
    }
}
