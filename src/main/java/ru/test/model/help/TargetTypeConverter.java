package ru.test.model.help;

import javax.persistence.AttributeConverter;


public class TargetTypeConverter implements AttributeConverter<TargetTypeEnum, String> {
    @Override
    public String convertToDatabaseColumn(TargetTypeEnum attribute) {
        return attribute.getName();

    }

    @Override
    public TargetTypeEnum convertToEntityAttribute(String dbData) {
        return TargetTypeEnum.fromTextName(dbData);
    }
}
