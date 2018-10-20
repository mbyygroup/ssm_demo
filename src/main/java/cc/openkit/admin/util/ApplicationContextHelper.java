package cc.openkit.admin.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/*
* 用于在非controller里调用service
*
* */
public class ApplicationContextHelper implements ApplicationContextAware {
    private static ApplicationContext appCtx;

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        appCtx=applicationContext;
    }

    public static Object getBean(String beanName){
        return appCtx.getBean(beanName);
    }

//    public static <T> getBean(Class<T> clz){
//        return (T)appCtx.getBean(clz);
//    }
}
