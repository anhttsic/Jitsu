package demo.function.hack;

import com.intuit.karate.driver.Element;

import java.lang.reflect.Proxy;

public class ElementGuard {

    public static Element guard(Element element) {
        ElementProxy proxy = new ElementProxy(element);
        return (Element) Proxy.newProxyInstance(ElementProxy.class.getClassLoader(), new Class[] { Element.class }, proxy);
    }
}
