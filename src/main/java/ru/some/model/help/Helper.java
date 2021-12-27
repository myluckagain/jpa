package ru.some.model.help;

import java.util.EnumSet;

public class Helper {

    public static <T extends Enum<T> & HasName> Enum fromTextName(Class<T> clazz, String textName) {
        for (T t : EnumSet.allOf(clazz)) {

            if (t.getName().equals(textName)) return t;
        }
        throw new IllegalArgumentException("ShortName [" + textName
                + "] not supported.");
    }


}
