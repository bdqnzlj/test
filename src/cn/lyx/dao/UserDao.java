package cn.lyx.dao;

import cn.lyx.domain.User;

import java.util.List;
import java.util.Map;

/*
    用户操作的dao
 */
public interface UserDao {
    /**
     * 查询功能
     * @return
     */
    public List<User> findAll();
    /**
     * 登录功能
     * @return
     */
    public User login(String username, String password);

    /**
     * 添加功能
     * @param u
     */
    public void addContact(User u);

    void delUser(int id);
    /**
     * 修改功能的回显信息
     * @param id
     * @return
     */
    public User updUser(int id);

    /**
     * 修改功能
     * @param user
     */
    public void updateUser(User user);

    public int findTotalCount(Map<String, String[]> parameterMap);

    public List<User> findByPage(int start, int rows, Map<String, String[]> parameterMap);
}
