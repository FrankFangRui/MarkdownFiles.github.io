/**
 * @author 方锐
 * @since 2023/4/26 9:13
 */
public class User {
    public int getUserId() {
        return UserId;
    }

    public void setUserId(int userId) {
        UserId = userId;
    }

    public int getUserName() {
        return UserName;
    }

    public void setUserName(int userName) {
        UserName = userName;
    }

    private int UserId;
    private int UserName;

    public void sayHi() {
        System.out.println("I am User");
    }

}
