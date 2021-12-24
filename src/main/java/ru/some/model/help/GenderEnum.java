package ru.some.model.help;

import lombok.Getter;

public enum GenderEnum {
    MALE("m"),
    FEMALE("f");
    GenderEnum(String name){
        this.name=name;
    }
    @Getter
    String name;

    public static GenderEnum fromTextName(String shortName) {
        switch (shortName) {
            case "m":
                return GenderEnum.MALE;

            case "f":
                return GenderEnum.FEMALE;


            default:
                throw new IllegalArgumentException("ShortName [" + shortName
                        + "] not supported.");
        }
    }
}
