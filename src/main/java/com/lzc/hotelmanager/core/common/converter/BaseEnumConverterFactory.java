package com.lzc.hotelmanager.core.common.converter;

import com.lzc.hotelmanager.core.common.enumeration.BaseEnum;
import org.springframework.core.convert.converter.Converter;
import org.springframework.core.convert.converter.ConverterFactory;

import java.util.HashMap;
import java.util.Map;
import java.util.WeakHashMap;


/**
 * 枚举类型转换
 */
public class BaseEnumConverterFactory implements ConverterFactory<String, BaseEnum> {
 
    @SuppressWarnings("rawtypes")
	private static final Map<Class, Converter> converterMap = new WeakHashMap<>();
 
    @SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
    public <T extends BaseEnum> Converter<String, T> getConverter(Class<T> targetType) {
        Converter result = converterMap.get(targetType);
        if(result == null) {
            result = new IntegerStrToEnum<T>(targetType);
            converterMap.put(targetType, result);
        }
        return result;
    }
 
    class IntegerStrToEnum<T extends BaseEnum> implements Converter<String, T> {
        @SuppressWarnings("unused")
		private final Class<T> enumType;
        private Map<String, T> enumMap = new HashMap<>();
 
        public IntegerStrToEnum(Class<T> enumType) {
            this.enumType = enumType;
            T[] enums = enumType.getEnumConstants();
            for(T e : enums) {
                enumMap.put(e.getValue() + "", e);
            }
        }
 
 
        @Override
        public T convert(String source) {
            T result = enumMap.get(source);
            if(result == null) {
                throw new IllegalArgumentException("No element matches " + source);
            }
            return result;
        }
    }
}
 
