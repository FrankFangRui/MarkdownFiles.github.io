import com.demo.controller.ArticleController;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @author 方锐
 * @since 2023/4/26 9:08
 */
public class APP {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("spring_config.xml");
//        User2 user = (User2)context.getBean("user");
//        User user2 = (User)context.getBean("user2");
//        //System.out.println(user2 == user);
//        User user3 = context.getBean(User.class);
//        user3.sayHi();
//        user.sayHi();
        // 这里填入的是要创建的类对象，这个类的地址（Article.class),和ArticleController中的方法名
        // 还要用这个类引用来存储
//        Article article = context.getBean("a1", Article.class);
//        article.create();
        //用上@Autowired之后，就是用ArticleController来当对象引用接收了
        ArticleController articleController = context.getBean("articleController",ArticleController.class);
        articleController.creating();
    }
}
