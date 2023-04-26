import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @author 方锐
 * @since 2023/4/26 9:08
 */
public class APP {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("spring_config.xml");
        User2 user = (User2)context.getBean("user");
        User user2 = (User)context.getBean("user2");
        //System.out.println(user2 == user);
        User user3 = context.getBean(User.class);
        user3.sayHi();
        user.sayHi();
    }


}
