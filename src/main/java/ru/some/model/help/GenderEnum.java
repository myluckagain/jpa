package ru.some.model.help;

import lombok.Getter;

public enum GenderEnum implements HasName{
    MALE("m"),
    FEMALE("f");
    GenderEnum(String name){
        this.name=name;
    }
    @Getter
    String name;

}
