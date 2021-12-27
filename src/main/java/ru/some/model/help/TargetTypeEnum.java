package ru.some.model.help;

import lombok.Getter;

public enum TargetTypeEnum implements HasName{
    MESSAGES("messages"),
    USERS("users"),
    POSTS("posts"),
    MEDIA("media");
    TargetTypeEnum(String name){
        this.name=name;
    }
    @Getter
    String name;


}
