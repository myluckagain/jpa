package ru.some.model.help;

import javax.persistence.AttributeConverter;


public class FriendshipStatusConverter implements AttributeConverter<FriendshipStatusesEnum, String> {
    @Override
    public String convertToDatabaseColumn(FriendshipStatusesEnum attribute) {
        return attribute.getName();

    }

    @Override
    public FriendshipStatusesEnum convertToEntityAttribute(String dbData) {
        return FriendshipStatusesEnum.fromTextName(dbData);
    }
}
