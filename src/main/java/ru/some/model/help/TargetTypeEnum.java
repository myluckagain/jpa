package ru.some.model.help;

import lombok.Getter;

public enum TargetTypeEnum {
    MESSAGES("messages"),
    USERS("users"),
    POSTS("posts"),
    MEDIA("media");
    TargetTypeEnum(String name){
        this.name=name;
    }
    @Getter
    String name;

    public static TargetTypeEnum fromTextName(String shortName) {
        switch (shortName) {
            case "messages":
                return TargetTypeEnum.MESSAGES;

            case "users":
                return TargetTypeEnum.USERS;

            case "posts":
                return TargetTypeEnum.POSTS;
            case "media":
                return TargetTypeEnum.MEDIA;


            default:
                throw new IllegalArgumentException("ShortName [" + shortName
                        + "] not supported.");
        }
    }
}
