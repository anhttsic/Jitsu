package demo.function.hack;

import com.intuit.karate.core.ScenarioEngine;
import com.intuit.karate.driver.Driver;
import demo.function.exceptions.FileReadException;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

public class ScenarioContext {
    private static ThreadLocal<Map<String, Driver>> drivers = ThreadLocal.withInitial(HashMap::new);

    private ScenarioContext() {

    }

    private static final ScenarioContext INSTANCE = new ScenarioContext();

    public static ScenarioContext getInstance() {
        return INSTANCE;
    }

    public static Driver getDriver() {
        try {
            Field field = getField(ScenarioEngine.get().getClass(), "driver");
            field.setAccessible(true);
            return (Driver) field.get(ScenarioEngine.get());
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        }
    }

    public static Field getField(Class clazz, String fieldName) {
        try {
            return clazz.getDeclaredField(fieldName);
        } catch (NoSuchFieldException e) {
            Class superClazz = clazz.getSuperclass();
            if (superClazz == null) {
                try {
                    throw e;
                } catch (NoSuchFieldException ex) {
                    throw new FileReadException(ex.getMessage());
                }
            } else {
                return getField(superClazz, fieldName);
            }
        }
    }
}
